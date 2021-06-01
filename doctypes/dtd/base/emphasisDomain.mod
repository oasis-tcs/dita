<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    DITA Emphasis Domain                             -->
<!--  VERSION:   2.0                                               -->
<!--  DATE:      [[[Release date]]]                                       -->
<!--  PURPOSE:   Declaring the elements and specialization         -->
<!--             attributes for the DITA Emphasis Domain          -->
<!--                                                               -->
<!-- ============================================================= -->
<!-- ============================================================= -->
<!--                    PUBLIC DOCUMENT TYPE DEFINITION            -->
<!--                    TYPICAL INVOCATION                         -->
<!--                                                               -->
<!--  Refer to this file by the following public identifier or an  -->
<!--       appropriate system identifier                           -->
<!-- PUBLIC "-//OASIS//ELEMENTS DITA 2.0 Emphasis Domain//EN"      -->
<!--       Delivered as file "emphasisDomain.mod"                  -->
<!-- ============================================================= -->
<!--                                                               -->
<!--             (C) Copyright OASIS Open 2005, 2020.              -->
<!--             (C) Copyright IBM Corporation 2001, 2004.         -->
<!--             All Rights Reserved.                              -->
<!--                                                               -->
<!--  UPDATES:                                                     -->
<!-- ============================================================= -->
<!--                                                               -->
<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->

<!ENTITY % strong      "strong"                                      >
<!ENTITY % em          "em"                                          >

<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!--                    LONG NAME: Strong                          -->
<!ENTITY % strong.content
                       "(#PCDATA |
                         %basic.ph; |
                         %data.elements.incl; |
                         %draft-comment; |
                         %foreign.unknown.incl; |
                         %required-cleanup;)*"
>
<!ENTITY % strong.attributes
              "keyref
                          CDATA
                                    #IMPLIED
               %univ-atts;"
>
<!ELEMENT  strong %strong.content;>
<!ATTLIST  strong %strong.attributes;>


<!--                    LONG NAME: Emphasis                      -->
<!ENTITY % em.content
                       "(#PCDATA |
                         %basic.ph; |
                         %data.elements.incl; |
                         %draft-comment; |
                         %foreign.unknown.incl; |
                         %required-cleanup;)*"
>
<!ENTITY % em.attributes
              "keyref
                          CDATA
                                    #IMPLIED
               %univ-atts;"
>
<!ELEMENT  em %em.content;>
<!ATTLIST  em %em.attributes;>


<!-- ============================================================= -->
<!--             SPECIALIZATION ATTRIBUTE DECLARATIONS             -->
<!-- ============================================================= -->
  
<!ATTLIST  strong         class CDATA "+ topic/ph emphasis-d/strong ">
<!ATTLIST  em             class CDATA "+ topic/ph emphasis-d/em "    >

<!-- ================== End of DITA Emphasis Domain ==================== -->
 