import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;
import java.util.stream.Collectors;
import javax.xml.XMLConstants;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/**
 * Reads a modular Relax NG XML schema and reports declared elements/attributes as JSON.
 *
 * <p>This is intentionally shaped for DITA RNG modules: it follows include and
 * externalRef files, resolves XML catalogs, and resolves common attribute
 * reference patterns such as .attlist, .attributes, .att, and -atts.
 */
public final class RngToJson {
    private static final String RNG_NS = "http://relaxng.org/ns/structure/1.0";
    private static final String ANN_NS = "http://relaxng.org/ns/compatibility/annotations/1.0";
    private static final String CAT_NS = "urn:oasis:names:tc:entity:xmlns:xml:catalog";
    private static final String MATHML_NS = "http://www.w3.org/1998/Math/MathML";
    private static final String SVG_NS = "http://www.w3.org/2000/svg";
    private static final String RNG_INHERITED_NS_USER_DATA = "rngInheritedNs";

    private RngToJson() {
    }

    public static void main(String[] args) {
        try {
            CliOptions options = CliOptions.parse(args);
            if (options.help) {
                printUsage();
                return;
            }

            CatalogMaps catalogs = loadCatalogs(options.catalogs);
            Map<String, Map<String, String>> report = extractRngSummary(options.rngPath, catalogs);
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
            System.err.println("Failed to parse schema/catalog: " + ex.getMessage());
            System.exit(1);
        }
    }

    private static Map<String, Map<String, String>> extractRngSummary(Path rngPath, CatalogMaps catalogs)
            throws IOException, ParserConfigurationException, SAXException {
        if (!Files.exists(rngPath)) {
            throw new IOException("Schema file not found: " + rngPath);
        }

        GrammarForest forest = new GrammarForest(catalogs);
        forest.ingest(rngPath);

        AnalysisContext ctx = new AnalysisContext(forest.defines);
        Map<String, Map<String, String>> attrsByElement = new TreeMap<>();

        for (Element element : forest.elementNodes) {
            String elementName = element.getAttribute("name");
            if (elementName.isEmpty() || isIgnoredElement(element)) {
                continue;
            }
            Map<String, String> attrs = attrsByElement.computeIfAbsent(elementName, ignored -> new TreeMap<>());
            collectAttrsFromPattern(element, ctx, attrs, new HashSet<>());
        }

        return attrsByElement;
    }

    private static void collectAttrsFromPattern(
            Element node,
            AnalysisContext ctx,
            Map<String, String> attrs,
            Set<String> seenRefs) {
        if (isRng(node, "attribute")) {
            String rawName = node.getAttribute("name");
            if (!rawName.isEmpty()) {
                AttributeName attributeName = normalizeAttributeName(rawName, node);
                if (attributeName.namespaceDeclarationName != null) {
                    attrs.put(attributeName.namespaceDeclarationName, attributeName.namespaceUri);
                }
                String value;
                if (node.hasAttributeNS(ANN_NS, "defaultValue")) {
                    value = node.getAttributeNS(ANN_NS, "defaultValue");
                } else {
                    value = inferAttrType(node, ctx, new HashSet<>());
                }
                attrs.put(attributeName.reportName, normalizeAttrValue(attributeName.reportName, value));
            }
            return;
        }

        if (isRng(node, "ref")) {
            String name = node.getAttribute("name");
            if (!name.isEmpty()
                    && (isAttributeRef(name) || ctx.refCanProduceAttrs(name, new HashSet<>()))
                    && !seenRefs.contains(name)) {
                Map<String, String> cached = ctx.refAttrCache.get(name);
                if (cached != null) {
                    attrs.putAll(cached);
                    return;
                }

                seenRefs.add(name);
                Map<String, String> localAttrs = new TreeMap<>();
                for (Element define : ctx.defines.getOrDefault(name, List.of())) {
                    collectAttrsFromPattern(define, ctx, localAttrs, seenRefs);
                }
                attrs.putAll(localAttrs);
                ctx.refAttrCache.put(name, new TreeMap<>(localAttrs));
                seenRefs.remove(name);
            }
            return;
        }

        if (isRng(node, "element")) {
            if (isIgnoredElement(node)) {
                return;
            }
            for (Element child : childElements(node)) {
                if (!isRng(child, "element")) {
                    collectAttrsFromPattern(child, ctx, attrs, seenRefs);
                }
            }
            return;
        }

        for (Element child : childElements(node)) {
            collectAttrsFromPattern(child, ctx, attrs, seenRefs);
        }
    }

