<?xml version="1.0" encoding="UTF-8"?>

<sch:schema 
    xmlns:sch="http://purl.oclc.org/dsdl/schematron" 
    queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    
    <sch:pattern id="boolean">
        <sch:rule context="*">
            <sch:report test="*[contains(@class, ' topic/boolean ')]">
               The &lt;boolean> element is deprecated. It will be removed in DITA 2.0.
               Replace it with a &lt;state> or &lt;data> element.
            </sch:report>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="chunk-attr">
        <sch:rule context="*[contains(@class, ' map/topicref ')]">
            <sch:report test="@chunk = 'to-navigation'">
                The 'to-navigation' token for the @chunk attribute is deprecated. 
                It will be removed in DITA 2.0.
            </sch:report>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="image">
        <sch:rule context="*[contains(@class, ' topic/image ')]">
            <sch:report test="@alt">
                The @alt attribute is deprecated. It will be removed in DITA 2.0.
                Replace it with an &lt;alt> element.
            </sch:report>
            <sch:report test="@longdescref">
                The @longdescref attribute is deprecated. It will be removed in DITA 2.0.
                Replace it with a &lt;longdescref> element.
            </sch:report>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="indextermref">
        <sch:rule context="*">
            <sch:report test="*[contains(@class, ' topic/indextermref ')]">
                The &lt;indextermref> element is 'reserved for future use.'
                It will be removed in DITA 2.0.
            </sch:report>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="linklist-linkpool">
        <sch:rule context="*[contains(@class, ' topic/linklist ')] 
                         | *[contains(@class, ' topic/linkpool ')]">
            <sch:report test="@collection-type = 'tree'">
                The 'tree' token for the @collection-type attribute on  &lt;<sch:name/>> is deprecated. 
                It will be removed in DITA 2.0.
            </sch:report>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="navref">
        <sch:rule context="*[contains(@class, ' map/navref ')]">
            <sch:report test="@keyref">
                The @keyref attribute on &lt;navref> is not defined. 
                It will be removed in DITA 2.0.
            </sch:report>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="navtitle-attr">
        <sch:rule context="*[contains(@class, ' map/topicref ')]">
            <sch:report test="@navtitle">
                The @navtitle attribute is deprecated. It will be removed in DITA 2.0.
                Replace it with an &lt;navtitle> element.
            </sch:report>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="print-attr">
        <sch:rule context="*[contains(@class, ' map/topicref ')]">
            <sch:report test="@print">
                The @print attribute is deprecated. It will be removed in DITA 2.0.
                Replace it with a @deliveryTarget attribute.
            </sch:report>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="query-attr">
        <sch:rule context="*[contains(@class, ' map/topicref ')]">
            <sch:report test="@query">
                The @query attribute is deprecated. It will be removed in DITA 2.0.
            </sch:report>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="refcols-attr">
        <sch:rule context="*[contains(@class, ' topic/simpletable ')]">
            <sch:report test="@refcols">
                The @refcols attribute is undefined. It will be removed in DITA 2.0.
            </sch:report>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="relcolspec-reltable">
        <sch:rule context="*[contains(@class, ' map/relcolspec ')] 
                         | *[contains(@class, ' map/reltable ')]">
            <sch:report test="@collection-type">
                The @collection-type attribute on  &lt;<sch:name/>> is deprecated. 
                It will be removed in DITA 2.0.
            </sch:report>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="title-attr">
        <sch:rule context="*[contains(@class, ' map/map ')]">
            <sch:report test="@title">
                The @title attribute is deprecated. It will be removed in DITA 2.0.
                Replace it with an &lt;title> element.
            </sch:report>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="topicgroup-topichead">
        <sch:rule context="*[contains(@class, ' mapgroup-d/topicgroup ')]
                         | *[contains(@class, ' mapgroup-d/topichead ')]">
            <sch:report test="@locktitle">
                The @locktitle attribute on &lt;<sch:name/>> is deprecated. 
                It will be removed in DITA 2.0.
            </sch:report>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>