<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    DITA Subject Scheme Map                           -->
<!--  VERSION:   2.0                                               -->
<!--  DATE:      [[[Release date]]]                                        -->
<!--  PURPOSE:   Declaring the elements and specialization         -->
<!--             attributes for DITA Subject Scheme Maps           -->
<!--                                                               -->
<!-- ============================================================= -->
<!-- ============================================================= -->
<!--                    PUBLIC DOCUMENT TYPE DEFINITION            -->
<!--                    TYPICAL INVOCATION                         -->
<!--                                                               -->
<!--  Refer to this file by the following public identifier or an  -->
<!--       appropriate system identifier                           -->
<!-- PUBLIC "-//OASIS//ELEMENTS DITA 2.0 Subject Scheme Map//EN"   -->
<!--       Delivered as file "subjectScheme.mod"                   -->
<!-- ============================================================= -->
<!--                                                               -->
<!--             (C) Copyright OASIS Open 2008, 2009.              -->
<!--             (C) Copyright IBM Corporation 2005, 2007.         -->
<!--             All Rights Reserved.                              -->
<!--                                                               -->
<!--  UPDATES:                                                     -->
<!--    2018.04.09 KJE: Removed @navtitle                          -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->

<!ENTITY % subjectScheme
                       "subjectScheme"                               >
<!ENTITY % schemeref   "schemeref"                                   >
<!ENTITY % subjectdef  "subjectdef"                                  >
<!ENTITY % subjectHead "subjectHead"                                 >
<!ENTITY % subjectHeadMeta
                       "subjectHeadMeta"                             >
<!ENTITY % enumerationdef
                       "enumerationdef"                              >
<!ENTITY % elementdef  "elementdef"                                  >
<!ENTITY % attributedef
                       "attributedef"                                >
<!ENTITY % defaultSubject
                       "defaultSubject"                              >

<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!ENTITY % topicref-atts-for-subjectScheme
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
                                    'resource-only'
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
                                    'no'
               search
                          (no |
                           yes |
                           -dita-use-conref-target)
                                    #IMPLIED
               chunk
                          CDATA
                                    #IMPLIED"
>
<!--                    LONG NAME: Subject Scheme Map              -->
<!ENTITY % subjectScheme.content
                       "((%title;)?,
                         (%topicmeta;)?,
                         (%data.elements.incl; |
                          %enumerationdef; |
                          %navref; |
                          %reltable; |
                          %schemeref; |
                          %subjectdef; |
                          %subjectHead; |
                          %topicref;)*)"
>
<!ENTITY % subjectScheme.attributes
              "id
                          ID
                                    #IMPLIED
               %conref-atts;
               outputclass
                          CDATA
                                    #IMPLIED
               %localization-atts;
               %topicref-atts-for-subjectScheme;
               %select-atts;"
>
<!ELEMENT  subjectScheme %subjectScheme.content;>
<!ATTLIST  subjectScheme %subjectScheme.attributes;
                 %arch-atts;
                 specializations 
                        CDATA
                                  "&included-domains;"
>


<!--                    LONG NAME: Scheme reference                -->
<!ENTITY % schemeref.content
                       "((%topicmeta;)?,
                         (%data.elements.incl;)*)"
>
<!ENTITY % schemeref.attributes
              "href
                          CDATA
                                    #IMPLIED
               keyref
                          CDATA
                                    #IMPLIED
               keys
                          CDATA
                                    #IMPLIED
               processing-role
                          (normal |
                           resource-only |
                           -dita-use-conref-target)
                                    #IMPLIED
               type
                          CDATA
                                    'scheme'
               cascade
                          CDATA
                                    #IMPLIED
               format
                          CDATA
                                    'ditamap'
               scope
                          (external |
                           local |
                           peer |
                           -dita-use-conref-target)
                                    #IMPLIED
               %univ-atts;"
>
<!ELEMENT  schemeref %schemeref.content;>
<!ATTLIST  schemeref %schemeref.attributes;>


<!--                    LONG NAME: Subject definition              -->
<!ENTITY % subjectdef.content
                       "((%topicmeta;)?,
                         (%data.elements.incl; |
                          %subjectdef; |
                          %subjectHead; |
                          %topicref;)*)"
>
<!ENTITY % subjectdef.attributes
              "href
                          CDATA
                                    #IMPLIED
               keyref
                          CDATA
                                    #IMPLIED
               keys
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
               %univ-atts;"
>
<!ELEMENT  subjectdef %subjectdef.content;>
<!ATTLIST  subjectdef %subjectdef.attributes;>


<!--                    LONG NAME: Subject Heading                 -->
<!ENTITY % subjectHead.content
                       "((%subjectHeadMeta;)?,
                         (%data.elements.incl; |
                          %subjectdef; |
                          %subjectHead; |
                          %topicref;)*)"
