<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    DITA Map Group Domain                             -->
<!--  VERSION:   2.0                                               -->
<!--  DATE:      [[[Release date]]]                                     -->
<!--                                                               -->
<!-- ============================================================= -->
<!-- ============================================================= -->
<!--                    PUBLIC DOCUMENT TYPE DEFINITION            -->
<!--                    TYPICAL INVOCATION                         -->
<!--                                                               -->
<!--  Refer to this file by the following public identifier or an  -->
<!--       appropriate system identifier                           -->
<!-- PUBLIC "-//OASIS//ELEMENTS DITA Map Group Domain//EN"         -->
<!--       Delivered as file "mapGroup.mod"                             -->
<!-- ============================================================= -->
<!--                                                               -->
<!-- PURPOSE:    Define elements and specialization attributes     -->
<!--             for Map Group Domain                              -->
<!--                                                               -->
<!--             (C) Copyright OASIS Open 2005, 2009.              -->
<!--             (C) Copyright IBM Corporation 2001, 2004.         -->
<!--             All Rights Reserved.                              -->
<!--                                                               -->
<!--  UPDATES:                                                     -->
<!--    2005.11.15 RDA: Corrected the "Delivered as" system ID     -->
<!--    2006.06.07 RDA: Make universal attributes universal        -->
<!--                      (DITA 1.1 proposal #12)                  -->
<!--    2007.12.01 EK:  Reformatted DTD modules for DITA 1.2        -->
<!--    2008.02.01 RDA: Added keydef element, keys attributes      -->
<!--    2008.02.12 RDA: Navtitle no longer required on topichead   -->
<!--    2008.02.13 RDA: Create .content and .attributes entities   -->
<!--    2010.09.20 RDA: Add copy-to to topichead                   -->
<!--    2018.03.14 KJE: Added new attribute group for use on       -->
<!--                    topichead and topicgroup (removes          -->
<!--                    @collection-type); removed @query          -->
<!-- ============================================================= -->
<!--                                                               -->
<!--                                                               -->

<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->

<!ENTITY % topichead   "topichead"                                   >
<!ENTITY % topicgroup  "topicgroup"                                  >
<!ENTITY % anchorref   "anchorref"                                   >
<!ENTITY % mapref      "mapref"                                      >
<!ENTITY % keydef      "keydef"                                      >

<!-- ============================================================= -->
<!--                    COMMON ATTLIST SETS                        -->
<!-- ============================================================= -->  

<!ENTITY % topicref-atts-no-locktitle
              "collection-type
                          (choice |
                           family |
                           sequence |
                           unordered |
                           -dita-use-conref-target)
                                    #IMPLIED
               type
                          CDATA
                                    #IMPLIED
               cascade
                          CDATA
                                    #IMPLIED
               processing-role
                          (normal |
                           resource-only |
                           -dita-use-conref-target)
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
               keyscope
                          CDATA
                                    #IMPLIED"
>

<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!--                    LONG NAME: Topichead                       -->
<!ENTITY % topichead.content
                       "((%topicmeta;)?,
                         (%anchor; |
                          %data.elements.incl; |
                          %navref; |
                          %topicref;)*)"
>
<!ENTITY % topichead.attributes
              "navtitle
                          CDATA
                                    #IMPLIED
               keys
                          CDATA
                                    #IMPLIED
               copy-to
                          CDATA
                                    #IMPLIED
               %topicref-atts-no-locktitle;
               %univ-atts;"
>
<!ELEMENT  topichead %topichead.content;>
<!ATTLIST  topichead %topichead.attributes;>


<!--                    LONG NAME: Topicgroup                      -->
<!ENTITY % topicgroup.content
                       "((%topicmeta;)?,
                         (%anchor; |
                          %data.elements.incl; |
                          %navref; |
                          %topicref;)*)"
>
<!ENTITY % topicgroup.attributes
              "%topicref-atts-no-locktitle;
               %univ-atts;"
>
<!ELEMENT  topicgroup %topicgroup.content;>
<!ATTLIST  topicgroup %topicgroup.attributes;>


<!--                    LONG NAME: Anchorref                       -->
<!ENTITY % anchorref.content
                       "((%topicmeta;)?,
                         (%data.elements.incl; |
                          %topicref;)*)"
>
<!ENTITY % anchorref.attributes
              "navtitle
                          CDATA
                                    #IMPLIED
               href
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
               copy-to
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
                                    #IMPLIED
               type
                          CDATA
                                    'anchor'
               cascade
                          CDATA
                                    #IMPLIED
               scope
                          (external |
                           local |
                           peer |
                           -dita-use-conref-target)
                                    #IMPLIED
               locktitle
                          (no |
                           yes |
                           -dita-use-conref-target)
                                    #IMPLIED
               format
                          CDATA
                                    'ditamap'
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
               print
                          (no |
                           printonly |
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
<!ELEMENT  anchorref %anchorref.content;>
<!ATTLIST  anchorref %anchorref.attributes;>


<!--                    LONG NAME: Map reference                   -->
<!ENTITY % mapref.content
                       "((%topicmeta;)?,
                         (%data.elements.incl;)*)"
>
<!ENTITY % mapref.attributes
              "navtitle
                          CDATA
                                    #IMPLIED
               href
                          CDATA
                                    #IMPLIED
               keyref
                          CDATA
                                    #IMPLIED
               keys
                          CDATA
                                    #IMPLIED
               copy-to
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
                         (%anchor; |
                          %data.elements.incl; |
                          %navref; |
                          %topicref;)*)"
>
<!ENTITY % keydef.attributes
              "navtitle
                          CDATA
                                    #IMPLIED
               href
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
               copy-to
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
               locktitle
                          (no |
                           yes |
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
               print
                          (no |
                           printonly |
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



<!-- ============================================================= -->
<!--             SPECIALIZATION ATTRIBUTE DECLARATIONS             -->
<!-- ============================================================= -->
  
<!ATTLIST  anchorref      class CDATA "+ map/topicref mapgroup-d/anchorref ">
<!ATTLIST  keydef         class CDATA "+ map/topicref mapgroup-d/keydef ">
<!ATTLIST  mapref         class CDATA "+ map/topicref mapgroup-d/mapref ">
<!ATTLIST  topicgroup     class CDATA "+ map/topicref mapgroup-d/topicgroup ">
<!ATTLIST  topichead      class CDATA "+ map/topicref mapgroup-d/topichead ">

<!-- ================== End of DITA Map Group Domain ==================== -->
 