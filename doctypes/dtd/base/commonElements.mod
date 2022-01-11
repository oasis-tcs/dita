<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    DITA Common Elements                              -->
<!--  VERSION:   2.0                                               -->
<!--  DATE:      [[[Release date]]]                                     -->
<!--  PURPOSE:   Declaring the elements and specialization         -->
<!--             attributes for content elements used in both      -->
<!--             topics and maps.                                  -->
<!--                                                               -->
<!-- ============================================================= -->
<!-- ============================================================= -->
<!--                    PUBLIC DOCUMENT TYPE DEFINITION            -->
<!--                    TYPICAL INVOCATION                         -->
<!--                                                               -->
<!--  Refer to this file by the following public identifier or an  -->
<!--       appropriate system identifier                           -->
<!-- PUBLIC "-//OASIS//ELEMENTS DITA 2.0 Common Elements//EN"      -->
<!--       Delivered as file "commonElements.mod"                  -->
<!-- ============================================================= -->
<!--                                                               -->
<!--             (C) Copyright OASIS Open 2005, 2009.              -->
<!--             (C) Copyright IBM Corporation 2001, 2004.         -->
<!--             All Rights Reserved.                              -->
<!--                                                               -->
<!--  UPDATES:                                                     -->
<!--    2018.03.14 KJE: Removed boolean and indextermref; @alt and -->
<!--                    @longdescref on image; @refcols            -->
<!--    2019.08.21 KJE: Modified content model of indexterm;       -->  
<!--                    removed index-base and added index-see     -->
<!--                    and index-see-also                         -->
<!-- =============================================================      -->
<!--                                                               -->

<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->


<!ENTITY % commonDefns
  PUBLIC "-//OASIS//ENTITIES DITA 2.0 Common Elements//EN"          "commonElements.ent" 
>%commonDefns;

<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!ENTITY % basic.ph
              "%cite; |
               %include; |
               %keyword; |
               %ph; |
               %q; |
               %term; |
               %text; |
               %tm; |
               %xref; |
               %state;"
>
<!ENTITY % basic.block
              "%audio; |
               %dl; |
               %div; |
               %example; |
               %fig; |
               %image; |
               %lines; |
               %lq; |
               %note; |
               %object; |
               %ol; |
               %p; |
               %pre; |
               %simpletable; |
               %sl; |
               %table; |
               %ul; |
               %video;"
>
<!ENTITY % basic.phandblock
              "%basic.block; |
               %basic.ph;"
>
<!ENTITY % basic.ph.noxref.nocite
              "%keyword; |
               %ph; |
               %q; |
               %term; |
               %text; |
               %tm; |
               %state;"
>
<!ENTITY % basic.ph.noxref
              "%basic.ph.noxref.nocite; |
               %cite;"
>
<!ENTITY % basic.ph.notm
              "%cite; |
               %include; |
               %keyword; |
               %ph; |
               %q; |
               %term; |
               %text; |
               %xref; |
               %state;"
>
<!ENTITY % basic.block.notbl
              "%audio; |
               %dl; |
               %div; |
               %example; |
               %fig; |
               %image; |
               %lines; |
               %lq; |
               %note; |
               %object; |
               %ol; |
               %p; |
               %pre; |
               %sl; |
               %ul; |
               %video;"
>
<!ENTITY % basic.block.nonote
              "%audio; |
               %dl; |
               %div; |
               %example; |
               %fig; |
               %image; |
               %lines; |
               %lq; |
               %object; |
               %ol; |
               %p; |
               %pre; |
               %simpletable; |
               %sl; |
               %table; |
               %ul; |
               %video;"
>
<!ENTITY % basic.block.nopara
              "%audio; |
               %dl; |
               %div; |
               %example; |
               %fig; |
               %image; |
               %lines; |
               %lq; |
               %note; |
               %object; |
               %ol; |
               %pre; |
               %simpletable; |
               %sl; |
               %table; |
               %ul; |
               %video;"
>
<!ENTITY % basic.block.nolq
              "%audio; |
               %dl; |
               %div; |
               %example; |
               %fig; |
               %image; |
               %lines; |
               %note; |
               %object; |
               %ol; |
               %p; |
               %pre; |
               %simpletable; |
               %sl; |
               %table; |
               %ul; |
               %video;"
>
<!ENTITY % basic.block.noexample
              "%audio; |
               %dl; |
               %div; |
               %fig; |
               %image; |
               %lines; |
               %lq; |
               %note; |
               %object; |
               %ol; |
               %p; |
               %pre; |
               %simpletable; |
               %sl; |
               %table; |
               %ul; |
               %video;"
>
<!ENTITY % basic.block.notbnofg
              "%audio; |
               %dl; |
               %div; |
               %example; |
               %image; |
               %lines; |
               %lq; |
               %note; |
               %object; |
               %ol; |
               %p; |
               %pre; |
               %sl; |
               %ul; |
               %video;"
>
<!ENTITY % basic.block.notbfgobj
              "%dl; |
               %div; |
               %image; |
               %lines; |
               %lq; |
               %note; |
               %ol; |
               %p; |
               %pre; |
               %sl; |
               %ul;"
>
<!ENTITY % txt.incl
              "%draft-comment; |
               %fn; |
               %indexterm; |
               %required-cleanup;"
>
<!ENTITY % data.elements.incl
              "%data;"
>
<!ENTITY % foreign.unknown.incl
              "%foreign; |
               %unknown;"
