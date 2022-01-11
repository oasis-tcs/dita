<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    DITA Utilities Domain                             -->
<!--  VERSION:   2.0                                               -->
<!--  DATE:      [[[Release date]]]                                       -->
<!--  PURPOSE:   Declaring the elements and specialization         -->
<!--             attributes for the DITA Utilities Domain          -->
<!--                                                               -->
<!-- ============================================================= -->
<!-- ============================================================= -->
<!--                    PUBLIC DOCUMENT TYPE DEFINITION            -->
<!--                    TYPICAL INVOCATION                         -->
<!--                                                               -->
<!--  Refer to this file by the following public identifier or an  -->
<!--       appropriate system identifier                           -->
<!-- PUBLIC "-//OASIS//ELEMENTS DITA 2.0 Utilities Domain//EN"     -->
<!--       Delivered as file "utilitiesDomain.mod"                 -->
<!-- ============================================================= -->
<!--                                                               -->
<!--             (C) Copyright OASIS Open 2005, 2019.              -->
<!--             (C) Copyright IBM Corporation 2001, 2004.         -->
<!--             All Rights Reserved.                              -->
<!--                                                               -->
<!--  UPDATES:                                                     -->
<!--    2019.08.28 KJE: Changed specialization base of imagemap    -->
<!--                    and area                                   -->
<!-- ============================================================= -->
<!--                                                               -->

<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->

<!ENTITY % imagemap    "imagemap"                                    >
<!ENTITY % area        "area"                                        >
<!ENTITY % shape       "shape"                                       >
<!ENTITY % coords      "coords"                                      >
<!ENTITY % sort-as     "sort-as"                                     >

<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!--                    LONG NAME: Imagemap                        -->
<!ENTITY % imagemap.content
                       "((%image;),
                         (%area;)+)"
>
<!ENTITY % imagemap.attributes
              "%display-atts;
               %univ-atts;"
>
<!ELEMENT  imagemap %imagemap.content;>
<!ATTLIST  imagemap %imagemap.attributes;>


<!--                    LONG NAME: Hotspot Area Description        -->
<!ENTITY % area.content
                       "((%shape;),
                         (%coords;),
                         (%xref;))"
>
<!ENTITY % area.attributes
              "%univ-atts;"
>
<!ELEMENT  area %area.content;>
<!ATTLIST  area %area.attributes;>


<!--                    LONG NAME: Shape of the Hotspot            -->
<!ENTITY % shape.content
                       "(#PCDATA |
                         %text;)*"
>
<!ENTITY % shape.attributes
              "keyref
                          CDATA
                                    #IMPLIED
               %univ-atts-translate-no;"
>
<!ELEMENT  shape %shape.content;>
<!ATTLIST  shape %shape.attributes;>


<!--                    LONG NAME: Coordinates of the Hotspot      -->
<!ENTITY % coords.content
                       "(%words.cnt;)*"
>
<!ENTITY % coords.attributes
              "keyref
                          CDATA
                                    #IMPLIED
               %univ-atts-translate-no;"
>
<!ELEMENT  coords %coords.content;>
<!ATTLIST  coords %coords.attributes;>


<!--                    LONG NAME: Sort phrase specifier           -->
<!ENTITY % sort-as.content
                       "(#PCDATA |
                         %text; |
                         %keyword;)*"
>
<!ENTITY % sort-as.attributes
              "%univ-atts;
               name
                          CDATA
                                    'sort-as'
               value
                          CDATA
                                    #IMPLIED"
>
<!ELEMENT  sort-as %sort-as.content;>
<!ATTLIST  sort-as %sort-as.attributes;>



<!-- ============================================================= -->
<!--             SPECIALIZATION ATTRIBUTE DECLARATIONS             -->
<!-- ============================================================= -->
  
<!ATTLIST  imagemap       class CDATA "+ topic/div ut-d/imagemap ">
<!ATTLIST  area           class CDATA "+ topic/div ut-d/area ">
<!ATTLIST  shape          class CDATA "+ topic/keyword ut-d/shape ">
<!ATTLIST  coords         class CDATA "+ topic/ph ut-d/coords ">
<!ATTLIST  sort-as        class CDATA "+ topic/data ut-d/sort-as ">

<!-- ================== End of DITA Utilities Domain ==================== -->
 