<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gfc="http://www.isotc211.org/2005/gfc"
   xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gmx="http://www.isotc211.org/2005/gmx"
   xmlns:gsr="http://www.isotc211.org/2005/gsr" xmlns:gss="http://www.isotc211.org/2005/gss"
   xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:gml="http://www.opengis.net/gml/3.2"
   xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:fn="http://www.w3.org/2005/xpath-functions"
   xmlns:grp="http://www.altova.com/Mapforce/grouping"
   xmlns:mdb="	http://www.isotc211.org/schemas/2012/mdb"
   xmlns:ci="http://www.isotc211.org/schemas/2012/ci" exclude-result-prefixes="fn grp xs xsi xsl xd"
   xmlns="http://www.isotc211.org/2005/gfc">


   <xd:doc scope="stylesheet">
      <xd:desc>
         <xd:p>mrf2ISOParent/03B_gmd_parentIdentifier.xsl</xd:p>
         <xd:p>called by the mrf2ISOParent/MRF2ISOParent.xsl template</xd:p>
         <xd:p><xd:b>Created on:</xd:b> Jan 27, 2014</xd:p>
         <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
         <xd:ul>
            <xd:li>Template                Explanation                         </xd:li>
            <xd:li>parentIdentifier        Handles the gmd:parentIdentifier element</xd:li>
         </xd:ul>
         <xd:p>
            Initial   Date         Description
            MMC       1/8/2014     Modified to work on the MRF Format. 
            MMC       2/2/2015     Modified the if to work with version 2.0 
         </xd:p>
      </xd:desc>
   </xd:doc>

   <xsl:template name="parentIdentifier" match="/">
      
      <xsl:text>&#10;</xsl:text>
      <xsl:comment> This part represents a link to the Series Collection File </xsl:comment>
      <!--  <xsl:comment> in the parentIdentifier template </xsl:comment> -->


      <xsl:variable name="CollectString">Series Information for the </xsl:variable>
      <xsl:variable name="Title" select="/MRF/Identification_Information/Citation/Title"/>

      <!--  <xsl:comment>The title is: <xsl:value-of select="$Title"/> 
      </xsl:comment>-->
      <xsl:choose>
         <xsl:when test="contains($Title,'TIGER/Line')">
            <xsl:variable name="PreComma" select="substring-before($Title, ',')"/>
            <xsl:variable name="PostComma" select="substring-after($Title, ',')"/>
            <xsl:variable name="year" select="substring-before($PostComma,',')"/>
            <xsl:variable name="PostCommaB" select="substring-after($PostComma, ',')"/>

           <!-- <xsl:comment>The Value of PreComma is <xsl:value-of select="$PreComma"/>
            </xsl:comment>
            <xsl:comment>The Value of PostComma is <xsl:value-of select="$PostComma"/>
            </xsl:comment>

            <xsl:comment>The Value of PostCommaB <xsl:value-of select="$PostCommaB"/>
            </xsl:comment> -->

            <xsl:choose>
               <xsl:when test="contains($PostCommaB,'state')">
                  <xsl:variable name="postCommaC" select="substring-after($PostCommaB,',')"/>
                  <xsl:variable name="Theme" select="substring-after($postCommaC,',')"/>
                  <xsl:variable name="WholeTitle"
                     select="concat($PreComma,', ', $year,', ', $CollectString,' ',  $Theme)"/>


                  <!-- <xsl:comment>The Value of WholeTitle <xsl:value-of select="$WholeTitle"/>
                  </xsl:comment> -->

                  <xsl:element name="gmd:parentIdentifier">
                     <xsl:element name="gco:CharacterString">
                        <xsl:value-of select="$WholeTitle"/>
                     </xsl:element>
                  </xsl:element>
               </xsl:when>
               <xsl:when test="contains($PostCommaB,'county')">
                  <xsl:variable name="postCommaC" select="substring-after($PostCommaB,',')"/>
                  <xsl:variable name="postCommaD" select="substring-after($postCommaC,',')"/>
                  <xsl:variable name="Theme" select="substring-after($postCommaD,',')"/>
                  <xsl:variable name="WholeTitle"
                     select="concat($PreComma,', ', $year,', ', $CollectString,' ',  $Theme)"/>



                  <!-- <xsl:comment>The Value of WholeTitle <xsl:value-of select="$WholeTitle"/>
                  </xsl:comment> -->

                  <xsl:element name="gmd:parentIdentifier">
                     <xsl:element name="gco:CharacterString">
                        <xsl:value-of select="$WholeTitle"/>
                     </xsl:element>
                  </xsl:element>
               </xsl:when>
               <xsl:when test="contains($PostCommaB,'nation')">
                  <xsl:variable name="postCommaC" select="substring-after($PostCommaB,',')"/>
                  <xsl:variable name="postCommaD" select="substring-after($postCommaC,',')"/>
                  <xsl:variable name="Theme" select="substring-after($postCommaC,',')"/>
                  <xsl:variable name="WholeTitle"
                     select="concat($PreComma,', ', $year,', ', $CollectString,' ',  $Theme)"/>



                  <!-- <xsl:comment>The Value of WholeTitle <xsl:value-of select="$WholeTitle"/>
                  </xsl:comment> -->

                  <xsl:element name="gmd:parentIdentifier">
                     <xsl:element name="gco:CharacterString">
                        <xsl:value-of select="$WholeTitle"/>
                     </xsl:element>
                  </xsl:element>
               </xsl:when>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="contains($Title,'Maps')">
            <xsl:variable name="PreFor" select="substring-before($Title,'for')"/>

            <xsl:comment>The Value of PreFor is <xsl:value-of select="$PreFor"/></xsl:comment>


            <xsl:choose>
               <xsl:when test="contains($Title,'(')">
                  <xsl:variable name="par" select="substring-after($Title,'(')"/>
                  <xsl:variable name="WholeTitle" select="concat($CollectString,$PreFor, '(',$par)"/>
                  <xsl:element name="mdb:parentIdentifier">
                     <xsl:element name="gco:CharacterString">
                        <xsl:value-of select="$WholeTitle"/>
                     </xsl:element>
                  </xsl:element>
               </xsl:when>
            </xsl:choose>
         </xsl:when>

         <xsl:when test="contains($Title,'Cartographic Boundary File')">
            <xsl:variable name="yearCartTheme" select="substring-before($Title, 'for')"/>
            <xsl:variable name="postFor" select="substring-after($Title,'for')"/>
            <xsl:variable name="scale" select="substring-after($postFor,',')"/>
            <xsl:variable name="WholeTitle"
               select="concat($CollectString,$yearCartTheme,',',$scale)"/>

            <!-- <xsl:comment>yearCartTheme:<xsl:value-of select="$yearCartTheme"/></xsl:comment>
            <xsl:comment>postFor<xsl:value-of select="$postFor"/></xsl:comment> -->

            <xsl:element name="gmd:parentIdentifier">
               <xsl:element name="gco:CharacterString">
                  <xsl:value-of select="$WholeTitle"/>
               </xsl:element>
            </xsl:element>
         </xsl:when>


      </xsl:choose>



   </xsl:template>
</xsl:stylesheet>