>
<!ENTITY % listitem.cnt
              "#PCDATA |
               %basic.block; |
               %basic.ph; |
               %data.elements.incl; |
               %foreign.unknown.incl; |
               %txt.incl;"
>
<!ENTITY % title.cnt
              "#PCDATA |
               %basic.ph.noxref; |
               %data.elements.incl; |
               %draft-comment; |
               %foreign.unknown.incl; |
               %required-cleanup; |
               %image;"
>
<!ENTITY % xreftext.cnt
              "#PCDATA |
               %basic.ph.noxref; |
               %data.elements.incl; |
               %draft-comment; |
               %foreign.unknown.incl; |
               %required-cleanup; |
               %image;"
>
<!ENTITY % xrefph.cnt
              "#PCDATA |
               %basic.ph.noxref.nocite; |
               %data.elements.incl; |
               %draft-comment; |
               %foreign.unknown.incl; |
               %required-cleanup;"
>
<!ENTITY % shortquote.cnt
              "#PCDATA |
               %basic.ph; |
               %data.elements.incl; |
               %draft-comment; |
               %foreign.unknown.incl; |
               %required-cleanup;"
>
<!ENTITY % para.cnt
              "#PCDATA |
               %basic.block.nopara; |
               %basic.ph; |
               %data.elements.incl; |
               %foreign.unknown.incl; |
               %txt.incl;"
>
<!ENTITY % note.cnt
              "#PCDATA |
               %basic.block.nonote; |
               %basic.ph; |
               %data.elements.incl; |
               %foreign.unknown.incl; |
               %txt.incl;"
>
<!ENTITY % longquote.cnt
              "#PCDATA |
               %basic.block.nolq; |
               %basic.ph; |
               %data.elements.incl; |
               %foreign.unknown.incl; |
               %txt.incl;"
>
<!ENTITY % tblcell.cnt
              "#PCDATA |
               %basic.block.notbl; |
               %basic.ph; |
               %data.elements.incl; |
               %foreign.unknown.incl; |
               %txt.incl;"
>
<!ENTITY % desc.cnt
              "#PCDATA |
               %basic.block.notbfgobj; |
               %basic.ph; |
               %data.elements.incl; |
               %draft-comment; |
               %foreign.unknown.incl; |
               %required-cleanup;"
>
<!ENTITY % ph.cnt
              "#PCDATA |
               %basic.ph; |
               %data.elements.incl; |
               %foreign.unknown.incl; |
               %image; |
               %txt.incl;"
>
<!ENTITY % fn.cnt
              "#PCDATA |
               %basic.block.notbl; |
               %basic.ph; |
               %data.elements.incl; |
               %draft-comment; |
               %foreign.unknown.incl; |
               %required-cleanup;"
>
<!ENTITY % term.cnt
              "#PCDATA |
               %basic.ph; |
               %data.elements.incl; |
               %draft-comment; |
               %foreign.unknown.incl; |
               %required-cleanup; |
               %image;"
>
<!ENTITY % defn.cnt
              "#PCDATA |
               %basic.block; |
               %basic.ph; |
               %data.elements.incl; |
               %foreign.unknown.incl; |
               %txt.incl;"
>
<!ENTITY % pre.cnt
              "#PCDATA |
               %basic.ph; |
               %data.elements.incl; |
               %foreign.unknown.incl; |
               %txt.incl;"
>
<!ENTITY % example.cnt
              "#PCDATA |
               %basic.block.noexample; |
               %basic.ph; |
               %data.elements.incl; |
               %foreign.unknown.incl; |
               %title; |
               %txt.incl;"
>
<!ENTITY % fig.cnt
              "%basic.block.notbnofg; |
               %data.elements.incl; |
               %fn; |
               %foreign.unknown.incl; |
               %include; |
               %simpletable; |
               %xref;"
>
<!ENTITY % figgroup.cnt
              "%basic.block.notbnofg; |
               %basic.ph; |
               %data.elements.incl; |
               %draft-comment; |
               %fn; |
               %foreign.unknown.incl; |
               %required-cleanup;"
>
<!ENTITY % words.cnt
              "#PCDATA |
               %data.elements.incl; |
               %foreign.unknown.incl; |
               %keyword; |
               %term; |
               %text;"
>
<!ENTITY % data.cnt
              "#PCDATA |
               %audio; |
               %basic.ph; |
               %data.elements.incl; |
               %draft-comment; |
               %foreign.unknown.incl; |
               %image; |
               %object; |
               %required-cleanup; |
               %title; |
               %video;"
>
<!ENTITY % div.cnt
              "#PCDATA |
               %basic.block; |
               %basic.ph; |
               %data.elements.incl; |
               %foreign.unknown.incl; |
               %txt.incl;"
>
<!ENTITY % display-atts
              "scale
                          (50 |
                           60 |
                           70 |
                           80 |
                           90 |
                           100 |
                           110 |
                           120 |
                           140 |
                           160 |
                           180 |
                           200 |
                           -dita-use-conref-target)
                                    #IMPLIED
               frame
                          (all |
                           bottom |
                           none |
                           sides |
                           top |
                           topbot |
                           -dita-use-conref-target)
                                    #IMPLIED
               expanse
                          (column |
                           page |
                           spread |
                           textline |
                           -dita-use-conref-target)
                                    #IMPLIED"
>
<!ENTITY % props-attribute-extensions
              ""
>
<!ENTITY % base-attribute-extensions
              ""
>
<!ENTITY % filter-atts
              "props
                          CDATA
                                    #IMPLIED
               %props-attribute-extensions;"
