<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gfc="http://www.isotc211.org/2005/gfc"
    xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gmx="http://www.isotc211.org/2005/gmx"
    xmlns:gsr="http://www.isotc211.org/2005/gsr" xmlns:gss="http://www.isotc211.org/2005/gss"
    xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:gml="http://www.opengis.net/gml/3.2"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xd">


    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p>mrf2ISOParent/01_gmd_fileIdentifier.xsl</xd:p>
            <xd:p>called by the mrf2ISOParent/MRF2ISOParent.xsl template</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Jan 27, 2014</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:ul>
                <xd:li>Template                Explanation                                </xd:li>
                <xd:li>fileIdentifier          Handles the gmd:fileIdentifier element</xd:li>
            </xd:ul>
            <xd:p>
                Initial   Date         Description
                MMC       1/8/2014     Modified to work on the MRF Format. 
                MMC       2/2/2015     Modified the if to work with version 2.0 
            </xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:template name="fileIdentifier">
        <!--  <xsl:comment>This is the right Template!!!!!!!!!!!!</xsl:comment>-->
        <xsl:variable name="SeriesInfo">SeriesCollection_</xsl:variable>
        <xsl:variable name="fileName" select="/MRF/Metadata_Reference_Information/Metadata_File_Identifier"/>
        <xsl:variable name="fileType" select="substring-before($fileName,'_')"/>
        <xsl:variable name="postUnder1" select="substring-after($fileName,'_')"/>
        <xsl:variable name="year" select="substring-before($postUnder1,'_')"/>
        <xsl:variable name="postUnder2" select="substring-after($postUnder1,'_')"/>
        <xsl:variable name="postUnder3" select="substring-after($postUnder2,'_')"/>
        <xsl:variable name="theme" select="substring-before($postUnder3,'.xml')"/>
        
        <!-- <xsl:comment>fileName:<xsl:value-of select="$fileName"/></xsl:comment>
        <xsl:comment>fileType:<xsl:value-of select="$fileType"/></xsl:comment>
        <xsl:comment>postUnder1:<xsl:value-of select="$postUnder1"/></xsl:comment>
        <xsl:comment>year<xsl:value-of select="$year"/></xsl:comment>
        <xsl:comment>postUnder2:<xsl:value-of select="$postUnder2"/></xsl:comment>
        <xsl:comment>theme<xsl:value-of select="$theme"/></xsl:comment> -->
        
        <xsl:variable name="newFileName" select="concat($SeriesInfo,$fileType,'_',$year,'_',$theme,'.iso.xml')"/>
        
        <xsl:element name="gmd:fileIdentifier">
            <xsl:element name="gco:CharacterString"><xsl:value-of select="$newFileName"/></xsl:element>
        </xsl:element>
        
    </xsl:template>
</xsl:stylesheet>
