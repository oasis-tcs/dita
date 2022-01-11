<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    DITA Map Group Domain                             -->
<!--  VERSION:   2.0                                               -->
<!--  DATE:      [[[Release date]]]                                     -->
<!--  PURPOSE:   Define elements and specialization attributes     -->
<!--             for Map Group Domain                              -->
<!--                                                               -->
<!-- ============================================================= -->
<!-- ============================================================= -->
<!--                    PUBLIC DOCUMENT TYPE DEFINITION            -->
<!--                    TYPICAL INVOCATION                         -->
<!--                                                               -->
<!--  Refer to this file by the following public identifier or an  -->
<!--       appropriate system identifier                           -->
<!-- PUBLIC "-//OASIS//ELEMENTS DITA 2.0 Map Group Domain//EN"     -->
<!--       Delivered as file "mapGroup.mod"                        -->
<!-- ============================================================= -->
<!--                                                               -->
<!--             (C) Copyright OASIS Open 2005, 2009.              -->
<!--             (C) Copyright IBM Corporation 2001, 2004.         -->
<!--             All Rights Reserved.                              -->
<!--                                                               -->
<!--  UPDATES:                                                     -->
<!--    2018.03.14 KJE: Added new attribute group for use on       -->
<!--                    topichead and topicgroup (removes          -->
<!--                    @collection-type); removed @query          -->
<!--    2019.12.04 KJE: Add <mapresources>                         -->
<!--                                                               -->
<!-- ============================================================= -->
<!--                                                               -->
<!--                                                               -->

<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->

<!ENTITY % topichead      "topichead"                                   >
<!ENTITY % topicgroup     "topicgroup"                                  >
<!ENTITY % mapref         "mapref"                                      >
<!ENTITY % keydef         "keydef"                                      >
<!ENTITY % mapresources   "mapresources"                          >

<!-- ============================================================= -->
<!--                    COMMON ATTLIST SETS                        -->
<!-- ============================================================= -->  


<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!--                    LONG NAME: Topichead                       -->
<!ENTITY % topichead.content
                       "((%topicmeta;)?,
                         (%data.elements.incl; |
                          %navref; |
                          %topicref;)*)"
>
<!ENTITY % topichead.attributes
              "keys
                          CDATA
                                    #IMPLIED
               %topicref-atts;
               %univ-atts;"
>
<!ELEMENT  topichead %topichead.content;>
<!ATTLIST  topichead %topichead.attributes;>


<!--                    LONG NAME: Topicgroup                      -->
<!ENTITY % topicgroup.content
                       "((%topicmeta;)?,
                         (%data.elements.incl; |
                          %navref; |
                          %topicref;)*)"
>
<!ENTITY % topicgroup.attributes
              "%topicref-atts;
               %univ-atts;"
>
<!ELEMENT  topicgroup %topicgroup.content;>
<!ATTLIST  topicgroup %topicgroup.attributes;>


<!--                    LONG NAME: Map reference                   -->
<!ENTITY % mapref.content
                       "((%topicmeta;)?,
                         (%data.elements.incl;)*)"
>
<!ENTITY % mapref.attributes
              "href
                          CDATA
                                    #IMPLIED
               keyref
                          CDATA
                                    #IMPLIED
               keys
                          CDATA
                                    #IMPLIED
               format
                          CDATA
                                    'ditamap'
               %topicref-atts-without-format;
               %univ-atts;"
>
<!ELEMENT  mapref %mapref.content;>
<!ATTLIST  mapref %mapref.attributes;>

<!--                    LONG NAME: Keydef                          -->
<!ENTITY % keydef.content
                       "((%topicmeta;)?,
                         (%data.elements.incl; |
                          %navref; |
                          %topicref;)*)"
>
<!ENTITY % keydef.attributes
              "href
                          CDATA
                                    #IMPLIED
               keyref
                          CDATA
                                    #IMPLIED
               keys
                          CDATA
                                    #REQUIRED
               keyscope
                          CDATA
                                    #IMPLIED
               collection-type
                          (choice |
                           family |
                           sequence |
                           unordered |
                           -dita-use-conref-target)
                                    #IMPLIED
               processing-role
                          (normal |
                           resource-only |
                           -dita-use-conref-target)
                                    'resource-only'
               type
                          CDATA
                                    #IMPLIED
               cascade
                          CDATA
                                    #IMPLIED
               scope
                          (external |
                           local |
                           peer |
                           -dita-use-conref-target)
                                    #IMPLIED
               format
                          CDATA
                                    #IMPLIED
               linking
                          (none |
                           normal |
                           sourceonly |
                           targetonly |
                           -dita-use-conref-target)
                                    #IMPLIED
               toc
                          (no |
                           yes |
                           -dita-use-conref-target)
                                    #IMPLIED
               search
                          (no |
                           yes |
                           -dita-use-conref-target)
                                    #IMPLIED
               chunk
                          CDATA
                                    #IMPLIED
               %univ-atts;"
>
<!ELEMENT  keydef %keydef.content;>
<!ATTLIST  keydef %keydef.attributes;>

<!--                    LONG NAME: Map resources                          -->
<!ENTITY % mapresources.content
                       "(
                         (%topicmeta;)?,
                         (%data.elements.incl; | %topicref;)*
                         )"
>
<!ENTITY % mapresources.attributes
              "href
                          CDATA
                                    #IMPLIED
               keyref
                          CDATA
                                    #IMPLIED
               keys
                          CDATA
                                    #IMPLIED
               keyscope
                          CDATA
                                    #IMPLIED
               processing-role
                          (normal |
                           resource-only |
                           -dita-use-conref-target)
                                    'resource-only'
               type
                          CDATA
                                    #IMPLIED
               cascade
                          CDATA
                                    #IMPLIED
               scope
                          (external |
                           local |
                           peer |
                           -dita-use-conref-target)
                                    #IMPLIED
               format
                          CDATA
                                    #IMPLIED
               linking
                          (none |
                           normal |
                           sourceonly |
                           targetonly |
                           -dita-use-conref-target)
                                    #IMPLIED
               toc
                          (no |
                           yes |
                           -dita-use-conref-target)
                                    #IMPLIED
               search
                          (no |
                           yes |
                           -dita-use-conref-target)
                                    #IMPLIED
               %univ-atts;"
>
<!ELEMENT  mapresources %mapresources.content;> 
<!ATTLIST  mapresources %mapresources.attributes;>

<!-- ============================================================= -->
<!--             SPECIALIZATION ATTRIBUTE DECLARATIONS             -->
<!-- ============================================================= -->
  
<!ATTLIST  keydef         class CDATA "+ map/topicref mapgroup-d/keydef ">
<!ATTLIST  mapref         class CDATA "+ map/topicref mapgroup-d/mapref ">
<!ATTLIST  mapresources   class CDATA "+ map/topicref mapgroup-d/mapresources ">
<!ATTLIST  topicgroup     class CDATA "+ map/topicref mapgroup-d/topicgroup ">
<!ATTLIST  topichead      class CDATA "+ map/topicref mapgroup-d/topichead ">

<!-- ================== End of DITA Map Group Domain ==================== -->
 