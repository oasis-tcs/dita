<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron">

  <title>Schematron rules for the DITA specification</title>
  
  <pattern>
    <rule context="draft-comment">
      <assert test="@audience">
        The draft-comment element must have an @audience attribute.
      </assert> 
      <assert test="@author">
        The draft-comment element must have an @author attribute.
      </assert>   
      <assert test="@time">
        The draft-comment element must have a @time attribute.
      </assert>
    </rule>
    
    <rule context="li | sli">
      <assert test="normalize-space(.) and not(@conref) or not(@conkeyref)">
        A list item is empty.
      </assert>
    </rule>
    
    <rule context="p">
      <assert test="normalize-space(.) and not(@conref) or not(@conkeyref)">
        A paragraph is empty.
      </assert>
    </rule>
    
<!--    <rule context="*[contains(@class, ' map/topicref ')]">
      <assert test="not(@navtitle)">
        The @navtitle attribute is deprecated and will  be removed in
        DITA 2.0. Replace it with a navtitle element.  
      </assert>
   </rule>-->
    
   <rule context="*[contains(@class, ' map/topicref ')]">
      <report test="@navtitle">
        The @navtitle attribute is deprecated and will  be removed in
        DITA 2.0. Replace it with a navtitle element.  
      </report>
   </rule>


  </pattern>
  
  </schema>


