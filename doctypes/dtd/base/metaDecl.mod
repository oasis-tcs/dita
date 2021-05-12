<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    DITA Metadata                                     -->
<!--  VERSION:   2.0                                               -->
<!--  DATE:      [[[Release date]]]                                     -->
<!--  PURPOSE:   Declaring the elements and specialization         -->
<!--             attributes for the DITA XML Metadata              -->
<!--                                                               -->
<!-- ============================================================= -->
<!-- ============================================================= -->
<!--                    PUBLIC DOCUMENT TYPE DEFINITION            -->
<!--                    TYPICAL INVOCATION                         -->
<!--                                                               -->
<!--  Refer to this file by the following public identifier or an  -->
<!--       appropriate system identifier                           -->
<!-- PUBLIC "-//OASIS//ELEMENTS DITA 2.0 Metadata//EN"             -->
<!--       Delivered as file "metaDecl.mod"                        -->
<!-- ============================================================= -->
<!--                                                               -->
<!--             (C) Copyright OASIS Open 2005, 2009.              -->
<!--             (C) Copyright IBM Corporation 2001, 2004.         -->
<!--             All Rights Reserved.                              -->
<!--                                                               -->
<!--  UPDATES:                                                     -->
<!-- ============================================================= -->
<!--                                                               -->
<!--                                                               -->

<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!ENTITY % date-format
              "CDATA"
>
<!--                    LONG NAME: Author                          -->
<!ENTITY % author.content
                       "(%words.cnt;)*"
>
<!ENTITY % author.attributes
              "%univ-atts;
               href
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
               type
                          CDATA
                                    #IMPLIED"
>
<!ELEMENT  author %author.content;>
<!ATTLIST  author %author.attributes;>


<!--                    LONG NAME: Source                          -->
<!ENTITY % source.content
                       "(%words.cnt; |
                         %ph;)*"
>
<!ENTITY % source.attributes
              "%univ-atts;
               href
                          CDATA
                                    #IMPLIED
               format
                          CDATA
                                    #IMPLIED
               type
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
                                    #IMPLIED"
>
<!ELEMENT  source %source.content;>
<!ATTLIST  source %source.attributes;>


<!--                    LONG NAME: Publisher                       -->
<!ENTITY % publisher.content
                       "(%words.cnt;)*"
>
<!ENTITY % publisher.attributes
              "href
                          CDATA
                                    #IMPLIED
               format
                          CDATA
                                    #IMPLIED
               type
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
               %univ-atts;"
>
<!ELEMENT  publisher %publisher.content;>
<!ATTLIST  publisher %publisher.attributes;>


<!--                    LONG NAME: Copyright                       -->
<!ENTITY % copyright.content
                       "((%copyryear;)+,
                         (%copyrholder;))"
>
<!ENTITY % copyright.attributes
              "%univ-atts;
               type
                          CDATA
                                    #IMPLIED"
>
<!ELEMENT  copyright %copyright.content;>
<!ATTLIST  copyright %copyright.attributes;>


<!--                    LONG NAME: Copyright Year                  -->
<!ENTITY % copyryear.content
                       "EMPTY"
>
<!ENTITY % copyryear.attributes
              "year
                          %date-format;
                                    #REQUIRED
               %univ-atts;"
>
<!ELEMENT  copyryear %copyryear.content;>
<!ATTLIST  copyryear %copyryear.attributes;>


<!--                    LONG NAME: Copyright Holder                -->
<!ENTITY % copyrholder.content
                       "(%words.cnt;)*"
>
<!ENTITY % copyrholder.attributes
              "%univ-atts;"
>
<!ELEMENT  copyrholder %copyrholder.content;>
<!ATTLIST  copyrholder %copyrholder.attributes;>


<!--                    LONG NAME: Critical Dates                  -->
<!ENTITY % critdates.content
                       "((%created;)?,
                         (%revised;)*)"
>
<!ENTITY % critdates.attributes
              "%univ-atts;"
>
<!ELEMENT  critdates %critdates.content;>
<!ATTLIST  critdates %critdates.attributes;>


<!--                    LONG NAME: Created Date                    -->
<!ENTITY % created.content
                       "EMPTY"
>
<!ENTITY % created.attributes
              "date
                          %date-format;
                                    #REQUIRED
               golive
                          %date-format;
                                    #IMPLIED
               expiry
                          %date-format;
                                    #IMPLIED
               %univ-atts;"
>
<!ELEMENT  created %created.content;>
<!ATTLIST  created %created.attributes;>


<!--                    LONG NAME: Revised Date                    -->
<!ENTITY % revised.content
                       "EMPTY"
