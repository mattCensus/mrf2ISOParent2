<?xml version="1.1" encoding="UTF-8" ?>

<!--
   Name:NonISOKeywords.xsl   
   Author:  Matthew J. McCready
   Date:  20111012
   Description:  XSLT stylesheet that transforms the values stored in the Theme_Keyword and Place_Keyword MIF elements to the gmd:descriptiveKeywords element. This 
   stylesheet consists of three templates: NonISOKeywords, NonThemeISOKeywords and PlaceKeywords. The NonISOKeywords template is the template called by the
   11_gmd:identificationInfo.xsl stylesheet. This template consists of two other templates: NonThemeISOKeywords and PlaceKeywords. The NonThemeISOKeywords template
   takes all the values in the MIF/Theme_Keyword element that are not ISO Topic Category Keywords and transforms them into the 
   gmd:descriptiveKeywords/gmd:MD_Keywords/gmd:keyword/gco:CharacterString ISO element. It also provides the correct value of 'theme' for the MD_KeywordTypeCode
   codelist. The PlaceKeywords template takes all the values in the MIF/Place_Keyword  element and transforms it into the
   gmd:descriptiveKeywords/gmd:MD_Keywords/gmd:keyword/gco:CharacterString ISO element. It also provides the correct value of 'place' for the MD_KeywordTypeCode codelist
   Modification History:
      Initial   Date      Change Request ID   Description
      MMC        4/23/2013                    Changed the formatting on the gmd:keyword/gco:characterstring element so that the entire element appear on one line.
      MMC        1/8/2014                     Modified to work on the MRF Format 
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gco="http://www.isotc211.org/2005/gco">
 <xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>
 <xsl:variable name="MetDate" select="//metadata/metainfo/metd"/>

 <xsl:template name="NonISOKeywords">
  <xsl:call-template name="NonThemeISOKeywords"/>
  <xsl:call-template name="PlaceKeywords"/>
 </xsl:template>

 <xsl:template name="NonThemeISOKeywords">

  <xsl:variable name="CodeListLoc"
   >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_KeywordTypeCode</xsl:variable>
  <xsl:variable name="NonISOKeywordsTheme"
   select="/MRF/Identification_Information/Keywords/Theme/Theme_Keyword_Thesaurus"/>



  <xsl:for-each select="/MRF/Identification_Information/Keywords/Theme">


   <xsl:variable name="NonISOKeywordsThemeA" select="./Theme_Keyword_Thesaurus"/>





   <xsl:element name="gmd:descriptiveKeywords">
    <xsl:element name="gmd:MD_Keywords">

     <xsl:comment>before the keyword</xsl:comment>
     <xsl:for-each select="./Theme_Keyword">
      <xsl:element name="gmd:keyword">
       <xsl:element name="gco:CharacterString ">
        <xsl:value-of select="."/>
       </xsl:element>
      </xsl:element>
     </xsl:for-each>

     <xsl:element name="gmd:type">
      <xsl:element name="gmd:MD_KeywordTypeCode">
       <xsl:attribute name="codeList"
        >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_KeywordTypeCode</xsl:attribute>
       <xsl:attribute name="codeListValue">theme</xsl:attribute>
       <xsl:attribute name="codeSpace">005</xsl:attribute> theme </xsl:element>
     </xsl:element>


     <xsl:element name="gmd:thesaurusName">
      <xsl:element name="gmd:CI_Citation">

       <xsl:element name="gmd:title">
        <xsl:element name="gco:CharacterString">
         <xsl:value-of select="$NonISOKeywordsThemeA"/>
        </xsl:element>
       </xsl:element>

       <xsl:element name="gmd:date">
        <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
       </xsl:element>

      </xsl:element>
     </xsl:element>

    </xsl:element>
   </xsl:element>

  </xsl:for-each>

 </xsl:template>












 <xsl:template name="PlaceKeywords">

 <!-- <xsl:comment> In the Place Keywords Template </xsl:comment> -->

  <xsl:for-each select="/MRF/Identification_Information/Keywords/Place">
   <xsl:element name="gmd:descriptiveKeywords">
    <xsl:element name="gmd:MD_Keywords">

     <xsl:for-each select="/MRF/Identification_Information/Keywords/Place/Place_Keyword">

      <xsl:element name="gmd:keyword">
       <xsl:element name="gco:CharacterString">
        <xsl:value-of select="."/>
       </xsl:element>

      </xsl:element>
     </xsl:for-each>


     <xsl:element name="gmd:type">
      <xsl:element name="gmd:MD_KeywordTypeCode">
       <xsl:attribute name="codeList"
        >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_KeywordTypeCode</xsl:attribute>
       <xsl:attribute name="codeListValue">place</xsl:attribute>
       <xsl:attribute name="codeSpace">002</xsl:attribute> place </xsl:element>
      <!-- gmd:MD_KeywordTypeCode -->
     </xsl:element>
     <!-- gmd:type -->
     <xsl:element name="gmd:thesaurusName">
      <xsl:element name="gmd:CI_Citation">
       <xsl:element name="gmd:title">
        <!-- <xsl:element name="gco:CharacterString"> -->

        <xsl:element name="gco:CharacterString">
         <xsl:value-of select="."/>
         <xsl:variable name="PlaceThesGID"
          select="/MRF/Identification_Information/Keywords/Place/Place_Keyword_Thesaurus"/>
         <xsl:text> 
</xsl:text>

         <xsl:text> 
</xsl:text>
        </xsl:element>
        <!-- gco:CharacterString -->

       </xsl:element>
       <!-- gmd:title -->
       <xsl:element name="gmd:date">
        <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
       </xsl:element>
       <!-- gmd:date -->
      </xsl:element>
      <!-- gmd:CI_Citation -->
     </xsl:element>
     <!-- gmd:thesaurusName -->
    </xsl:element>
    <!-- gmd:descriptiveKeywords -->
   </xsl:element>
   <!-- gmd:MD_Keywords -->
  </xsl:for-each>

 </xsl:template>

</xsl:stylesheet>
