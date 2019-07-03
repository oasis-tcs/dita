<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">

    <sch:pattern id="draft-comment-attr">
        <!-- Identify draft comments without required attributes -->
        <sch:rule context="*[contains(@class, ' topic/draft-comment ')]">
            <sch:assert test="@audience"> 
                The draft-comment element needs an @audience attribute.
            </sch:assert>
            <sch:assert test="@author">
                The draft-comment element needs an @author attribute.
            </sch:assert>
            <sch:assert test="@time">
                The draft-comment element must have a @time attribute.
            </sch:assert>
        </sch:rule>
    </sch:pattern>
    
   <sch:pattern id="examples-wo-titles">
        <!-- Identify examples in element-reference topics that do not have a title -->
        <sch:rule context="*[contains(@class, ' reference/refbody ')]">
            <sch:assert test="*[contains(@class, ' topic/example ')]/*[contains(@class, ' topic/title ')]"> 
                Example elements need to have a title.
                Use 'Example' or "Examples," depending on the number of examples in the
                element reference topic.
            </sch:assert>
        </sch:rule>
    </sch:pattern>
  
    <sch:pattern id="multiple-examples">
        <!-- Identify multiple example elements in reference topics -->
        <sch:rule context="*[contains(@class, ' reference/refbody ')]">
            <sch:report test="count(*[contains(@class, ' topic/example ')]) > 1">
               This topic contains multiple &lt;example> elements.
               An element-reference topic should have a single &lt;example>
               element; use &lt;fig> elements with titles if there are multiple
               examples.
            </sch:report>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="indexterm-not-in-prolog">
        <!-- Identify indexterms not in prolog -->
        <sch:rule context="*[contains(@class, ' topic/indexterm ')]">
            <sch:assert test="ancestor::node()/local-name() = 'prolog'">
                Move the &lt;indexterm element> to the prolog.
            </sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="empty-list-items">
        <!-- Identify empty list items -->
        <sch:rule context="*[contains(@class, ' topic/li ')]
                         | *[contains(@class, ' topic/sli ')]
                            [not(@conref)]
                            [not(@conkeyref)]">
            <sch:report test="normalize-space(.)">
                A list item is empty. Remove it or add content.
            </sch:report>            
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="empty-paragraphs">
        <!-- Identify empty paragraphs -->
        <sch:rule context="*[contains(@class, ' topic/p ')]
                            [not(@conref)]
                            [not(@conkeyref)]">
            <sch:report test="not(node())">
                A paragraph is empty. Remove it or add content.
            </sch:report>            
        </sch:rule>
    </sch:pattern>
  
    <sch:pattern id="section-multiple-titles">
        <!-- Identify sections with multiple titles -->
        <sch:rule context="*[contains(@class, ' topic/section ')]">
            <sch:report test="count(*[contains(@class, ' topic/title ')]) > 1" role="warning">
                A &lt;<sch:name/>> element should contain only a single title.
            </sch:report>
        </sch:rule>        
    </sch:pattern>
  
    <sch:pattern id="shortdesc-missing">
        <!-- Identify topics that lack a short description. -->
        <sch:rule context="*[contains(@class, ' topic/topic ')]">
            <sch:assert test="*[contains(@class, ' topic/shortdesc ')]">
                A topic needs to have a short description.
            </sch:assert>
        </sch:rule>
    </sch:pattern>

</sch:schema>


