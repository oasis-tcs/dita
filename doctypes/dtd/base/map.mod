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
<!--  MODULE:    DITA Map                                          -->
<!--  VERSION:   2.0                                               -->
<!--  DATE:      [[[Release date]]]                                        -->
<!--  PURPOSE:   Declaring the elements and specialization         -->
<!--             attributes for the DITA Maps                      -->
<!--                                                               -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!--                    PUBLIC DOCUMENT TYPE DEFINITION            -->
<!--                    TYPICAL INVOCATION                         -->
<!--                                                               -->
<!--  Refer to this file by the following public identifier or an 
      appropriate system identifier 
PUBLIC "-//OASIS//ELEMENTS DITA 2.0 Map//EN"
      Delivered as file "map.mod"                                  -->

<!-- ============================================================= -->
<!--                                                               -->
<!--             (C) Copyright OASIS Open 2005, 2009.              -->
<!--             (C) Copyright IBM Corporation 2001, 2004.         -->
<!--             All Rights Reserved.                              -->
<!--                                                               -->
<!--  UPDATES:                                                     -->
<!--    2018.03.14 KJE: Added new attribute group for use on       -->
<!--                    reltable and relcolspec; removed @keyref   -->
<!--                    from navref; removed @navtitle@print, and  -->
<!--                    @query; removed @title on map              -->
<!--    2018.04.09 KJE: Removed outputclass various elements that  -->
<!--                    take univ-atts                             -->
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

<!ENTITY % map         "map"                                         >
<!ENTITY % navref      "navref"                                      >
<!ENTITY % topicref    "topicref"                                    >
<!ENTITY % reltable    "reltable"                                    >
<!ENTITY % relheader   "relheader"                                   >
<!ENTITY % relcolspec  "relcolspec"                                  >
<!ENTITY % relrow      "relrow"                                      >
<!ENTITY % relcell     "relcell"                                     >
<!ENTITY % topicmeta   "topicmeta"                                   >
<!ENTITY % keytext     "keytext"                                     >
<!ENTITY % ux-window   "ux-window"                                   >

<!-- ============================================================= -->
<!--                    COMMON ATTLIST SETS                        -->
<!-- ============================================================= -->  

<!ENTITY % topicref-atts
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
<!ENTITY % topicref-atts-no-toc
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
                                    #IMPLIED
               keyscope
                          CDATA
                                    #IMPLIED"
>
<!ENTITY % topicref-atts-no-toc-no-keyscope
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
<!ENTITY % topicref-atts-without-format
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
<!ENTITY % topicref-atts-for-reltable
              "type
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

    
<!-- ============================================================= -->
<!--                    MODULES CALLS                              -->
<!-- ============================================================= -->
  

<!--           Content elements common to map and topic            -->
<!ENTITY % commonElements-def
  PUBLIC "-//OASIS//ELEMENTS DITA 2.0 Common Elements//EN"
         "commonElements.mod"
>%commonElements-def;

<!--                       MetaData Elements                       -->
<!ENTITY % metaDecl-def
  PUBLIC "-//OASIS//ELEMENTS DITA 2.0 Metadata//EN"
         "metaDecl.mod"
>%metaDecl-def;
      
  
<!-- ============================================================= -->
<!--                    DOMAINS ATTRIBUTE OVERRIDE                 -->
<!-- ============================================================= -->

<!ENTITY included-domains 
  "" 
> 

<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!--                    LONG NAME: Map                             -->
<!ENTITY % map.content
                       "((%title;)?,
                         (%topicmeta;)?,
                         (%data.elements.incl; |
                          %navref; |
                          %reltable; |
                          %topicref;)*)"
>
<!ENTITY % map.attributes
              "id
                          ID
                                    #IMPLIED
               %conref-atts;
               outputclass
                          CDATA
                                    #IMPLIED
               %localization-atts;
               %topicref-atts;
               %select-atts;"
>
<!ELEMENT  map %map.content;>
<!ATTLIST  map %map.attributes;
                 %arch-atts;
                 specializations 
                        CDATA
                                  "&included-domains;"
>


<!--                    LONG NAME: Navigation Reference            -->
<!ENTITY % navref.content
                       "EMPTY"
>
<!ENTITY % navref.attributes
              "%univ-atts;
               mapref
                          CDATA
                                    #IMPLIED"
>
<!ELEMENT  navref %navref.content;>
<!ATTLIST  navref %navref.attributes;>


<!--                    LONG NAME: Topic Reference                 -->
<!ENTITY % topicref.content
                       "((%topicmeta;)?,
                         (%data.elements.incl; |
                          %navref; |
                          %topicref;)*)"
>
<!ENTITY % topicref.attributes
              "href
                          CDATA
                                    #IMPLIED
               keyref
                          CDATA
                                    #IMPLIED
               keys
                          CDATA
                                    #IMPLIED
               %topicref-atts;
               %univ-atts;"
>
<!ELEMENT  topicref %topicref.content;>
<!ATTLIST  topicref %topicref.attributes;>


<!--                    LONG NAME: Relationship Table              -->
<!ENTITY % reltable.content
                       "((%title;)?,
                         (%topicmeta;)?,
                         (%relheader;)?,
                         (%relrow;)+)"