>
<!ENTITY % revised.attributes
              "modified
                          %date-format;
                                    #REQUIRED
               golive
                          %date-format;
                                    #IMPLIED
               expiry
                          %date-format;
                                    #IMPLIED
               %univ-atts;"
>
<!ELEMENT  revised %revised.content;>
<!ATTLIST  revised %revised.attributes;>


<!--                    LONG NAME: Permissions                     -->
<!ENTITY % permissions.content
                       "EMPTY"
>
<!ENTITY % permissions.attributes
              "%univ-atts;
               view
                          CDATA
                                    #REQUIRED"
>
<!ELEMENT  permissions %permissions.content;>
<!ATTLIST  permissions %permissions.attributes;>


<!--                    LONG NAME: Category                        -->
<!ENTITY % category.content
                       "(%words.cnt;)*"
>
<!ENTITY % category.attributes
              "%univ-atts;"
>
<!ELEMENT  category %category.content;>
<!ATTLIST  category %category.attributes;>


<!--                    LONG NAME: Metadata                        -->
<!ENTITY % metadata.content
                       "((%audience;)*,
                         (%category;)*,
                         (%keywords;)*,
                         (%prodinfo;)*,
                         (%othermeta;)*,
                         (%data.elements.incl; |
                          %foreign.unknown.incl;)*)"
>
<!ENTITY % metadata.attributes
              "%univ-atts;"
>
<!ELEMENT  metadata %metadata.content;>
<!ATTLIST  metadata %metadata.attributes;>


<!--                    LONG NAME: Audience                        -->
<!ENTITY % audience.content
                       "EMPTY"
>
<!ENTITY % audience.attributes
              "type
                          CDATA
                                    #IMPLIED
               job
                          CDATA
                                    #IMPLIED
               experiencelevel
                          CDATA
                                    #IMPLIED
               name
                          NMTOKEN
                                    #IMPLIED
               %univ-atts;"
>
<!ELEMENT  audience %audience.content;>
<!ATTLIST  audience %audience.attributes;>


<!--                    LONG NAME: Keywords                        -->
<!ENTITY % keywords.content
                       "(%indexterm; |
                         %keyword;)*"
>
<!ENTITY % keywords.attributes
              "%univ-atts;"
>
<!ELEMENT  keywords %keywords.content;>
<!ATTLIST  keywords %keywords.attributes;>


<!--                    LONG NAME: Product Information             -->
<!ENTITY % prodinfo.content
                       "((%prodname;),
                         (%vrmlist;)?,
                         (%brand; |
                          %component; |
                          %featnum; |
                          %platform; |
                          %prognum; |
                          %series;)*)"
>
<!ENTITY % prodinfo.attributes
              "%univ-atts;"
>
<!ELEMENT  prodinfo %prodinfo.content;>
<!ATTLIST  prodinfo %prodinfo.attributes;>


<!--                    LONG NAME: Product Name                    -->
<!ENTITY % prodname.content
                       "(%words.cnt;)*"
>
<!ENTITY % prodname.attributes
              "%univ-atts;"
>
<!ELEMENT  prodname %prodname.content;>
<!ATTLIST  prodname %prodname.attributes;>


<!--                    LONG NAME: Version Release and Modification List -->
<!ENTITY % vrmlist.content
                       "(%vrm;)+"
>
<!ENTITY % vrmlist.attributes
              "%univ-atts;"
>
<!ELEMENT  vrmlist %vrmlist.content;>
<!ATTLIST  vrmlist %vrmlist.attributes;>


<!--                    LONG NAME: Version Release and Modification -->
<!ENTITY % vrm.content
                       "EMPTY"
>
<!ENTITY % vrm.attributes
              "version
                          CDATA
                                    #REQUIRED
               release
                          CDATA
                                    #IMPLIED
               modification
                          CDATA
                                    #IMPLIED
               %univ-atts;"
>
<!ELEMENT  vrm %vrm.content;>
<!ATTLIST  vrm %vrm.attributes;>


<!--                    LONG NAME: Brand                           -->
<!ENTITY % brand.content
                       "(%words.cnt;)*"
>
<!ENTITY % brand.attributes
              "%univ-atts;"
>
<!ELEMENT  brand %brand.content;>
<!ATTLIST  brand %brand.attributes;>


<!--                    LONG NAME: Series                          -->
<!ENTITY % series.content
                       "(%words.cnt;)*"
>
<!ENTITY % series.attributes
              "%univ-atts;"
>
<!ELEMENT  series %series.content;>
<!ATTLIST  series %series.attributes;>


<!--                    LONG NAME: Platform                        -->
<!ENTITY % platform.content
                       "(%words.cnt;)*"
