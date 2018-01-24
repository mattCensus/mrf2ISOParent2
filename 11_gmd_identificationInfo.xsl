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
   
   <xsl:import href="../mrf2ISOParent/NGDA_Themes.xsl"/> 
   <xsl:import href="../mrf2ISOParent/IdPointOfContact.xsl"/>
   <xsl:import href="../mrf2ISOParent/MD_SpatialRepresentationType.xsl"/>
   <xsl:import href="../mrf2ISOParent/03_gmd_characterSet.xsl"/>
   <xsl:import href="../mrf2ISOParent/MD_MaintenanceFrequencyCode.xsl"/>
   <xsl:import href="../mrf2ISOParent/ISOKeywords.xsl"/>
   <xsl:import href="../mrf2ISOParent/NonISOKeywords.xsl"/>
   <xsl:import href="../mrf2ISOParent/ExtraDataQualityTemplate.xsl"/>
   <xsl:import href="../mrf2ISOParent/SeriesInfoTitle.xsl"/>
   <xsl:import href="boundingCoordinates.xsl"/>
   <xsl:import href="../mrf2ISOParent/MD_browseGraphic.xsl"/>
   <xsl:import href="../mrf2ISOParent/NGDAAltTitle.xsl"/>
   
   <xd:doc scope="stylesheet">
      <xd:desc>
         <xd:p>mrf2ISOParent/11_gmd_identificationInfo.xsl</xd:p>
         <xd:p>called by the mrf2ISOParent/MRF2ISOParent.xsl template</xd:p>
         <xd:p>XSLT stylesheet that transforms the following MIF elements with a 'citation' attribute into their respective ISO elements. This style sheet calls
            on  eight templates located in other stylesheets: CI_PresentationFormCode, MD_ProgressCode, MD_MaintenanceFrequencyCode, NonISOKeywords, 
            MD_SpatialRepresentationTypeCode, ISO_TopicCategories, BegDateTemp  and EndDateTemp</xd:p>
         <xd:p><xd:b>Created on:</xd:b> Jan 27, 2014</xd:p>
         <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
         <xd:p> calls on the following templates</xd:p>
         <xd:p> Template                     Stylesheet/File                        Description
                SeriesInfoTitle              SeriesInfoTitle.xsl                    formats the gmd:title element for the parent file
                CitedResponsibleParty        IdPointOfContact.xsl                   Handles the contact info for Citation information 
                pointOfContact               IdPointOfContact.xsl                   default contact direct form metadata no UUID
                MD_MaintenanceFrequencyCode  MD_MaintenanceFrequencyCode.xsl        transforms the element in the
                                                                                     /MRF/Identification_Information/Status/Maintenance_and_Update_Frequency element into
                                                                                     a value in the MD_MaintenanceFrequencyCode code list
                NonISOKeywords               NonISOKeywords.xsl                     transforms the values stored in the Theme_Keyword and Theme_Keyword MRF elements to
                                                                                     the gmd:descriptiveKeywords element 
                NGDAThemes                   NGDA_Themes.xsl                        Master template handling all the NGDA themes 
                spatialRepresentationType    MD_SpatialRepresentationType.xsl       transforms the value in the
                                                                                     /MRF/Spatial_Data_Organization_Information/Direct_Spatial_Reference_Method element
                                                                                     into the correct MD_SpatialRepresentationTypeCode.xsl codeList value 
                Metadata_Character_Set       03_gmd_characterSet.xsl                Handles the gmd:characterset for the identificationInformation section 
                ISO_TopicCategories          ISOKeywords.xsl                        transforms the value in the keywords/theme that are related to the ISO Topic
                                                                                     Categories  to the ISO_TopicCategories element
                boundingCoordinatesMaster    boundingCoordinates.xsl                Master template for the Parent file Bounding Coordinate
                browseGraphic                MD_browseGraphic.xsl                   Inserts the browse graphic
                
         </xd:p>
         <xd:ul>
            <xd:li>Template                        Explanation                                              </xd:li>
            <xd:li>S             Handles the gmd:referenceSystemInfo element              </xd:li> 
            <xd:li>kmlReferenceSystemInfo          Handles the gmd:referenceSystemInfo element for KML files</xd:li>
         </xd:ul>
         <xd:p>
            Initial   Date                           Description
            MMC       12/04/2013                     Inserted a call to the NGDA template to handle National Geospatial Data Asset OMB themes.
            MMC       12/04/2013                     Ensured that all calls to the ISO codelists have the correct URL 
            MMC       12/12/2013                     Inserted a call to the spatialRepresentationType template, which is in the  MD_SpatialRepresentationType.xsl 
                                                      stylesheet. Spatial reference information is now handled in the metadata file.
            MMC      1/8/2014                        Modified to work on the MRF Format  
            MMC       4/16/2012                      Eliminated the ISO gmd:code element. This element is now handled by the ReferenceSystemCodes template.  
            MMC       12/04/2013                     Inserted the gmd:code element
            MMC       12/11/2013                     Inserted a choice structure so that the gmd:referenceSystemInfo does not appear if the Indirect_Spatial_Reference element is not in the MIF file.
            MMC       12/11/2013                     Changed the path of the ISO gmd:RS_Identifier so that it transforms the MIF Indirect_Spatial_Reference element 
            MMC       1/8/2014                       Modified to work on the MRF Format.
            MMC       2/2/2015                       Modified the if to work with version 2.0 
            MMC       4/14/16                        Modified to include the Browse graphic   
            MMC       2/17/17                        Updated so that the date has hyphens
         </xd:p>
      </xd:desc>
   </xd:doc>

