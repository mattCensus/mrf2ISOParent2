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
                        <xd:p>mrf2ISOParent/09_gmd_spatialRepresentationInfo.xsl</xd:p>
                        <xd:p>called by the mrf2ISOParent/MRF2ISOParent.xsl template</xd:p>
                        <xd:p>XSLT stylesheet that transforms the SDTS_Point_and_Vector_Object_Type MRF element into the gmd:geometricObjectType ISO element
                                FGDC format file into a ISO file.This stylesheet consists of two templates: spatialRepresentationInfo and SDTSListValueTemp. The  
                                spatialRepresentationInfo template sets up the gmd:MD_GeometricObjects and gmd:geometricObjectCount elements. The SDTSListValueTemp
                                template sets up the md:geometricObjectType/gmd:MD_GeometricObjectTypeCode and translates the value found in
                                /MRF/Spatial_Data_Organization_Information/SDTS_Terms_Description/SDTS_Point_and_Vector_Object_Type of the MIF standard into the correct
                                ISO value based  on the MD_GeometricObjectTypeCode codelist, which is found on page 97 of the ISO standard.</xd:p>
                        <xd:p><xd:b>Created on:</xd:b> Jan 27, 2014</xd:p>
                        <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
                        <xd:ul>
                                <xd:li>Template                            Explanation                                      </xd:li>
                                <xd:li>SDTSListValueTemp                   Handles the gmd:geometricObjectType element      </xd:li> 
                                <xd:li>spatialRepresentationInfo           Handles the gmd:spatialRepresentationInfo element</xd:li>
                        </xd:ul>
                        <xd:p>
                                Initial   Date         Description
                                MMC       12/11/2013   Modified so that if no zip file is supplied and/or no theme is supplied in the /MRF/Identification_Information/Citation/Online_Linkage MIF element, a new URL
                                                        is created that has both the correct theme and the correct zip file name. This file has also been modified so that TIGER\Line files ('tl') can be handled. 
                                MMC       2/2/2015     Modified the if to work with version 2.0 
                        </xd:p>
                </xd:desc>
        </xd:doc>
        
        <xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>
        <xsl:variable name="MetDate" select="//metadata/metainfo/metd"/>
        <!-- <xsl:variable name="SDTSPntVot" select="//metadata/spdoinfo/ptvctinf/sdtsterm/sdtstype"/> -->



        <xsl:template name="SDTSListValueTemp">
                <xsl:variable name="SDTSPntVot"
                        select="/MRF/Spatial_Data_Organization_Information/SDTS_Terms_Description/SDTS_Point_and_Vector_Object_Type"/>
                <xsl:choose>
                        <xsl:when test="$SDTSPntVot='Point'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >point</xsl:attribute>
                                                <xsl:attribute name="codeSpace">004</xsl:attribute>
                                                point </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->
                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Entity point'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >point</xsl:attribute>
                                                <xsl:attribute name="codeSpace">004</xsl:attribute>
                                                point </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->
                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Label point'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >point</xsl:attribute>
                                                <xsl:attribute name="codeSpace">004</xsl:attribute>
                                                point </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->
                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Area Point'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >point</xsl:attribute>
                                                <xsl:attribute name="codeSpace">004</xsl:attribute>
                                                point </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->
                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Node, planar graph'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >surface</xsl:attribute>
                                                <xsl:attribute name="codeSpace">006</xsl:attribute>
                                                surface </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->

                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Node, network'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >surface</xsl:attribute>
                                                <xsl:attribute name="codeSpace">006</xsl:attribute>
                                                surface </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->
                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='String'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >curve</xsl:attribute>
                                                <xsl:attribute name="codeSpace">003</xsl:attribute>
                                                curve </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->

                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='LINK'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >curve</xsl:attribute>
                                                <xsl:attribute name="codeSpace">003</xsl:attribute>
                                                curve </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->
                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Complete chain'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >curve</xsl:attribute>
                                                <xsl:attribute name="codeSpace">003</xsl:attribute>
                                                curve </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->
                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Area chain'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >composite</xsl:attribute>
                                                <xsl:attribute name="codeSpace">002</xsl:attribute>
                                                curve </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->
                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Network chain, planar graph'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >surface</xsl:attribute>
                                                <xsl:attribute name="codeSpace">006</xsl:attribute>
                                                surface </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->
                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Network chain, nonplanar graph'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >composite</xsl:attribute>
                                                <xsl:attribute name="codeSpace">002</xsl:attribute>
                                                composite </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->

                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Circular arc, three point center'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >composite</xsl:attribute>
                                                <xsl:attribute name="codeSpace">002</xsl:attribute>
                                                composite </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->
                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Elliptical arc'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >curve</xsl:attribute>
                                                <xsl:attribute name="codeSpace">003</xsl:attribute>
                                                curve </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->

                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Uniform B-spline'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >curve</xsl:attribute>
                                                <xsl:attribute name="codeSpace">003</xsl:attribute>
                                                curve </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->

                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Piecewise Bezier'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >curve</xsl:attribute>
                                                <xsl:attribute name="codeSpace">003</xsl:attribute>
                                                curve </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->
                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Ring with mixed composition'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >composite</xsl:attribute>
                                                <xsl:attribute name="codeSpace">002</xsl:attribute>
                                                composite </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->
                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Ring composed of strings'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >composite</xsl:attribute>
                                                <xsl:attribute name="codeSpace">002</xsl:attribute>
                                                composite </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->

                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Ring composed of chains'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >composite</xsl:attribute>
                                                <xsl:attribute name="codeSpace">002</xsl:attribute>
                                                composite </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->
                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Ring composed of arcs'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >composite</xsl:attribute>
                                                <xsl:attribute name="codeSpace">002</xsl:attribute>
                                                composite </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->

                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='G-polygon'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >complex</xsl:attribute>
                                                <xsl:attribute name="codeSpace">001</xsl:attribute>
                                                complex </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->
                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='GT-polygon composed of rings'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >complex</xsl:attribute>
                                                <xsl:attribute name="codeSpace">001</xsl:attribute>
                                                complex </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->

                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='GT-polygon composed of chains'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >complex</xsl:attribute>
                                                <xsl:attribute name="codeSpace">001</xsl:attribute>
                                                complex </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->
                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Universe polygon composed of rings'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >complex</xsl:attribute>
                                                <xsl:attribute name="codeSpace">001</xsl:attribute>
                                                complex </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->
                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Universe polygon composed of chains'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >complex</xsl:attribute>
                                                <xsl:attribute name="codeSpace">001</xsl:attribute>
                                                complex </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->
                        </xsl:when>
                </xsl:choose>
        </xsl:template>

        <xsl:template name="spatialRepresentationInfo" match="/">
                <xsl:text>&#10;</xsl:text>
                <xsl:comment> This is the ptvctinf/sdtsterm/sdtstype from section 3 of the FGDC Standard (Spatial Data Organization) </xsl:comment>
                <xsl:if test="/MRF/Spatial_Data_Organization_Information/SDTS_Terms_Description">
                <xsl:element name="gmd:spatialRepresentationInfo">
                        <!-- <xsl:comment> comment 1  </xsl:comment> -->
                        <xsl:element name="gmd:MD_VectorSpatialRepresentation">
                                <!-- <xsl:comment> comment 2  </xsl:comment> -->
                                <xsl:element name="gmd:geometricObjects">

                                        <!-- getting the values for the codeListValue and codeSpace attributes -->
                                        <!-- These values are based on the SDTS Point and Vector Object Type FGDC element (spdoinfo/ptvctinf/sdtstype) -->
                                        <!-- MD_GeometricObjects -->

                                        <xsl:element name="gmd:MD_GeometricObjects">

                                                <xsl:if
                                                  test="/MRF/Spatial_Data_Organization_Information/SDTS_Terms_Description/SDTS_Point_and_Vector_Object_Type">
                                                  <xsl:call-template name="SDTSListValueTemp"/>
                                                </xsl:if>

                                                <xsl:if
                                                  test="/MRF/Spatial_Data_Organization_Information/SDTS_Terms_Description/Point_and_Vector_Object_Count">
                                                  <xsl:element name="gmd:geometricObjectCount">
                                                  <xsl:element name="gco:Integer">
                                                  <xsl:apply-templates
                                                  select="/MRF/Spatial_Data_Organization_Information/SDTS_Terms_Description/Point_and_Vector_Object_Count"
                                                  />
                                                  </xsl:element>
                                                  <!-- gco:Integer -->
                                                  </xsl:element>
                                                  <!-- gmd:geometricObjectCount -->
                                                </xsl:if>

                                        </xsl:element>
                                        <!-- gmd:geometricObjectsType -->


                                </xsl:element>
                                <!-- gmd:geometricObjects -->
                        </xsl:element>
                        <!-- gmd:MD_VectorSpatialRepresentation -->
                </xsl:element>
                <!-- gmd:spatialRepresentationInfo -->

</xsl:if>
        </xsl:template>
</xsl:stylesheet>
