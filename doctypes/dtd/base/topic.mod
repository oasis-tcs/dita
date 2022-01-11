<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!-- Darwin Information Typing Architecture (DITA) Version 2.0     -->
<!-- [[[Draft level]]]                                           -->
<!-- [[[Release date]]]                                           -->
<!-- Copyright (c) OASIS Open 2019. All rights reserved.           -->
<!-- Source: [[[Source link]]]                                -->
<!--                                                               -->
<!-- ============================================================= -->
<!--  MODULE:    DITA DITA Topic                                   -->
<!--  VERSION:   2.0                                               -->
<!--  DATE:      [[[Release date]]]                                        -->
<!--  PURPOSE:   Declaring the elements and specialization         -->
<!--             attributes for the base Topic type                -->
<!--                                                               -->
<!-- ============================================================= -->
<!-- ============================================================= -->
<!--                    PUBLIC DOCUMENT TYPE DEFINITION            -->
<!--                    TYPICAL INVOCATION                         -->
<!--                                                               -->
<!--  Refer to this file by the following public identifier or an  -->
<!--       appropriate system identifier                           -->
<!-- PUBLIC "-//OASIS//ELEMENTS DITA 2.0 Topic//EN"                -->
<!--       Delivered as file "topic.mod"                           -->
<!-- ============================================================= -->
<!--                                                               -->
<!--             (C) Copyright OASIS Open 2005, 2009.              -->
<!--             (C) Copyright IBM Corporation 2001, 2004.         -->
<!--             All Rights Reserved.                              -->
<!--                                                               -->
<!--  UPDATES:                                                     -->
<!--    2018.03.14 KJE: Removed @collection-type="tree"; removed   -->
<!--                    @role="external" and "sample"              -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!--                   ARCHITECTURE ENTITIES                       -->
<!-- ============================================================= -->

<!-- default namespace prefix for DITAArchVersion attribute can be
     overridden through predefinition in the document type shell   -->
<!ENTITY % DITAArchNSPrefix
  "ditaarch"
>

<!-- must be instanced on each topic type                          -->
<!ENTITY % arch-atts 
             "xmlns:%DITAArchNSPrefix; 
                        CDATA
                                  #FIXED 'http://dita.oasis-open.org/architecture/2005/'
              %DITAArchNSPrefix;:DITAArchVersion
                         CDATA
                                  '2.0'
  "
>



<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->


<!--                    Definitions of declared elements           -->
<!ENTITY % topicDefns
    PUBLIC "-//OASIS//ENTITIES DITA 2.0 Topic Definitions//EN" "topicDefn.ent" 
>%topicDefns;

<!--                      Content elements common to map and topic -->
<!ENTITY % commonElements

  PUBLIC "-//OASIS//ELEMENTS DITA 2.0 Common Elements//EN"
         "commonElements.mod" 
>%commonElements;

<!--                       MetaData Elements, plus indexterm       -->
<!ENTITY % metaXML 
  PUBLIC "-//OASIS//ELEMENTS DITA 2.0 Metadata//EN"
         "metaDecl.mod" 
>%metaXML;

<!-- ============================================================= -->
<!--                    STRUCTURAL MEMBERS                         -->
<!-- ============================================================= -->


<!ENTITY % info-types 
  "topic
  "
> 

<!-- ============================================================= -->
<!--                    SPECIALIZATION OF DECLARED ELEMENTS        -->
<!-- ============================================================= -->

<!ENTITY % topic-info-types 
  "%info-types;
  "
>

<!-- ============================================================= -->
<!--                    DOMAINS ATTRIBUTE OVERRIDE                 -->
<!-- ============================================================= -->

<!ENTITY included-domains 
  ""
>


<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!ENTITY % abstract.cnt
              "#PCDATA |
               %basic.block; |
               %basic.ph; |
               %data.elements.incl; |
               %foreign.unknown.incl; |
               %shortdesc; |
               %txt.incl;"
>
<!ENTITY % body.cnt
              "%basic.block; |
               %data.elements.incl; |
               %draft-comment; |
               %foreign.unknown.incl; |
               %required-cleanup;"
