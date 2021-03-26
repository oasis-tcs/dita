<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    DITA DITAVAL Reference Domain                     -->
<!--  VERSION:   2.0                                               -->
<!--  DATE:      [[[Release date]]]                                       -->
<!--  PURPOSE:   Declaring the elements and specialization         -->
<!--             attributes for the DITAVAL Reference Domain       -->
<!--                                                               -->
<!-- ============================================================= -->
<!-- ============================================================= -->
<!--                    PUBLIC DOCUMENT TYPE DEFINITION            -->
<!--                    TYPICAL INVOCATION                         -->
<!--                                                               -->
<!--  Refer to this file by the following public identifier or an  -->
<!--       appropriate system identifier                           -->
<!-- PUBLIC "-//OASIS//ELEMENTS DITA 2.0 DITAVAL Ref Domain//EN"   -->
<!--       Delivered as file "ditavalrefDomain.mod"                -->
<!-- ============================================================= -->
<!--                                                               -->
<!--             (C) Copyright OASIS Open 2015, 2019.              -->
<!--             All Rights Reserved.                              -->
<!--                                                               -->
<!--  UPDATES:                                                     -->
<!-- ============================================================= -->
<!--                                                               -->

<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->

<!ENTITY % ditavalref  "ditavalref"                                  >
<!ENTITY % ditavalmeta "ditavalmeta"                                 >
<!ENTITY % dvrResourcePrefix
                       "dvrResourcePrefix"                           >
<!ENTITY % dvrResourceSuffix
                       "dvrResourceSuffix"                           >
<!ENTITY % dvrKeyscopePrefix
                       "dvrKeyscopePrefix"                           >
<!ENTITY % dvrKeyscopeSuffix
                       "dvrKeyscopeSuffix"                           >

<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!ENTITY % ditavalref-univ-atts
              "id
                          NMTOKEN
                                    #IMPLIED
               conref
                          CDATA
                                    #IMPLIED
               conrefend
                          CDATA
                                    #IMPLIED
               conaction
                          (mark |
                           pushafter |
                           pushbefore |
                           pushreplace |
                           -dita-use-conref-target)
                                    #IMPLIED
               %select-atts;
               %localization-atts;
               outputclass
                          CDATA
                                    #IMPLIED"
>
<!--                    LONG NAME: DITAVAL Reference               -->
<!ENTITY % ditavalref.content
                       "(%ditavalmeta;)?"
>
<!ENTITY % ditavalref.attributes
              "href
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
                                    'ditaval'
               processing-role
                          CDATA
                                    'resource-only'
               %ditavalref-univ-atts;"
>
<!ELEMENT  ditavalref %ditavalref.content;>
<!ATTLIST  ditavalref %ditavalref.attributes;>


<!--                    LONG NAME: Ditavalmeta                     -->
<!ENTITY % ditavalmeta.content
                       "((%titlealt;)*,
                         ((%dvrResourcePrefix;)?,
                          (%dvrResourceSuffix;)?,
                          (%dvrKeyscopePrefix;)?,
                          (%dvrKeyscopeSuffix;)?))"
>
<!ENTITY % ditavalmeta.attributes
              "%ditavalref-univ-atts;"
>
<!ELEMENT  ditavalmeta %ditavalmeta.content;>
<!ATTLIST  ditavalmeta %ditavalmeta.attributes;>


<!--                    LONG NAME: DvrResourcePrefix               -->
<!ENTITY % dvrResourcePrefix.content
                       "(#PCDATA |
                         %text;)*"
>
<!ENTITY % dvrResourcePrefix.attributes
              "name
                          (dvrResourcePrefix)
                                    'dvrResourcePrefix'
               %ditavalref-univ-atts;"
>
<!ELEMENT  dvrResourcePrefix %dvrResourcePrefix.content;>
<!ATTLIST  dvrResourcePrefix %dvrResourcePrefix.attributes;>


<!--                    LONG NAME: DvrResourceSuffix               -->
<!ENTITY % dvrResourceSuffix.content
                       "(#PCDATA |
                         %text;)*"
>
<!ENTITY % dvrResourceSuffix.attributes
              "name
                          (dvrResourceSuffix)
                                    'dvrResourceSuffix'
               %ditavalref-univ-atts;"
>
<!ELEMENT  dvrResourceSuffix %dvrResourceSuffix.content;>
<!ATTLIST  dvrResourceSuffix %dvrResourceSuffix.attributes;>


<!--                    LONG NAME: DvrKeyscopePrefix               -->
<!ENTITY % dvrKeyscopePrefix.content
                       "(#PCDATA |
                         %text;)*"
>
<!ENTITY % dvrKeyscopePrefix.attributes
              "name
                          (dvrKeyscopePrefix)
                                    'dvrKeyscopePrefix'
               %ditavalref-univ-atts;"
>
<!ELEMENT  dvrKeyscopePrefix %dvrKeyscopePrefix.content;>
<!ATTLIST  dvrKeyscopePrefix %dvrKeyscopePrefix.attributes;>


<!--                    LONG NAME: DvrKeyscopeSuffix               -->
<!ENTITY % dvrKeyscopeSuffix.content
                       "(#PCDATA |
                         %text;)*"
>
<!ENTITY % dvrKeyscopeSuffix.attributes
              "name
                          (dvrKeyscopeSuffix)
                                    'dvrKeyscopeSuffix'
               %ditavalref-univ-atts;"
>
<!ELEMENT  dvrKeyscopeSuffix %dvrKeyscopeSuffix.content;>
<!ATTLIST  dvrKeyscopeSuffix %dvrKeyscopeSuffix.attributes;>



<!-- ============================================================= -->
<!--             SPECIALIZATION ATTRIBUTE DECLARATIONS             -->
<!-- ============================================================= -->
  
<!ATTLIST  ditavalref     class CDATA "+ map/topicref ditavalref-d/ditavalref ">
<!ATTLIST  ditavalmeta    class CDATA "+ map/topicmeta ditavalref-d/ditavalmeta ">
<!ATTLIST  dvrResourcePrefix   class CDATA "+ topic/data ditavalref-d/dvrResourcePrefix ">
<!ATTLIST  dvrResourceSuffix   class CDATA "+ topic/data ditavalref-d/dvrResourceSuffix ">
<!ATTLIST  dvrKeyscopePrefix   class CDATA "+ topic/data ditavalref-d/dvrKeyscopePrefix ">
<!ATTLIST  dvrKeyscopeSuffix   class CDATA "+ topic/data ditavalref-d/dvrKeyscopeSuffix ">

<!-- ================== End of DITAVAL Reference Domain ==================== -->
 