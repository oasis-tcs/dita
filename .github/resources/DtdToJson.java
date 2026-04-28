import java.io.IOException;
import java.io.StringReader;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;
import java.util.stream.Collectors;
import javax.xml.XMLConstants;
import javax.xml.catalog.CatalogFeatures;
import javax.xml.catalog.CatalogManager;
import javax.xml.catalog.CatalogResolver;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.SAXNotRecognizedException;
import org.xml.sax.SAXNotSupportedException;
import org.xml.sax.XMLReader;
import org.xml.sax.ext.DeclHandler;
import org.xml.sax.helpers.DefaultHandler;

/**
 * Reads an XML DTD and reports declared elements and attributes as JSON.
 *
 * <p>The parser expands parameter entities while reading the DTD. Attribute
 * defaults reported by SAX are already normalized by the XML parser, including
 * entity references in default literals.
 */
public final class DtdToJson {
    private static final String DECL_HANDLER_PROPERTY =
            "http://xml.org/sax/properties/declaration-handler";

    private static final String LOAD_EXTERNAL_DTD_FEATURE =
            "http://apache.org/xml/features/nonvalidating/load-external-dtd";
    private static final String EXTERNAL_GENERAL_ENTITIES_FEATURE =
            "http://xml.org/sax/features/external-general-entities";
    private static final String EXTERNAL_PARAMETER_ENTITIES_FEATURE =
            "http://xml.org/sax/features/external-parameter-entities";
    private static final String DISALLOW_DOCTYPE_DECL_FEATURE =
            "http://apache.org/xml/features/disallow-doctype-decl";

    private DtdToJson() {
    }

    public static void main(String[] args) {
        try {
            CliOptions options = CliOptions.parse(args);
            if (options.help) {
                printUsage();
                return;
            }

            Map<String, Map<String, String>> report = parseDtd(options);
            String json = toJson(report);

            if (options.output == null) {
                System.out.println(json);
            } else {
                Files.writeString(options.output, json + System.lineSeparator(), StandardCharsets.UTF_8);
            }
        } catch (UsageException ex) {
            System.err.println(ex.getMessage());
            System.err.println();
            printUsage();
            System.exit(2);
        } catch (Exception ex) {
            System.err.println("Failed to parse DTD: " + ex.getMessage());
            System.exit(1);
        }
    }

    private static Map<String, Map<String, String>> parseDtd(CliOptions options)
            throws ParserConfigurationException, SAXException, IOException {
        if (!Files.exists(options.dtdPath)) {
            throw new IOException("DTD file not found: " + options.dtdPath);
        }
        for (Path catalog : options.catalogs) {
            if (!Files.exists(catalog)) {
                throw new IOException("Catalog file not found: " + catalog);
            }
        }

        SAXParserFactory factory = SAXParserFactory.newInstance();
        factory.setNamespaceAware(false);
        factory.setValidating(false);

        setFeatureIfSupported(factory, LOAD_EXTERNAL_DTD_FEATURE, true);
        setFeatureIfSupported(factory, EXTERNAL_GENERAL_ENTITIES_FEATURE, true);
        setFeatureIfSupported(factory, EXTERNAL_PARAMETER_ENTITIES_FEATURE, true);
        setFeatureIfSupported(factory, DISALLOW_DOCTYPE_DECL_FEATURE, false);

        SAXParser parser = factory.newSAXParser();
        setPropertyIfSupported(parser, XMLConstants.ACCESS_EXTERNAL_DTD, "all");
        setPropertyIfSupported(parser, XMLConstants.ACCESS_EXTERNAL_SCHEMA, "all");

        XMLReader reader = parser.getXMLReader();
        DtdDeclCollector collector = new DtdDeclCollector();
        reader.setContentHandler(new DefaultHandler());
        reader.setProperty(DECL_HANDLER_PROPERTY, collector);

        if (!options.catalogs.isEmpty()) {
            CatalogFeatures features = CatalogFeatures.builder()
                    .with(CatalogFeatures.Feature.RESOLVE, "continue")
                    .build();
            CatalogResolver resolver = CatalogManager.catalogResolver(
                    features,
                    options.catalogs.stream()
                            .map(Path::toUri)
                            .toArray(java.net.URI[]::new));
            reader.setEntityResolver(resolver);
        }

        String dtdUri = options.dtdPath.toAbsolutePath().normalize().toUri().toASCIIString();
        String probeDocument = "<!DOCTYPE __dtd_probe__ SYSTEM \"" + xmlEscape(dtdUri) + "\">\n"
                + "<__dtd_probe__/>";
        InputSource input = new InputSource(new StringReader(probeDocument));
        input.setSystemId(options.dtdPath.toAbsolutePath().normalize().toUri().toASCIIString());
        reader.parse(input);

        return collector.report();
    }

