<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--                    HEADER                                     --> 
<!-- ============================================================= --> 
<!--  MODULE:    DITA Media Domain                                 -->
<!--  VERSION:   2.0                                               -->  
<!--  DATE:      [[[Release date]]]                                        -->
<!--                                                               -->
<!-- ============================================================= -->
<!--                    PUBLIC DOCUMENT TYPE DEFINITION            -->
<!--                    TYPICAL INVOCATION                         -->
<!--                                                               -->
<!--  Refer to this file by the following public identifier or an  -->
<!--       appropriate system identifier                           -->
<!-- PUBLIC "-//OASIS//ELEMENTS DITA 2.0 Media Domain//EN"         -->
<!--       Delivered as file "mediaDomain.mod"                     -->
<!--                                                               -->
<!-- ============================================================= -->    
<!--                                                               -->
<!--                                                               -->
<!-- PURPOSE:    Declaring the elements and specialization         -->
<!--             attributes for the DITA Media Domain              -->
<!--                                                               -->
<!-- ============================================================= -->    
<!--                                                               --> 
<!--   (C) Copyright OASIS Open 2019                               -->
<!--                                                               -->
<!-- ============================================================= -->      


<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->

<!ENTITY % audio           "audio"                                   >
<!ENTITY % video           "video"                                   >
<!ENTITY % media-autoplay  "media-autoplay"                          >
<!ENTITY % media-controls  "media-controls"                          >
<!ENTITY % media-loop      "media-loop"                              >
<!ENTITY % media-muted     "media-muted"                             >
<!ENTITY % media-source    "media-source"                            >
<!ENTITY % media-track     "media-track"                             >
<!ENTITY % video-poster    "video-poster"                            >

<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!--                    LONG NAME: Audio object reference          -->
<!ENTITY % audio.content
                       "((%desc;)?,
                         (%longdescref;)?,
                         (%fallback;)?,
                         (%media-controls;)?,
                         (%media-autoplay;)?,
                         (%media-loop;)?,
                         (%media-muted;)?,
                         (%media-source;)*,
                         (%media-track;)*,
                         (%param;)*,
                         (%foreign.unknown.incl;)*)"
>
<!ENTITY % audio.attributes
              "data
                          CDATA
                                    #IMPLIED
               datakeyref
                          CDATA
                                    #IMPLIED
               type
                          CDATA
                                    #IMPLIED
               tabindex
                          NMTOKEN
                                    #IMPLIED
               %univ-atts;"
>
<!ELEMENT  audio %audio.content;>
<!ATTLIST  audio %audio.attributes;>

<!--                    LONG NAME: Video object reference          -->
<!ENTITY % video.content
                       "((%desc;)?,
                         (%longdescref;)?,
                         (%fallback;)?,
                         (%video-poster;)?,
                         (%media-controls;)?,
                         (%media-autoplay;)?,
                         (%media-loop;)?,
                         (%media-muted;)?,
                         (%media-source;)*,
                         (%media-track;)*,
                         (%param;)*,
                         (%foreign.unknown.incl;)*)"
>
<!ENTITY % video.attributes
              "data
                          CDATA
                                    #IMPLIED
               datakeyref
                          CDATA
                                    #IMPLIED
               type
                          CDATA
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

<!--                    LONG NAME: Media control configuration                -->
<!ENTITY % media-controls.content
                       "EMPTY"
>
<!ENTITY % media-controls.attributes
              "%univ-atts;
               name
                          CDATA
                                    'controls'
               value
                          (true |
                           false |
                           -dita-use-conref-target)
                                    'true'"
>
<!ELEMENT  media-controls %media-controls.content;>
<!ATTLIST  media-controls %media-controls.attributes;>

<!--                    LONG NAME: Media autoplay configuration                -->
<!ENTITY % media-autoplay.content
                       "EMPTY"
>
<!ENTITY % media-autoplay.attributes
              "%univ-atts;
               name
                          CDATA
                                    'controls'
               value
                          (true |
                           false |
                           -dita-use-conref-target)
                                    'true'"