>
<!ENTITY % select-atts
              "%filter-atts;
               base
                          CDATA
                                    #IMPLIED
               %base-attribute-extensions;
               importance
                          (default |
                           deprecated |
                           high |
                           low |
                           normal |
                           obsolete |
                           optional |
                           recommended |
                           required |
                           urgent |
                           -dita-use-conref-target)
                                    #IMPLIED
               rev
                          CDATA
                                    #IMPLIED
               status
                          (changed |
                           deleted |
                           new |
                           unchanged |
                           -dita-use-conref-target)
                                    #IMPLIED"
>
<!ENTITY % conref-atts
              "conref
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
               conkeyref
                          CDATA
                                    #IMPLIED"
>
<!ENTITY % id-atts
              "id
                          NMTOKEN
                                    #IMPLIED
               %conref-atts;"
>
<!ENTITY % localization-atts
              "translate
                          (no |
                           yes |
                           -dita-use-conref-target)
                                    #IMPLIED
               xml:lang
                          CDATA
                                    #IMPLIED
               dir
                          (lro |
                           ltr |
                           rlo |
                           rtl |
                           -dita-use-conref-target)
                                    #IMPLIED"
>
<!ENTITY % localization-atts-translate-no
              "translate
                          (no |
                           yes |
                           -dita-use-conref-target)
                                    'no'
               xml:lang
                          CDATA
                                    #IMPLIED
               dir
                          (lro |
                           ltr |
                           rlo |
                           rtl |
                           -dita-use-conref-target)
                                    #IMPLIED"
>
<!ENTITY % univ-atts
              "%id-atts;
               %select-atts;
               %localization-atts;
               outputclass
                          CDATA
                                    #IMPLIED"
>
<!ENTITY % univ-atts-translate-no
              "%id-atts;
               %select-atts;
               %localization-atts-translate-no;
               outputclass
                          CDATA
                                    #IMPLIED"
>

<!ENTITY % data-element-atts
              "%univ-atts;
               name
                          CDATA
                                    #IMPLIED
               datatype
                          CDATA
                                    #IMPLIED
               value
                          CDATA
                                    #IMPLIED
               href
                          CDATA
                                    #IMPLIED
               keyref
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
                                    #IMPLIED"
>
<!--                    LONG NAME: Data                            -->
<!ENTITY % data.content
                       "(%data.cnt;)*"
>
<!ENTITY % data.attributes
              "%data-element-atts;"
>
<!ELEMENT  data %data.content;>
<!ATTLIST  data %data.attributes;>


<!--                    LONG NAME: Unknown                         -->
<!ENTITY % unknown.content
                       "ANY "
>
<!ENTITY % unknown.attributes
              "%univ-atts;"
>
<!ELEMENT  unknown %unknown.content;>
<!ATTLIST  unknown %unknown.attributes;>


<!--                    LONG NAME: Foreign                         -->
<!ENTITY % foreign.content
                       "ANY "
>
<!ENTITY % foreign.attributes
              "%univ-atts;"
>
<!ELEMENT  foreign %foreign.content;>
<!ATTLIST  foreign %foreign.attributes;>


<!--                    LONG NAME: Title                           -->
<!ENTITY % title.content
                       "(%title.cnt;)*"
>
<!ENTITY % title.attributes
              "%id-atts;
               %localization-atts;
               base
                          CDATA
                                    #IMPLIED
               %base-attribute-extensions;
               outputclass
                          CDATA
                                    #IMPLIED
               rev
                          CDATA
                                    #IMPLIED"
>
<!ELEMENT  title %title.content;>
<!ATTLIST  title %title.attributes;>


<!--                    LONG NAME: Alternate Title                -->
<!ENTITY % titlealt.content
                       "(%words.cnt; |
                         %ph; |
                         %draft-comment; |
                         %required-cleanup;)*"
>
<!ENTITY % titlealt.attributes
              "title-role
                          CDATA
                                    #REQUIRED
               %univ-atts;"
>
<!ELEMENT  titlealt %titlealt.content;>
<!ATTLIST  titlealt %titlealt.attributes;>

<!--                    LONG NAME: Short Description               -->
<!ENTITY % shortdesc.content
                       "(%title.cnt; |
                         %xref;)*"
>
<!ENTITY % shortdesc.attributes
              "%univ-atts;"
>
<!ELEMENT  shortdesc %shortdesc.content;>
<!ATTLIST  shortdesc %shortdesc.attributes;>


<!--                    LONG NAME: Description                     -->
<!ENTITY % desc.content
                       "(%desc.cnt;)*"
>
<!ENTITY % desc.attributes
              "%univ-atts;"
>
<!ELEMENT  desc %desc.content;>
<!ATTLIST  desc %desc.attributes;>


<!--                    LONG NAME: Paragraph                       -->
<!ENTITY % p.content
                       "(%para.cnt;)*"
>
<!ENTITY % p.attributes
              "%univ-atts;"
>
<!ELEMENT  p %p.content;>
<!ATTLIST  p %p.attributes;>


<!--                    LONG NAME: Note                            -->
<!ENTITY % note.content
                       "(%note.cnt;)*"
>
<!ENTITY % note.attributes
              "type
                          (attention |
                           caution |
                           danger |
                           fastpath |
                           important |
                           note |
                           notice |
                           other |
                           remember |
                           restriction |
                           tip |
                           trouble |
                           warning |
                           -dita-use-conref-target)
                                    #IMPLIED
               othertype
                          CDATA
                                    #IMPLIED
               %univ-atts;"