    private static void setFeatureIfSupported(SAXParserFactory factory, String feature, boolean value)
            throws ParserConfigurationException, SAXException {
        try {
            factory.setFeature(feature, value);
        } catch (SAXNotRecognizedException | SAXNotSupportedException ignored) {
            // Optional parser feature. The JDK parser supports the ones this tool needs.
        }
    }

    private static void setPropertyIfSupported(SAXParser parser, String property, String value)
            throws SAXException {
        try {
            parser.setProperty(property, value);
        } catch (SAXNotRecognizedException | SAXNotSupportedException ignored) {
            // Optional JAXP property. Some parser implementations do not use it.
        }
    }

    private static String normalizeAttrValue(String attrName, String value) {
        if ("class".equals(attrName)) {
            return value;
        }
        return sortEnumerationValue(value.trim().replaceAll("\\s+", " "));
    }

    private static String sortEnumerationValue(String value) {
        String prefix = "";
        String body = value;
        if (body.startsWith("NOTATION ")) {
            prefix = "NOTATION ";
            body = body.substring("NOTATION ".length());
        }
        if (!body.startsWith("(") || !body.endsWith(")") || !body.contains("|")) {
            return value;
        }

        String inner = body.substring(1, body.length() - 1).trim();
        List<String> values = Arrays.stream(inner.split("\\|"))
                .map(String::trim)
                .collect(Collectors.toList());
        if (values.stream().anyMatch(String::isEmpty)) {
            return value;
        }

        List<String> ordered = values.stream()
                .distinct()
                .sorted(DtdToJson::compareEnumToken)
                .collect(Collectors.toList());
        return prefix + "(" + String.join(" | ", ordered) + ")";
    }

    private static int compareEnumToken(String left, String right) {
        int leftRank = "-dita-use-conref-target".equals(left) ? 1 : 0;
        int rightRank = "-dita-use-conref-target".equals(right) ? 1 : 0;
        if (leftRank != rightRank) {
            return Integer.compare(leftRank, rightRank);
        }
        return left.compareTo(right);
    }

    private static String toJson(Map<String, Map<String, String>> report) {
        StringBuilder out = new StringBuilder();
        out.append("{\n");
        int elementIndex = 0;
        for (Map.Entry<String, Map<String, String>> element : report.entrySet()) {
            if (elementIndex++ > 0) {
                out.append(",\n");
            }
            out.append("  \"").append(jsonEscape(element.getKey())).append("\": ");
            out.append("{");
            if (!element.getValue().isEmpty()) {
                out.append("\n");
                int attrIndex = 0;
                for (Map.Entry<String, String> attr : element.getValue().entrySet()) {
                    if (attrIndex++ > 0) {
                        out.append(",\n");
                    }
                    out.append("    \"").append(jsonEscape(attr.getKey())).append("\": ");
                    out.append("\"").append(jsonEscape(attr.getValue())).append("\"");
                }
                out.append("\n  ");
            }
            out.append("}");
        }
        out.append("\n}");
        return out.toString();
    }

    private static String xmlEscape(String value) {
        return value.replace("&", "&amp;").replace("\"", "&quot;");
    }

