<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:err="http://www.w3.org/2005/xqt-errors" version="3.0" exclude-result-prefixes="xs err">

  <xsl:param name="output.dir"/>
  <xsl:param name="FILEDIR"/>
  <xsl:param name="FILENAME"/>

  <xsl:output indent="yes" omit-xml-declaration="yes"/>

  <xsl:template match="/">
    <xsl:variable name="errors" as="element()*">
      <xsl:for-each select="descendant::*[contains(@class, ' pr-d/codeblock ')]">
        <xsl:variable name="text" as="xs:string">
          <xsl:value-of>
            <xsl:apply-templates select="node()" mode="text-only"/>
          </xsl:value-of>
        </xsl:variable>
        <xsl:variable name="normalized" select="normalize-space($text)" as="xs:string"/>
        <xsl:choose>
          <xsl:when test="starts-with($normalized, '&lt;') and ends-with($normalized, '&gt;')">
            <xsl:try>
              <xsl:variable name="parsed" select="parse-xml($text)/*[namespace-uri() = '']" as="element()"/>
              <xsl:if test="$parsed">
                <fragment>
                  <xsl:copy-of select="@xtrf | @xtrc"/>
                  <xsl:copy-of select="$parsed"/>
                </fragment>
              </xsl:if>
              <xsl:catch>
                <xsl:try>
                  <xsl:variable name="parsed"
                    select="parse-xml(concat('&lt;wrapper>', $text, '&lt;/wrapper>'))/wrapper/*[namespace-uri() = '']"
                    as="element()*"/>
                  <xsl:if test="$parsed">
                    <fragment>
                      <xsl:copy-of select="@xtrf | @xtrc"/>
                      <xsl:copy-of select="$parsed"/>
                    </fragment>
                  </xsl:if>
                  <xsl:catch>
                    <err:codeblock err:code="{$err:code}" err:description="{$err:description}">
                      <xsl:attribute name="FILEDIR" select="$FILEDIR"/>
                      <xsl:attribute name="FILENAME" select="$FILENAME"/>
                      <xsl:value-of select="$text"/>
                    </err:codeblock>
                  </xsl:catch>
                </xsl:try>
              </xsl:catch>
            </xsl:try>
          </xsl:when>
        </xsl:choose>
      </xsl:for-each>
    </xsl:variable>
    <xsl:apply-templates select="$errors" mode="serialize"/>
  </xsl:template>

  <xsl:template match="fragment[dita]" mode="serialize">
    <xsl:result-document href="{concat($output.dir, '/', $FILEDIR, '/', $FILENAME, '.xml')}"
      doctype-public="-//OASIS//DTD DITA 2.0 Composite//EN" doctype-system="ditabase.dtd">
      <xsl:apply-templates select="." mode="copy"/>
    </xsl:result-document>
  </xsl:template>
  
  <xsl:template match="fragment[concept]" mode="serialize">
    <xsl:result-document href="{concat($output.dir, '/', $FILEDIR, '/', $FILENAME, '.xml')}"
      doctype-public="-//OASIS//DTD DITA 2.0 Concept//EN" doctype-system="concept.dtd">
      <xsl:apply-templates select="." mode="copy"/>
    </xsl:result-document>
  </xsl:template>

  <xsl:template match="fragment[task | steps | step]" mode="serialize">
    <xsl:result-document href="{concat($output.dir, '/', $FILEDIR, '/', $FILENAME, '.xml')}"
      doctype-public="-//OASIS//DTD DITA 2.0 Task//EN" doctype-system="task.dtd">
      <xsl:apply-templates select="." mode="copy"/>
    </xsl:result-document>
  </xsl:template>

  <xsl:template match="fragment[reference]" mode="serialize">
    <xsl:result-document href="{concat($output.dir, '/', $FILEDIR, '/', $FILENAME, '.xml')}"
      doctype-public="-//OASIS//DTD DITA 2.0 Reference//EN" doctype-system="reference.dtd">
      <xsl:apply-templates select="." mode="copy"/>
    </xsl:result-document>
  </xsl:template>

  <xsl:template match="fragment[descendant::topicsubject]" mode="serialize" priority="10">
    <xsl:result-document href="{concat($output.dir, '/', $FILEDIR, '/', $FILENAME, '.xml')}"
      doctype-public="-//OASIS//DTD DITA 2.0 Classification Map//EN" doctype-system="classifyMap.dtd">
      <xsl:apply-templates select="." mode="copy"/>
    </xsl:result-document>
  </xsl:template>

  <xsl:template match="fragment[map | topicref | keydef | topicsubject | topicgroup]" mode="serialize">
    <xsl:result-document href="{concat($output.dir, '/', $FILEDIR, '/', $FILENAME, '.xml')}"
      doctype-public="-//OASIS//DTD DITA 2.0 Base Map//EN" doctype-system="map.dtd">
      <xsl:apply-templates select="." mode="copy"/>
    </xsl:result-document>
  </xsl:template>

  <xsl:template match="fragment[subjectScheme | topicsubject | subjectdef]" mode="serialize">
    <xsl:result-document href="{concat($output.dir, '/', $FILEDIR, '/', $FILENAME, '.xml')}"
      doctype-public="-//OASIS//DTD DITA 2.0 Subject Scheme Map//EN" doctype-system="subjectScheme.dtd">
      <xsl:apply-templates select="." mode="copy"/>
    </xsl:result-document>
  </xsl:template>

  <xsl:template match="fragment[val]" mode="serialize">
    <xsl:result-document href="{concat($output.dir, '/', $FILEDIR, '/', $FILENAME, '.xml')}"
      doctype-public="-//OASIS//DTD DITA 2.0 DITAVAL//EN" doctype-system="ditaval.dtd">
      <xsl:apply-templates select="." mode="copy"/>
    </xsl:result-document>
  </xsl:template>

  <xsl:template match="fragment[glossentry]" mode="serialize">
    <xsl:result-document href="{concat($output.dir, '/', $FILEDIR, '/', $FILENAME, '.xml')}"
      doctype-public="-//OASIS//DTD DITA 2.0 Glossary Entry//EN" doctype-system="glossentry.dtd">
      <xsl:apply-templates select="." mode="copy"/>
    </xsl:result-document>
  </xsl:template>

  <xsl:template match="fragment" mode="serialize" priority="0">
    <xsl:result-document href="{concat($output.dir, '/', $FILEDIR, '/', $FILENAME, '.xml')}"
      doctype-public="-//OASIS//DTD DITA 2.0 Topic//EN" doctype-system="topic.dtd">
      <xsl:apply-templates select="." mode="copy"/>
    </xsl:result-document>
  </xsl:template>

  <xsl:template match="fragment" mode="copy">
    <xsl:processing-instruction name="xtrf" select="@xtrf"/>
    <xsl:processing-instruction name="xtrc" select="@xtrc"/>
    <xsl:copy-of select="*"/>
  </xsl:template>

  <xsl:template match="*" mode="text-only" priority="10">
    <xsl:apply-templates select="node()" mode="#current"/>
  </xsl:template>

  <xsl:template match="text()" mode="text-only" priority="10">
    <xsl:value-of select="."/>
  </xsl:template>

  <xsl:template match="node()" mode="text-only" priority="0"/>

</xsl:stylesheet>
