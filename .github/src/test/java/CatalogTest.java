import org.junit.Test;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xmlresolver.Resolver;
import org.xmlresolver.XMLResolverConfiguration;

import java.io.IOException;
import java.nio.file.Paths;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

public class CatalogTest {
    @Test
    public void loadCatalog() throws IOException, SAXException {
        final String catalog = Paths.get("../doctypes/catalog.xml").toAbsolutePath().toUri().toString();
        final XMLResolverConfiguration config = new XMLResolverConfiguration(catalog);

        final Resolver resolver = new Resolver(config);
        final InputSource act = resolver.resolveEntity("-//OASIS//DTD DITA 2.0 Base Topic//EN", "foo");

        assertNotNull(act.getSystemId());
        assertTrue(act.getByteStream() != null || act.getCharacterStream() != null);
    }
}