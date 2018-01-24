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
    xmlns:ci="http://www.isotc211.org/schemas/2012/ci" exclude-result-prefixes="fn grp xs xsi xsl xd"
    xmlns="http://www.isotc211.org/2005/gfc">
    
    <xsl:import href="../mrf2ISOParent/ExtraDataQualityTemplate.xsl"/>
    
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p>mrf2ISOParent/boundingCoordinates.xsl</xd:p>
            <xd:p>called by the mrf2ISOParent/11_gmd_identificationInfo.xsl template</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Jan 27, 2014</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            
            <xd:ul>
                <xd:li>Template                    Explanation                                                                               </xd:li>
                <xd:li>boundingCoordinatesMaster   Master template for the Parent file Bounding Coordinates                                  </xd:li>
                <xd:li>defalutBoundingCoordinates  Bounding coordinates obtained from the Metadata file for ANRCS and Estates                </xd:li>
                <xd:li>nationalBoundingCoordinates Bounding coordinates for all national files with default coordinates for the entire nation</xd:li>
                
            </xd:ul>
            <xd:p>
                Initial   Date              Description
                MMC       1/8/2014          Modified to work on the MRF Format.
                MMC       2/2/2015          Modified the if to work with version 2.0 
            </xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:template name="boundingCoordinatesMaster" match="/">
        <xsl:variable name="mrfTitle" select="/MRF/Identification_Information/Citation/Title"/>
      <xsl:choose>
          <xsl:when test="contains($mrfTitle,'Alaska Native Regional Corporation')">
              <xsl:call-template name="defalutBoundingCoordinates"/>
          </xsl:when>
          <xsl:otherwise>
              <xsl:call-template name="nationalBoundingCoordinates"/>
          </xsl:otherwise>
      </xsl:choose>
        
    </xsl:template>
    
    <xsl:template name="defalutBoundingCoordinates">
        <xsl:element name="gmd:extent">
            <xsl:element name="gmd:EX_Extent">
                <xsl:attribute name="id">boundingExtent</xsl:attribute>
                
                <xsl:element name="gmd:geographicElement">
                    <xsl:element name="gmd:EX_GeographicBoundingBox">
                        <xsl:attribute name="id">boundingGeographicBoundingBox</xsl:attribute>
                        
                        <xsl:element name="gmd:westBoundLongitude">
                            <xsl:element name="gco:Decimal">
                                <xsl:value-of select="/MRF/Identification_Information/Spatial_Domain/West_Bounding_Coordinate"/>
                            </xsl:element>
                            <!-- gco:Decimal -->
                        </xsl:element>
                        <!-- gmd:westBoundLongitude -->
                        
                        
                        <xsl:element name="gmd:eastBoundLongitude">
                            <xsl:element name="gco:Decimal">
                                <xsl:value-of select="/MRF/Identification_Information/Spatial_Domain/East_Bounding_Coordinate"/>
                            </xsl:element>
                            <!-- gco:Decimal -->
                        </xsl:element>
                        <!-- gmd:eastBoundLongitude -->
                        
                        
                        <xsl:element name="gmd:southBoundLatitude">
                            <xsl:element name="gco:Decimal">
                                <xsl:value-of select="//MRF/Identification_Information/Spatial_Domain/South_Bounding_Coordinate"/>
                            </xsl:element>
                            <!-- gco:Decimal -->
                        </xsl:element>
                        <!-- gmd:southBoundLongitude -->
                        
                        
                        <xsl:element name="gmd:northBoundLatitude">
                            <xsl:element name="gco:Decimal">
                                <xsl:value-of select="/MRF/Identification_Information/Spatial_Domain/North_Bounding_Coordinate"/>
                            </xsl:element>
                            <!-- gco:Decimal -->
                        </xsl:element>
                        <!-- gmd:southBoundLongitude -->
                        
                        
                    </xsl:element>
                    <!-- gmd:EX_GeographicBoundingBox -->
                </xsl:element>
                <!-- gmd:geographicElement -->
                
                
                <xsl:element name="gmd:temporalElement">
                    <xsl:element name="gmd:EX_TemporalExtent">
                        <xsl:attribute name="id">boundingTemporalExtent</xsl:attribute>
                        <!-- <xsl:attribute name="gml:id">boundingTimePeriodExtent</xsl:attribute> -->
                        <xsl:element name="gmd:extent">
                            <xsl:element name="gml:TimePeriod">
                                <xsl:attribute name="gml:id">boundingTemporalExtentA</xsl:attribute>
                                
                                <xsl:element name="gml:description">
                                    <xsl:value-of select="/MRF/Identification_Information/Time_Period_of_Content/Currentness_Reference"/>
                                </xsl:element>
                                
                                <xsl:call-template name="begDateFormatTimePeriod"/>
                                <xsl:call-template name="endDateFormatTimePeriod"/>
                                
                            </xsl:element>
                            <!-- gml:TimePeriod -->
                        </xsl:element>
                        <!-- gmd:extent -->
                    </xsl:element>
                    <!-- gmd:EX_TemporalExtent -->
                </xsl:element>
                <!-- gmd:temporalElement -->
            </xsl:element>
            <!-- gmd:EX_Extent -->
        </xsl:element>
        <!-- gmd:extent -->
    </xsl:template>
    
    <xsl:template name="nationalBoundingCoordinates">
        <xsl:element name="gmd:extent">
            <xsl:element name="gmd:EX_Extent">
                <xsl:attribute name="id">boundingExtent</xsl:attribute>
                
                <xsl:element name="gmd:geographicElement">
                    <xsl:element name="gmd:EX_GeographicBoundingBox">
                        <xsl:attribute name="id">boundingGeographicBoundingBox</xsl:attribute>
                        
                        <xsl:element name="gmd:westBoundLongitude">
                            <xsl:element name="gco:Decimal">-179.231086</xsl:element>
                            <!-- gco:Decimal -->
                        </xsl:element>
                        <!-- gmd:westBoundLongitude -->
                        
                        
                        <xsl:element name="gmd:eastBoundLongitude">
                            <xsl:element name="gco:Decimal">179.859681</xsl:element>
                            <!-- gco:Decimal -->
                        </xsl:element>
                        <!-- gmd:eastBoundLongitude -->
                        
                        
                        <xsl:element name="gmd:southBoundLatitude">
                            <xsl:element name="gco:Decimal">-14.601813</xsl:element>
                            <!-- gco:Decimal -->
                        </xsl:element>
                        <!-- gmd:southBoundLongitude -->
                        
                        
                        <xsl:element name="gmd:northBoundLatitude">
                            <xsl:element name="gco:Decimal">71.441059</xsl:element>
                            <!-- gco:Decimal -->
                        </xsl:element>
                        <!-- gmd:southBoundLongitude -->
                        
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>