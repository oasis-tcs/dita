import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.Parameters;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.ErrorHandler;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;
import org.xmlresolver.Resolver;
import org.xmlresolver.ResolverFeature;
import org.xmlresolver.XMLResolverConfiguration;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.IOException;
import java.net.URI;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collection;
import java.util.stream.Collectors;

import static org.junit.Assert.fail;

@RunWith(Parameterized.class)
public class CodeblockTest {

    @Parameters(name = "{0}")
    public static Collection<Object[]> data() throws IOException {
        final Path out = Paths.get(System.getProperty("out"));
        return Files.list(out)
                .map(file -> new Object[]{file})
                .collect(Collectors.toList());
    }

    private final Path file;
    private final DocumentBuilderFactory builderFactory;
    private DocumentBuilder documentBuilder;
    private XMLResolverConfiguration config;

    public CodeblockTest(final Path file) {
        this.file = file;

        builderFactory = DocumentBuilderFactory.newInstance();
        builderFactory.setNamespaceAware(true);
        builderFactory.setValidating(true);

        final String catalog = Paths.get(System.getProperty("catalogs")).toAbsolutePath().toUri().toString();
        config = new XMLResolverConfiguration(catalog);
        config.setFeature(ResolverFeature.PREFER_PUBLIC, true);
    }

    @Before
    public void setup() throws ParserConfigurationException {
        documentBuilder = builderFactory.newDocumentBuilder();
        final Resolver resolver = new Resolver(config);
        documentBuilder.setEntityResolver(resolver);
        documentBuilder.setErrorHandler(new ErrorHandler() {
            @Override
            public void warning(SAXParseException exception) throws SAXException {
                throw new SAXException(exception.getMessage(), exception);
            }

            @Override
            public void error(SAXParseException exception) throws SAXException {
                throw new SAXException(exception.getMessage(), exception);
            }

            @Override
            public void fatalError(SAXParseException exception) throws SAXException {
                throw new SAXException(exception.getMessage(), exception);
            }
        });
    }

    @Test
    public void loadCatalog() throws IOException, SAXException, ParserConfigurationException {
        try {
            documentBuilder.parse(file.toFile());
        } catch (SAXException e) {
            DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
            builderFactory.setNamespaceAware(true);
            builderFactory.setValidating(false);
            DocumentBuilder documentBuilder = builderFactory.newDocumentBuilder();
            final Resolver resolver = new Resolver(config);
            documentBuilder.setEntityResolver(resolver);
            final Document doc = documentBuilder.parse(file.toFile());
            fail("Failed to parse " + getLocation(doc) + ": " + e.getMessage());
        }
    }

    private String getLocation(Document doc) {
        final StringBuilder buf = new StringBuilder();
        final NodeList childNodes = doc.getChildNodes();
        for (int i = 0; i < childNodes.getLength() ; i++) {
            final Node item = childNodes.item(i);
            if (item.getNodeType() == Node.PROCESSING_INSTRUCTION_NODE && item.getNodeName().equals("xtrf")) {
                final URI root = Paths.get(System.getProperty("root")).toAbsolutePath().normalize().toUri();
                final URI nodeValue = Paths.get(URI.create(item.getNodeValue())).toAbsolutePath().normalize().toUri();
                final URI path = root.relativize(nodeValue);
                buf.append("https://github.com/");
                buf.append(System.getProperty("repository"));
                buf.append("/blob/");
                buf.append(System.getProperty("sha"));
                buf.append("/");
                buf.append(path);
                break;
            }
        }
        for (int i = 0; i < childNodes.getLength() ; i++) {
            final Node item = childNodes.item(i);
            if (item.getNodeType() == Node.PROCESSING_INSTRUCTION_NODE && item.getNodeName().equals("xtrc")) {
                final String value = item.getNodeValue();
                buf.append("#L");
                buf.append(value, value.indexOf(";") + 1, value.lastIndexOf(":"));
                break;
            }
        }
        return buf.toString();
    }
}