    private static String inferAttrType(Element node, AnalysisContext ctx, Set<String> seenRefs) {
        Set<String> values = collectValueLiterals(node, ctx, seenRefs);
        if (!values.isEmpty()) {
            List<String> ordered = values.stream()
                    .map(value -> normalizeAttrValue("_", value))
                    .distinct()
                    .sorted(RngToJson::compareEnumToken)
                    .collect(Collectors.toList());
            return "(" + String.join(" | ", ordered) + ")";
        }

        Set<String> dataTypes = collectDataTypes(node, ctx, new HashSet<>());
        if (!dataTypes.isEmpty()) {
            return dataTypes.stream().sorted().findFirst().orElse("CDATA");
        }
        return "CDATA";
    }

    private static Set<String> collectValueLiterals(Element node, AnalysisContext ctx, Set<String> seenRefs) {
        Set<String> out = new TreeSet<>(RngToJson::compareEnumToken);
        if (isRng(node, "value")) {
            String text = node.getTextContent();
            if (text != null && !text.trim().isEmpty()) {
                out.add(text.trim());
            }
            return out;
        }

        if (isRng(node, "ref")) {
            String name = node.getAttribute("name");
            if (name.isEmpty() || seenRefs.contains(name)) {
                return out;
            }
            Set<String> cached = ctx.refValueCache.get(name);
            if (cached != null) {
                return new TreeSet<>(cached);
            }

            seenRefs.add(name);
            for (Element define : ctx.defines.getOrDefault(name, List.of())) {
                out.addAll(collectValueLiterals(define, ctx, seenRefs));
            }
            ctx.refValueCache.put(name, new TreeSet<>(out));
            seenRefs.remove(name);
            return out;
        }

        for (Element child : childElements(node)) {
            out.addAll(collectValueLiterals(child, ctx, seenRefs));
        }
        return out;
    }

    private static Set<String> collectDataTypes(Element node, AnalysisContext ctx, Set<String> seenRefs) {
        Set<String> out = new TreeSet<>();
        if (isRng(node, "data")) {
            String type = node.getAttribute("type");
            out.add(normalizeDataType(type));
            return out;
        }
        if (isRng(node, "text")) {
            out.add("CDATA");
            return out;
        }

        if (isRng(node, "ref")) {
            String name = node.getAttribute("name");
            if (name.isEmpty() || seenRefs.contains(name)) {
                return out;
            }
            Set<String> cached = ctx.refTypeCache.get(name);
            if (cached != null) {
                return new TreeSet<>(cached);
            }

            seenRefs.add(name);
            for (Element define : ctx.defines.getOrDefault(name, List.of())) {
                out.addAll(collectDataTypes(define, ctx, seenRefs));
            }
            ctx.refTypeCache.put(name, new TreeSet<>(out));
            seenRefs.remove(name);
            return out;
        }

        for (Element child : childElements(node)) {
            out.addAll(collectDataTypes(child, ctx, seenRefs));
        }
        return out;
    }

    private static boolean isAttributeRef(String name) {
        return name.endsWith(".attlist")
                || name.endsWith(".attributes")
                || name.endsWith(".att")
                || name.endsWith("-atts")
                || name.contains("-atts-")
                || name.endsWith("-att");
    }

    private static boolean patternCanProduceAttrs(Element node, AnalysisContext ctx, Set<String> seenRefs) {
        if (isRng(node, "attribute")) {
            return true;
        }
        if (isRng(node, "element")) {
            return false;
        }
        if (isRng(node, "ref")) {
            String name = node.getAttribute("name");
            return !name.isEmpty() && ctx.refCanProduceAttrs(name, seenRefs);
        }
        for (Element child : childElements(node)) {
            if (patternCanProduceAttrs(child, ctx, seenRefs)) {
                return true;
            }
        }
        return false;
    }

