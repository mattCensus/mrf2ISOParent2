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
            <xd:p>mrf2ISO/NGDAAltTitle.xsl</xd:p>
            <xd:p> called by the  template</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Apr 19, 2016</xd:p>
            <xd:p><xd:b>Author:</xd:b> matt</xd:p>
            <xd:p>Initial    Date          Description
                   MMC       6/20/17       Created to provide Alternate Titles for NGDA tagged datasets
            </xd:p>
        </xd:desc>
    </xd:doc>
    
    
    <xsl:template name="AltTitle">
        <xsl:variable name="title" select="/MRF/Identification_Information/Citation/Title"/>
        <xsl:variable name="postComma1" select="substring-after($title,',')"/>
        <xsl:variable name="postComma2" select="substring-after($postComma1,',')"/>
        <xsl:variable name="levelOfGeo" select="substring-before($postComma2,',')"/>
        <xsl:variable name="theme" select="substring-after($postComma2,',')"/>
        
        <!-- <xsl:comment>title<xsl:value-of select="$title"/></xsl:comment>
        <xsl:comment>postComma1<xsl:value-of select="$postComma1"/></xsl:comment>
        <xsl:comment>postComma2<xsl:value-of select="$postComma2"/></xsl:comment>
        <xsl:comment>levelOfGeo<xsl:value-of select="$levelOfGeo"/></xsl:comment>
        <xsl:comment>theme<xsl:value-of select="$theme"/></xsl:comment> -->
        
      
                        
                        <!-- every theme will here -->
                        <xsl:choose>
                            <xsl:when test="contains($theme,'Current Secondary School Districts')">
                                <xsl:element name="gmd:alternateTitle">
                                    <xsl:element name="gco:CharacterString">National Geospatial Data Asset (NGDA) Secondary School Districts</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Consolidated City')">
                                <xsl:element name="gmd:alternateTitle">
                                    <xsl:element name="gco:CharacterString">National Geospatial Data Asset (NGDA) Consolidated City</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Elementary School Districts')">
                                <xsl:element name="gmd:alternateTitle">
                                    <xsl:element name="gco:CharacterString">National Geospatial Data Asset (NGDA) Elementary School Districts</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Congressional District')">
                                <xsl:element name="gmd:alternateTitle">
                                    <xsl:element name="gco:CharacterString">National Geospatial Data Asset (NGDA) 115th Congressional District</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current American Indian Tribal Subdivision')">
                                <xsl:element name="gmd:alternateTitle">
                                    <xsl:element name="gco:CharacterString">National Geospatial Data Asset (NGDA) American Indian Tribal Subdivision</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'AIANNH')">
                                <xsl:element name="gmd:alternateTitle">
                                    <xsl:element name="gco:CharacterString">National Geospatial Data Asset (NGDA) American Indian/Alaska Native/Native Hawaiian (AIANNH) Homeland Areas</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'CNECTA')">
                                <xsl:element name="gmd:alternateTitle">
                                    <xsl:element name="gco:CharacterString">National Geospatial Data Asset (NGDA) Combined New England City and Town Area</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'CSA')">
                                <xsl:element name="gmd:alternateTitle">
                                    <xsl:element name="gco:CharacterString">National Geospatial Data Asset (NGDA) Combined Statistical Area</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current County and Equivalent')">
                                <xsl:element name="gmd:alternateTitle">
                                    <xsl:element name="gco:CharacterString">National Geospatial Data Asset (NGDA) County and Equivalent</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Metropolitan Division')">
                                <xsl:element name="gmd:alternateTitle">
                                    <xsl:element name="gco:CharacterString">National Geospatial Data Asset (NGDA) Metropolitan Division</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'CBSA')">
                                <xsl:element name="gmd:alternateTitle">
                                    <xsl:element name="gco:CharacterString">National Geospatial Data Asset (NGDA)  Metropolitan Statistical Area/Micropolitan Statistical Area (CBSA)</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'NECTA Division')">
                                <xsl:element name="gmd:alternateTitle">
                                    <xsl:element name="gco:CharacterString">National Geospatial Data Asset (NGDA) NECTA Division</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'State and Equivalent')">
                                <xsl:element name="gmd:alternateTitle">
                                    <xsl:element name="gco:CharacterString">National Geospatial Data Asset (NGDA) State and Equivalent</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Tribal Block Group')">
                                <xsl:element name="gmd:alternateTitle">
                                    <xsl:element name="gco:CharacterString">National Geospatial Data Asset (NGDA) Tribal Block Group</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Tribal Census Tract')">
                                <xsl:element name="gmd:alternateTitle">
                                    <xsl:element name="gco:CharacterString">National Geospatial Data Asset (NGDA) Tribal Census Tract</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'ANRC')">
                                <xsl:element name="gmd:alternateTitle">
                                    <xsl:element name="gco:CharacterString">National Geospatial Data Asset (NGDA) Alaska Native Regional Corporation (ANRC)</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Census  Urban Area')">
                                <xsl:element name="gmd:alternateTitle">
                                    <xsl:element name="gco:CharacterString">National Geospatial Data Asset (NGDA) Urban Area</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'ZCTA5')">
                                <xsl:element name="gmd:alternateTitle">
                                    <xsl:element name="gco:CharacterString">National Geospatial Data Asset (NGDA) ZIP Code Tabulation Area</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'NECTA')">
                                <xsl:element name="gmd:alternateTitle">
                                    <xsl:element name="gco:CharacterString">National Geospatial Data Asset (NGDA) New England City and Town Area</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'PUMA')">
                                <xsl:element name="gmd:alternateTitle">
                                    <xsl:element name="gco:CharacterString">National Geospatial Data Asset (NGDA) Public Use Microdata Area (PUMA)</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Block Group')">
                                <xsl:element name="gmd:alternateTitle">
                                    <xsl:element name="gco:CharacterString">National Geospatial Data Asset (NGDA) Block Group</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Census Tract')">
                                <xsl:element name="gmd:alternateTitle">
                                    <xsl:element name="gco:CharacterString">National Geospatial Data Asset (NGDA) Census Tract</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Census  Block State-based')">
                                <xsl:element name="gmd:alternateTitle">
                                    <xsl:element name="gco:CharacterString">National Geospatial Data Asset (NGDA) Census  Block</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current County Subdivision')">
                                <xsl:element name="gmd:alternateTitle">
                                    <xsl:element name="gco:CharacterString">National Geospatial Data Asset (NGDA) County Subdivision</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Place')">
                                <xsl:element name="gmd:alternateTitle">
                                    <xsl:element name="gco:CharacterString">National Geospatial Data Asset (NGDA) Place</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'State Legislative District (SLD) Lower Chamber')">
                                <xsl:element name="gmd:alternateTitle">
                                    <xsl:element name="gco:CharacterString">National Geospatial Data Asset (NGDA) State Legislative District (SLD) Lower Chamber</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current State Legislative District (SLD) Upper Chamber')">
                                <xsl:element name="gmd:alternateTitle">
                                    <xsl:element name="gco:CharacterString">National Geospatial Data Asset (NGDA) State Legislative District (SLD) Upper Chamber</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Unified School Districts')">
                                <xsl:element name="gmd:alternateTitle">
                                    <xsl:element name="gco:CharacterString">National Geospatial Data Asset (NGDA) Unified School Districts</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Subbarrio')">
                                <xsl:element name="gmd:alternateTitle">
                                    <xsl:element name="gco:CharacterString">National Geospatial Data Asset (NGDA) Subbarrio (Subminor Civil Division)</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Estate')">
                                <xsl:element name="gmd:alternateTitle">
                                    <xsl:element name="gco:CharacterString">National Geospatial Data Asset (NGDA) Estate (U.S. Virgin Islands)</xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($theme,'All Roads')">
                                <xsl:element name="gmd:alternateTitle">
                                    <xsl:element name="gco:CharacterString">National Geospatial Data Asset (NGDA) Roads (All Roads)</xsl:element>
                                </xsl:element>         
                            </xsl:when>
                            <xsl:when test="contains($theme,'Area Landmark')">
                                <xsl:element name="gmd:alternateTitle">
                                    <xsl:element name="gco:CharacterString">National Geospatial Data Asset (NGDA) Area Landmark</xsl:element>
                                </xsl:element>
                            </xsl:when>                            
                            
                        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>