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
                MMC        6/20/2016     Updated the applicationProfile to http://opengis.net/spec/wms on the recomendation of the FGDC
                MMC        2/10/2017     Changed all the URLs so that only the "root" element appears
                MMC        6/20/17       Changed so the WMS URL for Census blocks appears
            </xd:p>
        </xd:desc>
    </xd:doc>
    
    
    <xsl:template name="WMSDist">
        <xsl:variable name="title" select="/MRF/Identification_Information/Citation/Title"/>
        <xsl:variable name="postComma1" select="substring-after($title,',')"/>
        <xsl:variable name="postComma2" select="substring-after($postComma1,',')"/>
        <xsl:variable name="levelOfGeo" select="substring-before($postComma2,',')"/>
        <xsl:variable name="theme" select="substring-after($postComma2,',')"/>
        
      <!--  <xsl:comment>title<xsl:value-of select="$title"/></xsl:comment>
        <xsl:comment>postComma1<xsl:value-of select="$postComma1"/></xsl:comment>
        <xsl:comment>postComma2<xsl:value-of select="$postComma2"/></xsl:comment>
        <xsl:comment>levelOfGeo<xsl:value-of select="$levelOfGeo"/></xsl:comment>
        <xsl:comment>theme<xsl:value-of select="$theme"/></xsl:comment> --> 
        
        <xsl:element name="gmd:transferOptions">
            <xsl:element name="gmd:MD_DigitalTransferOptions">
                <xsl:element name="gmd:onLine">
                    <xsl:element name="gmd:CI_OnlineResource">
                        
                        <!-- every theme will here -->
                        <xsl:choose>
                            <xsl:when test="contains($theme,'Current Secondary School Districts')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for secondary school districts. For more information on using this WMS, see the OGC Specification for further details.</xsl:element>
                                </xsl:element>    
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Consolidated City')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for consolidated cities. For more information on using this WMS, see the OGC Specification for further details.</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Elementary School Districts')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for Elementary School Districts. For more information on using this WMS, see the OGC Specification for further details.</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Congressional District')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for 115th Congressional Districts. For more information on using this WMS, see the OGC Specification for further details.</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current American Indian Tribal Subdivision')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for Current American Indian Tribal Subdivision. For more information on using this WMS, see the OGC Specification for further details. </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'AIANNH')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for Current American Indian/Alaska Native/Native Hawaiian Areas. For more information on using this WMS, see the OGC Specification for further details.</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'CNECTA')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for the Combined New England City and Town Areas.For more information on using this WMS, see the OGC Specification for further details.</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'CSA')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for the Current Combined Statistical Area (CSA). For more information on using this WMS, see the OGC Specification for further details.</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current County and Equivalent')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for the Current County and Equivalent.For more information on using this WMS, see the OGC Specification for further details.</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Metropolitan Division')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for the Current Metropolitan Division. For more information on using this WMS, see the OGC Specification for further details.</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'CBSA')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the Current Metropolitan Statistical Area/Micropolitan Statistical Area (CBSA) Layers. For more information on using this WMS, see the OGC Specification for further details.</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'NECTA Division')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for the New England City and Town Area Divisions. For more information on using this WMS, see the OGC Specification for further details. </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'State and Equivalent')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for the States and Equivalents. For more information on using this WMS, see the OGC Specification for further details.</xsl:element>
                                </xsl:element> 
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Tribal Block Group')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for Current Tribal Block Groups. For more information on using this WMS, see the OGC Specification for further details.</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Tribal Census Tract')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for Current Tribal Census Tracts. For more information on using this WMS, see the OGC Specification for further details. </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Census  Block State-based')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for 2010 Census Tracts. 
                                        This URL is to be used in mapping software like ArcMap. To use this in a web browser, see the OGC Web Mapping Specification.
                                    </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'ANRC')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for the Alaska Native Regional Corporations. For more information on using this WMS, see the OGC Specification for further details. </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Census  Urban Area')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for the 2010 Census Urban Area Clusters. For more information on using this WMS, see the OGC Specification for further details.</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'ZCTA5')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for the Current County and Equivalent. For more information on using this WMS, see the OGC Specification for further details.</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'NECTA')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for the Current New England City and Town Areas. For more information on using this WMS, see the OGC Specification for further details. </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'PUMA')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for 2010 Public Use Microdata Area. For more information on using this WMS, see the OGC Specification for further details. </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Block Group')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for 2010 Census Blocks. For more information on using this WMS, see the OGC Specification for further details.</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Census Tract')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for 2010 Census Tracts. For more information on using this WMS, see the OGC Specification for further details.</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current County Subdivision')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for the County Sudivisions. For more information on using this WMS, see the OGC Specification for further details. </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Place')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for places. For more information on using this WMS, see the OGC Specification for further details.</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'State Legislative District (SLD) Lower Chamber')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for state legislative districts - lower chamber. For more information on using this WMS, see the OGC Specification for further details.</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current State Legislative District (SLD) Upper Chamber')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for state legislative districts - upper chamber.For more information on using this WMS, see the OGC Specification for further details. </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Unified School Districts')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for Unified School Districts. For more information on using this WMS, see the OGC Specification for further details.</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Subbarrio')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                               <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for the subbarrios. For more information on using this WMS, see the OGC Specification for further details. </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Estate')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                 <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for the Estates. For more information on using this WMS, see the OGC Specification for further details.</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'All Roads')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_PhysicalFeatures/MapServer/WmsServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                               <xsl:call-template name="PhysicalFeaturesWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for primary and secondary roads. For more information on using this WMS, see the OGC Specification for further details.</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Primary Roads')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_PhysicalFeatures/MapServer/WmsServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                               <xsl:call-template name="PhysicalFeaturesWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for the primary roads. For more information on using this WMS, see the OGC Specification for further details.</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Area Landmark')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_PhysicalFeatures/MapServer/WmsServer</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="PhysicalFeaturesWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for Area Landmarks. For more information on using this WMS, see the OGC Specification for further details.</xsl:element>
                                </xsl:element>
                            </xsl:when>                            
                            
                        </xsl:choose>
                        <!-- every file will have this -->
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
    
     <xsl:template name="appProfileWMS">
         <xsl:element name="gmd:applicationProfile">
             <xsl:element name="gco:CharacterString">http://opengis.net/spec/wms</xsl:element>
         </xsl:element>
     </xsl:template>
    
    <xsl:template name="PhysicalFeaturesWMS">
        <xsl:element name="gmd:name">
            <xsl:element name="gco:CharacterString">TIGERweb/tigerWMS_PhysicalFeatures (MapServer)</xsl:element>
        </xsl:element>
    </xsl:template>
    
   
    <xsl:template name="tigerWMS_CurrentWMS">
        <xsl:element name="gmd:name">
            <xsl:element name="gco:CharacterString">TIGERweb/tigerWMS_Current (MapServer)</xsl:element>
        </xsl:element>
    </xsl:template> 
    
</xsl:stylesheet>