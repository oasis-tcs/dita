<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!-- Darwin Information Typing Architecture (DITA) Version 2.0     -->
<!-- [[[Draft level]]]                                           -->
<!-- [[[Release date]]]                                           -->
<!-- Copyright (c) OASIS Open 2018. All rights reserved.           -->
<!-- Source: [[[Source link]]]                                -->
<!--                                                               -->
<!-- ============================================================= -->
<!--  MODULE:    DITA BASE ELEMENT MODULE                          -->
<!--  VERSION:   2.0                                               -->
<!--  DATE:      [[[Release date]]]                                        -->
<!--  PURPOSE:   Defines the <dita> element for use in shells      -->
<!--                                                               -->
<!-- ============================================================= -->
<!-- ============================================================= -->
<!--                    PUBLIC DOCUMENT TYPE DEFINITION            -->
<!--                    TYPICAL INVOCATION                         -->
<!--                                                               -->
<!--  Refer to this file by the following public identifier or an  -->
<!--       appropriate system identifier                           -->
<!--                                                               -->
<!-- PUBLIC "-//OASIS//ELEMENT DITA 2.x Element//EN"               -->
<!-- The public ID above refers to the latest version of this DTD. -->
<!--      To refer to this specific version, use this value: -->
<!--                                                               -->
<!-- PUBLIC "-//OASIS//ELEMENT DITA 2.0 Element//EN"               -->
<!--                                                               -->
<!-- ============================================================= -->
<!--             (C) Copyright OASIS Open 2005, 2026.              -->
<!--             (C) Copyright IBM Corporation 2001, 2004.         -->
<!--             All Rights Reserved.                              -->
<!--                                                               -->
<!--  UPDATES:                                                     -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!--                DEFINE ELEMENT AND ATTRIBUTES                  -->
<!-- ============================================================= -->

<!-- The <dita> element cannot be specialized, so it does not      -->
<!-- a class attribute or a named entity for the element.          -->

<!ATTLIST dita
              specializations 
                        CDATA                            
                                  "&included-domains;"
              %arch-atts;
              %localization-atts;
>
<!ELEMENT dita          (%info-types;)+                              >