>
<!ENTITY % subjectHead.attributes
              "collection-type
                          (sequence |
                           unordered |
                           -dita-use-conref-target)
                                    #IMPLIED
               processing-role
                          (normal |
                           resource-only |
                           -dita-use-conref-target)
                                    #IMPLIED
               linking
                          (normal)
                                    'normal'
               toc
                          (no |
                           yes |
                           -dita-use-conref-target)
                                    #IMPLIED
               %univ-atts;"
>
<!ELEMENT  subjectHead %subjectHead.content;>
<!ATTLIST  subjectHead %subjectHead.attributes;>


<!--                    LONG NAME: Subject Heading Metadata        -->
<!ENTITY % subjectHeadMeta.content
                       "((%titlealt;)*,
                         (%shortdesc;)?)"
>
<!ENTITY % subjectHeadMeta.attributes
              "%univ-atts;"
>
<!ELEMENT  subjectHeadMeta %subjectHeadMeta.content;>
<!ATTLIST  subjectHeadMeta %subjectHeadMeta.attributes;>


<!--                    LONG NAME: Enumeration definition          -->
<!ENTITY % enumerationdef.content
                       "((%elementdef;)?,
                         (%attributedef;),
                         (%subjectdef;)+,
                         (%defaultSubject;)?,
                         (%data.elements.incl;)*)"
>
<!ENTITY % enumerationdef.attributes
              "%id-atts;
               outputclass
                          CDATA
                                    #IMPLIED
               status
                          (changed |
                           deleted |
                           new |
                           unchanged |
                           -dita-use-conref-target)
                                    #IMPLIED
               base
                          CDATA
                                    #IMPLIED
               %base-attribute-extensions;"
>
<!ELEMENT  enumerationdef %enumerationdef.content;>
<!ATTLIST  enumerationdef %enumerationdef.attributes;>


<!--                    LONG NAME: Element definition              -->
<!ENTITY % elementdef.content
                       "(%data.elements.incl;)*"
>
<!ENTITY % elementdef.attributes
              "%id-atts;
               name
                          CDATA
                                    #REQUIRED
               outputclass
                          CDATA
                                    #IMPLIED
               status
                          (changed |
                           deleted |
                           new |
                           unchanged |
                           -dita-use-conref-target)
                                    #IMPLIED
               translate
                          (no |
                           yes |
                           -dita-use-conref-target)
                                    'no'
               base
                          CDATA
                                    #IMPLIED
               %base-attribute-extensions;"
>
<!ELEMENT  elementdef %elementdef.content;>
<!ATTLIST  elementdef %elementdef.attributes;>


<!--                    LONG NAME: Attribute definition            -->
<!ENTITY % attributedef.content
                       "(%data.elements.incl;)*"
>
<!ENTITY % attributedef.attributes
              "%id-atts;
               name
                          CDATA
                                    #REQUIRED
               outputclass
                          CDATA
                                    #IMPLIED
               status
                          (changed |
                           deleted |
                           new |
                           unchanged |
                           -dita-use-conref-target)
                                    #IMPLIED
               translate
                          (no |
                           yes |
                           -dita-use-conref-target)
                                    'no'
               base
                          CDATA
                                    #IMPLIED
               %base-attribute-extensions;"
>
<!ELEMENT  attributedef %attributedef.content;>
<!ATTLIST  attributedef %attributedef.attributes;>


<!--                    LONG NAME: Default Subject                 -->
<!ENTITY % defaultSubject.content
                       "(%data.elements.incl;)*"
>
<!ENTITY % defaultSubject.attributes
              "href
                          CDATA
                                    #IMPLIED
               keyref
                          CDATA
                                    #IMPLIED
               keys
                          CDATA
                                    #IMPLIED
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
               processing-role
                          (normal |
                           resource-only |
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
               %univ-atts;"
>
<!ELEMENT  defaultSubject %defaultSubject.content;>
<!ATTLIST  defaultSubject %defaultSubject.attributes;>


<!-- ============================================================= -->
<!--             SPECIALIZATION ATTRIBUTE DECLARATIONS             -->
<!-- ============================================================= -->
  
<!ATTLIST  subjectScheme   class CDATA "- map/map subjectScheme/subjectScheme ">
<!ATTLIST  schemeref      class CDATA "- map/topicref subjectScheme/schemeref ">
<!ATTLIST  enumerationdef   class CDATA "- map/topicref subjectScheme/enumerationdef ">
<!ATTLIST  elementdef     class CDATA "- topic/data subjectScheme/elementdef ">
<!ATTLIST  attributedef   class CDATA "- topic/data subjectScheme/attributedef ">
<!ATTLIST  defaultSubject   class CDATA "- map/topicref subjectScheme/defaultSubject ">
<!ATTLIST  subjectHead    class CDATA "- map/topicref subjectScheme/subjectHead ">
<!ATTLIST  subjectHeadMeta   class CDATA "- map/topicmeta subjectScheme/subjectHeadMeta ">
<!ATTLIST  subjectdef     class CDATA "- map/topicref subjectScheme/subjectdef ">

<!-- ================== End of DITA Subject Scheme Map Type ==================== -->
 