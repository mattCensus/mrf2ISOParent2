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
         <xd:p>mrf2ISOParent/ISOKeywords.xsl</xd:p>
         <xd:p>called by the mrf2ISOParent/11_gmd_identificationInfo.xsl template</xd:p>
         <xd:p>XSLT stylesheet that transforms the values stored in the Theme_Keyword element that consist of one of the 12 ISO Topic categories the
            gmd:topicCategory/gmd:MD_TopicCategoryCode element. This stylesheet also corrects for inconsistencies between the GPMS and ISO standard. Examples of this
            inconsistency are the use of capitilization and the slash.</xd:p>
         <xd:p><xd:b>Created on:</xd:b> Jan 27, 2014</xd:p>
         <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
         
         <xd:ul>
            <xd:li>Template                  Explanation                                                                                     </xd:li>
            <xd:li>ISO_TopicCategories       transforms the value in the/MRF/Spatial_Data_Organization_Information/Direct_Spatial_Reference_Method element
                                              into the correct MD_SpatialRepresentationTypeCode.xsl codeList value                            </xd:li>
            
         </xd:ul>
         <xd:p>
            Initial   Date              Description
            MMC       1/8/2014          Modified to work on the MRF Format.
            MMC       2/2/2015          Modified the if to work with version 2.0 
            MMC       2/17/17           Modified so that the Topic Categories appear
         </xd:p>
      </xd:desc>
   </xd:doc>
   


   <xsl:template name="ISO_TopicCategories">


      <xsl:for-each select="/MRF/Identification_Information[1]/Keywords/Theme/Theme_Keyword">
         <!-- group-by="@gid1" -->




         <xsl:variable name="ThemeKey" select="."/>


         <!-- <xsl:comment> ThemeKey = <xsl:value-of select="$ThemeKey"/></xsl:comment> -->

         <xsl:variable name="FarmingCheckCap" select="contains($ThemeKey, 'Farming')"/>
         <xsl:variable name="FarmingCheckLow" select="contains($ThemeKey, 'farming')"/>
         <xsl:variable name="BiotaCheckCap" select="contains($ThemeKey, 'Biota')"/>
         <xsl:variable name="BiotaCheckLow" select="contains($ThemeKey, 'biota')"/>
         <xsl:variable name="BoundCheckCap" select="contains($ThemeKey, 'Boundaries')"/>
         <xsl:variable name="BoundCheckLow" select="contains($ThemeKey, 'boundaries')"/>
         <xsl:variable name="AtmosphereCheck" select="contains($ThemeKey, 'Atmosphere')"/>
         <xsl:variable name="ClimateCheck"
            select="contains($ThemeKey, 'climatologyMeteorologyAtmosphere')"/>
         <xsl:variable name="EconomyCap" select="contains($ThemeKey, 'Economy')"/>
         <xsl:variable name="EconomyLow" select="contains($ThemeKey, 'economy')"/>
         <xsl:variable name="ElevationCap" select="contains($ThemeKey, 'Elevation')"/>
         <xsl:variable name="ElevationLow" select="contains($ThemeKey, 'elevation')"/>
         <xsl:variable name="EnvironmentCap" select="contains($ThemeKey, 'Environment')"/>
         <xsl:variable name="EnvironmentLow" select="contains($ThemeKey, 'environment')"/>
         <xsl:variable name="GeoCap" select="contains($ThemeKey, 'GeoscientificInformation')"/>
         <xsl:variable name="GeoLow" select="contains($ThemeKey, 'GeoscientificInformation')"/>
         <xsl:variable name="HealthCap" select="contains($ThemeKey, 'Health')"/>
         <xsl:variable name="HealthLow" select="contains($ThemeKey, 'health')"/>
         <xsl:variable name="ImageryCap" select="contains($ThemeKey, 'ImageryBaseMapsEarthCover')"/>
         <xsl:variable name="ImageryLow" select="contains($ThemeKey, 'imageryBaseMapsEarthCover')"/>
         <xsl:variable name="MiltCap" select="contains($ThemeKey, 'IntelligenceMilitary')"/>
         <xsl:variable name="MiltLow" select="contains($ThemeKey, 'intelligenceMilitary')"/>
         <xsl:variable name="InlandCap" select="contains($ThemeKey, 'InlandWaters')"/>
         <xsl:variable name="InlandLow" select="contains($ThemeKey, 'inlandWaters')"/>
         <xsl:variable name="LocationCap" select="contains($ThemeKey, 'Location')"/>
         <xsl:variable name="LocationLow" select="contains($ThemeKey, 'location')"/>
         <xsl:variable name="OceansCap" select="contains($ThemeKey, 'Oceans')"/>
         <xsl:variable name="OceansLow" select="contains($ThemeKey, 'oceans')"/>
         <xsl:variable name="PlanningCap" select="contains($ThemeKey, 'PlanningCadastre')"/>
         <xsl:variable name="PlanningLow" select="contains($ThemeKey, 'planningCadastre')"/>
         <xsl:variable name="PlanningSlash" select="contains($ThemeKey, 'Planning/Cadastre')"/>
         <xsl:variable name="SocietyCap" select="contains($ThemeKey, 'Society')"/>
         <xsl:variable name="SocietyLow" select="contains($ThemeKey, 'society')"/>
         <xsl:variable name="StructureCap" select="contains($ThemeKey, 'Structure')"/>
         <xsl:variable name="StructureLow" select="contains($ThemeKey, 'structure')"/>
         <xsl:variable name="TransportationCap" select="contains($ThemeKey, 'Transportation')"/>
         <xsl:variable name="TransportationLow" select="contains($ThemeKey, 'transportation')"/>
         <xsl:variable name="UtilitiesCap" select="contains($ThemeKey, 'UtilitiesCommunication')"/>
         <xsl:variable name="UtilitiesLow" select="contains($ThemeKey, 'utilitiesCommunication')"/>
         <xsl:variable name="UtilitiesSlash"
            select="contains($ThemeKey, 'Utilities/Communications')"/>

         <!-- <comment> BoundCheck = <xsl:value-of select="$BoundCheck"/> 
