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
         <xd:p>mrf2ISOParent/07_gmd_metadataStandardName.xsl</xd:p>
         <xd:p>called by the mrf2ISOParent/MRF2ISOParent.xsl template</xd:p>
         <xd:p><xd:b>Created on:</xd:b> Jan 27, 2014</xd:p>
         <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
         <xd:ul>
            <xd:li>Template                                                      Explanation                                    </xd:li>
            <xd:li>StandardName                                                  Handles the gmd:metadataStandardVersion element</xd:li> 
         </xd:ul>
         <xd:p>
            Initial   Date         Description
            MMC       1/8/2014     Modified to work on the MRF Format. 
            MMC       2/2/2015     Modified the if to work with version 2.0 
         </xd:p>
      </xd:desc>
   </xd:doc>
<xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>



<xsl:template name="StandardName" match="/">
<xsl:element name="gmd:metadataStandardName">
<xsl:element name="gco:CharacterString">ISO 19115 Geographic Information - Metadata </xsl:element>
</xsl:element>



<xsl:element name="gmd:metadataStandardVersion">
<xsl:element name="gco:CharacterString">2009-02-15 </xsl:element>
</xsl:element>


</xsl:template>
</xsl:stylesheet>

