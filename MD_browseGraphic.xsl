<?xml version="1.0" encoding="UTF-8"?>
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
    xmlns:gmi="http://www.isotc211.org/2005/gmi"
    xmlns:ci="http://www.isotc211.org/schemas/2012/ci" exclude-result-prefixes="fn grp xs xsi xsl xd"
    xmlns="http://www.isotc211.org/2005/gfc">
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Apr 13, 2016</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p>mrf2ISOParent/MD_browseGraphic.xsl</xd:p>
            <xd:p>called on by the mrf2ISOParent/11_gmd_identificationInfo.xsl</xd:p>
            <xd:p>This stylesheet calls the creates a browse graphic for use on data.gov</xd:p>
            <xd:p>
                Initial             Date         Description
                MMC                 2/10/2017    Added URLS for the NECTA, CNECTA and NECTADIV browse graphics
                MMC                 2/10/2017    Changed all the "http" to "https"
                </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="browseGraphic">
        <xsl:element name="gmd:graphicOverview">
            <xsl:element name="gmd:MD_BrowseGraphic">
                <xsl:element name="gmd:fileName">
                    <xsl:call-template name="browseUrl"/>
                </xsl:element>
                <xsl:element name="gmd:fileDescription">
                    <xsl:element name="gco:CharacterString">URL for the TigerWeb Web Mapping Service</xsl:element>
                </xsl:element>
                <xsl:element name="gmd:fileType">
                    <xsl:element name="gco:CharacterString">URL for the TigerWeb Web Mapping Service</xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="browseUrl">
        <xsl:variable name="Name" select="/MRF/Identification_Information[1]/Citation[1]/Title[1]"/>
        <xsl:variable name="postComma1" select="substring-after($Name,',')"/>
        <xsl:variable name="postComma2" select="substring-after($postComma1,',')"/>
        <xsl:variable name="postComma3" select="substring-after($postComma2,',')"/>
        <xsl:variable name="theme" select="substring-after($postComma3,',')"/>
        
       <!-- <xsl:comment>Name:<xsl:value-of select="$Name"/></xsl:comment>
            <xsl:comment>postComma3<xsl:value-of select="$postComma3"/></xsl:comment> -->
        
        <xsl:choose>
            <xsl:when test="contains($theme,'Current County Subdivision')">
                <xsl:element name="gco:CharacterString">https://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=County Subdivisions,County Subdivisions Labels&amp;STYLES=default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=43.628449,-71.934903,43.706635,-71.346863&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
            </xsl:when>
            <xsl:when test="contains($theme,'Area Landmark' )">
                <xsl:element name="gco:CharacterString"> https://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_PhysicalFeatures/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=National Park Service Areas,National Park Service Areas Labels,Correctional Facilities,Correctional Facilities Labels,Colleges and Universities,Colleges and Universities Labels&amp;STYLES=default,default,default,default,default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=FALSE&amp;CRS=EPSG:4326&amp;BBOX=42.3242,-71.1873,42.4306,-70.9440&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
            </xsl:when>
            <xsl:when test="contains($theme, 'Current Block Group')">
                <xsl:element name="gco:CharacterString">https://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=Census Block Groups,Census Block Groups Labels&amp;STYLES=default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=42.389053,-71.907142,42.52679,-71.879999&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
            </xsl:when>
            <xsl:when test="contains($theme, 'Current Secondary School Districts')">
                <xsl:element name="gco:CharacterString">https://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=Secondary School Districts&amp;STYLES=&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:3857&amp;BBOX=-11679625.942909468,4709198.547476525,-11645573.246808422,4737900.651597611&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
            </xsl:when>
            <xsl:when test="contains($theme, 'Current Consolidated City')">
                <xsl:element name="gco:CharacterString">https://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=Consolidated Cities,Consolidated Cities Labels&amp;STYLES=default, default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=+41.1581676,-073.1316819,+41.2909526,-072.97466503&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
            </xsl:when>
            <xsl:when test="contains($theme, 'Current Elementary School Districts')">
                <xsl:element name="gco:CharacterString">https://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=Elementary School Districts,Elementary School Districts Labels&amp;STYLES=default, default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=+41.3255598,-073.0942359,+41.4663967,-072.8549872&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
            </xsl:when>
            <xsl:when test="contains($theme, 'Census Public Use Microdata Area')">
                <xsl:element name="gco:CharacterString">https://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=2010 Census Public Use Microdata Areas,2010 Census Public Use Microdata Areas Labels&amp;STYLES=default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=41.187053,-72.508142,42.88679,-69.858861&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
            </xsl:when>
            <xsl:when test="contains($theme, 'Census Block')">
                <xsl:element name="gco:CharacterString">https://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=2010 Census Blocks,2010 Census Blocks Labels&amp;STYLES=default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=42.499053,-71.897142,42.52679,-71.889999&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
            </xsl:when>
            <xsl:when test="contains($theme,'2010 Census  Block State')">
                <xsl:element name="gco:CharacterString">https://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=2010 Census Blocks,2010 Census Blocks Labels&amp;STYLES=default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=42.499053,-71.897142,42.52679,-71.889999&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
            </xsl:when>
            <xsl:when test="contains($theme, 'Current Block Group')">
                <xsl:element name="gco:CharacterString">https://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=Census Block Groups,Census Block Groups Labels&amp;STYLES=default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=42.389053,-71.907142,42.52679,-71.879999&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
            </xsl:when>
            <xsl:when test="contains($theme, 'Current Census Tract')">
                <xsl:element name="gco:CharacterString">https://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=Census Tracts,Census Tracts Labels&amp;STYLES=default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=41.187053,-72.508142,42.88679,-69.858861&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
            </xsl:when>
            <xsl:when test="contains($theme, 'Current County Subdivision')">
                <xsl:element name="gco:CharacterString">https://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=County Subdivisions,County Subdivisions Labels&amp;STYLES=default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=43.628449,-71.934903,43.706635,-71.346863&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
            </xsl:when>
            <xsl:when test="contains($theme, 'Current Place')">
                <xsl:element name="gco:CharacterString">https://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=Census Designated Places,Census Designated Places Labels,Incorporated Places,Incorporated Places Labels&amp;STYLES=default,default,default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=42.299053,-71.408142,42.35679,-70.798861&amp;WIDTH=891&amp;HEIGHT=751 </xsl:element>
            </xsl:when>
            <xsl:when test="contains($theme, 'Lower Chamber')">
                <xsl:element name="gco:CharacterString">https://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=2014 State Legislative Districts - Lower,2014 State Legislative Districts - Lower Labels&amp;STYLES=default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=42.299053,-71.408142,42.35679,-70.798861&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
            </xsl:when>
            <xsl:when test="contains($theme,'Upper Chamber')">
                <xsl:element name="gco:CharacterString">https://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=2014 State Legislative Districts - Upper,2014 State Legislative Districts - Upper Labels&amp;STYLES=default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=42.299053,-71.408142,42.35679,-70.798861&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
            </xsl:when>
            <xsl:when test="contains($theme,'Current Unified School Districts')">
                <xsl:element name="gco:CharacterString">https://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=Unified School Districts,Unified School Districts Labels&amp;STYLES=default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=42.299053,-71.408142,42.35679,-70.798861&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
            </xsl:when>
            <xsl:when test="contains($theme,'CNECTA')">
                <xsl:element name="gco:CharacterString">https://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=Combined New England City and Town Areas,Combined New England City and Town Areas Labels&amp;STYLES=default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=41.2381,-72.317142,42.9305,-72.000099&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
            </xsl:when>
            <!-- Current New England City and Town Area -->
            <xsl:when test="contains($theme,'NECTA')">
                <xsl:element name="gco:CharacterString">https://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=Metropolitan New England City and Town Areas,Metropolitan New England City and Town Areas Labels,Micropolitan New England City and Town Areas,Micropolitan New England City and Town Areas Labels&amp;STYLES=default,default,default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=41.2381,-72.317142,42.9305,-72.000099&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
            </xsl:when>
            <xsl:when test="contains($theme,'NECTA Division')">
                <xsl:element name="gco:CharacterString">https://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=New England City and Town Area Divisions,&amp;STYLES=default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=42.1381,-71.897142,42.9305,-71.889999&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
            </xsl:when>
            <xsl:when test="contains($theme,'All Roads')">
                <xsl:element name="gco:CharacterString">https://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_PhysicalFeatures/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp; VERSION=1.3.0%200%20&amp;LAYERS=Primary%20Roads,Secondary%20Roads,Local%20Roads&amp;STYLES%20=%20default,%20default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=FALSE&amp;CRS=EPSG:4326&amp;BBOX=%20+47.5329749,-122.3435865,+47.5969449,-122.2511911,&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
                </xsl:when>
            <xsl:otherwise>
                <xsl:element name="gco:CharacterString">Insert Browse graphic for <xsl:value-of select="$theme"/> here !!!!!!!!!!!!!!!!!!</xsl:element>
            </xsl:otherwise>
            
        </xsl:choose>
        
    </xsl:template>
</xsl:stylesheet>