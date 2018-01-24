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
                        <xd:p>mrf2ISOParent/06_gmd_dateStamp.xsl</xd:p>
                        <xd:p>called by the mrf2ISOParent/MRF2ISOParent.xsl template</xd:p>
                        <xd:p><xd:b>Created on:</xd:b> Jan 27, 2014</xd:p>
                        <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
                        <xd:ul>
                                <xd:li>Template                                                         Explanation                                   </xd:li>
                                <xd:li>dateStamp                                                        Handles the gmd:dateStamp element             </xd:li>
                                <xd:li>dateStampFormat                                                  formats the date for the gmd:dateStamp element</xd:li>
                                
                                
                        </xd:ul>
                        <xd:p>
                                Initial   Date         Description
                                
                                MMc       4/16/2012   Inserted code to account for missing dates by dtermining the length of the Metadata_Date element. If the length is less than zero, a date element with a
                                                        gco:nilReason element is inserted  
                                MMC       1/8/2014     Modified to work on the MRF Format. 
                                MMC       2/2/2015     Modified the if to work with version 2.0 
                        </xd:p>
                </xd:desc>
        </xd:doc>
<xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>



<xsl:template name="dateStamp" match="/">

<xsl:if test="/MRF/Metadata_Reference_Information[1]/Metadata_Date[1]" >
<xsl:variable name="dateStampLength" select="string-length(/MRF/Metadata_Reference_Information[1]/Metadata_Date[1])" />  
<!--  <xsl:if test="metadata/metainfo/metd"> -->

<xsl:choose>
<xsl:when test="$dateStampLength >0">
<xsl:element name="gmd:dateStamp">
<xsl:call-template name ="dateStampFormat"/>
</xsl:element>
</xsl:when>

<xsl:otherwise>
<xsl:element name="gmd:dateStamp">
<!--  <xsl:element name="gco:Date"> -->
<xsl:attribute name="gco:nilReason">missing </xsl:attribute>
<!-- </xsl:element> -->
</xsl:element>
</xsl:otherwise>
<!-- </xsl:if> -->
</xsl:choose>


</xsl:if>

</xsl:template>

<xsl:template name="dateStampFormat">
<xsl:variable name ="MetDate" select= "/MRF/Metadata_Reference_Information[1]/Metadata_Date[1]"/>
<xsl:variable name="year"  select ="substring($MetDate,1,4)"/>
<xsl:variable name="month" select ="substring($MetDate,5,2)"/>
<xsl:variable name="monthLength" select="string-length($month)"/>
<xsl:variable name="day"   select ="substring($MetDate,7,2)"/>
<xsl:variable name="dayLength" select="string-length($day)"/>

<xsl:choose>
<xsl:when test="$dayLength>0">

<xsl:variable name="dateFormat" select="concat($year, '-',$month,'-',$day)"/>
        <xsl:element name="gco:Date">
                <xsl:value-of select ="$dateFormat"/>
        </xsl:element>
</xsl:when>

<xsl:when test="$monthLength >0">
<xsl:variable name="dateFormat" select="concat($year, '-',$month)"/>
        <xsl:element name="gco:Date">
                <xsl:value-of select ="$dateFormat"/>
        </xsl:element>
</xsl:when>
<xsl:otherwise>
<xsl:variable name="dateFormat" select="$year"/>
        <xsl:element name="gco:Date">
                <xsl:value-of select ="$dateFormat"/>
        </xsl:element>

</xsl:otherwise>
</xsl:choose>

</xsl:template>
</xsl:stylesheet>