>
<!ELEMENT  note %note.content;>
<!ATTLIST  note %note.attributes;>


<!--                    LONG NAME: Long Quote                      -->
<!ENTITY % lq.content
                       "(%longquote.cnt;)*"
>
<!ENTITY % lq.attributes
              "keyref
                          CDATA
                                    #IMPLIED
               %univ-atts;"
>
<!ELEMENT  lq %lq.content;>
<!ATTLIST  lq %lq.attributes;>


<!--                    LONG NAME: Quote                           -->
<!ENTITY % q.content
                       "(%shortquote.cnt;)*"
>
<!ENTITY % q.attributes
              "%univ-atts;"
>
<!ELEMENT  q %q.content;>
<!ATTLIST  q %q.attributes;>


<!--                    LONG NAME: Simple List                     -->
<!ENTITY % sl.content
                       "((%data;)*,
                         (%sli;)+)"
>
<!ENTITY % sl.attributes
              "compact
                          (no |
                           yes |
                           -dita-use-conref-target)
                                    #IMPLIED
               %univ-atts;"
>
<!ELEMENT  sl %sl.content;>
<!ATTLIST  sl %sl.attributes;>


<!--                    LONG NAME: Simple List Item                -->
<!ENTITY % sli.content
                       "(%ph.cnt;)*"
>
<!ENTITY % sli.attributes
              "%univ-atts;"
>
<!ELEMENT  sli %sli.content;>
<!ATTLIST  sli %sli.attributes;>


<!--                    LONG NAME: Unordered List                  -->
<!ENTITY % ul.content
                       "((%data;)*,
                         (%li;)+)"
>
<!ENTITY % ul.attributes
              "compact
                          (no |
                           yes |
                           -dita-use-conref-target)
                                    #IMPLIED
               %univ-atts;"
>
<!ELEMENT  ul %ul.content;>
<!ATTLIST  ul %ul.attributes;>


<!--                    LONG NAME: Ordered List                    -->
<!ENTITY % ol.content
                       "((%data;)*,
                         (%li;)+)"
>
<!ENTITY % ol.attributes
              "compact
                          (no |
                           yes |
                           -dita-use-conref-target)
                                    #IMPLIED
               %univ-atts;"
>
<!ELEMENT  ol %ol.content;>
<!ATTLIST  ol %ol.attributes;>


<!--                    LONG NAME: List Item                       -->
<!ENTITY % li.content
                       "(%listitem.cnt;)*"
>
<!ENTITY % li.attributes
              "%univ-atts;"
>
<!ELEMENT  li %li.content;>
<!ATTLIST  li %li.attributes;>


<!--                    LONG NAME: Definition List                 -->
<!ENTITY % dl.content
                       "((%data;)*,
                         (%dlhead;)?,
                         (%dlentry;)+)"
>
<!ENTITY % dl.attributes
              "compact
                          (no |
                           yes |
                           -dita-use-conref-target)
                                    #IMPLIED
               %univ-atts;"
>
<!ELEMENT  dl %dl.content;>
<!ATTLIST  dl %dl.attributes;>


<!--                    LONG NAME: Definition List Head            -->
<!ENTITY % dlhead.content
                       "((%dthd;)?,
                         (%ddhd;)?)"
>
<!ENTITY % dlhead.attributes
              "%univ-atts;"
>
<!ELEMENT  dlhead %dlhead.content;>
<!ATTLIST  dlhead %dlhead.attributes;>


<!--                    LONG NAME: Term Header                     -->
<!ENTITY % dthd.content
                       "(%title.cnt;)*"
>
<!ENTITY % dthd.attributes
              "%univ-atts;"
>
<!ELEMENT  dthd %dthd.content;>
<!ATTLIST  dthd %dthd.attributes;>


<!--                    LONG NAME: Definition Header               -->
<!ENTITY % ddhd.content
                       "(%title.cnt;)*"
>
<!ENTITY % ddhd.attributes
              "%univ-atts;"
>
<!ELEMENT  ddhd %ddhd.content;>
<!ATTLIST  ddhd %ddhd.attributes;>


<!--                    LONG NAME: Definition List Entry           -->
<!ENTITY % dlentry.content
                       "((%dt;)+,
                         (%dd;)+)"
>
<!ENTITY % dlentry.attributes
              "%univ-atts;"
>
<!ELEMENT  dlentry %dlentry.content;>
<!ATTLIST  dlentry %dlentry.attributes;>


<!--                    LONG NAME: Definition Term                 -->
<!ENTITY % dt.content
                       "(%term.cnt;)*"
>
<!ENTITY % dt.attributes
              "keyref
                          CDATA
                                    #IMPLIED
               %univ-atts;"
>
<!ELEMENT  dt %dt.content;>
<!ATTLIST  dt %dt.attributes;>


<!--                    LONG NAME: Definition Description          -->
<!ENTITY % dd.content
                       "(%defn.cnt;)*"
>
<!ENTITY % dd.attributes
              "%univ-atts;"
>
<!ELEMENT  dd %dd.content;>
<!ATTLIST  dd %dd.attributes;>

<!--                    LONG NAME: Example                         -->
<!ENTITY % example.content
                       "(%example.cnt;)*"
>
<!ENTITY % example.attributes
              "%univ-atts;"
>
<!ELEMENT  example %example.content;>
<!ATTLIST  example %example.attributes;>

<!--                    LONG NAME: Figure                          -->
<!ENTITY % fig.content
                       "((%title;)?,
                         (%desc;)?,
                         (%figgroup; |
                          %fig.cnt;)*)"
