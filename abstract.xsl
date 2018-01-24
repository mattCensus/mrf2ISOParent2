<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gfc="http://www.isotc211.org/2005/gfc"
    xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gmx="http://www.isotc211.org/2005/gmx"
    xmlns:gsr="http://www.isotc211.org/2005/gsr" xmlns:gss="http://www.isotc211.org/2005/gss"
    xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:gml="http://www.opengis.net/gml/3.2"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="xd">

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Jan 28, 2014</xd:p>
            <xd:p><xd:b>Author:</xd:b> mattpsc</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>

    <!-- -->

    <xsl:template name="abstract">
       
         <xsl:variable name="OrigAbstract" select="/MRF/Identification_Information/Description/Abstract"/>
        <xsl:variable name="newAbstract"  select="substring-after($OrigAbstract,' nation.')"/>
        <xsl:element name="gmd:abstract">
            <xsl:element name="gco:CharacterString"> <xsl:value-of select="$newAbstract"/> </xsl:element>
           
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
