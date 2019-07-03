<?xml version="1.0" encoding="UTF-8"?>
<sch:schema 
    xmlns:sch="http://purl.oclc.org/dsdl/schematron" 
    queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    
    <sch:pattern id="abstract-w-shortdesc">
        <sch:rule context="*[contains(@class, ' topic/abstract ')]">
            <sch:assert test="*[contains(@class, ' topic/shortdesc ')]">
                An &lt;<sch:name/>> element should contain at least one &lt;shortdesc> element.
            </sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="example-titles">
        <sch:rule context="*[contains(@class, ' topic/example ')]">
            <sch:assert test="*[contains(@class, ' topic/title ')] = 'Example' or 'Examples'" role="warning">
                A title element in an <sch:name/> should contain 'Example' or 'Examples".
            </sch:assert>
        </sch:rule>        
    </sch:pattern>
    
    <sch:pattern id="may-must-should">
        <sch:rule context="text()">
            <sch:report test="contains(., 'may')">
               This topic contains the word 'should'.
               If possible, recast the wording to avoid the word.
            </sch:report>
            <sch:report test="contains(., 'must')">
               This topic contains the word 'must'.
               If possible, recast the wording to avoid the word.
            </sch:report>
            <sch:report test="contains(., 'should')">
               This topic contains the word 'should'.
               If possible, recast the wording to avoid the word.
            </sch:report>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>