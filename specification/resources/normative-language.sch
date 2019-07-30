<?xml version="1.0" encoding="UTF-8"?>
<sch:schema 
    xmlns:sch="http://purl.oclc.org/dsdl/schematron" 
    queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    
    <sch:pattern id="may">
        <sch:rule context="text()[contains(., ' may ')]">
            <sch:assert test="preceding::comment()[contains(., 'IGNORE may-must-should word')]">
               This topic contains the word 'may'.
               If possible, recast the wording to avoid the word.               
            </sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="must">
        <sch:rule context="text()[contains(., ' must ')]">
            <sch:assert test="preceding::comment()[contains(., 'IGNORE may-must-should word')]">
               This topic contains the word 'must'.
               If possible, recast the wording to avoid the word.               
            </sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="should">
        <sch:rule context="text()[contains(., ' should ')]">
            <sch:assert test="preceding::comment()[contains(., 'IGNORE may-must-should word')]">
               This topic contains the word 'should'.
               If possible, recast the wording to avoid the word.               
            </sch:assert>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>