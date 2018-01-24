<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gfc="http://www.isotc211.org/2005/gfc"
 xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gmx="http://www.isotc211.org/2005/gmx"
 xmlns:gsr="http://www.isotc211.org/2005/gsr" xmlns:gss="http://www.isotc211.org/2005/gss"
 xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:gml="http://www.opengis.net/gml/3.2"
 xmlns:xlink="http://www.w3.org/1999/xlink"   xmlns:xs="http://www.w3.org/2001/XMLSchema"
 xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:fn="http://www.w3.org/2005/xpath-functions"
 xmlns:grp="http://www.altova.com/Mapforce/grouping"
 xmlns:mdb="	http://www.isotc211.org/schemas/2012/mdb"
 xmlns:ci="http://www.isotc211.org/schemas/2012/ci" exclude-result-prefixes="fn grp xs xsi xsl xd"
 xmlns="http://www.isotc211.org/2005/gfc">

 <xsl:import href="../mrf2ISO/05_gmd_contact.xsl"/>
 
 <xd:doc scope="stylesheet">
  <xd:desc>
   <xd:p>mrf2ISOParent/15_metadataMaintenance.xsl</xd:p>
   <xd:p>called by the mrf2ISOParent/MRF2ISOParent.xsl template</xd:p>
   <xd:p> XSLT stylesheet that transforms a MIF file into the gmd:DQ_DataQuality section of an ISO file. This stylesheet is called by 
    the  MIF2iso19115-2_master.xslt stylesheet. This template calls on the dateTimeTemp template, located in this stylesheet, and the DataQualitySource template, 
    located in the DataQualitySource.xsl stylesheet. The DataQualitySource template handles all the gmd:lineage information.</xd:p>
   <xd:p><xd:b>Created on:</xd:b> Jan 27, 2014</xd:p>
   <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
   <xd:ul>
    <xd:li>Template                       Explanation                                                     </xd:li>
    <xd:li>metadataMaintenance            Handles the gmd:MD_MaintenanceInformation element              </xd:li>
    <xd:li>metaMaintContInfo              Handles the contact information for metadataMaintenence section</xd:li>
    <xd:li>defaultMetaMaintContact        Handles the contact information for metadataMaintenence section when no recognized branch is given(no uuid
                                           reads it directly from the metadata</xd:li>
    
   </xd:ul>
   <xd:p>
    Initial   Date                 Description
    MMC		    07/07/2011            Added the gmd:DQ_Scope, md:level and gmd:MD_ScopeCode elements to comply with the ISO standard.
    MMC      07/07/2011            Added the gmd:DQ_CompletenessCommission to one of the gmd:report elements
    MMC		    07/08/2011            Created the dateTimeTemp template to work with dates and times for the gmd:dateTime element. This 
                                    element has to be in the MMDDYYYYT00:00:00 format, even when oly a year is given in the 
                                    /metadata/dataqual/lineage/procstep/procdate FGDC element. To correctly format this ISO element, a default -01-01 for 
                                    the month is inserted and all 0, for the time when only a year is given in the FGDC XML. 
    MMC      07/08/2011            Inserted the CI_Date package under the gmd:source/CI_Citation section. Previously, the gco:date element was not in this package.
    MMC      07/13/2011            Modified the dateTimeTemp template to include the actual time for the gmd:dateTime ISO element and not the default 
                                    01T00:00:00 for transforming FGDC files that have the Process Time element. The correct ISO format was inserted for the                                                Process Date elements that do not include the month or day.
    MMC       11/1/2011            Changed the gco:Date element to the gco:DateTime element in the dateTimeTemp template to better adhere to the standard. 
    MMC       1/10/2014            Modified to work on the MRF Format     
    MMC        2/2/2015            Modified the if to work with version 2.0 
   </xd:p>
  </xd:desc>
 </xd:doc>
 
 <xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>



 <xsl:template name="metadataMaintenance" match="/">


  <xsl:element name="gmd:metadataMaintenance">

   <xsl:element name="gmd:MD_MaintenanceInformation">

    <!-- <xsl:element name="gmd:maintenanceAndUpdateFrequency"> -->

    <!-- <xsl:element name="gmd:MD_MaintenanceFrequencyCode"> -->
    <xsl:call-template name="MD_MaintenanceFrequencyCode"/>
    <!-- </xsl:element> -->
    <!--gmd:MD_MaintenanceFrequencyCode -->

    <!-- </xsl:element> -->
    <!-- gmd:maintenanceAndUpdateFrequency -->

    <xsl:element name="gmd:maintenanceNote">
     <xsl:element name="gco:CharacterString">This was transformed from the Census Metadata Repository (MRF) Format</xsl:element>
     <!--gco:CharacterString -->
     <!-- <xsl:text> </xsl:text>-->

    </xsl:element>
    <!-- gmd:maintenanceNote -->

    <xsl:call-template name="metaMaintContInfo"/>
   </xsl:element>
   <!-- gmd:MD_MaintenanceInformation -->
  </xsl:element>
  <!-- gmd:metadataMaintenance -->
 </xsl:template>

 <xsl:template name="metaMaintContInfo">

  <xsl:variable name="fullOrg" select="/MRF/Metadata_Reference_Information/Metadata_Contact/Contact_Organization"/>
  <xsl:variable name="postComma1" select="substring-after($fullOrg,',')"/>
  <xsl:variable name="division" select="substring-after($postComma1,',')"/>
  <xsl:variable name="hasSlash" select="contains($division,'/')"/>
  <xsl:variable name="hasCommas" select="contains($division,',')"/>

 <!-- <xsl:comment>fullOrg:<xsl:value-of select="$fullOrg"/></xsl:comment>
  <xsl:comment>postComma1:<xsl:value-of select="$postComma1"/></xsl:comment>
  <xsl:comment>division:<xsl:value-of select="$division"/></xsl:comment>
  <xsl:comment>hasSlash:<xsl:value-of select="$hasSlash"/></xsl:comment>
  <xsl:comment>hasCommas:<xsl:value-of select="$hasCommas"/></xsl:comment> -->

  <xsl:choose>
   <xsl:when test="$hasSlash='true'">
    <xsl:variable name="fullBranch" select="substring-after($division,'/')"/>
    <xsl:variable name="finalBrach" select="substring($fullBranch,1,3)"/>

    <xsl:choose>
     <xsl:when test="$finalBrach='Car'">
      <!-- <xsl:element name="gmd:contact"> -->
      <xsl:call-template name="CartographicProductsBranchCustodian"/>
     <!-- </xsl:element> -->
     </xsl:when>
     <xsl:when test="$finalBrach='Geo'">
      <xsl:call-template name="GeographicProductsBranchCustodian"/>
     </xsl:when>
     <xsl:otherwise>
      <xsl:call-template name="defaultMetaMaintContact"/>
     </xsl:otherwise>
    </xsl:choose>


    <!-- <xsl:comment>we have a slash!!!!!!!!!!</xsl:comment>
    <xsl:comment>fullBrach:<xsl:value-of select="$fullBranch"/></xsl:comment>
    <xsl:comment>finalBrach:<xsl:value-of select="$finalBrach"/></xsl:comment> -->

   </xsl:when>
   <xsl:when test="$hasCommas='true'">
    <xsl:variable name="fullBranch" select="substring-after($division,',')"/>
    <xsl:variable name="hasGeo" select="contains($fullBranch,'Geo')"/>
    <xsl:variable name="hasCarto" select="contains($fullBranch,'Carto')"/>
    <xsl:variable name="finalBrach" select="substring($fullBranch,1,3)"/>
    <xsl:variable name="hasNSGPB"  select="contains($fullBranch,'National')"/>

   <xsl:comment>fullBranch:<xsl:value-of select="$fullBranch"/></xsl:comment>
    <xsl:comment>finalBrach<xsl:value-of select="$finalBrach"/></xsl:comment>


    <xsl:choose>
     <xsl:when test="$finalBrach='Car'">
      <xsl:call-template name="CartographicProductsBranchCustodian"/>
     </xsl:when>
     <xsl:when test="$finalBrach='Geo'">
      <xsl:call-template name="GeographicProductsBranchCustodian"/>
     </xsl:when>
     <xsl:when test="$hasGeo">
      <xsl:call-template name="GeographicProductsBranchCustodian"/>
     </xsl:when>
     <xsl:when test="$hasNSGPB='true'">
      <xsl:call-template name="NSGPBPointOfContact"/>
     </xsl:when>
     <xsl:when test="contains($fullBranch,'Spatial')">
      <xsl:call-template name="GeographicProductsBranchCustodian"/>
     </xsl:when>
     <xsl:otherwise>
      <xsl:comment>in the default!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</xsl:comment>
      <xsl:call-template name="defaultMetaMaintContact"/>
     </xsl:otherwise>
    </xsl:choose>


   </xsl:when>
   <xsl:otherwise>
    <xsl:call-template name="defaultMetaMaintContact"/>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>

 <xsl:template name="defaultMetaMaintContact">
  <xsl:element name="gmd:contact">
   <xsl:element name="gmd:CI_ResponsibleParty">

    <xsl:element name="gmd:organisationName">
     <xsl:element name="gco:CharacterString">


      <xsl:value-of select="/MRF/Metadata_Reference_Information/Metadata_Contact/Contact_Organization"/>
     </xsl:element>
    </xsl:element>

    <xsl:element name="gmd:contactInfo">
     <xsl:element name="gmd:CI_Contact">
      <xsl:element name="gmd:phone">
       <xsl:element name="gmd:CI_Telephone">

        <xsl:element name="gmd:voice">
         <xsl:element name="gco:CharacterString">
          <xsl:value-of select="/MRF/Metadata_Reference_Information/Metadata_Contact/Contact_Voice_Telephone"/>
         </xsl:element>
        </xsl:element>

        <xsl:element name="gmd:facsimile">
         <xsl:element name="gco:CharacterString">
          <xsl:value-of select="/MRF/Metadata_Reference_Information/Metadata_Contact/Contact_Facsimile_Telephone"/>
         </xsl:element>
        </xsl:element>

       </xsl:element>
      </xsl:element>


      <xsl:element name="gmd:address">
       <xsl:element name="gmd:CI_Address">


        <xsl:element name="gmd:deliveryPoint">
         <xsl:element name="gco:CharacterString">
          <xsl:value-of select="/MRF/Metadata_Reference_Information/Metadata_Contact/Contact_Address/Address"/>
         </xsl:element>
        </xsl:element>

        <xsl:element name="gmd:city">
         <xsl:element name="gco:CharacterString">
          <xsl:value-of select="/MRF/Metadata_Reference_Information/Metadata_Contact/Contact_Address/City"/>
         </xsl:element>
        </xsl:element>

        <xsl:element name="gmd:administrativeArea">
         <xsl:element name="gco:CharacterString">
          <xsl:value-of select="/MRF/Metadata_Reference_Information/Metadata_Contact/Contact_Address/State_or_Province"/>
         </xsl:element>
        </xsl:element>

        <xsl:element name="gmd:postalCode">
         <xsl:element name="gco:CharacterString">
          <xsl:value-of select="/MRF/Metadata_Reference_Information/Metadata_Contact/Contact_Address/Postal_Code"/>
         </xsl:element>
        </xsl:element>

        <xsl:element name="gmd:country">
         <xsl:element name="gco:CharacterString">
          <xsl:value-of select="/MRF/Metadata_Reference_Information/Metadata_Contact/Contact_Address/Country"/>
         </xsl:element>
        </xsl:element>

        <xsl:element name="gmd:electronicMailAddress">
         <xsl:element name="gco:CharacterString">
          <xsl:value-of select="/MRF/Metadata_Reference_Information/Metadata_Contact/Contact_Electronic_Mail_Address"/>
         </xsl:element>
        </xsl:element>


       </xsl:element>
      </xsl:element>

     </xsl:element>
    </xsl:element>

    <xsl:element name="gmd:role">
     <xsl:element name="gmd:CI_RoleCode">
      <xsl:attribute name="codeList"
       >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_RoleCode</xsl:attribute>
      <xsl:attribute name="codeListValue">custodian</xsl:attribute>
      <xsl:attribute name="codeSpace">002</xsl:attribute> custodian </xsl:element>
    </xsl:element>


   </xsl:element>
  </xsl:element>



 </xsl:template>



</xsl:stylesheet>
