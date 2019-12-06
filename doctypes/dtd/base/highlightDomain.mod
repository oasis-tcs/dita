<?xml version="1.0" encoding="UTF-8"?>
<!-- MODULE: DITA Highlight Domain VERSION: 2.0 DATE:              -->
<!-- November 2009                                                 -->
<!-- SYSTEM: Darwin Information Typing Architecture (DITA)         -->
<!-- PURPOSE: Define elements and specialization attributes for Highlight Domain  -->
<!-- (C) Copyright OASIS Open 2005, 2009.                          -->
<!-- (C) Copyright IBM Corporation 2001, 2004. All Rights Reserved. -->
<!-- UPDATES:                                                      -->
<!-- 2005.11.15 RDA: Corrected descriptive names for all elements except bold  -->
<!-- 2005.11.15 RDA: Corrected the "Delivered as" system ID        -->
<!-- 2007.12.01 WEK: Reformatted DTD modulesfor DITA 1.2           -->
<!-- 2008.02.13 RDA: Create .content and .attributes entities      -->
<!--                                                               -->

<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->

<!ENTITY % b           "b"                                           >
<!ENTITY % u           "u"                                           >
<!ENTITY % i           "i"                                           >
<!ENTITY % line-through
                       "line-through"                                >
<!ENTITY % overline    "overline"                                    >
<!ENTITY % tt          "tt"                                          >
<!ENTITY % sup         "sup"                                         >
<!ENTITY % sub         "sub"                                         >

<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!--                    LONG NAME: Bold                            -->
<!ENTITY % b.content
                       "(#PCDATA |
                         %basic.ph; |
                         %data.elements.incl; |
                         %draft-comment; |
                         %foreign.unknown.incl; |
                         %required-cleanup;)*"
>
<!ENTITY % b.attributes
              "%univ-atts;"
>
<!ELEMENT  b %b.content;>
<!ATTLIST  b %b.attributes;>


<!--                    LONG NAME: Underlined                      -->
<!ENTITY % u.content
                       "(#PCDATA |
                         %basic.ph; |
                         %data.elements.incl; |
                         %draft-comment; |
                         %foreign.unknown.incl; |
                         %required-cleanup;)*"
>
<!ENTITY % u.attributes
              "%univ-atts;"
>
<!ELEMENT  u %u.content;>
<!ATTLIST  u %u.attributes;>


<!--                    LONG NAME: Italic                          -->
<!ENTITY % i.content
                       "(#PCDATA |
                         %basic.ph; |
                         %data.elements.incl; |
                         %draft-comment; |
                         %foreign.unknown.incl; |
                         %required-cleanup;)*"
>
<!ENTITY % i.attributes
              "%univ-atts;"
>
<!ELEMENT  i %i.content;>
<!ATTLIST  i %i.attributes;>


<!--                    LONG NAME: Line through                    -->
<!ENTITY % line-through.content
                       "(#PCDATA |
                         %basic.ph; |
                         %data.elements.incl; |
                         %draft-comment; |
                         %foreign.unknown.incl; |
                         %required-cleanup;)*"
>
<!ENTITY % line-through.attributes
              "%univ-atts;"
>
<!ELEMENT  line-through %line-through.content;>
<!ATTLIST  line-through %line-through.attributes;>


<!--                    LONG NAME: Overline                        -->
<!ENTITY % overline.content
                       "(#PCDATA |
                         %basic.ph; |
                         %data.elements.incl; |
                         %draft-comment; |
                         %foreign.unknown.incl; |
                         %required-cleanup;)*"
>
<!ENTITY % overline.attributes
              "%univ-atts;"
>
<!ELEMENT  overline %overline.content;>
<!ATTLIST  overline %overline.attributes;>


<!--                    LONG NAME: Teletype (monospaced)           -->
<!ENTITY % tt.content
                       "(#PCDATA |
                         %basic.ph; |
                         %data.elements.incl; |
                         %draft-comment; |
                         %foreign.unknown.incl; |
                         %required-cleanup;)*"
>
<!ENTITY % tt.attributes
              "%univ-atts;"
>
<!ELEMENT  tt %tt.content;>
<!ATTLIST  tt %tt.attributes;>


<!--                    LONG NAME: Superscript                     -->
<!ENTITY % sup.content
                       "(#PCDATA |
                         %basic.ph; |
                         %data.elements.incl; |
                         %draft-comment; |
                         %foreign.unknown.incl; |
                         %required-cleanup;)*"
>
<!ENTITY % sup.attributes
              "%univ-atts;"
>
<!ELEMENT  sup %sup.content;>
<!ATTLIST  sup %sup.attributes;>


<!--                    LONG NAME: Subscript                       -->
<!ENTITY % sub.content
                       "(#PCDATA |
                         %basic.ph; |
                         %data.elements.incl; |
                         %draft-comment; |
                         %foreign.unknown.incl; |
                         %required-cleanup;)*"
>
<!ENTITY % sub.attributes
              "%univ-atts;"
>
<!ELEMENT  sub %sub.content;>
<!ATTLIST  sub %sub.attributes;>



<!-- ============================================================= -->
<!--             SPECIALIZATION ATTRIBUTE DECLARATIONS             -->
<!-- ============================================================= -->
  
<!ATTLIST  b              class CDATA "+ topic/ph hi-d/b "  >
<!ATTLIST  i              class CDATA "+ topic/ph hi-d/i "  >
<!ATTLIST  line-through   class CDATA "+ topic/ph hi-d/line-through ">
<!ATTLIST  overline       class CDATA "+ topic/ph hi-d/overline ">
<!ATTLIST  sub            class CDATA "+ topic/ph hi-d/sub ">
<!ATTLIST  sup            class CDATA "+ topic/ph hi-d/sup ">
<!ATTLIST  tt             class CDATA "+ topic/ph hi-d/tt " >
<!ATTLIST  u              class CDATA "+ topic/ph hi-d/u "  >

<!-- ================== End of DITA Highlight Domain ==================== -->
 