>
<!ENTITY % bodydiv.cnt
              "#PCDATA |
               %basic.block; |
               %basic.ph; |
               %data.elements.incl; |
               %foreign.unknown.incl; |
               %txt.incl;"
>
<!ENTITY % section.cnt
              "#PCDATA |
               %basic.block; |
               %basic.ph; |
               %data.elements.incl; |
               %foreign.unknown.incl; |
               %title; |
               %txt.incl;"
>
<!ENTITY % section.notitle.cnt
              "#PCDATA |
               %basic.block; |
               %basic.ph; |
               %data.elements.incl; |
               %foreign.unknown.incl; |
               %txt.incl;"
>
<!ENTITY % relational-atts
              "type
                          CDATA
                                    #IMPLIED
               cascade
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
               role
                          (ancestor |
                           child |
                           cousin |
                           descendant |
                           friend |
                           next |
                           other |
                           parent |
                           previous |
                           sibling |
                           -dita-use-conref-target)
                                    #IMPLIED
               otherrole
                          CDATA
                                    #IMPLIED"
>
<!ENTITY % rel-atts
              "type
                          CDATA
                                    #IMPLIED
               role
                          (ancestor |
                           child |
                           cousin |
                           descendant |
                           friend |
                           next |
                           other |
                           parent |
                           previous |
                           sibling |
                           -dita-use-conref-target)
                                    #IMPLIED
               otherrole
                          CDATA
                                    #IMPLIED"
>
<!--                    LONG NAME: Topic                           -->
<!ENTITY % topic.content
                       "((%title;),
                         (%shortdesc; |
                          %abstract;)?,
                         (%prolog;)?,
                         (%body;)?,
                         (%related-links;)?,
                         (%topic-info-types;)*)"
>
<!ENTITY % topic.attributes
              "id
                          ID
                                    #REQUIRED
               %conref-atts;
               %select-atts;
               %localization-atts;
               outputclass
                          CDATA
                                    #IMPLIED"
>
<!ELEMENT  topic %topic.content;>
<!ATTLIST  topic %topic.attributes;
                 %arch-atts;
                 specializations 
                        CDATA
                                  "&included-domains;"
>

<!--                    LONG NAME: Abstract                        -->
<!ENTITY % abstract.content
                       "(%abstract.cnt;)*"
>
<!ENTITY % abstract.attributes
              "%univ-atts;"
>
<!ELEMENT  abstract %abstract.content;>
<!ATTLIST  abstract %abstract.attributes;>


<!--                    LONG NAME: Body                            -->
<!ENTITY % body.content
                       "(%body.cnt; |
                         %bodydiv; |
                         %section;)*"
>
<!ENTITY % body.attributes
              "%univ-atts;"
>
<!ELEMENT  body %body.content;>
<!ATTLIST  body %body.attributes;>


<!--                    LONG NAME: Body division                   -->
<!ENTITY % bodydiv.content
                       "(%bodydiv.cnt; |
                         %bodydiv; |
                         %section;)*"
>
<!ENTITY % bodydiv.attributes
              "%univ-atts;"
>
<!ELEMENT  bodydiv %bodydiv.content;>
<!ATTLIST  bodydiv %bodydiv.attributes;>



<!--                    LONG NAME: No Topic nesting                -->
<!ELEMENT no-topic-nesting EMPTY >

    <!--                    LONG NAME: Section                         -->
<!ENTITY % section.content
                       "(%section.cnt;)*"
>
<!ENTITY % section.attributes
              "%univ-atts;"
>
<!ELEMENT  section %section.content;>
<!ATTLIST  section %section.attributes;>


<!--                    LONG NAME: prolog                          -->
<!ENTITY % prolog.content
                       "((%titlealt;)*,
                         (%author;)*,
                         (%source;)?,
                         (%publisher;)?,
                         (%copyright;)*,
                         (%critdates;)?,
                         (%permissions;)?,
                         (%metadata;)*,
                         (%resourceid;)*,
                         (%data.elements.incl; |
                          %foreign.unknown.incl;)*)"
>
<!ENTITY % prolog.attributes
              "%univ-atts;"
