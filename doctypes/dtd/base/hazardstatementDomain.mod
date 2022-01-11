<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    DITA Hazard Statement Domain                      -->
<!--  VERSION:   2.0                                               -->
<!--  DATE:      [[[Release date]]]                                    -->
<!--  PURPOSE:   Declaring the elements and specialization         -->
<!--             attributes for the Hazard Statement Domain        -->
<!--                                                               -->
<!-- ============================================================= -->
<!-- ============================================================= -->
<!--                    PUBLIC DOCUMENT TYPE DEFINITION            -->
<!--                    TYPICAL INVOCATION                         -->
<!--                                                               -->
<!--  Refer to this file by the following public identifier or an  -->
<!--       appropriate system identifier                           -->
<!-- PUBLIC "-//OASIS//ELEMENTS DITA 2.0 Hazard Statement Domain//EN" -->
<!--       Delivered as file "hazardstatementDomain.mod"           -->
<!-- ============================================================= -->
<!--                                                               -->
<!--             (C) Copyright OASIS Open 2008, 2019.              -->
<!--             All Rights Reserved.                              -->
<!--                                                               -->
<!--  UPDATES:                                                     -->
<!--    2019.11.09 KJE: Updated for DITA 2.0                       -->
<!--                                                               -->
<!-- ============================================================= -->
<!--                                                               -->

<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->

<!ENTITY % hazardstatement
                       "hazardstatement"                             >
<!ENTITY % hazardsymbol
                       "hazardsymbol"                                >
<!ENTITY % messagepanel
                       "messagepanel"                                >
<!ENTITY % typeofhazard
                       "typeofhazard"                                >
<!ENTITY % consequence "consequence"                                 >
<!ENTITY % howtoavoid  "howtoavoid"                                  >

<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!--                    LONG NAME: Hazard Statement                -->
<!ENTITY % hazardstatement.content
                         "(%messagepanel;)+"
>
<!ENTITY % hazardstatement.attributes
              "type
                          (caution |
                           danger |
                           notice |
                           warning |
                           -dita-use-conref-target)
                                    #REQUIRED
               %univ-atts;"
>
<!ELEMENT  hazardstatement %hazardstatement.content;>
<!ATTLIST  hazardstatement %hazardstatement.attributes;>


<!--                    LONG NAME: Hazard Symbol                   -->
<!ENTITY % hazardsymbol.content
                       "((%alt;)?,
                         (%longdescref;)?)"
>
<!ENTITY % hazardsymbol.attributes
              "href
                          CDATA
                                    #IMPLIED
               format
                          CDATA
                                    #IMPLIED
               scope
                          (external |
                           local |
                           peer |
                           -dita-use-conref-target)
                                    #IMPLIED
               keyref
                          CDATA
                                    #IMPLIED
               height
                          NMTOKEN
                                    #IMPLIED
               width
                          NMTOKEN
                                    #IMPLIED
               align
                          CDATA
                                    #IMPLIED
               scale
                          NMTOKEN
                                    #IMPLIED
               scalefit
                          (yes |
                           no |
                           -dita-use-conref-target)
                                    #IMPLIED
               placement
                          (break |
                           inline |
                           -dita-use-conref-target)
                                    'inline'
               %univ-atts;"
>
<!ELEMENT  hazardsymbol %hazardsymbol.content;>
<!ATTLIST  hazardsymbol %hazardsymbol.attributes;>


<!--                    LONG NAME: Hazard Message panel            -->
<!ENTITY % messagepanel.content
                       "(
                         (%data;)*,
                         (%typeofhazard;),
                         (
                          ((%consequence;)*, (%howtoavoid;)+) |
                          ((%howtoavoid;)+, (%consequence;)*)
                          ),(%hazardsymbol;)*
                         )"
                         
>
<!ENTITY % messagepanel.attributes
              "%univ-atts;"
>
<!ELEMENT  messagepanel %messagepanel.content;>
<!ATTLIST  messagepanel %messagepanel.attributes;>

<!--                    LONG NAME: The Type of Hazard              -->
<!ENTITY % typeofhazard.content
                       "(%words.cnt; |
                         %ph; |
                         %tm; |
                         %hazardsymbol;)*"
>                          

<!ENTITY % typeofhazard.attributes
              "%univ-atts;"
>
<!ELEMENT  typeofhazard %typeofhazard.content;>
<!ATTLIST  typeofhazard %typeofhazard.attributes;>


<!--                    LONG NAME: Consequences of not Avoiding the Hazard -->
<!ENTITY % consequence.content
                       "(%words.cnt; |
                         %ph; |
                         %tm; |
                         %hazardsymbol;)*"
>
<!ENTITY % consequence.attributes
              "%univ-atts;"
>
<!ELEMENT  consequence %consequence.content;>
<!ATTLIST  consequence %consequence.attributes;>


<!--                    LONG NAME: How to Avoid the Hazard         -->
<!ENTITY % howtoavoid.content
              "(#PCDATA |
                %basic.ph; |
                %sl; |
                %ul; |
                %ol; |
                %simpletable; |
                %hazardsymbol;)*"
>
<!ENTITY % howtoavoid.attributes
              "%univ-atts;"
>
<!ELEMENT  howtoavoid %howtoavoid.content;>
<!ATTLIST  howtoavoid %howtoavoid.attributes;>



<!-- ============================================================= -->
<!--             SPECIALIZATION ATTRIBUTE DECLARATIONS             -->
<!-- ============================================================= -->
  
<!ATTLIST  hazardstatement   class CDATA "+ topic/note hazard-d/hazardstatement ">
<!ATTLIST  messagepanel      class CDATA "+ topic/div hazard-d/messagepanel ">
<!ATTLIST  hazardsymbol      class CDATA "+ topic/image hazard-d/hazardsymbol ">
<!ATTLIST  typeofhazard      class CDATA "+ topic/div hazard-d/typeofhazard ">
<!ATTLIST  consequence       class CDATA "+ topic/div hazard-d/consequence ">
<!ATTLIST  howtoavoid        class CDATA "+ topic/div hazard-d/howtoavoid ">

<!-- ================== End of DITA Hazard Statement Domain ==================== -->
 