</xsl:comment> -->

         <!-- farming -->
         <xsl:if test="$FarmingCheckCap = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">farming</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="$FarmingCheckLow = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <!-- biota -->
         <xsl:if test="$BiotaCheckCap = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">biota</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="$BiotaCheckLow = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <!-- boundaries -->
         <xsl:if test="$BoundCheckCap = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">boundaries</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="$BoundCheckLow = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <!-- climatologyMeteorologyAtmosphere -->
         <xsl:if test="$AtmosphereCheck = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode"
                  >climatologyMeteorologyAtmosphere</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="$ClimateCheck = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <!-- Economy -->
         <xsl:if test="$EconomyCap = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">economy</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="$EconomyLow = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <!-- elevation -->
         <xsl:if test="$ElevationCap = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">elevation</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="$ElevationLow = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <!-- environment -->
         <xsl:if test="$EnvironmentCap = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">environment</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="$EnvironmentLow = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <!-- geoscientificInformation 282 -->
         <xsl:if test="$GeoCap = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">geoscientificInformation</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="$GeoLow = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <!-- health -->
         <xsl:if test="$HealthCap = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">health</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="$HealthLow = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <!-- Imagery -->
         <xsl:if test="$ImageryCap = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">imageryBaseMapsEarthCover</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="$ImageryLow = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <!-- intelligenceMilitary -->
         <xsl:if test="$MiltCap = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">intelligenceMilitary</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="$MiltLow = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <!-- inlandWaters -->
         <xsl:if test="$InlandCap = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">inlandWaters</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="$InlandLow = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <!-- Location -->
         <xsl:if test="$LocationCap = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">location</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="$LocationLow = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <!-- Oceans -->
         <xsl:if test="$OceansCap = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">oceans</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="$OceansLow = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <!-- planningCadastre -->
         <xsl:if test="$PlanningCap = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">planningCadastre</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="$PlanningLow = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="$PlanningSlash = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">planningCadastre</xsl:element>
            </xsl:element>
         </xsl:if>
         <!-- society -->
         <xsl:if test="$SocietyCap = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">society</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="$SocietyLow = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <!-- structure -->

         <xsl:if test="$StructureCap = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">structure</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="$StructureLow = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <!-- Transportation -->

         <xsl:if test="$TransportationCap = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">transportation</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="$TransportationLow = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <!-- Utilities -->
         <xsl:if test="$UtilitiesCap = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">utilitiesCommunication</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="$UtilitiesLow = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="$UtilitiesSlash = 'true'">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">utilitiesCommunication</xsl:element>
            </xsl:element>
         </xsl:if>




      </xsl:for-each>




   </xsl:template>

</xsl:stylesheet>