    private static String jsonEscape(String value) {
        StringBuilder escaped = new StringBuilder();
        for (int i = 0; i < value.length(); i++) {
            char ch = value.charAt(i);
            switch (ch) {
                case '"':
                    escaped.append("\\\"");
                    break;
                case '\\':
                    escaped.append("\\\\");
                    break;
                case '\b':
                    escaped.append("\\b");
                    break;
                case '\f':
                    escaped.append("\\f");
                    break;
                case '\n':
                    escaped.append("\\n");
                    break;
                case '\r':
                    escaped.append("\\r");
                    break;
                case '\t':
                    escaped.append("\\t");
                    break;
                default:
                    if (ch < 0x20) {
                        escaped.append(String.format("\\u%04x", (int) ch));
                    } else {
                        escaped.append(ch);
                    }
            }
        }
        return escaped.toString();
    }

    private static void printUsage() {
        System.err.println("Usage: javac DtdToJson.java && java DtdToJson [options] path/to/schema.dtd");
        System.err.println();
        System.err.println("Options:");
        System.err.println("  -o, --output FILE       Write JSON report to FILE instead of stdout");
        System.err.println("  --catalog FILE          XML Catalog for resolving PUBLIC/SYSTEM IDs; repeatable");
        System.err.println("  -h, --help              Show this help");
    }

    private static final class DtdDeclCollector implements DeclHandler {
        private final Set<String> elements = new TreeSet<>();
        private final Map<String, Map<String, String>> attrsByElement = new TreeMap<>();

        @Override
        public void elementDecl(String name, String model) {
            elements.add(name);
        }

        @Override
        public void attributeDecl(
                String elementName,
                String attributeName,
                String type,
                String mode,
                String value) {
            elements.add(elementName);
            String reportValue = value == null ? type : value;
            attrsByElement
                    .computeIfAbsent(elementName, ignored -> new TreeMap<>())
                    .put(attributeName, normalizeAttrValue(attributeName, reportValue));
        }

        @Override
        public void internalEntityDecl(String name, String value) {
            // Entity declarations are consumed by the parser; the report is element/attribute only.
        }

        @Override
        public void externalEntityDecl(String name, String publicId, String systemId) {
            // Entity declarations are consumed by the parser; the report is element/attribute only.
        }

        Map<String, Map<String, String>> report() {
            Map<String, Map<String, String>> result = new TreeMap<>();
            for (String element : elements) {
                result.put(element, attrsByElement.getOrDefault(element, new TreeMap<>()));
            }
            return result;
        }
    }

    private static final class CliOptions {
        private final Path dtdPath;
        private final Path output;
        private final List<Path> catalogs;
        private final boolean help;

        private CliOptions(Path dtdPath, Path output, List<Path> catalogs, boolean help) {
            this.dtdPath = dtdPath;
            this.output = output;
            this.catalogs = catalogs;
            this.help = help;
        }

        static CliOptions parse(String[] args) throws UsageException {
            Path dtdPath = null;
            Path output = null;
            List<Path> catalogs = new ArrayList<>();
            boolean help = false;

            for (int i = 0; i < args.length; i++) {
                String arg = args[i];
                switch (arg) {
                    case "-h":
                    case "--help":
                        help = true;
                        break;
                    case "-o":
                    case "--output":
                        output = requirePathArg(args, ++i, arg);
                        break;
                    case "--catalog":
                        catalogs.add(requirePathArg(args, ++i, arg));
                        break;
                    default:
                        if (arg.startsWith("-")) {
                            throw new UsageException("Unknown option: " + arg);
                        }
                        if (dtdPath != null) {
                            throw new UsageException("Only one DTD path may be provided.");
                        }
                        dtdPath = Path.of(arg);
                        break;
                }
            }

            if (!help && dtdPath == null) {
                throw new UsageException("Missing DTD path.");
            }
            return new CliOptions(dtdPath, output, catalogs, help);
        }

        private static Path requirePathArg(String[] args, int index, String option) throws UsageException {
            if (index >= args.length) {
                throw new UsageException("Missing value for " + option);
            }
            return Path.of(args[index]);
        }
    }

    private static final class UsageException extends Exception {
        UsageException(String message) {
            super(message);
        }
    }
}