>
<!ENTITY % reltable.attributes
              "title
                          CDATA
                                    #IMPLIED
               %topicref-atts-for-reltable;
               %univ-atts;"
>
<!ELEMENT  reltable %reltable.content;>
<!ATTLIST  reltable %reltable.attributes;>


<!--                    LONG NAME: Relationship Header             -->
<!ENTITY % relheader.content
                       "(%relcolspec;)+"
>
<!ENTITY % relheader.attributes
              "%univ-atts;"
>
<!ELEMENT  relheader %relheader.content;>
<!ATTLIST  relheader %relheader.attributes;>


<!--                    LONG NAME: Relationship Column Specification -->
<!ENTITY % relcolspec.content
                       "((%title;)?,
                         (%topicmeta;)?,
                         (%topicref;)*)"
>
<!ENTITY % relcolspec.attributes
              "%topicref-atts-for-reltable;
               %univ-atts;"
>
<!ELEMENT  relcolspec %relcolspec.content;>
<!ATTLIST  relcolspec %relcolspec.attributes;>


<!--                    LONG NAME: Relationship Table Row          -->
<!ENTITY % relrow.content
                       "(%relcell;)*"
>
<!ENTITY % relrow.attributes
              "%univ-atts;"
>
<!ELEMENT  relrow %relrow.content;>
<!ATTLIST  relrow %relrow.attributes;>


<!--                    LONG NAME: Relationship Table Cell         -->
<!ENTITY % relcell.content
                       "(%topicref; |
                         %data.elements.incl;)*"
>
<!ENTITY % relcell.attributes
              "%topicref-atts-no-toc-no-keyscope;
               %univ-atts;"
>
<!ELEMENT  relcell %relcell.content;>
<!ATTLIST  relcell %relcell.attributes;>


<!--                    LONG NAME: Topic Metadata                  -->
<!ENTITY % topicmeta.content
                       "((%keytext;)?,
                         (%titlealt;)*,
                         (%shortdesc;)?,
                         (%author;)*,
                         (%source;)?,
                         (%publisher;)?,
                         (%copyright;)*,
                         (%critdates;)?,
                         (%permissions;)?,
                         (%metadata;)*,
                         (%audience;)*,
                         (%category;)*,
                         (%keywords;)*,
                         (%prodinfo;)*,
                         (%othermeta;)*,
                         (%resourceid;)*,
                         (%ux-window;)*,
                         (%data.elements.incl; |
                          %foreign.unknown.incl;)*)"
>
<!ENTITY % topicmeta.attributes
              "%univ-atts;"
>
<!ELEMENT  topicmeta %topicmeta.content;>
<!ATTLIST  topicmeta %topicmeta.attributes;>


<!--                    LONG NAME: Key text                        -->
<!ENTITY % keytext.content
                        "(#PCDATA |
                          %cite; |
                          %data; |
                          %keyword; |
                          %ph; |
                          %q; |
                          %term; |
                          %text; |
                          %tm;)*"
>
<!ENTITY % keytext.attributes
              "%univ-atts;"
>
<!ELEMENT  keytext %keytext.content;>
<!ATTLIST  keytext %keytext.attributes;>


<!--                    LONG NAME: User Experience Window          -->
<!ENTITY % ux-window.content
                       "EMPTY"
>
<!ENTITY % ux-window.attributes
              "name
                          CDATA
                                    #REQUIRED
               top
                          CDATA
                                    #IMPLIED
               left
                          CDATA
                                    #IMPLIED
               height
                          CDATA
                                    #IMPLIED
               width
                          CDATA
                                    #IMPLIED
               on-top
                          (yes |
                           no |
                           -dita-use-conref-target)
                                    'no'
               features
                          CDATA
                                    #IMPLIED
               relative
                          (yes |
                           no |
                           -dita-use-conref-target)
                                    'no'
               full-screen
                          (yes |
                           no |
                           -dita-use-conref-target)
                                    'no'
               %id-atts;
               %select-atts;
               outputclass
                          CDATA
                                    #IMPLIED"
>
<!ELEMENT  ux-window %ux-window.content;>
<!ATTLIST  ux-window %ux-window.attributes;>



<!-- ============================================================= -->
<!--             SPECIALIZATION ATTRIBUTE DECLARATIONS             -->
<!-- ============================================================= -->
  
<!ATTLIST  map            class CDATA "- map/map "          >
<!ATTLIST  navref         class CDATA "- map/navref "       >
<!ATTLIST  topicref       class CDATA "- map/topicref "     >
<!ATTLIST  reltable       class CDATA "- map/reltable "     >
<!ATTLIST  relheader      class CDATA "- map/relheader "    >
<!ATTLIST  relcolspec     class CDATA "- map/relcolspec "   >
<!ATTLIST  relrow         class CDATA "- map/relrow "       >
<!ATTLIST  relcell        class CDATA "- map/relcell "      >
<!ATTLIST  topicmeta      class CDATA "- map/topicmeta "    >
<!ATTLIST  keytext        class CDATA "- map/keytext "      >
<!ATTLIST  ux-window      class CDATA "- map/ux-window "    >

<!-- ================== End of DITA Map Module ==================== -->
 