    private static CatalogMaps loadCatalogs(List<Path> catalogPaths)
            throws IOException, ParserConfigurationException, SAXException {
        CatalogMaps maps = new CatalogMaps();
        Set<Path> seen = new HashSet<>();
        for (Path catalog : catalogPaths) {
            if (!Files.exists(catalog)) {
                throw new IOException("Catalog file not found: " + catalog);
            }
            loadCatalog(catalog, maps, seen);
        }
        return maps;
    }

    private static void loadCatalog(Path catalogPath, CatalogMaps maps, Set<Path> seen)
            throws IOException, ParserConfigurationException, SAXException {
        Path absPath = catalogPath.toAbsolutePath().normalize();
        if (!seen.add(absPath)) {
            return;
        }

        Document doc = newDocumentBuilder().parse(absPath.toFile());
        Path baseDir = absPath.getParent();

        for (Element uri : descendants(doc.getDocumentElement(), CAT_NS, "uri")) {
            String name = uri.getAttribute("name");
            String target = uri.getAttribute("uri");
            if (!name.isEmpty() && !target.isEmpty()) {
                maps.uriMap.put(name, baseDir.resolve(target).normalize());
            }
        }

        for (Element system : descendants(doc.getDocumentElement(), CAT_NS, "system")) {
            String systemId = system.getAttribute("systemId");
            String target = system.getAttribute("uri");
            if (!systemId.isEmpty() && !target.isEmpty()) {
                maps.systemMap.put(systemId, baseDir.resolve(target).normalize());
            }
        }

        for (Element nextCatalog : descendants(doc.getDocumentElement(), CAT_NS, "nextCatalog")) {
            String next = nextCatalog.getAttribute("catalog");
            if (!next.isEmpty()) {
                loadCatalog(baseDir.resolve(next).normalize(), maps, seen);
            }
        }
    }

    private static Path resolveHref(String href, Path baseDir, CatalogMaps catalogs) throws IOException {
        Path uriMatch = catalogs.uriMap.get(href);
        if (uriMatch != null) {
            return uriMatch;
        }
        Path systemMatch = catalogs.systemMap.get(href);
        if (systemMatch != null) {
            return systemMatch;
        }
        if (href.contains("://") || href.startsWith("urn:")) {
            throw new IOException("Cannot resolve remote href without catalog mapping: " + href);
        }
        return baseDir.resolve(href).normalize();
    }

    private static AttributeName normalizeAttributeName(String name, Element attributeNode) {
        int colon = name.indexOf(':');
        if (colon < 0) {
            return new AttributeName(name, null, null);
        }

        String prefix = name.substring(0, colon);
        String localName = name.substring(colon + 1);
        String namespaceUri = attributeNode.lookupNamespaceURI(prefix);
        if ("http://dita.oasis-open.org/architecture/2005/".equals(namespaceUri)) {
            String reportName = "ditaarch:" + localName;
            return new AttributeName(reportName, "xmlns:ditaarch", namespaceUri);
        }
        if (namespaceUri != null && !namespaceUri.isEmpty()) {
            return new AttributeName(name, "xmlns:" + prefix, namespaceUri);
        }
        return new AttributeName(name, null, null);
    }

    private static String normalizeDataType(String type) {
        if (type == null || type.isEmpty() || "string".equals(type)) {
            return "CDATA";
        }
        return type;
    }

    private static DocumentBuilder newDocumentBuilder() throws ParserConfigurationException {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        factory.setNamespaceAware(true);
        setFeatureIfSupported(factory, XMLConstants.FEATURE_SECURE_PROCESSING, true);
        setFeatureIfSupported(factory, "http://apache.org/xml/features/nonvalidating/load-external-dtd", false);
        DocumentBuilder builder = factory.newDocumentBuilder();
        builder.setEntityResolver((publicId, systemId) -> new org.xml.sax.InputSource(new java.io.StringReader("")));
        return builder;
    }

