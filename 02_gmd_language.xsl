<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gmd="http://www.isotc211.org/2005/gmd"
    xmlns:gmi="http://www.isotc211.org/2005/gmi" xmlns:gmx="http://www.isotc211.org/2005/gmx"
    xmlns:gsr="http://www.isotc211.org/2005/gsr" xmlns:gss="http://www.isotc211.org/2005/gss"
    xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:gml="http://www.opengis.net/gml/3.2"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:gfc="http://www.isotc211.org/2005/gfc" xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:grp="http://www.altova.com/Mapforce/grouping"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="fn grp vmf xs xsi xsl xd" xmlns="http://www.isotc211.org/2005/gmi">
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p>mrf2ISOParent/02_gmd_language.xsl</xd:p>
            <xd:p>called by the mrf2ISOParent/MRF2ISOParent.xsl template</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Jan 27, 2014</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:ul>
                <xd:li>Template                Explanation                     </xd:li>
                <xd:li>gmdLanguage             Handles the gmd:language element</xd:li>
            </xd:ul>
            <xd:p>
                Initial   Date         Description
                MMC       1/8/2014     Modified to work on the MRF Format. 
                MMC       2/2/2015     Modified the if to work with version 2.0 
            </xd:p>
        </xd:desc>
    </xd:doc>
    
    
    <xsl:template name="gmdLanguage">
        <xsl:choose>
            <xsl:when test="/MRF/Metadata_Reference_Information/Metadata_Language">
                <xsl:element name="gmd:language">
                    <xsl:element name="gco:CharacterString">
                        <xsl:value-of select="/MRF/Metadata_Reference_Information/Metadata_Language"
                        />
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="gmd:language">
                    <xsl:element name="gco:CharacterString">eng</xsl:element>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