<!-- file:/U:/ReleasedPerlScriptsandSchemas/XSLTSSchemsaModules/mrf2ISO/11_gmd_identificationInfo.xsl -->
   <xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>


   <xsl:template name="identificationInfo" match="/">
      <xsl:text>&#10;</xsl:text>
      <xsl:comment> This part represents Section 1 of the FGDC Metadata Standard </xsl:comment>
    
      <xsl:element name="gmd:identificationInfo">
         <xsl:element name="gmd:MD_DataIdentification">
            <xsl:element name="gmd:citation">
               <xsl:element name="gmd:CI_Citation">

                  <!-- <xsl:element name="gmd:title">
                     <xsl:element name="gco:CharacterString">
                        <xsl:apply-templates select="/MRF/Identification_Information/Citation/Title"/>
                     </xsl:element>
                  </xsl:element>
                  gmd:title -->

<xsl:call-template name="SeriesInfoTitle"/>

                  <xsl:element name="gmd:date">
                     <xsl:element name="gmd:CI_Date">
                        <xsl:text>&#10;</xsl:text>
                              <xsl:comment>This is the publication date </xsl:comment>
                        <xsl:element name="gmd:date">

                           <xsl:element name="gco:Date">
                              <xsl:variable name="dateLength" select="string-length(/MRF/Identification_Information/Citation/Publication_Date)"/>
                              <xsl:variable name="citDate" select="/MRF/Identification_Information/Citation/Publication_Date"/>
                              <xsl:choose>
                                 <xsl:when test="$dateLength=6">
                                    <xsl:variable name="year" select="substring($citDate,1,4)"/>
                                    <xsl:variable name="month" select="substring($citDate,5,2)"/>
                                    <xsl:variable name="corrCitDate" select="concat($year,'-',$month)"/>
                                    <xsl:value-of select="$corrCitDate"/>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <xsl:value-of select="/MRF/Identification_Information/Citation/Publication_Date"/>
                                 </xsl:otherwise>
                              </xsl:choose>
                           </xsl:element>
                           <!--gco:date -->
                        </xsl:element>
                        <!-- gmd:date -->

                        <xsl:element name="gmd:dateType">
                           <xsl:element name="gmd:CI_DateTypeCode">
                              <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_DateTypeCode</xsl:attribute>
                              <xsl:attribute name="codeListValue">publication</xsl:attribute>
                              <xsl:attribute name="codeSpace">002</xsl:attribute> publication </xsl:element>
                           <!-- gmd:CI_DateTypeCode -->
                        </xsl:element>
                        <!-- gmd:dateType -->
                     </xsl:element>
                     <!-- gmd:CI_Date -->
                  </xsl:element>
                  <!-- gmd:date -->
                  <!-- <xsl:comment>Edition Check  </xsl:comment> -->
                
                  <xsl:if test="/MRF/Identification_Information/Citation/Edition">
                     <xsl:element name="gmd:edition">
                        <xsl:element name="gco:CharacterString">
                           <xsl:value-of select="/MRF/Identification_Information/Citation/Edition"/>
                        </xsl:element>
                        <!-- gco:CharacterString -->
                     </xsl:element>
                     <!-- gmd:edition -->
                  </xsl:if>

                  <!-- <xsl:comment> calling CitedResponsibleParty</xsl:comment>-->
                  <xsl:call-template name="CitedResponsibleParty"/> 
                  <!--  <xsl:comment> done with CitedResponsibleParty</xsl:comment> -->


               </xsl:element>
               <!-- gmd:CI_Citation -->
            </xsl:element>
            <!-- gmd:citation-->

            <xsl:element name="gmd:abstract">
               <xsl:element name="gco:CharacterString">
                  <xsl:value-of select="/MRF/Identification_Information/Description/Abstract"/>
               </xsl:element>
               <!-- gco:CharacterString -->
            </xsl:element>
            <!-- gmd:abstract -->

            <xsl:element name="gmd:purpose">
               <xsl:element name="gco:CharacterString">
                  <xsl:value-of select="/MRF/Identification_Information/Description/Purpose"/>
               </xsl:element>
               <!-- gco:CharacterString -->
            </xsl:element>
            <!-- gmd:purpose -->

            <xsl:call-template name="pointOfContact"/>

            <xsl:if test="/MRF/Identification_Information/Status/Maintenance_and_Update_Frequency">
               <xsl:element name="gmd:resourceMaintenance">
                  <xsl:element name="gmd:MD_MaintenanceInformation">
                     <xsl:call-template name="MD_MaintenanceFrequencyCode"/>
                  </xsl:element><!-- gmd:MD_MaintenanceInformation -->
               </xsl:element><!-- gmd:resourceMaintenance -->
            </xsl:if>

            <xsl:variable name="NgdaCheck" select="/MRF/Identification_Information[1]/Keywords[1]/Theme[1]/Theme_Keyword_Thesaurus[1]"/>
           <!--   <xsl:comment><xsl:value-of select="$NgdaCheck"/></xsl:comment>-->
            <xsl:if test="contains($NgdaCheck,'NGDA Portfolio Themes')">
               <xsl:call-template name="browseGraphic"/>
            </xsl:if>

            <xsl:call-template name="NonISOKeywords"/>

            <!--  <xsl:call-template name="NGDAThemes"/>-->

            <xsl:element name="gmd:resourceConstraints">
               <xsl:element name="gmd:MD_LegalConstraints">

                  <xsl:element name="gmd:accessConstraints">

                     <xsl:element name="gmd:MD_RestrictionCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_RestrictionCode</xsl:attribute>
                        <xsl:attribute name="codeListValue">otherRestrictions</xsl:attribute>
                        <xsl:attribute name="codeSpace">008 </xsl:attribute> otherRestrictions </xsl:element><!-- gmd:MD_RestrictionCode -->
                  </xsl:element>
                  <!-- gmd:accessConstraints -->


                  <xsl:element name="gmd:useConstraints">
                     <xsl:element name="gmd:MD_RestrictionCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_RestrictionCode</xsl:attribute>
                        <xsl:attribute name="codeListValue">otherRestrictions</xsl:attribute>
                        <xsl:attribute name="codeSpace">008 </xsl:attribute>
                     </xsl:element>
                     <!-- gmd:MD_RestrictionCode -->
                  </xsl:element>
                  <!-- gmd:useConstraints -->



                  <xsl:if test="/MRF/Identification_Information/Access_Constraints">
                     <xsl:element name="gmd:otherConstraints">
                        <xsl:element name="gco:CharacterString"> Access Constraints: <xsl:value-of select="/MRF/Identification_Information/Access_Constraints"/>
                        </xsl:element>
                        <!-- gco:CharacterString -->
                     </xsl:element>
                     <!-- gmd:otherConstraints -->
                  </xsl:if>

                  <xsl:if test="/MRF/Identification_Information/Use_Constraints">
                     <xsl:element name="gmd:otherConstraints">
                        <xsl:element name="gco:CharacterString"> Use Constraints:<xsl:value-of select="/MRF/Identification_Information/Use_Constraints"/></xsl:element>
                        <!-- gco:CharacterString -->
                     </xsl:element>
                     <!-- gmd:otherConstraints -->
                  </xsl:if>


               </xsl:element>
               <!-- gmd:MD_LegalConstraints -->
            </xsl:element>
            <!-- gmd:resourceConstraints -->
            <xsl:text>&#10;</xsl:text>
            <xsl:comment> This is from the Direct Spatial Reference from Chapter 3 </xsl:comment>
            
            <xsl:call-template name="spatialRepresentationType"/>
            <xsl:element name="gmd:language">
               <xsl:choose>
                  <xsl:when test="/MRF/Identification_Information/Data_Set_Language">
                     <xsl:element name="gco:CharacterString">
                        <xsl:value-of select="/MRF/Identification_Information/Data_Set_Language"/>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:element name="gco:CharacterString">eng</xsl:element>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:element>
            <!-- language -->

            <xsl:call-template name="Metadata_Character_Set"/>
            <!-- <xsl:comment> calling the ISO template </xsl:comment> -->
            <xsl:call-template name="ISO_TopicCategories"/>

            <xsl:if test="/MRF/Distribution_Information/Technical_Prerequisites">
               <xsl:element name="gmd:environmentDescription">
                  <xsl:element name="gco:CharacterString">
                     <xsl:value-of select="/MRF/Distribution_Information/Technical_Prerequisites"/>
                  </xsl:element>
               </xsl:element>
            </xsl:if>

           
<xsl:call-template name="boundingCoordinatesMaster"/>

            <xsl:if test="/MRF/Identification_Information/Description/Supplemental_Information">
               <xsl:element name="gmd:supplementalInformation">
                  <xsl:element name="gco:CharacterString">
                     <xsl:value-of select="/MRF/Identification_Information/Description/Supplemental_Information"/>
                  </xsl:element>
               </xsl:element>
            </xsl:if>
         </xsl:element>
         <!-- gmd:MD_DataIdentification -->
      </xsl:element>
      <!-- gmd:identificationInfo -->

      <!-- </xsl:if> -->




   </xsl:template>
</xsl:stylesheet>