>
<!ENTITY % platform.attributes
              "%univ-atts;"
>
<!ELEMENT  platform %platform.content;>
<!ATTLIST  platform %platform.attributes;>


<!--                    LONG NAME: Program Number                  -->
<!ENTITY % prognum.content
                       "(%words.cnt;)*"
>
<!ENTITY % prognum.attributes
              "%univ-atts;"
>
<!ELEMENT  prognum %prognum.content;>
<!ATTLIST  prognum %prognum.attributes;>


<!--                    LONG NAME: Feature Number                  -->
<!ENTITY % featnum.content
                       "(%words.cnt;)*"
>
<!ENTITY % featnum.attributes
              "%univ-atts;"
>
<!ELEMENT  featnum %featnum.content;>
<!ATTLIST  featnum %featnum.attributes;>


<!--                    LONG NAME: Component                       -->
<!ENTITY % component.content
                       "(%words.cnt;)*"
>
<!ENTITY % component.attributes
              "%univ-atts;"
>
<!ELEMENT  component %component.content;>
<!ATTLIST  component %component.attributes;>


<!--                    LONG NAME: Other Metadata                  -->
<!ENTITY % othermeta.content
                       "EMPTY"
>
<!ENTITY % othermeta.attributes
              "name
                          CDATA
                                    #REQUIRED
               content
                          CDATA
                                    #REQUIRED
               translate-content
                          (no |
                           yes |
                           -dita-use-conref-target)
                                    #IMPLIED
               %univ-atts;"
>
<!ELEMENT  othermeta %othermeta.content;>
<!ATTLIST  othermeta %othermeta.attributes;>


<!--                    LONG NAME: Resource Identifier             -->
<!ENTITY % resourceid.content
                       "(%data.elements.incl;)*"
>
<!ENTITY % resourceid.attributes
              "%univ-atts;
               appname
                          CDATA
                                    #IMPLIED
               appid
                          CDATA
                                    #IMPLIED
               appid-role
                           CDATA
                                     'context-sensitive-help'
               ux-context-string
                          CDATA
                                    #IMPLIED
               ux-source-priority
                          (topic-and-map |
                           topic-only |
                           map-only |
                           map-takes-priority |
                           topic-takes-priority |
                           -dita-use-conref-target)
                                    'topic-and-map'
               ux-windowref
                          CDATA
                                    #IMPLIED"
>
<!ELEMENT  resourceid %resourceid.content;>
<!ATTLIST  resourceid %resourceid.attributes;>



<!-- ============================================================= -->
<!--             SPECIALIZATION ATTRIBUTE DECLARATIONS             -->
<!-- ============================================================= -->
  
<!ATTLIST  author         class CDATA "- topic/author "     >
<!ATTLIST  source         class CDATA "- topic/source "     >
<!ATTLIST  publisher      class CDATA "- topic/publisher "  >
<!ATTLIST  copyright      class CDATA "- topic/copyright "  >
<!ATTLIST  copyryear      class CDATA "- topic/copyryear "  >
<!ATTLIST  copyrholder    class CDATA "- topic/copyrholder ">
<!ATTLIST  critdates      class CDATA "- topic/critdates "  >
<!ATTLIST  created        class CDATA "- topic/created "    >
<!ATTLIST  revised        class CDATA "- topic/revised "    >
<!ATTLIST  permissions    class CDATA "- topic/permissions ">
<!ATTLIST  category       class CDATA "- topic/category "   >
<!ATTLIST  metadata       class CDATA "- topic/metadata "   >
<!ATTLIST  audience       class CDATA "- topic/audience "   >
<!ATTLIST  keywords       class CDATA "- topic/keywords "   >
<!ATTLIST  prodinfo       class CDATA "- topic/prodinfo "   >
<!ATTLIST  prodname       class CDATA "- topic/prodname "   >
<!ATTLIST  vrmlist        class CDATA "- topic/vrmlist "    >
<!ATTLIST  vrm            class CDATA "- topic/vrm "        >
<!ATTLIST  brand          class CDATA "- topic/brand "      >
<!ATTLIST  series         class CDATA "- topic/series "     >
<!ATTLIST  platform       class CDATA "- topic/platform "   >
<!ATTLIST  prognum        class CDATA "- topic/prognum "    >
<!ATTLIST  featnum        class CDATA "- topic/featnum "    >
<!ATTLIST  component      class CDATA "- topic/component "  >
<!ATTLIST  othermeta      class CDATA "- topic/othermeta "  >
<!ATTLIST  resourceid     class CDATA "- topic/resourceid " >

<!-- ================== End of DITA Metadata ==================== -->
 