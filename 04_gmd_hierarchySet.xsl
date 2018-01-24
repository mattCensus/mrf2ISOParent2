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
         <xd:p>mrf2ISOParent/04_gmd_hierarchySet.xsl</xd:p>
         <xd:p>called by the mrf2ISOParent/MRF2ISOParent.xsl template</xd:p>
         <xd:p><xd:b>Created on:</xd:b> Jan 27, 2014</xd:p>
         <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
         <xd:ul>
            <xd:li>Template                Explanation                           </xd:li>
            <xd:li>hierarchySet            Handles the gmd:hierarchyLevel element</xd:li>
         </xd:ul>
         <xd:p>
            Initial   Date         Description
            
            MMC      12/04/2013   Removed the extra space in the codeListValue attribute. Ensured that all the calls to the ISO codelist have the correct URL  
            MMC       1/8/2014     Modified to work on the MRF Format. 
            MMC       2/2/2015     Modified the if to work with version 2.0 
         </xd:p>
      </xd:desc>
   </xd:doc>
   
<xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>



<xsl:template name="hierarchySet" match="/">


<xsl:element name="gmd:hierarchyLevel">

<xsl:element name="gmd:MD_ScopeCode">

<xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_ScopeCode</xsl:attribute>

   <xsl:attribute name="codeListValue">series</xsl:attribute>
   series
</xsl:element>
</xsl:element>

</xsl:template>
</xsl:stylesheet>