    private static void setFeatureIfSupported(DocumentBuilderFactory factory, String feature, boolean value)
            throws ParserConfigurationException {
        try {
            factory.setFeature(feature, value);
        } catch (ParserConfigurationException ignored) {
            // Some JAXP implementations do not expose every optional feature.
        }
    }

    private static List<Element> descendants(Element root, String namespace, String localName) {
        List<Element> out = new ArrayList<>();
        NodeList nodes = root.getElementsByTagNameNS(namespace, localName);
        for (int i = 0; i < nodes.getLength(); i++) {
            Node node = nodes.item(i);
            if (node instanceof Element element) {
                out.add(element);
            }
        }
        return out;
    }

    private static List<Element> childElements(Element node) {
        List<Element> out = new ArrayList<>();
        NodeList children = node.getChildNodes();
        for (int i = 0; i < children.getLength(); i++) {
            Node child = children.item(i);
            if (child instanceof Element element) {
                out.add(element);
            }
        }
        return out;
    }

    private static boolean isRng(Element node, String localName) {
        return RNG_NS.equals(node.getNamespaceURI()) && localName.equals(node.getLocalName());
    }

    private static boolean isIgnoredElement(Element element) {
        String elementNamespace = rngElementNamespace(element);
        return MATHML_NS.equals(elementNamespace) || SVG_NS.equals(elementNamespace);
    }

    private static String rngElementNamespace(Element element) {
        String name = element.getAttribute("name");
        int colon = name.indexOf(':');
        if (colon > 0) {
            String namespaceUri = element.lookupNamespaceURI(name.substring(0, colon));
            return namespaceUri == null ? "" : namespaceUri;
        }

        for (Node node = element; node instanceof Element current; node = node.getParentNode()) {
            if (current.hasAttribute("ns")) {
                return current.getAttribute("ns");
            }
        }
        Object inheritedNamespace = element.getUserData(RNG_INHERITED_NS_USER_DATA);
        if (inheritedNamespace instanceof String namespace) {
            return namespace;
        }
        return "";
    }

    private static String normalizeAttrValue(String attrName, String value) {
        if ("class".equals(attrName)) {
            return value;
        }
        if ("specializations".equals(attrName)) {
            return sortWhitespaceTokens(value);
        }
        return sortEnumerationValue(value.trim().replaceAll("\\s+", " "));
    }

    private static String sortWhitespaceTokens(String value) {
        return Arrays.stream(value.trim().split("\\s+"))
                .filter(token -> !token.isEmpty())
                .distinct()
                .sorted()
                .collect(Collectors.joining(" "));
    }

    private static String sortEnumerationValue(String value) {
        if (!value.startsWith("(") || !value.endsWith(")") || !value.contains("|")) {
            return value;
        }
        String inner = value.substring(1, value.length() - 1).trim();
        List<String> values = Arrays.stream(inner.split("\\|"))
                .map(String::trim)
                .collect(Collectors.toList());
        if (values.stream().anyMatch(String::isEmpty)) {
            return value;
        }
        List<String> ordered = values.stream()
                .distinct()
                .sorted(RngToJson::compareEnumToken)
                .collect(Collectors.toList());
        return "(" + String.join(" | ", ordered) + ")";
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
        System.err.println("Usage: javac RngToJson.java && java RngToJson [options] path/to/schema.rng");
        System.err.println();
        System.err.println("Options:");
        System.err.println("  -o, --output FILE       Write JSON report to FILE instead of stdout");
        System.err.println("  --catalog FILE          XML Catalog for resolving include/externalRef hrefs; repeatable");
        System.err.println("  -h, --help              Show this help");
    }

    private static final class GrammarForest {
        private final CatalogMaps catalogs;
        private final Set<Path> visitedFiles = new HashSet<>();
        private final Map<String, List<Element>> defines = new HashMap<>();
        private final List<Element> elementNodes = new ArrayList<>();

        private GrammarForest(CatalogMaps catalogs) {
            this.catalogs = catalogs;
        }