>
<!ENTITY % fig.attributes
              "%display-atts;
               %univ-atts;"
>
<!ELEMENT  fig %fig.content;>
<!ATTLIST  fig %fig.attributes;>


<!--                    LONG NAME: Figure Group                    -->
<!ENTITY % figgroup.content
                       "((%title;)?,
                         (%figgroup; |
                          %figgroup.cnt;)*)"
>
<!ENTITY % figgroup.attributes
              "%univ-atts;"
>
<!ELEMENT  figgroup %figgroup.content;>
<!ATTLIST  figgroup %figgroup.attributes;>


<!--                    LONG NAME: Preformatted Text               -->
<!ENTITY % pre.content
                       "(%pre.cnt;)*"
>
<!ENTITY % pre.attributes
              "%display-atts;
               xml:space
                          (preserve)
                                    #FIXED 
                                    'preserve'
               %univ-atts;"
>
<!ELEMENT  pre %pre.content;>
<!ATTLIST  pre %pre.attributes;>


<!--                    LONG NAME: Line Respecting Text            -->
<!ENTITY % lines.content
                       "(%pre.cnt;)*"
>
<!ENTITY % lines.attributes
              "%display-atts;
               xml:space
                          (preserve)
                                    #FIXED 
                                    'preserve'
               %univ-atts;"
>
<!ELEMENT  lines %lines.content;>
<!ATTLIST  lines %lines.attributes;>


<!--                    LONG NAME: Division                        -->
<!ENTITY % div.content
                       "(%div.cnt;)*"
>
<!ENTITY % div.attributes
              "%univ-atts;"
>
<!ELEMENT  div %div.content;>
<!ATTLIST  div %div.attributes;>


<!--                    LONG NAME: Text                            -->
<!ENTITY % text.content
                       "(#PCDATA |
                         %text;)*"
>
<!ENTITY % text.attributes
              "%univ-atts;"
>
<!ELEMENT  text %text.content;>
<!ATTLIST  text %text.attributes;>


<!--                    LONG NAME: Keyword                         -->
<!ENTITY % keyword.content
                       "(#PCDATA |
                         %draft-comment; |
                         %required-cleanup; |
                         %text; |
                         %tm;)*"
>
<!ENTITY % keyword.attributes
              "keyref
                          CDATA
                                    #IMPLIED
               %univ-atts;"
>
<!ELEMENT  keyword %keyword.content;>
<!ATTLIST  keyword %keyword.attributes;>


<!--                    LONG NAME: Term                            -->
<!ENTITY % term.content
                       "(#PCDATA |
                         %draft-comment; |
                         %required-cleanup; |
                         %text; |
                         %tm;)*"
>
<!ENTITY % term.attributes
              "keyref
                          CDATA
                                    #IMPLIED
               %univ-atts;"
>
<!ELEMENT  term %term.content;>
<!ATTLIST  term %term.attributes;>


<!--                    LONG NAME: Phrase                          -->
<!ENTITY % ph.content
                       "(%ph.cnt;)*"
>
<!ENTITY % ph.attributes
              "keyref
                          CDATA
                                    #IMPLIED
               %univ-atts;"
>
<!ELEMENT  ph %ph.content;>
<!ATTLIST  ph %ph.attributes;>


<!--                    LONG NAME: Trade Mark                      -->
<!ENTITY % tm.content
                       "(#PCDATA |
                         %text; |
                         %tm;)*"
>
<!ENTITY % tm.attributes
              "trademark
                          CDATA
                                    #IMPLIED
               tmowner
                          CDATA
                                    #IMPLIED
               tmtype
                                                     (reg |
                           service |
                           tm |
                           -dita-use-conref-target)
                                    #REQUIRED
               tmclass
                          CDATA
                                    #IMPLIED
               %univ-atts;"
>
<!ELEMENT  tm %tm.content;>
<!ATTLIST  tm %tm.attributes;>

<!--                    LONG NAME: State                           -->
<!ENTITY % state.content
                       "EMPTY"
>
<!ENTITY % state.attributes
              "name
                          CDATA
                                    #REQUIRED
               value
                          CDATA
                                    #REQUIRED
               %univ-atts;"
>
<!ELEMENT  state %state.content;>
<!ATTLIST  state %state.attributes;>


<!--                    LONG NAME: Image Data                      -->
<!ENTITY % image.content
                       "((%alt;)?,
                         (%longdescref;)?)"
>
<!ENTITY % image.attributes
              "href
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
               format
                          CDATA
                                    #IMPLIED
               %univ-atts;"
>
<!ELEMENT  image %image.content;>
<!ATTLIST  image %image.attributes;>

<!--                    LONG NAME: Inclusion                  -->
<!ENTITY % include.content
                       "((%data.elements.incl;)*,
                         (%fallback;)?,
                         (%foreign.unknown.incl;)*)"
>
<!ENTITY % include.attributes
              "href
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
               format
                          CDATA
                                    #IMPLIED
               parse
                          CDATA
                                    #IMPLIED
               encoding
                          CDATA
                                    #IMPLIED
               %univ-atts;"
>
<!ELEMENT  include %include.content;>
<!ATTLIST  include %include.attributes;>

<!--                    LONG NAME: Alternate text                  -->
<!ENTITY % alt.content
                       "(%words.cnt; |
                         %draft-comment; |
                         %required-cleanup; |
                         %ph;)*"
>
<!ENTITY % alt.attributes
              "%univ-atts;"
