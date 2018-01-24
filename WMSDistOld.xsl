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
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0 &amp;LAYERS=Secondary School Districts,Secondary School Districts Labels&amp;STYLES&amp;STYLES =&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:3857 &amp;BBOX=-11679625.942909468,4709198.547476525,-11645573.246808422,4737900.651597611&amp;WIDTH=1091&amp;HEIGHT=951</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for secondary school districts. Since this layer displays at scales of 1:5,999,988 or greater, adjusting the BBox coordinates in the URL is necessary</xsl:element>
                                </xsl:element>    
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Consolidated City')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0 &amp;LAYERS=Consolidated Cities,Consolidated Cities Labels&amp;STYLES=default, default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:3857 &amp;BBOX=-11679625.942909468,4709198.547476525,-11645573.246808422,4737900.651597611&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for consolidated cities. Since this layer displays at scales of 1:1,399,997 or greater, adjusting the BBox coordinates in the URL is necessary </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Elementary School Districts')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0 &amp;LAYERS=Elementary School Districts,Elementary School Districts Labels&amp;STYLES=default, default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326 &amp;BBOX=32.860571,-113.5097542,46.389131,-113.509754&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for Elementary School Districts. Since this layer displays at scales of 1:5,999,988 or greater, adjusting the BBox coordinates in the URL is necessary</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Congressional District')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0 &amp;LAYERS=114th Congressional Districts,114th Congressional Districts Labels&amp;STYLES=default, default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326 &amp;BBOX=32.860571,-113.5097542,46.389131,-113.509754&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for 114th Congressional Districts. Since this layer displays at scales of 1:11,999,976 or greater, adjusting the BBox coordinates in the URL is necessary to get the desired area </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current American Indian Tribal Subdivision')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0 &amp;LAYERS=Tribal Subdivisions,Tribal Subdivisions Labels,Oklahoma Tribal Statistical Areas,Oklahoma Tribal Statistical Areas Labels&amp;STYLES=default, default,default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326 &amp;BBOX=32.860571,-113.5097542,46.389131,-113.509754&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for Current American Indian Tribal Subdivision . Since this layer displays at scales of 1:2,499,995 or greater, adjusting the BBox coordinates in the URL is necessary </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'AIANNH')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=Off-Reservation Trust Lands,Off-Reservation Trust Lands Labels,State American Indian Reservations,State American Indian Reservations Labels,Hawaiian Home Lands,Hawaiian Home Lands Labels,Alaska Native Village Statistical Areas,Alaska Native Village Statistical Areas Labels,Federal American Indian Reservations,Federal American Indian Reservations Labels,Tribal Subdivisions,Tribal Subdivisions Labels,Oklahoma Tribal Statistical Areas,Oklahoma Tribal Statistical Areas Labels&amp;&amp;STYLES=default,default, default,default, default,default,default,default,default,default,default,default,default,default &amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326 &amp;BBOX=32.860571,-113.5097542,46.389131,-113.509754&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for Current American Indian/Alaska Native/Native Hawaiian Areas. Since this layer displays at scales of 1:2,499,995 or greater, adjusting the BBox coordinates in the URL is necessary</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'CNECTA')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0 &amp;LAYERS=Combined New England City and Town Areas,Combined New England City and Town Areas Labels&amp;STYLES=default,default &amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326 &amp;BBOX= 40.143086,-74.815419,45.131168,-68.0292064&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for the Combined New England City and Town Areas. Since this layer displays at scales of 1:4,622,324 or greater, adjusting the BBox coordinates in the URL is necessary </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'CSA')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0 &amp;LAYERS=Combined Statistical Areas,Combined Statistical Areas Labels&amp;STYLES=default, default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326 &amp;BBOX=32.860571,-114.5097542,46.389131,-110.509754&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for the Current Combined Statistical Area (CSA). Since this layer displays at scales of 1:18,489,298 or greater, adjusting the BBox coordinates in the URL is necessary </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current County and Equivalent')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0 &amp;LAYERS=Counties,Counties Labels&amp;STYLES=default, default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326 &amp;BBOX=32.860571,-113.5097542,46.389131,-113.509754&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for the Current County and Equivalent. Since this layer displays at scales of 1:2,311,162 or greater, adjusting the BBox coordinates in the URL is necessary </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Metropolitan Division')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0 &amp;LAYERS=Metropolitan Divisions,Metropolitan Divisions Labels&amp;STYLES=default, default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326 &amp;BBOX=32.860571,-113.5097542,46.389131,-113.509754&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for the Current Metropolitan Division. Since this layer displays at scales of 1:4,622,324  or greater, adjusting the BBox coordinates in the URL is necessary </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'CBSA')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0 &amp;LAYERS=Metropolitan Statistical Areas,Metropolitan Statistical Areas Labels,Micropolitan Statistical Areas,Micropolitan Statistical Areas Labels&amp;STYLES=default,default,default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=32.860571,-113.5097542,46.389131,-113.509754&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This Rest Service contains the Current Metropolitan Statistical Area/Micropolitan Statistical Area (CBSA) Layers</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'NECTA Division')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0 &amp;LAYERS=New England City and Town Area Divisions,New England City and Town Area  Divisions Labels&amp;STYLES=default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=32.860571,-113.5097542,46.389131,-113.509754&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for the New England City and Town Area Divisions. Since this layer displays at scales of 1:577,791 or greater, adjusting the BBox coordinates in the URL is necessary </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'State and Equivalent')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0 &amp;LAYERS=States,States Labels&amp;STYLES=default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=41.187053,-72.508142,42.88679,-69.858861&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for the States and Equivalents. Since this layer displays at scales of 1:36,978,595 or greater, adjusting the BBox coordinates in the URL is necessary </xsl:element>
                                </xsl:element> 
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Tribal Block Group')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0 &amp;LAYERS=Tribal Block Groups,Tribal Block Groups Labels&amp;STYLES=default, default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326 &amp;BBOX=25.467847,-136.541802,57.054448,-62.039082&amp;WIDTH=1090&amp;HEIGHT=751</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for Current Tribal Block Groups. Since this layer displays at scales of 1:288,895 or greater, adjusting the BBox coordinates in the URL is necessary </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Tribal Census Tract')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0 &amp;LAYERS=Tribal Census Tracts,Tribal Census Tracts Labels&amp;STYLES=default, default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326 &amp;BBOX= 32.501202,-112.203736,33.466104,-110.448354&amp;WIDTH=1090&amp;HEIGHT=751</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for Current Tribal Census Tracts. Since this layer displays at scales of 1:1,155,581 or greater, adjusting the BBox coordinates in the URL is necessary </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'ANRC')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0 &amp;LAYERS=Alaska Native Regional Corporations,Alaska Native Regional Corporations Labels&amp;STYLES=default, default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326 &amp;BBOX=51.175092,-179.231086,71.441059,179.859681&amp;WIDTH=1090&amp;HEIGHT=751</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for the Alaska Native Regional Corporations. Since this layer displays at scales of 1:1:9,244,649 or greater, adjusting the BBox coordinates in the URL is necessary </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Census  Urban Area')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0 &amp;LAYERS=2010 Census Urban Clusters,2010 Census Urban Clusters Labels&amp;STYLES=default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=-14.874757, -171.060408, 71.465321, 146.356228&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for the 2010 Census Urban Area Clusters. Since this layer displays at scales of 1:2,311,162 or greater, adjusting the BBox coordinates in the URL is necessary</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'ZCTA5')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0 &amp;LAYERS=2010 Census ZIP Code Tabulation Areas&amp;STYLES=&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:3857 &amp;BBOX=-11679625.942909468,4709198.547476525,-11645573.246808422,4737900.651597611&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for the Current County and Equivalent. Since this layer displays at scales of 1:2,311,162 or greater, adjusting the BBox coordinates in the URL is necessary </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'NECTA')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0 &amp;LAYERS=Micropolitan New England City and Town Areas,Micropolitan New England City and Town Areas Labels,Metropolitan New England City and Town Areas,Metropolitan New England City and Town Areas Labels&amp;STYLES=default,default,default,default &amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=32.860571,-113.5097542,46.389131,-113.509754&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for the Current New England City and Town Areas. Since this layer displays at scales of 1:1,155,581 or greater, adjusting the BBox coordinates in the URL is necessary </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'PUMA')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0 &amp;LAYERS=2010 Census Public Use Microdata Areas,2010 Census Public Use Microdata Areas Labels&amp;STYLES=default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=-14.874757,-171.060408,71.465321,146.356228&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for 2010 Public Use Microdata Area. Since this layer displays at scales of 1:9244649 or greater, adjusting the BBox coordinates in the URL is necessary </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Block Group')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0 &amp;LAYERS=Census Block Groups,Census Block Groups Labels&amp;STYLES=default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=-14.874757,-171.060408,71.465321,146.356228&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for 2010 Census Blocks. Since this layer displays at scales of 1:288895 or greater, adjusting the BBox coordinates in the URL is necessary</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Census Tract')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0 &amp;LAYERS=Census Tracts,Census Tracts Labels&amp;STYLES=default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=-14.874757,-171.060408,71.465321,146.356228&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for 2010 Census Tracts. Since this layer displays at scales of 1:577791 or greater, adjusting the BBox coordinates in the URL is necessary</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current County Subdivision')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0 &amp;LAYERS=County Subdivisions,County Subdivisions Labels&amp;STYLES=default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=-14.874757,-171.060408,71.465321,146.356228&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for the County Sudivisions. Since this layer displays at scales of 1:288895 or greater, adjusting the BBox coordinates in the URL is necessary </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Place')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0 &amp;LAYERS=Census Designated Places,Census Designated Places Labels,Incorporated Places,Incorporated Places Labels&amp;STYLES=default,default,default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=-14.874757,-171.060408,71.465321,146.356228&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for places. Since this layer displays at scales of 1:1155581 or greater, adjusting the BBox coordinates in the URL is necessary </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'State Legislative District (SLD) Lower Chamber')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=2014 State Legislative Districts - Lower,2014 State Legislative Districts - Lower Labels&amp;STYLES=default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=-14.874757,-171.060408,71.465321,146.356228&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for state legislative districts - lower chamber. Since this layer displays at scales of 1:2311162 or greater, adjusting the BBox coordinates in the URL is necessary </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current State Legislative District (SLD) Upper Chamber')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=2014 State Legislative Districts - Upper,2014 State Legislative Districts - Upper Labels&amp;STYLES=default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=-14.874757,-171.060408,71.465321,146.356228&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for state legislative districts - upper chamber. Since this layer displays at scales of 1:2311162 or greater, adjusting the BBox coordinates in the URL is necessary </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Unified School Districts')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=Unified School Districts,Unified School Districts Labels&amp;STYLES=default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=-14.874757,-171.060408,71.465321,146.356228&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for Unified School Districts. Since this layer displays at scales of 1:4,622,324 or greater, adjusting the BBox coordinates in the URL is necessary </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Subbarrio')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=Subbarrios,Subbarrios Labels&amp;STYLES=default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=18.3366,-64.9147,18.3539,-64.8332&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                               <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for the subbarrios. Since this layer displays at scales of 1:36112 or greater, adjusting the BBox coordinates in the URL is necessary </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Estate')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=Estates,Estates Labels&amp;STYLES=default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=-14.874757,-171.060408,71.465321,146.356228&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                 <xsl:call-template name="tigerWMS_CurrentWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for the Estates. Since this layer displays at scales of 1:36112 or greater, adjusting the BBox coordinates in the URL is necessary</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'All Roads')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_PhysicalFeatures/MapServer/WmsServer?REQUEST=GetMap&amp;amp;SERVICE=WMS&amp;amp;VERSION=1.3.0%200%20&amp;amp;LAYERS=Primary%20Roads,Secondary%20Roads,Local%20Roads&amp;amp;STYLES%20=%20default,%20default,default&amp;amp;FORMAT=image/svg+xml&amp;amp;BGCOLOR=0xFFFFFF&amp;amp;TRANSPARENT=FALSE&amp;amp;CRS=EPSG:4326&amp;amp;BBOX=14.898513,-170.881184,49.203544,49.203544,-65.082949&amp;amp;WIDTH=891&amp;amp;HEIGHT=751</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                               <xsl:call-template name="PhysicalFeaturesWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for primary and secondary roads. Since this layer displays at scales of 1:90,000 or greater, adjusting the BBox coordinates in the URL is necessary</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Primary Roads')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_PhysicalFeatures/MapServer/WmsServer?REQUEST=GetMap&amp;amp;SERVICE=WMS&amp;amp;VERSION=1.3.0 &amp;amp;LAYERS=Primary Roads, Primary Roads Labels&amp;amp;STYLES= default,default&amp;amp;FORMAT=image/svg+xml&amp;amp;BGCOLOR=0xFFFFFF&amp;amp;TRANSPARENT=FALSE&amp;amp;CRS=EPSG:4326&amp;amp;BBOX= -14.898513,-170.881184,49.203544,49.203544,-65.082949&amp;amp;WIDTH=891&amp;amp;HEIGHT=751</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                               <xsl:call-template name="PhysicalFeaturesWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for the primary roads. Since this layer displays at scales of 1:1,400,000 or greater, adjusting the BBox coordinates in the URL is necessary</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Area Landmark')">
                                <xsl:element name="gmd:linkage">
                                    <xsl:element name="gmd:URL">https://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_PhysicalFeatures/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0 &amp;LAYERS=National Park Service Areas,National Park Service Areas Labels,Correctional Facilities,Correctional Facilities Labels,Colleges and Universities,Colleges and Universities Labels&amp;STYLES= default,default,default,default,default,default &amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=FALSE&amp;CRS=EPSG:4326&amp;BBOX= -14.898513,-170.881184,49.203544,49.203544,-65.082949&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
                                </xsl:element>
                                <xsl:call-template name="appProfileWMS"/>
                                <xsl:call-template name="PhysicalFeaturesWMS"/>
                                <xsl:element name="gmd:description">
                                    <xsl:element name="gco:CharacterString">This web mapping service contains the layer for Area Landmarks. Since this layer displays at scales of 1:144,448 or greater, adjusting the BBox coordinates in the URL is necessary</xsl:element>
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