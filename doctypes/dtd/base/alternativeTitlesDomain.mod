<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    DITA Alternative Titles Domain                    -->
<!--  VERSION:   2.0                                               -->
<!--  DATE:      [[[Release date]]]                                     -->
<!--  PURPOSE:   Define elements and specialization attributes     -->
<!--             for the Alternative Titles Domain                 -->
<!--                                                               -->
<!-- ============================================================= -->
<!-- ============================================================= -->
<!--                    PUBLIC DOCUMENT TYPE DEFINITION            -->
<!--                    TYPICAL INVOCATION                         -->
<!--                                                               -->
<!--  Refer to this file by the following public identifier or an  -->
<!--       appropriate system identifier                           -->
<!-- PUBLIC "-//OASIS//ELEMENTS DITA 2.0 Alternative Titles Domain//EN" -->
<!--       Delivered as file "alternativeTitlesDomain.mod"         -->
<!-- ============================================================= -->
<!--                                                               -->
<!--             (C) Copyright OASIS Open 2005, 2021.              -->
<!--             (C) Copyright IBM Corporation 2001, 2004.         -->
<!--             All Rights Reserved.                              -->
<!--                                                               -->
<!--  UPDATES:                                                     -->
<!--                                                               -->
<!-- ============================================================= -->
<!--                                                               -->
<!--                                                               -->

<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->

<!ENTITY % navtitle      "navtitle"                                  >
<!ENTITY % searchtitle   "searchtitle"                               >
<!ENTITY % linktitle     "linktitle"                                 >
<!ENTITY % subtitle      "subtitle"                                  >
<!ENTITY % titlehint     "titlehint"                                 >

<!-- ============================================================= -->
<!--                    COMMON ATTLIST SETS                        -->
<!-- ============================================================= -->  



<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!--                    LONG NAME: Navigation Title                -->
<!ENTITY % navtitle.content
                       "(%words.cnt; |
                         %ph; |
                         %draft-comment; |
                         %required-cleanup;)*"
>
<!ENTITY % navtitle.attributes
              "title-role
                          CDATA
                                    'navigation'
               %univ-atts;"
>
<!ELEMENT  navtitle %navtitle.content;>
<!ATTLIST  navtitle %navtitle.attributes;>

<!--                    LONG NAME: Search Title                -->
<!ENTITY % searchtitle.content
                       "(%words.cnt; |
                         %ph; |
                         %draft-comment; |
                         %required-cleanup;)*"
>
<!ENTITY % searchtitle.attributes
              "title-role
                          CDATA
                                    'search'
               %univ-atts;"
>
<!ELEMENT  searchtitle %searchtitle.content;>
<!ATTLIST  searchtitle %searchtitle.attributes;>

<!--                    LONG NAME: Link Title                -->
<!ENTITY % linktitle.content
                       "(%words.cnt; |
                         %ph; |
                         %draft-comment; |
                         %required-cleanup;)*"
>
<!ENTITY % linktitle.attributes
              "title-role
                          CDATA
                                    'linking'
               %univ-atts;"
>
<!ELEMENT  linktitle %linktitle.content;>
<!ATTLIST  linktitle %linktitle.attributes;>

<!--                    LONG NAME: Subtitle                -->
<!ENTITY % subtitle.content
                       "(%words.cnt; |
                         %ph; |
                         %draft-comment; |
                         %required-cleanup;)*"
>
<!ENTITY % subtitle.attributes
              "title-role
                          CDATA
                                    'subtitle'
               %univ-atts;"
>
<!ELEMENT  subtitle %subtitle.content;>
<!ATTLIST  subtitle %subtitle.attributes;>

<!--                    LONG NAME: Title hint                -->
<!ENTITY % titlehint.content
                       "(%words.cnt; |
                         %ph; |
                         %draft-comment; |
                         %required-cleanup;)*"
>
<!ENTITY % titlehint.attributes
              "title-role
                          CDATA
                                    'hint'
               %univ-atts;"
>
<!ELEMENT  titlehint %titlehint.content;>
<!ATTLIST  titlehint %titlehint.attributes;>


<!-- ============================================================= -->
<!--             SPECIALIZATION ATTRIBUTE DECLARATIONS             -->
<!-- ============================================================= -->
  
<!ATTLIST  navtitle     class CDATA "+ topic/titlealt alternativeTitles-d/navtitle ">
<!ATTLIST  searchtitle  class CDATA "+ topic/titlealt alternativeTitles-d/searchtitle ">
<!ATTLIST  linktitle    class CDATA "+ topic/titlealt alternativeTitles-d/linktitle ">
<!ATTLIST  subtitle     class CDATA "+ topic/titlealt alternativeTitles-d/subtitle ">
<!ATTLIST  titlehint    class CDATA "+ topic/titlealt alternativeTitles-d/titlehint ">

<!-- ================== End of DITA Alternative Title Domain ===================== -->
 