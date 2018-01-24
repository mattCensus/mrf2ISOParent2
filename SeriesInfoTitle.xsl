<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet  version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gfc="http://www.isotc211.org/2005/gfc"
    xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gmx="http://www.isotc211.org/2005/gmx"
    xmlns:gsr="http://www.isotc211.org/2005/gsr" xmlns:gss="http://www.isotc211.org/2005/gss"
    xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:gml="http://www.opengis.net/gml/3.2"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs xd">
    <xsl:import href="../mrf2ISOParent/NGDAAltTitle.xsl"/>
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p>mrf2ISOParent/SeriesInfoTitle.xsl</xd:p>
            <xd:p>called by the mrf2ISOParent/11_gmd_identificationInfo.xsl template</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Jan 27, 2014</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            
            <xd:ul>
                <xd:li>Template                        Explanation                                     </xd:li>
                <xd:li>SeriesInfoTitle                 formats the gmd:title elment for the parent file</xd:li> 
            </xd:ul>
            <xd:p>
                Initial   Date                           Description
                MMC       1/8/2014                       Modified to work on the MRF Format.
                MMC       2/2/2015                       Modified the if to work with version 2.0 
                MMC       5/4/2015                       Modified the title to accomadate IGER files. Inserted a choose structure to handle all the 
                                                          levels of Geography. Also modified it to handle Alternate Titles
            </xd:p>
        </xd:desc>
    </xd:doc>
    
     <xsl:strip-space elements="scale"/>
    <xsl:template name="SeriesInfoTitle" match="/">
        <xsl:variable name="SeriesInfo">Series Information File for the</xsl:variable>
        <xsl:element name="gmd:title">
            <xsl:element name="gco:CharacterString">
               <!--  <xsl:apply-templates select="/MRF/Identification_Information/Citation/Title"/>--> 
                <xsl:variable name="mrfTitle" select="/MRF/Identification_Information/Citation/Title"/>
                <xsl:choose>
                    <xsl:when test="contains($mrfTitle,'Cartographic')">
                       
                        <xsl:variable name="preFor" select="substring-before($mrfTitle,'for')"/>
                        <xsl:variable name="type" select="substring-before($preFor,',')"/>
                        <xsl:variable name="theme" select="substring-after($preFor,',')"/>
                        
                        <xsl:variable name="postFor" select="substring-after($mrfTitle,' for')"/>
                        <xsl:variable name="scale" select="substring-after($postFor,',')"/>
                        <xsl:variable name="scaleB" select="substring-after($scale,' ')"></xsl:variable>
                        
                       
                        <xsl:variable name="fullTitle" select="concat($SeriesInfo, ' ', $type,', ',$theme,', ',$scaleB)"/>
                  <!--        <xsl:comment> dealing with cartographic files!!!!!!!!!!!!!!!!!!!!!!</xsl:comment>
                        <xsl:text>&#10;</xsl:text>
                        <xsl:comment>prefor:<xsl:value-of select="$preFor"/></xsl:comment>
                        <xsl:text>&#10;</xsl:text>
                        <xsl:comment>type:<xsl:value-of select="$type"/></xsl:comment>
                        <xsl:text>&#10;</xsl:text>
                        <xsl:comment>theme: <xsl:value-of select="$theme"/></xsl:comment>
                        <xsl:text>&#10;</xsl:text> 
                        <xsl:comment>scale:<xsl:value-of select="$scale"/></xsl:comment>-->
                        
                        
                        <xsl:value-of select="$fullTitle"/>
                        
                        
                    </xsl:when>
                    <xsl:when test="contains($mrfTitle,'TIGER/Line')">
                        <xsl:variable name="type" select="substring-before($mrfTitle,',')"/>
                        <xsl:variable name="postComma1" select="substring-after($mrfTitle,',')"/>
                        <xsl:variable name="year" select="substring-before($postComma1,',')"/>
                        <xsl:variable name="postComma2" select="substring-after($postComma1,',')"/>
                        
                       <!--   <xsl:comment>postComma2<xsl:value-of select="$postComma1"/></xsl:comment>-->
                        
                        <xsl:choose>
                            <xsl:when test="contains($mrfTitle,'state')">
                                
                                <xsl:variable name="postComma3" select="substring-after($postComma2,',')"/>
                                <xsl:variable name="theme" select="substring-after($postComma3,',')"/>
                                <xsl:variable name="fullTitle" select="concat($SeriesInfo, ' ', $year, ' ', $type,', ',$theme)"/>
                                
                                <!--  <xsl:comment>In the state!!!!!!!!!!!</xsl:comment>
                                <xsl:comment> postComma3:<xsl:value-of select="$postComma3"/></xsl:comment>-->
                                <xsl:value-of select="$fullTitle"/>
                                <!--  <xsl:call-template name="AltTitle"/>-->
                            </xsl:when>
                            <xsl:when test="contains($mrfTitle,'nation')">
                                <xsl:variable name="postComma3" select="substring-after($postComma2,',')"/>
                                <xsl:variable name="theme" select="substring-after($postComma3,',')"/>
                                <xsl:variable name="fullTitle" select="concat($SeriesInfo, ' ', $year, ' ', $type,', ',$theme)"/>
                                
                                <!--  <xsl:comment>In the Nation!!!!!!!!!!!</xsl:comment>
                                    <xsl:comment> postComma3:<xsl:value-of select="$postComma3"/></xsl:comment>-->
                                <xsl:value-of select="$fullTitle"/>
                                <!--  <xsl:call-template name="AltTitle"/>-->
                            </xsl:when>
                            <xsl:when test="contains($mrfTitle,'county')">
                                <xsl:variable name="postComma3" select="substring-after($postComma2,',')"/>
                                <xsl:variable name="postComma4" select="substring-after($postComma3,',')"/>
                                <xsl:variable name="theme" select="substring-after($postComma4,',')"/>
                                <xsl:variable name="fullTitle" select="concat($SeriesInfo, ' ', $year, ' ', $type,', ',$theme)"/>
                                
                                <!--  <xsl:comment>In the Nation!!!!!!!!!!!</xsl:comment>
                                    <xsl:comment> postComma3:<xsl:value-of select="$postComma3"/></xsl:comment>-->
                                <xsl:value-of select="$fullTitle"/>
                                <!--  <xsl:call-template name="AltTitle"/>-->
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:comment>Can Not determine the level of geography!!!!!!</xsl:comment>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                </xsl:choose>
            </xsl:element>
        </xsl:element>
        
        <xsl:if test="/MRF/Identification_Information[1]/Citation[1]/Alternate_Title[1]">
            <xsl:element name="gmd:alternateTitle">
                <xsl:element name="gco:CharacterString"><xsl:value-of select="/MRF/Identification_Information/Citation/Alternate_Title"/></xsl:element>
            </xsl:element>
        </xsl:if>
        
        <xsl:call-template name="AltTitle"/>
    </xsl:template>
</xsl:stylesheet>