>
<!ELEMENT  alt %alt.content;>
<!ATTLIST  alt %alt.attributes;>


<!--                    LONG NAME: Long description reference      -->
<!ENTITY % longdescref.content
                       "EMPTY"
>
<!ENTITY % longdescref.attributes
              "href
                          CDATA
                                    #IMPLIED
               keyref
                          CDATA
                                    #IMPLIED
               type
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
               %univ-atts;"
>
<!ELEMENT  longdescref %longdescref.content;>
<!ATTLIST  longdescref %longdescref.attributes;>


<!--                    LONG NAME: Object (Streaming/Executable Data) -->
<!ENTITY % object.content
                       "((%desc;)?,
                         (%longdescref;)?,
                         (%fallback;)?,
                         (%param;)*,
                         (%foreign.unknown.incl;)*)"
>
<!ENTITY % object.attributes
              "declare
                          (declare)
                                    #IMPLIED
               classid
                          CDATA
                                    #IMPLIED
               classidkeyref
                          CDATA
                                    #IMPLIED
               codebase
                          CDATA
                                    #IMPLIED
               codebasekeyref
                          CDATA
                                    #IMPLIED
               data
                          CDATA
                                    #IMPLIED
               datakeyref
                          CDATA
                                    #IMPLIED
               type
                          CDATA
                                    #IMPLIED
               codetype
                          CDATA
                                    #IMPLIED
               archive
                          CDATA
                                    #IMPLIED
               archivekeyrefs
                          CDATA
                                    #IMPLIED
               standby
                          CDATA
                                    #IMPLIED
               height
                          NMTOKEN
                                    #IMPLIED
               width
                          NMTOKEN
                                    #IMPLIED
               usemap
                          CDATA
                                    #IMPLIED
               name
                          CDATA
                                    #IMPLIED
               tabindex
                          NMTOKEN
                                    #IMPLIED
               longdescref
                          CDATA
                                    #IMPLIED
               %univ-atts;
               longdescre CDATA     #IMPLIED"
>
<!ELEMENT  object %object.content;>
<!ATTLIST  object %object.attributes;>

<!--                    LONG NAME: Fallback                       -->
<!ENTITY % fallback.content
                       "(#PCDATA |
                         %basic.block.notbfgobj; |
                         %basic.ph; |
                         %data.elements.incl; |
                         %draft-comment; |
                         %foreign.unknown.incl; |
                         %required-cleanup;)*"
>
<!ENTITY % fallback.attributes
              "%univ-atts;"
>
<!ELEMENT  fallback %fallback.content;>
<!ATTLIST  fallback %fallback.attributes;>

<!--                    LONG NAME: Parameter                       -->
<!ENTITY % param.content
                       "EMPTY"
>
<!ENTITY % param.attributes
              "%univ-atts;
               name
                          CDATA
                                    #REQUIRED
               value
                          CDATA
                                    #IMPLIED
               valuetype
                          (data |
                           object |
                           ref |
                           -dita-use-conref-target)
                                    #IMPLIED
               type
                          CDATA
                                    #IMPLIED
               keyref
                          CDATA
                                    #IMPLIED"
>
<!ELEMENT  param %param.content;>
<!ATTLIST  param %param.attributes;>

<!--                    LONG NAME: Simple Table                    -->
<!ENTITY % simpletable.content
                       "((%title;)?,
                         (%sthead;)?,
                         (%strow;)+)"
>
<!ENTITY % simpletable.attributes
              "relcolwidth
                          CDATA
                                    #IMPLIED
               keycol
                          NMTOKEN
                                    #IMPLIED
               %display-atts;
               %univ-atts;"
>
<!ELEMENT  simpletable %simpletable.content;>
<!ATTLIST  simpletable %simpletable.attributes;>


<!--                    LONG NAME: Simple Table Head               -->
<!ENTITY % sthead.content
                       "(%stentry;)+"
>
<!ENTITY % sthead.attributes
              "%univ-atts;"
>
<!ELEMENT  sthead %sthead.content;>
<!ATTLIST  sthead %sthead.attributes;>


<!--                    LONG NAME: Simple Table Row                -->
<!ENTITY % strow.content
                       "(%stentry;)*"
>
<!ENTITY % strow.attributes
              "%univ-atts;"
>
<!ELEMENT  strow %strow.content;>
<!ATTLIST  strow %strow.attributes;>


<!--                    LONG NAME: Simple Table Cell (entry)       -->
<!ENTITY % stentry.content
                       "(%tblcell.cnt;)*"
>
<!ENTITY % stentry.attributes
              "colspan
                          NMTOKEN
                                    #IMPLIED
               rowspan
                          NMTOKEN
                                    #IMPLIED                     
               scope
                          (row |
                           col |
                           rowgroup |
                           colgroup |
                           -dita-use-conref-target)
                                    #IMPLIED
               headers
                          NMTOKENS
                                    #IMPLIED
               %univ-atts;"
>
<!ELEMENT  stentry %stentry.content;>
<!ATTLIST  stentry %stentry.attributes;>


<!--                    LONG NAME: Review Comments Block           -->
<!ENTITY % draft-comment.content
                       "(#PCDATA |
                         %basic.phandblock; |
                         %data.elements.incl; |
                         %foreign.unknown.incl;)*"
>
<!ENTITY % draft-comment.attributes
              "author
                          CDATA
                                    #IMPLIED
               time
                          CDATA
                                    #IMPLIED
               disposition
                          CDATA
                                    #IMPLIED
               %univ-atts-translate-no;"