>
<!ELEMENT  media-autoplay %media-autoplay.content;>
<!ATTLIST  media-autoplay %media-autoplay.attributes;>

<!--                    LONG NAME: Media autoplay configuration                -->
<!ENTITY % media-loop.content
                       "EMPTY"
>
<!ENTITY % media-loop.attributes
              "%univ-atts;
               name
                          CDATA
                                    'loop'
               value
                          (true |
                           false |
                           -dita-use-conref-target)
                                    'true'"
>
<!ELEMENT  media-loop %media-loop.content;>
<!ATTLIST  media-loop %media-loop.attributes;>

<!--                    LONG NAME: Media muted configuration                -->
<!ENTITY % media-muted.content
                       "EMPTY"
>
<!ENTITY % media-muted.attributes
              "%univ-atts;
               name
                          CDATA
                                    'muted'
               value
                          (true |
                           false |
                           -dita-use-conref-target)
                                    'true'"
>
<!ELEMENT  media-muted %media-muted.content;>
<!ATTLIST  media-muted %media-muted.attributes;>

<!--                    LONG NAME: Media source                -->
<!ENTITY % media-source.content
                       "EMPTY"
>
<!ENTITY % media-source.attributes
              "%univ-atts;
               name
                          CDATA
                                    'source'
               value
                          CDATA
                                    #IMPLIED
               valuetype
                          (ref)
                                    #FIXED
                                    'ref'
               type
                          CDATA
                                    #IMPLIED
               keyref
                          CDATA
                                    #IMPLIED"
>
<!ELEMENT  media-source %media-source.content;>
<!ATTLIST  media-source %media-source.attributes;>

<!--                    LONG NAME: Media track                -->
<!ENTITY % media-track.content
                       "EMPTY"
>
<!ENTITY % media-track.attributes
              "%univ-atts;
               name
                          CDATA
                                    'track'
               value
                          CDATA
                                    #IMPLIED
               valuetype
                          (ref)   
                                    #FIXED
                                    'ref'
               type
                          (subtitles |
                           captions |
                           descriptions |
                           chapters |
                           metadata |
                           -dita-use-conref-target)
                                    #IMPLIED
               keyref
                          CDATA
                                    #IMPLIED"
>
<!ELEMENT  media-track %media-track.content;>
<!ATTLIST  media-track %media-track.attributes;>

<!--                    LONG NAME: Video poster                -->
<!ENTITY % video-poster.content
                       "EMPTY"
>
<!ENTITY % video-poster.attributes
              "%univ-atts;
               name
                          CDATA
                                    'source'
               value
                          CDATA
                                    #IMPLIED
               valuetype
                          CDATA
                                    #FIXED
                                    'ref'
               type
                          CDATA
                                    #IMPLIED
               keyref
                          CDATA
                                    #IMPLIED"
>
<!ELEMENT  video-poster %video-poster.content;>
<!ATTLIST  video-poster %video-poster.attributes;>

<!-- ============================================================= -->
<!--             SPECIALIZATION ATTRIBUTE DECLARATIONS             -->
<!-- ============================================================= -->
  
<!ATTLIST  audio          class CDATA "+ topic/object media-d/audio ">
<!ATTLIST  video          class CDATA "+ topic/object media-d/video ">
<!ATTLIST  media-autoplay class CDATA "+ topic/param media-d/media-autoplay ">
<!ATTLIST  media-controls class CDATA "+ topic/param media-d/media-controls ">
<!ATTLIST  media-loop     class CDATA "+ topic/param media-d/media-loop ">
<!ATTLIST  media-muted    class CDATA "+ topic/param media-d/media-muted ">
<!ATTLIST  media-source   class CDATA "+ topic/param media-d/media-source ">
<!ATTLIST  media-track    class CDATA "+ topic/param media-d/media-track ">
<!ATTLIST  video-poster   class CDATA "+ topic/param media-d/video-poster ">

<!-- ================== End of DITA Media Domain ==================== -->
 