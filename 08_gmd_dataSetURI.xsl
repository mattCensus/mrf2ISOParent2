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
         <xd:p>mrf2ISOParent/08_gmd_dataSetURI.xsl</xd:p>
         <xd:p>called by the mrf2ISOParent/MRF2ISOParent.xsl template</xd:p>
         <xd:p><xd:b>Created on:</xd:b> Jan 27, 2014</xd:p>
         <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
         <xd:ul>
            <xd:li>Template                            Explanation                       </xd:li>
            <xd:li>dataSetURI                          Handles the gmd:dataSetURI element</xd:li> 
         </xd:ul>
         <xd:p>
            Initial   Date         Description
            MMC       12/11/2013                    Modified so that if no zip file is supplied and/or no theme is supplied in the /MRF/Identification_Information/Citation/Online_Linkage MIF element, a new URL is
                                                    created that has both the correct theme and the correct zip file name. This file has also been modified so that TIGER\Line files ('tl') can be handled. 
            MMC       2/2/2015     Modified the if to work with version 2.0 
         </xd:p>
      </xd:desc>
   </xd:doc>


   <xsl:template name="dataSetURI" match="/">
   <!--   <xsl:text>&#10;</xsl:text>
       <xsl:comment>in the dataSetURI template</xsl:comment> -->
      <xsl:element name="gmd:dataSetURI">
         <xsl:element name="gco:CharacterString">
            <xsl:variable name="mifUrl"
               select="/MRF/Identification_Information/Citation/Online_Linkage"/>
            <xsl:variable name="hasZIP" select="contains($mifUrl,'.zip')"/>

            <xsl:choose>
               <xsl:when test="$hasZIP='true'">
                <!--    <xsl:text>&#10;</xsl:text>
                 <xsl:comment> in the zip section!!!!!!!!!!</xsl:comment> -->
                  <xsl:for-each select="/MRF/Identification_Information/Citation/Online_Linkage">
                    <xsl:variable name="Onlink" select="."/>
                     <xsl:choose>
                        <xsl:when test="contains($Onlink,'tl')">
                          <xsl:variable name="newURL1" select="substring-before($Onlink,'/tl')"/>
                           <xsl:value-of select="$newURL1"/>
                        </xsl:when>
                        <xsl:when test="contains($Onlink,'cb')">
                        <!-- <xsl:text>&#10;</xsl:text>
                           <xsl:comment>dealing with cartographic files!!!!!!!!!!!!!!</xsl:comment>
                           <xsl:text>&#10;</xsl:text> -->   
                           <xsl:variable name="newURL1" select="substring-before($Onlink,'/cb')"/>
                           <xsl:value-of select="$newURL1"/>
                        </xsl:when>
                     </xsl:choose>
                     
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:comment>In the first otherwise section!!!!!!!!!!!!</xsl:comment>
                  <xsl:variable name="FileId" select="/MIF/Metadata_File_Identifier[1]"/>

                  <xsl:variable name="type" select="substring($FileId,0,2)"/>
                  <xsl:variable name="hasUS" select="contains($FileId,'us')"/>
                  <xsl:variable name="postYear1" select="substring($FileId,9)"/>
                  <xsl:variable name="postYear2" select="substring-after($postYear1,'_')"/>
                  <xsl:choose>
                     <xsl:when test="$type='tl' or $hasUS='true'">

                         
                        <xsl:variable name="postYear3" select="substring-before($postYear2,'_')"/>
                        <xsl:variable name="theme" select="substring-before($postYear2,'_')"/>
                        <xsl:variable name="slashTheme" select="concat('/',$theme)"/>
                        <xsl:comment>postYear1:<xsl:value-of select="$postYear1"/></xsl:comment>
                        <xsl:comment> postYear2:<xsl:value-of select="$postYear2"/> </xsl:comment>
                        <xsl:comment>theme:<xsl:value-of select="$theme"/></xsl:comment>
                        <xsl:comment>slashTheme<xsl:value-of select="$slashTheme"/></xsl:comment>
                        <xsl:variable name="hasTheme" select="contains($mifUrl,$slashTheme)"/>

                        <xsl:choose>
                           <xsl:when test="$type='tl'">
                              <xsl:variable name="zipFileId" select="string-length($FileId)-7"/>
                              <xsl:variable name="partFileId"
                                 select="substring($FileId,0,$zipFileId)"/>
                              <xsl:variable name="newZipFieId" select="concat($partFileId,'.zip')"/>
                              <!--  <xsl:comment>hastheme<xsl:value-of select="$hasTheme"/></xsl:comment> -->
                              <xsl:choose>
                                 <xsl:when test="$hasTheme='true'">
                                    <xsl:variable name="fullURL"
                                       select="concat($mifUrl,$newZipFieId)"/>
                                    <xsl:value-of select="$fullURL"/>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <!--   <xsl:comment>Right here!!!!!!!!!!!!!!!!!!!!!!</xsl:comment> -->
                                    <xsl:variable name="fullURL"
                                       select="concat($mifUrl,$theme,'/',$newZipFieId)"/>
                                    <xsl:value-of select="$fullURL"/>
                                 </xsl:otherwise>
                              </xsl:choose>
                           </xsl:when>
                           <xsl:when test="$type='cb'">
                              <xsl:comment>dealing with cartographic boundary files!!!!!!!!!!!!!</xsl:comment>
                           </xsl:when>
                           <xsl:otherwise>
                              <xsl:variable name="zipFileId" select="string-length($FileId)-3"/>
                              <xsl:variable name="partFileId"
                                 select="substring($FileId,0,$zipFileId)"/>
                              <xsl:variable name="newZipFieId" select="concat($partFileId,'.zip')"/>
                              <!--  <xsl:comment><xsl:value-of select="$newZipFieId"/></xsl:comment> -->
                              <!--  <xsl:comment>hastheme<xsl:value-of select="$hasTheme"/></xsl:comment> -->
                              <xsl:choose>
                                 <xsl:when test="$hasTheme='true'">
                                    <xsl:variable name="fullURL"
                                       select="concat($mifUrl,$newZipFieId)"/>
                                    <xsl:value-of select="$fullURL"/>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <!--    <xsl:comment>Right here!!!!!!!!!!!!!!!!!!!!!!</xsl:comment> -->
                                    <xsl:variable name="fullURL"
                                       select="concat($mifUrl,$theme,'/',$newZipFieId)"/>
                                    <xsl:value-of select="$fullURL"/>
                                 </xsl:otherwise>
                              </xsl:choose>
                           </xsl:otherwise>
                        </xsl:choose>
                     </xsl:when>


                     <xsl:otherwise>
                        <xsl:comment>In the last otherwise</xsl:comment>
                        <xsl:variable name="zipFileId" select="string-length($FileId)-3"/>
                        <!-- was 7 -->
                        <xsl:variable name="partFileId" select="substring($FileId,0,$zipFileId)"/>
                        <xsl:variable name="newZipFieId" select="concat($partFileId,'.zip')"/>
                        <xsl:variable name="theme" select="substring-before($postYear2,'_')"/>
                        <xsl:variable name="slashTheme" select="concat('/',$theme)"/>
                        <xsl:variable name="hasTheme" select="contains($mifUrl,$slashTheme)"/>
                        <!-- <xsl:comment><xsl:value-of select="$newZipFieId"/></xsl:comment> -->
                        <xsl:choose>
                           <xsl:when test="$hasTheme='true'">

                              <xsl:variable name="fullURL"
                                 select="concat($mifUrl,$theme,$newZipFieId)"/>

                              <xsl:value-of select="$fullURL"/>
                           </xsl:when>
                           <xsl:otherwise>

                              <xsl:variable name="fullURL"
                                 select="concat($mifUrl,$theme,'/',$newZipFieId)"/>
                              <xsl:value-of select="$fullURL"/>
                           </xsl:otherwise>
                        </xsl:choose>

                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:element>
      </xsl:element>

   </xsl:template>
</xsl:stylesheet>
