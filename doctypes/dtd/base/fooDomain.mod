<!--  ======================================================
      Foo Domain
      ====================================================== -->

<!--                    LONG NAME: Foo Paragraph                       -->
<!ENTITY % foo.content
                       "(%para.cnt;)*"
>
<!ENTITY % foo.attributes
              "%univ-atts;"
>
<!ELEMENT  foo %foo.content;>
<!ATTLIST  foo %p.attributes;>

<!ATTLIST  foo          %global-atts;  class CDATA "+ topic/p foo/foo "          >
