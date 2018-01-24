
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
         <xd:p>mrf2ISOParent/MD_MaintenanceFrequencyCode.xsl</xd:p>
         <xd:p>called by the mrf2ISOParent/11_gmd_identificationInfo.xsl template</xd:p>
         <xd:p>XSLT stylesheet that is called by the 11_gmd:identificationInfo.xsl and the  15_gmd:metadataMaintenance.xsl stylesheets. It transforms the element in the
            element into a value in the MD_MaintenanceFrequencyCode code list, which can be found on page 99 of the ISO standard. </xd:p>
         <xd:p><xd:b>Created on:</xd:b> Jan 27, 2014</xd:p>
         <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
         
         <xd:ul>
            <xd:li>Template                        Explanation                                          </xd:li>
            <xd:li>MD_MaintenanceFrequencyCode     Handles the gmd:maintenanceAndUpdateFrequency element</xd:li> 
           
         </xd:ul>
         <xd:p>
            Initial   Date              Description
            MMC       07122011          Insered the MD_MaintenanceFrequencyCodeMetMaint template. This template is similiar to the MD_MaintenanceFrequencyCode
                                         template, but does not have the gmd:resourceMaintenance and gmd:MD_MaintenanceInformation elements. This is due to
                                         the fact that the gmd:resourceMaintenance element is not in the gmd:resourceMaintenance section.  For the 
                                         gmd:MD_MaintenanceInformation element contains only the gmd:MD_MaintenanceFrequencyCode for the identificationInfo section
                                         but contains additional elements in the gmd:metadataMaintenance section. 
            MMC     12/04/2013          Ensured that all the calls to the ISO codelist have the correct URL
            MMC       1/8/2014          Modified to work on the MRF Format.
            MMC       2/2/2015          Modified the if to work with version 2.0 
         </xd:p>
      </xd:desc>
   </xd:doc>
   
<xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>

<xsl:template name="MD_MaintenanceFrequencyCode">
   <xsl:variable name="CodeListLoc">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_MaintenanceFrequencyCode</xsl:variable>
<xsl:variable name="MaintenanceFrequencyCode" select="/MRF/Identification_Information/Status/Maintenance_and_Update_Frequency"/>
<xsl:variable name="TigerChange">No changes or updates will be made to this version</xsl:variable>
<xsl:variable name="NonePlanned">None planned</xsl:variable>
<xsl:variable name="MaintenanceFrequencyCodeChange" select="contains($MaintenanceFrequencyCode,$TigerChange)"/>
<xsl:variable name="MaintenanceFrequencyCodeChangeB" select="contains($MaintenanceFrequencyCode,$NonePlanned)"/>
<!-- <xsl:comment> Calling MD_MaintenanceFrequencyCode </xsl:comment> -->
<xsl:choose>
<xsl:when test="$MaintenanceFrequencyCodeChange='true'">
<!--        <xsl:element name="gmd:resourceMaintenance"> -->
      <!--   <xsl:element name="gmd:MD_MaintenanceInformation"> -->
         <xsl:element name="gmd:maintenanceAndUpdateFrequency">
                <xsl:element name="gmd:MD_MaintenanceFrequencyCode">
                        <xsl:attribute name="codeList"><xsl:value-of select="$CodeListLoc"/></xsl:attribute>
                        <xsl:attribute name="codeListValue">notPlanned</xsl:attribute>
                        <xsl:attribute name="codeSpace">011</xsl:attribute>
                         notPlanned
                </xsl:element><!-- gmd:MD_MaintenanceFrequencyCode -->
         </xsl:element><!-- gmd:maintenanceAndUpdateFrequency -->
      <!--  </xsl:element> --><!-- gmd:MD_MaintenanceInformation -->
    <!--     </xsl:element>--> <!-- gmd:resourceMaintenance -->
</xsl:when>

<xsl:when test="$MaintenanceFrequencyCodeChangeB='true'">
      <!--  <xsl:element name="gmd:resourceMaintenance"> -->
      <!--  <xsl:element name="gmd:MD_MaintenanceInformation"> -->
         <xsl:element name="gmd:maintenanceAndUpdateFrequency"> 
                <xsl:element name="gmd:MD_MaintenanceFrequencyCode"> 
                        <xsl:attribute name="codeList"><xsl:value-of select="$CodeListLoc"/></xsl:attribute> 
                        <xsl:attribute name="codeListValue">notPlanned</xsl:attribute>
                        <xsl:attribute name="codeSpace">011</xsl:attribute>
                         notPlanned
                </xsl:element><!-- gmd:MD_MaintenanceFrequencyCode -->
         </xsl:element><!-- gmd:maintenanceAndUpdateFrequency -->
       <!--  </xsl:element> --><!-- gmd:MD_MaintenanceInformation -->
      <!--   </xsl:element> --> <!-- gmd:resourceMaintenance -->
</xsl:when>

<xsl:otherwise>
<xsl:element name="gmd:maintenanceAndUpdateFrequency">
<xsl:attribute name="gco:nilReason">unknown:<xsl:value-of select="$MaintenanceFrequencyCode"/> </xsl:attribute>
</xsl:element><!-- gmd:maintenanceAndUpdateFrequency -->
</xsl:otherwise>

</xsl:choose>
</xsl:template>
</xsl:stylesheet>

