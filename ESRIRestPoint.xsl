<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gfc="http://www.isotc211.org/2005/gfc"
    xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gmx="http://www.isotc211.org/2005/gmx"
    xmlns:gsr="http://www.isotc211.org/2005/gsr" xmlns:gss="http://www.isotc211.org/2005/gss"
    xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:gml="http://www.opengis.net/gml/3.2"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:grp="http://www.altova.com/Mapforce/grouping"
    xmlns:mdb="http://www.isotc211.org/schemas/2012/mdb"
    xmlns:ci="http://www.isotc211.org/schemas/2012/ci"
    exclude-result-prefixes="fn grp xs xsi xsl xd" xmlns="http://www.isotc211.org/2005/gfc">
    
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Apr 19, 2016</xd:p>
            <xd:p><xd:b>Author:</xd:b> matt</xd:p>
            <xd:p>
                Initial    Date          Description
                MMC        6/20/2016     Updated the applicationProfile to http://www.geoplatform.gov/spec/esri-map-rest on the recomendation of the FGDC.
            </xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:template name="EsriRest">
        <xsl:variable name="title" select="/MRF/Identification_Information/Citation/Title"/>
        <xsl:variable name="postComma1" select="substring-after($title,',')"/>
        <xsl:variable name="postComma2" select="substring-after($postComma1,',')"/>
        <xsl:variable name="levelOfGeo" select="substring-before($postComma2,',')"/>
        <xsl:variable name="theme" select="substring-after($postComma2,',')"/>
        
        <xsl:element name="gmd:transferOptions">
            <xsl:element name="gmd:MD_DigitalTransferOptions">
                <xsl:element name="gmd:onLine">
                    <xsl:element name="gmd:CI_OnlineResource">
                        
                        <xsl:choose>
                            <xsl:when test="contains($theme,'Current Secondary School Districts')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/rest/services/TIGERweb/School/MapServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfile"/>
                                <xsl:call-template name="SchoolRestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains all the school layers</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Consolidated City')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/rest/services/TIGERweb/Places_CouSub_ConCity_SubMCD/MapServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfile"/>
                               <xsl:call-template name="Places_CouSub_ConCity_SubMCDRestService"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains all the Consolidated Cities layers</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Elementary School Districts')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL"> https://tigerweb.geo.census.gov/arcgis/rest/services/TIGERweb/School/MapServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfile"/>
                                <xsl:call-template name="SchoolRestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the Elementary School layer</xsl:element>
                                </xsl:element> 
                            </xsl:when>
                            <xsl:when test="contains($theme,'Congressional District')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/rest/services/TIGERweb/Legislative/MapServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfile"/>
                                <xsl:call-template name="LegislativeRestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the 115th Congressional layer</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current American Indian Tribal Subdivision')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/rest/services/TIGERweb/AIANNHA/MapServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfile"/>
                                <xsl:call-template name="AIANNHARestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains all the Tribal Subdivision and Oklahoma Tribal Statistical Areas layers</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'AIANNH')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/rest/services/TIGERweb/AIANNHA/MapServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfile"/>
                                <xsl:call-template name="AIANNHARestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains all the Tribal Subdivision and Oklahoma Tribal Statistical Areas layers</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'CNECTA')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.cRensus.gov/arcgis/rest/services/TIGERweb/CBSA/MapServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfile"/>
                                <xsl:call-template name="CBSARestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the Combined New England City and Town Areas layers</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'CSA')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/rest/services/TIGERweb/CBSA/MapServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfile"/>
                                <xsl:call-template name="CBSARestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the Current Combined Statistical Area (CSA)</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current County and Equivalent')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/rest/services/TIGERweb/State_County/MapServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfile"/>
                                <xsl:call-template name="State_CountyRestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the Counties and Equivalent Layer</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Metropolitan Division')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/rest/services/TIGERweb/CBSA/MapServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="CBSARestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the Current Metropolitan Divisions</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'CBSA')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/rest/services/TIGERweb/CBSA/MapServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfile"/>
                                <xsl:call-template name="CBSARestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the Current Metropolitan Statistical Area/Micropolitan Statistical Area (CBSA) Layers</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'NECTA Division')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/rest/services/TIGERweb/CBSA/MapServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfile"/>
                               <xsl:call-template name="CBSARestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains theNew England City and Town Area Divisions Layers</xsl:element>     
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'State and Equivalent')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/rest/services/TIGERweb/State_County/MapServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfile"/>
                               <xsl:call-template name="State_CountyRestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the States and Equivalents Layers</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Tribal Block Group')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/rest/services/TIGERweb/TribalTracts/MapServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfile"/>
                                <xsl:call-template name="TribalTractsRestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the Tribal Block Group Layers</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Census  Block State-based')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/rest/services/TIGERweb/Tracts_Blocks/MapServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfile"/>
                                <xsl:call-template name="Tracts_BlocksRestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the 2010 Census Block Groups layer</xsl:element>
                                </xsl:element>
                            </xsl:when>   
                            <xsl:when test="contains($theme,'Current Tribal Census Tract')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/rest/services/TIGERweb/TribalTracts/MapServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfile"/>
                                <xsl:call-template name="TribalTractsRestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the Tribal Census Tracts Layers</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'ANRC')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/rest/services/TIGERweb/AIANNHA/MapServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfile"/>
                               <xsl:call-template name="AIANNHARestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the Alaska Native Regional Corporations Layers</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Census  Urban Area')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/rest/services/TIGERweb/Urban/MapServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfile"/>
                                <xsl:call-template name="UrbanRestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the 2010 Census Urban Area Clusters</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'ZCTA5')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/rest/services/TIGERweb/PUMA_TAD_TAZ_UGA_ZCTA/MapServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfile"/>
                               <xsl:call-template name="PUMA_TAD_TAZ_UGA_ZCTARestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the Zip Code Tabulation Layer</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'NECTA')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/rest/services/TIGERweb/CBSA/MapServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfile"/>
                                <xsl:call-template name="CBSARestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the Current New England City and Town Area layer</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'PUMA')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/rest/services/TIGERweb/PUMA_TAD_TAZ_UGA_ZCTA/MapServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfile"/>
                               <xsl:call-template name="PUMA_TAD_TAZ_UGA_ZCTARestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the 2010 Public Use Microdata Area layer</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Block Group')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/rest/services/TIGERweb/Tracts_Blocks/MapServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfile"/>
                                <xsl:call-template name="Tracts_BlocksRestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the 2010 Census Block Groups layer</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Census Tract')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/rest/services/TIGERweb/Tracts_Blocks/MapServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfile"/>
                                <xsl:call-template name="Tracts_BlocksRestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the 2010 Census Tracts</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current County Subdivision')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/rest/services/TIGERweb/Places_CouSub_ConCity_SubMCD/MapServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfile"/>
                                <xsl:call-template name="Places_CouSub_ConCity_SubMCDRestService"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the County Sudivisions</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Place')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/rest/services/TIGERweb/Places_CouSub_ConCity_SubMCD/MapServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfile"/>
                               <xsl:call-template name="Places_CouSub_ConCity_SubMCDRestService"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the places</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'State Legislative District (SLD) Lower Chamber')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/rest/services/Census2010/Legislative/MapServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfile"/>
                                <xsl:call-template name="LegislativeRestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the state legislative districts - lower chamber layer</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current State Legislative District (SLD) Upper Chamber')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/rest/services/TIGERweb/Legislative/MapServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfile"/>
                               <xsl:call-template name="LegislativeRestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the state legislative districts - Upper chamber layer</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Unified School Districts')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/rest/services/TIGERweb/School/MapServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfile"/>
                               <xsl:call-template name="SchoolRestPoint"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the state Unified School Districts layer</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Subbarrio')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/rest/services/TIGERweb/Places_CouSub_ConCity_SubMCD/MapServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfile"/>
                                <xsl:call-template name="Places_CouSub_ConCity_SubMCDRestService"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the subbarrios layer</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Estate')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/rest/services/TIGERweb/Places_CouSub_ConCity_SubMCD/MapServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfile"/>
                               <xsl:call-template name="Places_CouSub_ConCity_SubMCDRestService"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">Feature Catalog for the 2015 Estates County-based Shapefile</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'All Roads')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/rest/services/TIGERweb/Transportation/MapServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfile"/>
                                <xsl:call-template name="PhysicalFeaturesRest"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains all the Transportation and hydrology layers</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Primary Roads')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/rest/services/TIGERweb/Transportation/MapServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfile"/>
                                <xsl:call-template name="PhysicalFeaturesRest"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains all the Transportation and hydrology layers</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Area Landmark')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/rest/services/TIGERweb/tigerWMS_PhysicalFeatures/MapServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfile"/>
                                <xsl:call-template name="PhysicalFeaturesRest"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">his Rest Service contains the state Area Landmarks layer</xsl:element>
                                </xsl:element>
                            </xsl:when>
                        </xsl:choose>
                        
                        <xsl:element name="gmd:function">
                            <xsl:element name="gmd:CI_OnLineFunctionCode">
                                <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_OnlineFunctionCode</xsl:attribute>
                                <xsl:attribute name="codeListValue">download</xsl:attribute>download
                            </xsl:element>
                        </xsl:element>
                        
                    </xsl:element> <!-- gmd:CI_OnlineResource -->
                </xsl:element> <!-- gmd:onLine -->
            </xsl:element> <!--gmd:MD_DigitalTransferOptions  -->
        </xsl:element><!-- gmd:transferOptions  -->
        
    </xsl:template>
    
    <xsl:template name="appProfile">
        <xsl:element name="gmd:applicationProfile">
            <xsl:element name="gco:CharacterString">http://www.geoplatform.gov/spec/esri-map-rest</xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="PhysicalFeaturesRest">
        <xsl:element name="gmd:name">
            <xsl:element name="gco:CharacterString">TIGERweb/tigerWMS_PhysicalFeatures (MapServer) Rest Service</xsl:element> 
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="Places_CouSub_ConCity_SubMCDRestService">
        <xsl:element name="gmd:name">
            <xsl:element name="gco:CharacterString">TIGERweb/Places_CouSub_ConCity_SubMCD (MapServer)</xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="SchoolRestPoint">
        <xsl:element name="gmd:name">
        <xsl:element name="gco:CharacterString">TIGERweb/School (MapServer)</xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="LegislativeRestPoint">
        <xsl:element name="gmd:name">
            <xsl:element name="gco:CharacterString">TIGERweb/Legislative (MapServer)</xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="Tracts_BlocksRestPoint">
        <xsl:element name="gmd:name">
            <xsl:element name="gco:CharacterString">TIGERweb/Tracts_Blocks (MapServer)</xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="PUMA_TAD_TAZ_UGA_ZCTARestPoint">
        <xsl:element name="gmd:name">
            <xsl:element name="gco:CharacterString">TIGERweb/PUMA_TAD_TAZ_UGA_ZCTA (MapServer)</xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="CBSARestPoint">
        <xsl:element name="gmd:name">
            <xsl:element name="gco:CharacterString">TIGERweb/CBSA (MapServer)</xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="UrbanRestPoint">
        <xsl:element name="gmd:name">
            <xsl:element name="gco:CharacterString">TIGERweb/Urban (MapServer)</xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="AIANNHARestPoint">
        <xsl:element name="gmd:name">
            <xsl:element name="gco:CharacterString">TIGERweb/AIANNHA (MapServer)</xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="TribalTractsRestPoint">
        <xsl:element name="gmd:name">
            <xsl:element name="gco:CharacterString">TIGERweb/TribalTracts (MapServer)</xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="State_CountyRestPoint">
        <xsl:element name="gmd:name">
            <xsl:element name="gco:CharacterString">TIGERweb/State_County (MapServer)</xsl:element>
        </xsl:element>
    </xsl:template>
    
    
    
</xsl:stylesheet>
