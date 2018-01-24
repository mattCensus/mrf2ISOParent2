<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gfc="http://www.isotc211.org/2005/gfc"
    xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gmx="http://www.isotc211.org/2005/gmx"
    xmlns:gsr="http://www.isotc211.org/2005/gsr" xmlns:gss="http://www.isotc211.org/2005/gss"
    xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:gml="http://www.opengis.net/gml/3.2"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xd">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Jan 29, 2014</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>

    <xsl:variable name="oldTitle" select="/MRF/Identification_Information/Citation/Title"/>

    <xsl:template name="extent">

        <xsl:choose>
            <xsl:when test="contains($oldTitle,'TIGER/Line Shapefile')">
                <xsl:variable name="postComma1" select="substring-after($oldTitle,',')"/>
                <xsl:variable name="postcomma2" select="substring-after($postComma1,',')"/>
                <xsl:variable name="levelOfGeo" select="substring-before($postcomma2,',')"/>
                <xsl:variable name="postComma3" select="substring-after($postcomma2,',')"/>
                        <xsl:variable name="theme" select="substring-after($postComma3,',')"/>
                <xsl:choose>
                    <xsl:when test="contains($levelOfGeo,'state')">
                        
                        <xsl:choose>


                            <xsl:when test="contains($theme,'ANRC')">
                                <xsl:call-template name="ANRC"/>
                            </xsl:when>
                            <xsl:when test="contains($theme,'Current Estate')">
                                <xsl:call-template name="estate"/>
                            </xsl:when>
                            <xsl:when test="contains($oldTitle,'UGA')">
                                <xsl:call-template name="UGA"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:call-template name="defaultExtent"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="contains($levelOfGeo,'county')">
                        <xsl:call-template name="defaultExtent"/>
                    </xsl:when>
                    <xsl:when test="contains($levelOfGeo,'nation')"> 
                        <xsl:choose>
                            <xsl:when test="contains($theme,'NECTA')">
                                <xsl:call-template name="Necta"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:call-template name="defaultExtent"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="defaultExtent">
        <xsl:element name="gmd:extent">
            <xsl:element name="gmd:EX_Extent">
                <xsl:attribute name="id">boundingExtent</xsl:attribute>

                <xsl:element name="gmd:geographicElement">
                    <xsl:element name="gmd:EX_GeographicBoundingBox ">
                        <xsl:attribute name="id">boundingGeographicBoundingBox</xsl:attribute>

                        <xsl:element name="gmd:westBoundLongitude">
                            <xsl:element name="gco:Decimal">-179.231086</xsl:element>
                        </xsl:element>

                        <xsl:element name="gmd:eastBoundLongitude">
                            <xsl:element name="gco:Decimal">179.859681</xsl:element>
                        </xsl:element>

                        <xsl:element name="gmd:southBoundLatitude">
                            <xsl:element name="gco:Decimal">-14.601813</xsl:element>
                        </xsl:element>

                        <xsl:element name="gmd:northBoundLatitude">
                            <xsl:element name="gco:Decimal">71.441059</xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>

                <xsl:call-template name="temporal"/>

            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="temporal">
        <xsl:element name="gmd:temporalElement">
            <xsl:element name="gmd:EX_TemporalExtent">
                <xsl:element name="gmd:extent">
                    <xsl:element name="gml:TimePeriod ">
                        <xsl:attribute name="gml:id">boundingTemporalExtent1</xsl:attribute>
                        <xsl:element name="gml:description">
                            <xsl:value-of
                                select="/MRF/Identification_Information/Time_Period_of_Content/Currentness_Reference"
                            />
                        </xsl:element>
                        <xsl:element name="gml:beginPosition">
                            <xsl:value-of
                                select="/MRF/Identification_Information/Time_Period_of_Content/Beginning_Date"
                            />
                        </xsl:element>
                        <xsl:element name="gml:endPosition">
                            <xsl:value-of
                                select="/MRF/Identification_Information/Time_Period_of_Content/Ending_Date"
                            />
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="ANRC">
        <xsl:element name="gmd:extent">
            <xsl:element name="gmd:EX_Extent">
                <xsl:attribute name="id">boundingExtent</xsl:attribute>

                <xsl:element name="gmd:geographicElement">
                    <xsl:element name="gmd:EX_GeographicBoundingBox ">
                        <xsl:attribute name="id">boundingGeographicBoundingBox</xsl:attribute>

                        <xsl:element name="gmd:westBoundLongitude">
                            <xsl:element name="gco:Decimal">-179.231086</xsl:element>
                        </xsl:element>

                        <xsl:element name="gmd:eastBoundLongitude">
                            <xsl:element name="gco:Decimal">179.859681</xsl:element>
                        </xsl:element>

                        <xsl:element name="gmd:southBoundLatitude">
                            <xsl:element name="gco:Decimal">51.175092</xsl:element>
                        </xsl:element>

                        <xsl:element name="gmd:northBoundLatitude">
                            <xsl:element name="gco:Decimal">71.441059</xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>

                <xsl:call-template name="temporal"/>

            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="estate">
        <xsl:element name="gmd:extent">
            <xsl:element name="gmd:EX_Extent">
                <xsl:attribute name="id">boundingExtent</xsl:attribute>

                <xsl:element name="gmd:geographicElement">
                    <xsl:element name="gmd:EX_GeographicBoundingBox ">
                        <xsl:attribute name="id">boundingGeographicBoundingBox</xsl:attribute>

                        <xsl:element name="gmd:westBoundLongitude">
                            <xsl:element name="gco:Decimal">-65.154118</xsl:element>
                        </xsl:element>

                        <xsl:element name="gmd:eastBoundLongitude">
                            <xsl:element name="gco:Decimal">-64.512674</xsl:element>
                        </xsl:element>

                        <xsl:element name="gmd:southBoundLatitude">
                            <xsl:element name="gco:Decimal">17.623468</xsl:element>
                        </xsl:element>

                        <xsl:element name="gmd:northBoundLatitude">
                            <xsl:element name="gco:Decimal">18.464984</xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>

                <xsl:call-template name="temporal"/>

            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="UGA">
        <xsl:element name="gmd:extent">
            <xsl:element name="gmd:EX_Extent">
                <xsl:attribute name="id">boundingExtent</xsl:attribute>

                <xsl:element name="gmd:geographicElement">
                    <xsl:element name="gmd:EX_GeographicBoundingBox ">
                        <xsl:attribute name="id">boundingGeographicBoundingBox</xsl:attribute>

                        <xsl:element name="gmd:westBoundLongitude">
                            <xsl:element name="gco:Decimal">-124.703541</xsl:element>
                        </xsl:element>

                        <xsl:element name="gmd:eastBoundLongitude">
                            <xsl:element name="gco:Decimal">-116.463262</xsl:element>
                        </xsl:element>

                        <xsl:element name="gmd:southBoundLatitude">
                            <xsl:element name="gco:Decimal">41.991794</xsl:element>
                        </xsl:element>

                        <xsl:element name="gmd:northBoundLatitude">
                            <xsl:element name="gco:Decimal">46.299099</xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>

                <xsl:call-template name="temporal"/>

            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="Necta">
        <xsl:element name="gmd:extent">
            <xsl:element name="gmd:EX_Extent">
                <xsl:attribute name="id">boundingExtent</xsl:attribute>
                
                <xsl:element name="gmd:geographicElement">
                    <xsl:element name="gmd:EX_GeographicBoundingBox ">
                        <xsl:attribute name="id">boundingGeographicBoundingBox</xsl:attribute>
                        
                        <xsl:element name="gmd:westBoundLongitude">
                            <xsl:element name="gco:Decimal">-179.231086</xsl:element>
                        </xsl:element>
                        
                        <xsl:element name="gmd:eastBoundLongitude">
                            <xsl:element name="gco:Decimal">179.859681</xsl:element>
                        </xsl:element>
                        
                        <xsl:element name="gmd:southBoundLatitude">
                            <xsl:element name="gco:Decimal">-14.601813</xsl:element>
                        </xsl:element>
                        
                        <xsl:element name="gmd:northBoundLatitude">
                            <xsl:element name="gco:Decimal">71.441059</xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
                
                <xsl:call-template name="temporal"/>
                
            </xsl:element>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