>
<!ELEMENT  draft-comment %draft-comment.content;>
<!ATTLIST  draft-comment %draft-comment.attributes;>


<!--                    LONG NAME: Required Cleanup Block          -->
<!ENTITY % required-cleanup.content
                       "ANY "
>
<!ENTITY % required-cleanup.attributes
              "remap
                          CDATA
                                    #IMPLIED
               %univ-atts-translate-no;"
>
<!ELEMENT  required-cleanup %required-cleanup.content;>
<!ATTLIST  required-cleanup %required-cleanup.attributes;>


<!--                    LONG NAME: Footnote                        -->
<!ENTITY % fn.content
                       "(%fn.cnt;)*"
>
<!ENTITY % fn.attributes
              "callout
                          CDATA
                                    #IMPLIED
               %univ-atts;"
>
<!ELEMENT  fn %fn.content;>
<!ATTLIST  fn %fn.attributes;>


<!--                    LONG NAME: Index Term                      -->
<!ENTITY % indexterm.content
                       "(%words.cnt; |
                         %ph; |
                         %indexterm; |
                         %index-see; |
                         %index-see-also;)*"
>
<!ENTITY % indexterm.attributes
              "keyref
                          CDATA
                                    #IMPLIED
               start
                          CDATA
                                    #IMPLIED
               end
                          CDATA
                                    #IMPLIED
               %univ-atts;"
>
<!ELEMENT  indexterm %indexterm.content;>
<!ATTLIST  indexterm %indexterm.attributes;>

<!--                    LONG NAME: Index See                       -->
<!ENTITY % index-see.content
                       "(%words.cnt; |
                         %ph; |
                         %indexterm;)*"
>
<!ENTITY % index-see.attributes
              "keyref
                          CDATA
                                    #IMPLIED
               %univ-atts;"
>
<!ELEMENT  index-see %index-see.content;>
<!ATTLIST  index-see %index-see.attributes;>


<!--                    LONG NAME: Index See Also                  -->
<!ENTITY % index-see-also.content
                       "(%words.cnt; |
                         %ph; |
                         %indexterm;)*"
>
<!ENTITY % index-see-also.attributes
              "keyref
                          CDATA
                                    #IMPLIED
               %univ-atts;"
>
<!ELEMENT  index-see-also %index-see-also.content;>
<!ATTLIST  index-see-also %index-see-also.attributes;>

<!--                    LONG NAME: Citation (bibliographic source) -->
<!ENTITY % cite.content
                       "(%xrefph.cnt;)*"
>
<!ENTITY % cite.attributes
              "keyref
                          CDATA
                                    #IMPLIED
               %univ-atts;"
>
<!ELEMENT  cite %cite.content;>
<!ATTLIST  cite %cite.attributes;>


<!--                    LONG NAME: Cross Reference/Link            -->
<!ENTITY % xref.content
                       "(%xreftext.cnt; |
                         %desc;)*"
>
<!ENTITY % xref.attributes
              "href
                          CDATA
                                    #IMPLIED
               keyref
                          CDATA
                                    #IMPLIED
               type
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
               %univ-atts;"
>
<!ELEMENT  xref %xref.content;>
<!ATTLIST  xref %xref.attributes;>


<!--                    LONG NAME: Audio                           -->
<!ENTITY % audio.content
                       "((%desc;)?,
                         (%longdescref;)?,
                         (%fallback;)?,
                         (%media-source;)*,
                         (%media-track;)*,
                         (%foreign.unknown.incl;)*)"
>
<!ENTITY % audio.attributes
              "autoplay
                          (true |
                           false |
                           -dita-use-conref-target)
                                    #IMPLIED
               controls
                          (true |
                           false |
                           -dita-use-conref-target)
                                    #IMPLIED
               loop
                          (true |
                           false |
                           -dita-use-conref-target)
                                    #IMPLIED
               muted
                          (true |
                           false |
                           -dita-use-conref-target)
                                    #IMPLIED
               href
                          CDATA
                                    #IMPLIED
               keyref
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
               tabindex
                          NMTOKEN
                                    #IMPLIED
               %univ-atts;"
>
<!ELEMENT  audio %audio.content;>
<!ATTLIST  audio %audio.attributes;>


<!--                    LONG NAME: Video                            -->
<!ENTITY % video.content
                       "((%desc;)?,
                         (%longdescref;)?,
                         (%fallback;)?,
                         (%media-source;)*,
                         (%media-track;)*,
                         (%foreign.unknown.incl;)*)"
>
<!ENTITY % video.attributes
              "autoplay
                          (true |
                           false |
                           -dita-use-conref-target)
                                    #IMPLIED
               controls
                          (true |
                           false |
                           -dita-use-conref-target)
                                    #IMPLIED
               loop
                          (true |
                           false |
                           -dita-use-conref-target)
                                    #IMPLIED
               muted
                          (true |
                           false |
                           -dita-use-conref-target)
                                    #IMPLIED
               poster
                          CDATA
                                    #IMPLIED
               posterkeyref                          
                          CDATA
                                    #IMPLIED
               href
                          CDATA
                                    #IMPLIED
               keyref
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
               height
                          NMTOKEN
                                    #IMPLIED
               width
                          NMTOKEN
                                    #IMPLIED
               tabindex
                          NMTOKEN
                                    #IMPLIED
               %univ-atts;"
>
<!ELEMENT  video %video.content;>
<!ATTLIST  video %video.attributes;>


<!--                    LONG NAME: Media source                -->
<!ENTITY % media-source.content
                       "EMPTY"