>
<!ELEMENT  prolog %prolog.content;>
<!ATTLIST  prolog %prolog.attributes;>


<!--                    LONG NAME: related-links                   -->
<!ENTITY % related-links.content
                       "(%link; |
                         %linklist; |
                         %linkpool;)*"
>
<!ENTITY % related-links.attributes
              "%relational-atts;
               %univ-atts;"
>
<!ELEMENT  related-links %related-links.content;>
<!ATTLIST  related-links %related-links.attributes;>


<!--                    LONG NAME: link                            -->
<!ENTITY % link.content
                       "((%linktext;)?,
                         (%desc;)?)"
>
<!ENTITY % link.attributes
              "href
                          CDATA
                                    #IMPLIED
               keyref
                          CDATA
                                    #IMPLIED
               %relational-atts;
               %univ-atts;"
>
<!ELEMENT  link %link.content;>
<!ATTLIST  link %link.attributes;>

<!--                    LONG NAME: link text                       -->
<!ENTITY % linktext.content
                       "(%words.cnt; |
                         %ph;)*"
>
<!ENTITY % linktext.attributes
              "%univ-atts;"
>
<!ELEMENT  linktext %linktext.content;>
<!ATTLIST  linktext %linktext.attributes;>

<!--                    LONG NAME: linklist                        -->
<!ENTITY % linklist.content
                       "((%title;)?,
                         (%desc;)?,
                         (%linklist; |
                          %link;)*,
                         (%linkinfo;)?)"
>
<!ENTITY % linklist.attributes
              "collection-type
                          (choice |
                           family |
                           sequence |
                           unordered |
                           -dita-use-conref-target)
                                    #IMPLIED
               duplicates
                          (no |
                           yes |
                           -dita-use-conref-target)
                                    #IMPLIED
               %relational-atts;
               %univ-atts;"
>
<!ELEMENT  linklist %linklist.content;>
<!ATTLIST  linklist %linklist.attributes;>


<!--                    LONG NAME: linkinfo                        -->
<!ENTITY % linkinfo.content
                       "(%desc.cnt;)*"
>
<!ENTITY % linkinfo.attributes
              "%univ-atts;"
>
<!ELEMENT  linkinfo %linkinfo.content;>
<!ATTLIST  linkinfo %linkinfo.attributes;>


<!--                    LONG NAME: linkpool                        -->
<!ENTITY % linkpool.content
                       "(%linkpool; |
                         %link;)*"
>
<!ENTITY % linkpool.attributes
              "collection-type
                          (choice |
                           family |
                           sequence |
                           unordered |
                           -dita-use-conref-target)
                                    #IMPLIED
               duplicates
                          (no |
                           yes |
                           -dita-use-conref-target)
                                    #IMPLIED
               %relational-atts;
               %univ-atts;"
>
<!ELEMENT  linkpool %linkpool.content;>
<!ATTLIST  linkpool %linkpool.attributes;>


<!-- ============================================================= -->
<!--             SPECIALIZATION ATTRIBUTE DECLARATIONS             -->
<!-- ============================================================= -->
  
<!ATTLIST  abstract       class CDATA "- topic/abstract "   >
<!ATTLIST  body           class CDATA "- topic/body "       >
<!ATTLIST  bodydiv        class CDATA "- topic/bodydiv "    >
<!ATTLIST  link           class CDATA "- topic/link "       >
<!ATTLIST  linkinfo       class CDATA "- topic/linkinfo "   >
<!ATTLIST  linklist       class CDATA "- topic/linklist "   >
<!ATTLIST  linkpool       class CDATA "- topic/linkpool "   >
<!ATTLIST  linktext       class CDATA "- topic/linktext "   >
<!ATTLIST  no-topic-nesting   class CDATA "- topic/no-topic-nesting ">
<!ATTLIST  prolog         class CDATA "- topic/prolog "     >
<!ATTLIST  related-links   class CDATA "- topic/related-links ">
<!ATTLIST  section        class CDATA "- topic/section "    >
<!ATTLIST  topic          class CDATA "- topic/topic "      >

<!-- ================== End of DITA Topic Module ==================== -->
 