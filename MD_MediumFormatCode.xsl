<?xml version="1.0" encoding="UTF-8" ?>

<!--
   Name:  MD_MediumFormatCode.xsl 
   Author:  Matthew J. McCready
   Date:  20110623
   Description:  XSLT stylesheet that transforms the value in the  /metadata/distinfo/stdorder/digform/digtopt/offoptn[1]/recfmt (recording format) FGDC element
into the correct MD_MediumFormatCode codeList value ,which can be found of page 99 of the ISO standard, for the gmd:MD_MediumFormatCode ISO element and the 
 codeListValue and codeSpace attributes. This stylesheet is called by the 13_gmd:distributionInfo.xsl style sheet.
  Modification History:
Initial   Date      Change Request ID   Description
MMC       1/10/2014                      Modified to work on the MRF Format
-->




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
                <xd:p>mrf2ISOParent/MD_MediumFormatCode.xsl</xd:p>
                <xd:p>called by the mrf2ISOParent/13_gmd_distributionInfo.xsl template</xd:p>
                <xd:p><xd:b>Created on:</xd:b> Jan 27, 2014</xd:p>
                <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
                <xd:ul>
                        <xd:li>Template                       Explanation                         </xd:li>
                        <xd:li>MD_MediumFormatCode            Handles the gmd:mediumFormat element</xd:li>
                        
                </xd:ul>
                <xd:p>
                        Initial   Date                           Description
                        MMC       12/12/13                      Inserted the gmd:fileDecompressionTechnique element. This is represented by File_Decompression_Technique
                                                                 in the MRF file.
                        MMC       1/8/2014                      Modified to work on the MRF Format
                        MMC       1/7/2015                      Modified the gmd:online element to have a choice structure to accomadate KML files. 
                        MMC          2/2/2015                   Modified the if to work with version 2.0 
                </xd:p>
        </xd:desc>
        </xd:doc>
        
<xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>
<!-- <xsl:variable name ="MetDate"   select= "//metadata/metainfo/metd"/> -->
<!-- <xsl:variable name="SDTSPntVot" select="//metadata/spdoinfo/ptvctinf/sdtsterm/sdtstype"/> -->



<xsl:template name="MD_MediumFormatCode">
<xsl:variable name="CodeListLoc">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_MediumFormatCode</xsl:variable>
<xsl:variable name="MediumFormatCode" select="/MRF/Distribution_Information/Standard_Order_Process/Digital_Form/Format_Name"/>
<xsl:choose>

<xsl:when test="$MediumFormatCode='cpio'">
	<xsl:element name="gmd:mediumFormat">
		<xsl:element name="gmd:MD_MediumFormatCode">
			<xsl:attribute name="codeList"><xsl:value-of select="$CodeListLoc"/></xsl:attribute>
			<xsl:attribute name="codeListValue">cpio</xsl:attribute>
			<xsl:attribute name="codeSpace">001 </xsl:attribute>
                         cpio
		</xsl:element><!-- gmd:MD_MediumFormatCode -->
	</xsl:element><!-- gmd:mediumFormat -->
</xsl:when>


<xsl:when test="$MediumFormatCode='tar'">
        <xsl:element name="gmd:mediumFormat">
                <xsl:element name="gmd:MD_MediumFormatCode">
                        <xsl:attribute name="codeList"><xsl:value-of select="$CodeListLoc"/></xsl:attribute>
                        <xsl:attribute name="codeListValue">tar</xsl:attribute>
                        <xsl:attribute name="codeSpace">002</xsl:attribute>
                         tar
                </xsl:element><!-- gmd:MD_MediumFormatCode -->
        </xsl:element><!-- gmd:mediumFormat -->
</xsl:when>

<xsl:when test="$MediumFormatCode='High Sierra'">
        <xsl:element name="gmd:mediumFormat">
                <xsl:element name="gmd:MD_MediumFormatCode">
                        <xsl:attribute name="codeList"><xsl:value-of select="$CodeListLoc"/></xsl:attribute>
                        <xsl:attribute name="codeListValue">highSierra</xsl:attribute>
                        <xsl:attribute name="codeSpace">003</xsl:attribute>
                         highSierra
                </xsl:element><!-- gmd:MD_MediumFormatCode -->
        </xsl:element><!-- gmd:mediumFormat -->
</xsl:when>

<xsl:when test="$MediumFormatCode='ISO 9660'">
        <xsl:element name="gmd:mediumFormat">
                <xsl:element name="gmd:MD_MediumFormatCode">
                        <xsl:attribute name="codeList"><xsl:value-of select="$CodeListLoc"/></xsl:attribute>
                        <xsl:attribute name="codeListValue">iso9660</xsl:attribute>
                        <xsl:attribute name="codeSpace">004</xsl:attribute>
                         iso9660
                </xsl:element><!-- gmd:MD_MediumFormatCode -->
        </xsl:element><!-- gmd:mediumFormat -->
</xsl:when>

<xsl:when test="$MediumFormatCode='ISO 9660 with Rock Ridge extensions'">
        <xsl:element name="gmd:mediumFormat">
                <xsl:element name="gmd:MD_MediumFormatCode">
                        <xsl:attribute name="codeList"><xsl:value-of select="$CodeListLoc"/></xsl:attribute>
                        <xsl:attribute name="codeListValue">iso9660RockRidge</xsl:attribute>
                        <xsl:attribute name="codeSpace">005</xsl:attribute>
                         iso9660RockRidge
                </xsl:element><!-- gmd:MD_MediumFormatCode -->
        </xsl:element><!-- gmd:mediumFormat -->
</xsl:when>

<xsl:when test="$MediumFormatCode='ISO 9660 with Apple HFS extensions'">
        <xsl:element name="gmd:mediumFormat">
                <xsl:element name="gmd:MD_MediumFormatCode">
                        <xsl:attribute name="codeList"><xsl:value-of select="$CodeListLoc"/></xsl:attribute>
                        <xsl:attribute name="codeListValue">iso9660AppleHFS</xsl:attribute>
                        <xsl:attribute name="codeSpace">006</xsl:attribute>
                         iso9660AppleHFS
                </xsl:element><!-- gmd:MD_MediumFormatCode -->
        </xsl:element><!-- gmd:mediumFormat -->
</xsl:when>

<xsl:when test="$MediumFormatCode='ISO 9660 MAC'">
        <xsl:element name="gmd:mediumFormat">
                <xsl:element name="gmd:MD_MediumFormatCode">
                        <xsl:attribute name="codeList"><xsl:value-of select="$CodeListLoc"/></xsl:attribute>
                        <xsl:attribute name="codeListValue">iso9660AppleHFS</xsl:attribute>
                        <xsl:attribute name="codeSpace">006</xsl:attribute>
                         iso9660AppleHFS
                </xsl:element><!-- gmd:MD_MediumFormatCode -->
        </xsl:element><!-- gmd:mediumFormat -->
</xsl:when>
</xsl:choose>
</xsl:template>
</xsl:stylesheet>