>
<!ENTITY % media-source.attributes
              "href
                          CDATA
                                    #IMPLIED
               keyref
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
               %univ-atts;"
>
<!ELEMENT  media-source %media-source.content;>
<!ATTLIST  media-source %media-source.attributes;>


<!--                    LONG NAME: Media track                -->
<!ENTITY % media-track.content
                       "(#PCDATA)"
>
<!ENTITY % media-track.attributes
              "href
                          CDATA
                                    #IMPLIED
               keyref
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
               kind       (subtitles |
                           captions |
                           descriptions |
                           chapters |
                           metadata |
                           -dita-use-conref-target)
                                    #IMPLIED
               srclang
                          CDATA
                                    #IMPLIED
               %univ-atts;"
>
<!ELEMENT  media-track %media-track.content;>
<!ATTLIST  media-track %media-track.attributes;>


<!ENTITY % tblDecl-def
  PUBLIC "-//OASIS//ELEMENTS DITA 2.0 Exchange Table Model//EN"
         "tblDecl.mod"
>%tblDecl-def;

<!-- ============================================================= -->
<!--             SPECIALIZATION ATTRIBUTE DECLARATIONS             -->
<!-- ============================================================= -->
  
<!ATTLIST  alt            class CDATA "- topic/alt "        >
<!ATTLIST  audio          class CDATA "- topic/audio "      >
<!ATTLIST  cite           class CDATA "- topic/cite "       >
<!ATTLIST  dd             class CDATA "- topic/dd "         >
<!ATTLIST  data           class CDATA "- topic/data "       >
<!ATTLIST  ddhd           class CDATA "- topic/ddhd "       >
<!ATTLIST  desc           class CDATA "- topic/desc "       >
<!ATTLIST  div            class CDATA "- topic/div "        >
<!ATTLIST  dl             class CDATA "- topic/dl "         >
<!ATTLIST  dlentry        class CDATA "- topic/dlentry "    >
<!ATTLIST  dlhead         class CDATA "- topic/dlhead "     >
<!ATTLIST  draft-comment  class CDATA "- topic/draft-comment ">
<!ATTLIST  dt             class CDATA "- topic/dt "         >
<!ATTLIST  dthd           class CDATA "- topic/dthd "       >
<!ATTLIST  example        class CDATA "- topic/example "    >
<!ATTLIST  fallback       class CDATA "- topic/fallback "   >
<!ATTLIST  fig            class CDATA "- topic/fig "        >
<!ATTLIST  figgroup       class CDATA "- topic/figgroup "   >
<!ATTLIST  fn             class CDATA "- topic/fn "         >
<!ATTLIST  foreign        class CDATA "- topic/foreign "    >
<!ATTLIST  image          class CDATA "- topic/image "      >
<!ATTLIST  include        class CDATA "- topic/include "    >
<!ATTLIST  index-see      class CDATA "- topic/index-see "  >
<!ATTLIST  index-see-also class CDATA "- topic/index-see-also ">
<!ATTLIST  indexterm      class CDATA "- topic/indexterm "  >
<!ATTLIST  index-base     class CDATA "- topic/index-base " >
<!ATTLIST  keyword        class CDATA "- topic/keyword "    >
<!ATTLIST  li             class CDATA "- topic/li "         >
<!ATTLIST  lines          class CDATA "- topic/lines "      >
<!ATTLIST  longdescref    class CDATA "- topic/longdescref ">
<!ATTLIST  lq             class CDATA "- topic/lq "         >
<!ATTLIST  media-source   class CDATA "- topic/media-source ">
<!ATTLIST  media-track    class CDATA "- topic/media-track ">
<!ATTLIST  note           class CDATA "- topic/note "       >
<!ATTLIST  object         class CDATA "- topic/object "     >
<!ATTLIST  ol             class CDATA "- topic/ol "         >
<!ATTLIST  p              class CDATA "- topic/p "          >
<!ATTLIST  param          class CDATA "- topic/param "      >
<!ATTLIST  ph             class CDATA "- topic/ph "         >
<!ATTLIST  pre            class CDATA "- topic/pre "        >
<!ATTLIST  q              class CDATA "- topic/q "          >
<!ATTLIST  required-cleanup   class CDATA "- topic/required-cleanup ">
<!ATTLIST  shortdesc      class CDATA "- topic/shortdesc "  >
<!ATTLIST  simpletable    class CDATA "- topic/simpletable ">
<!ATTLIST  sl             class CDATA "- topic/sl "         >
<!ATTLIST  sli            class CDATA "- topic/sli "        >
<!ATTLIST  state          class CDATA "- topic/state "      >
<!ATTLIST  stentry        class CDATA "- topic/stentry "    >
<!ATTLIST  sthead         class CDATA "- topic/sthead "     >
<!ATTLIST  strow          class CDATA "- topic/strow "      >
<!ATTLIST  term           class CDATA "- topic/term "       >
<!ATTLIST  text           class CDATA "- topic/text "       >
<!ATTLIST  title          class CDATA "- topic/title "      >
<!ATTLIST  titlealt       class CDATA "- topic/titlealt "   >
<!ATTLIST  tm             class CDATA "- topic/tm "         >
<!ATTLIST  ul             class CDATA "- topic/ul "         >
<!ATTLIST  unknown        class CDATA "- topic/unknown "    >
<!ATTLIST  video          class CDATA "- topic/video "      >
<!ATTLIST  xref           class CDATA "- topic/xref "       >

<!-- ================== End of DITA Common Elements ==================== -->
 
