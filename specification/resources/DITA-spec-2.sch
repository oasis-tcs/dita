<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">

    <sch:pattern>
        <sch:rule context="*[contains(@class, ' topic/indexterm ')]">
            <sch:assert test="ancestor::node()/local-name() = 'prolog'">
                Move the indexterm element to the prolog.
            </sch:assert>
        </sch:rule>
    </sch:pattern>

</sch:schema>