        private void ingest(Path path) throws IOException, ParserConfigurationException, SAXException {
            ingest(path, "");
        }

        private void ingest(Path path, String inheritedNamespace)
                throws IOException, ParserConfigurationException, SAXException {
            Path absPath = path.toAbsolutePath().normalize();
            if (!visitedFiles.add(absPath)) {
                return;
            }

            Document doc = newDocumentBuilder().parse(absPath.toFile());
            Element root = doc.getDocumentElement();
            Path baseDir = absPath.getParent();
            String effectiveNamespace = root.hasAttribute("ns") ? root.getAttribute("ns") : inheritedNamespace;

            for (Element define : descendants(root, RNG_NS, "define")) {
                String name = define.getAttribute("name");
                if (!name.isEmpty()) {
                    defines.computeIfAbsent(name, ignored -> new ArrayList<>()).add(define);
                }
            }

            elementNodes.addAll(descendants(root, RNG_NS, "element").stream()
                    .filter(element -> element.hasAttribute("name"))
                    .peek(element -> element.setUserData(RNG_INHERITED_NS_USER_DATA, effectiveNamespace, null))
                    .collect(Collectors.toCollection(LinkedHashSet::new)));

            for (Element include : descendants(root, RNG_NS, "include")) {
                String href = include.getAttribute("href");
                if (!href.isEmpty()) {
                    ingest(resolveHref(href, baseDir, catalogs), effectiveNamespace);
                }
            }

            for (Element externalRef : descendants(root, RNG_NS, "externalRef")) {
                String href = externalRef.getAttribute("href");
                if (!href.isEmpty()) {
                    ingest(resolveHref(href, baseDir, catalogs), effectiveNamespace);
                }
            }
        }
    }

    private static final class AnalysisContext {
        private final Map<String, List<Element>> defines;
        private final Map<String, Map<String, String>> refAttrCache = new HashMap<>();
        private final Map<String, Set<String>> refValueCache = new HashMap<>();
        private final Map<String, Set<String>> refTypeCache = new HashMap<>();
        private final Map<String, Boolean> attrProducingRefCache = new HashMap<>();

        private AnalysisContext(Map<String, List<Element>> defines) {
            this.defines = defines;
        }

        private boolean refCanProduceAttrs(String name, Set<String> seenRefs) {
            Boolean cached = attrProducingRefCache.get(name);
            if (cached != null) {
                return cached;
            }
            if (!seenRefs.add(name)) {
                return false;
            }

            boolean result = false;
            for (Element define : defines.getOrDefault(name, List.of())) {
                if (patternCanProduceAttrs(define, this, seenRefs)) {
                    result = true;
                    break;
                }
            }
            seenRefs.remove(name);
            attrProducingRefCache.put(name, result);
            return result;
        }
    }

    private static final class CatalogMaps {
        private final Map<String, Path> uriMap = new HashMap<>();
        private final Map<String, Path> systemMap = new HashMap<>();
    }

    private static final class AttributeName {
        private final String reportName;
        private final String namespaceDeclarationName;
        private final String namespaceUri;

        private AttributeName(String reportName, String namespaceDeclarationName, String namespaceUri) {
            this.reportName = reportName;
            this.namespaceDeclarationName = namespaceDeclarationName;
            this.namespaceUri = namespaceUri;
        }
    }

    private static final class CliOptions {
        private final Path rngPath;
        private final Path output;
        private final List<Path> catalogs;
        private final boolean help;

        private CliOptions(Path rngPath, Path output, List<Path> catalogs, boolean help) {
            this.rngPath = rngPath;
            this.output = output;
            this.catalogs = catalogs;
            this.help = help;
        }

        static CliOptions parse(String[] args) throws UsageException {
            Path rngPath = null;
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
                        if (rngPath != null) {
                            throw new UsageException("Only one RNG path may be provided.");
                        }
                        rngPath = Path.of(arg);
                        break;
                }
            }

            if (!help && rngPath == null) {
                throw new UsageException("Missing RNG schema path.");
            }
            return new CliOptions(rngPath, output, catalogs, help);
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
