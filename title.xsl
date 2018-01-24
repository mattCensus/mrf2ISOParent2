<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gfc="http://www.isotc211.org/2005/gfc"
    xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gmx="http://www.isotc211.org/2005/gmx"
    xmlns:gsr="http://www.isotc211.org/2005/gsr" xmlns:gss="http://www.isotc211.org/2005/gss"
    xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:gml="http://www.opengis.net/gml/3.2"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"   exclude-result-prefixes="xd" >
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Jan 28, 2014</xd:p>
            <xd:p><xd:b>Author:</xd:b> mattpsc</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:template name="title">
        <xsl:element name="gmd:title">
            <xsl:element name="gco:CharacterString">
                <xsl:variable name="seriesInfo"> Series Information File for the</xsl:variable>
                <xsl:variable name="oldTitle" select="/MRF/Identification_Information/Citation/Title"/>
                
                <xsl:choose>
                    <xsl:when test="contains($oldTitle,'TIGER/Line Shapefile')">
                        <xsl:variable name="type" select="substring-before($oldTitle,',')"/>
                        <xsl:variable name="postComma1" select="substring-after($oldTitle,',')"/>
                        <xsl:variable name="year" select="substring-before($postComma1,',')"/>
                        <xsl:variable name="postcomma2" select="substring-after($postComma1,',')"/>
                        <xsl:variable name="levelOfGeo" select="substring-before($postcomma2,',')"/>
                        
                        <xsl:choose>
                            <xsl:when test="contains($levelOfGeo,'state')">
                                <xsl:variable name="postComma3" select="substring-after($postcomma2,',')"/>
                                <xsl:variable name="theme" select="substring-after($postComma3,',')"/>
                                <xsl:variable name="newTitle" select="concat($type,',',$year,',',$seriesInfo,$theme)"/>
                                <xsl:value-of select="$newTitle"/>
                            </xsl:when>
                            <xsl:when test="contains($levelOfGeo,'nation')">
                                <xsl:variable name="postComma3" select="substring-after($postcomma2,',')"/>
                                <xsl:variable name="theme" select="substring-after($postComma3,',')"/>
                                <xsl:variable name="newTitle" select="concat($type,',',$year,',',$seriesInfo,$theme)"/>
                                <xsl:value-of select="$newTitle"/>
                            </xsl:when>
                            <xsl:when test="contains($levelOfGeo,'county')">
                                <xsl:variable name="postComma3" select="substring-after($postcomma2,',')"/>
                                <xsl:variable name="postComma4" select="substring-after($postComma3,',')"/>
                                <xsl:variable name="theme" select="substring-after($postComma4,',')"/>
                                <xsl:variable name="newTitle" select="concat($type,',',$year,',',$seriesInfo,$theme)"/>
                                <xsl:value-of select="$newTitle"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                </xsl:choose>
                
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>