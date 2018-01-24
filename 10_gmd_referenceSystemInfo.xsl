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
         <xd:p>mrf2ISOParent/10_gmd_referenceSystemInfo.xsl</xd:p>
         <xd:p>called by the mrf2ISOParent/MRF2ISOParent.xsl template</xd:p>
         <xd:p>XSLT stylesheet that transforms the //MRF/Spatial_Data_Organization_Information[1]/Indirect_Spatial_Reference[1] MIF standard into the  
            gmd:referenceSystemIdentifier element</xd:p>
         <xd:p><xd:b>Created on:</xd:b> Jan 27, 2014</xd:p>
         <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
         <xd:ul>
            <xd:li>Template                        Explanation                                              </xd:li>
            <xd:li>referenceSystemInfo             Handles the gmd:referenceSystemInfo element              </xd:li> 
            <xd:li>kmlReferenceSystemInfo          Handles the gmd:referenceSystemInfo element for KML files</xd:li>
         </xd:ul>
         <xd:p>
            Initial   Date                           Description
            MMc       4/16/2012                      Elimanated the ISO gmd:code element. This element is now handled by the ReferenceSystemCodes template.  
            MMC       12/04/2013                     Inserted the gmd:code element
            MMC       12/11/2013                     Inserted a choice structure so that the gmd:referenceSystemInfo does not appear if the Indirect_Spatial_Reference element is not in the MIF file.
            MMC       12/11/2013                     Changed the path of the ISO gmd:RS_Identifier so that it transforms the MIF Indirect_Spatial_Reference element 
            MMC       1/8/2014                       Modified to work on the MRF Format.
            MMC       2/2/2015                       Modified the if to work with version 2.0 
         </xd:p>
      </xd:desc>
   </xd:doc>
   <xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>


   <xsl:template name="referenceSystemInfo" match="/">


      <!-- <xsl:if test="//MRF/Spatial_Data_Organization_Information[1]/Indirect_Spatial_Reference[1]" or test="/MIF/Map_Projection_Name" > -->

      <xsl:choose>
         <xsl:when test="/MRF/Spatial_Data_Organization_Information/Indirect_Spatial_Reference">

            <xsl:text>&#10;</xsl:text>
            <xsl:comment>This is the indirect spatial reference of section 3 and the Projection Information from Section 4 of the FGDC Standard</xsl:comment>
            
            <xsl:element name="gmd:referenceSystemInfo">
               <xsl:element name="gmd:MD_ReferenceSystem">
                  <xsl:element name="gmd:referenceSystemIdentifier">
                     <xsl:element name="gmd:RS_Identifier">

                        <xsl:element name="gmd:code">
                           <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                           <!-- <xsl:call-template name="ReferenceSystemCodes"/> -->
                        </xsl:element>
                        <!-- gmd:code -->

                        <xsl:if test="//MRF/Spatial_Data_Organization_Information/Indirect_Spatial_Reference">
                           <xsl:element name="gmd:codeSpace">
                              <xsl:element name="gco:CharacterString">
                                 <xsl:value-of select="/MRF/Spatial_Data_Organization_Information/Indirect_Spatial_Reference"/>
                              </xsl:element>
                              <!-- gco:CharacterString -->
                           </xsl:element>
                           <!-- gmd:codeSpace -->
                        </xsl:if>

                     </xsl:element>
                     <!-- gmd:RS_Identifier -->
                  </xsl:element>
                  <!-- gmd:referenceSystemIdentifier -->
               </xsl:element>
               <!-- gmd:MD_ReferenceSystem -->
            </xsl:element>
            <!-- gmd:referenceSystemInfo -->
            <!-- </xsl:if> -->
         </xsl:when>
      </xsl:choose>
   </xsl:template>
   
   <xsl:template name="kmlReferenceSystemInfo">
      <xsl:text>&#10;</xsl:text>
      <xsl:comment>This is the Projection Information from Section 4 of the FGDC Standard</xsl:comment>
      <xsl:element name="gmd:referenceSystemInfo">
         <xsl:element name="gmd:MD_ReferenceSystem">
            <xsl:element name="gmd:referenceSystemIdentifier">
               <xsl:element name="gmd:RS_Identifier">
                  
                  <xsl:element name="gmd:authority">
                     <xsl:element name="gmd:CI_Citation">
                        
                        <xsl:element name="gmd:title">
                           <xsl:element name="gco:CharacterString">WGS 84 / World Mercator</xsl:element>
                        </xsl:element>
                        
                        <xsl:element name="gmd:date">
                           <xsl:element name="gmd:CI_Date">
                              
                              <xsl:element name="gmd:date">
                                 <xsl:element name="gco:Date">2006-06-02</xsl:element>
                              </xsl:element>
                              
                              <xsl:element name="gmd:dateType">
                                 <!--   <xsl:text>&#10;</xsl:text>-->
                                 <xsl:element name="gmd:CI_DateTypeCode">
                                    <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_DateTypeCode</xsl:attribute>
                                    <xsl:attribute name="codeListValue">revision</xsl:attribute>
                                    revision
                                 </xsl:element>
                              </xsl:element><!--gmd:dateType  -->
                           </xsl:element><!-- gmd:CI_Date -->
                        </xsl:element><!-- gmd:date -->
                        
                        <xsl:element name="gmd:citedResponsibleParty">
                           <xsl:element name="gmd:CI_ResponsibleParty">
                              <xsl:element name="gmd:contactInfo">
                                 <xsl:element name="gmd:CI_Contact">
                                    <xsl:element name="gmd:onlineResource">
                                       <xsl:element name="gmd:CI_OnlineResource">
                                          <xsl:element name="gmd:linkage">
                                             <xsl:element name="gmd:URL"> http://www.epsg-registry.org/export.htm?gml=urn:ogc:def:crs:EPSG::3395</xsl:element>
                                          </xsl:element><!-- gmd:linkage -->
                                       </xsl:element><!-- gmd:CI_OnlineResource-  -->
                                    </xsl:element> <!-- gmd:onlineResource -->
                                 </xsl:element><!-- gmd:CI_Contact  -->
                              </xsl:element> <!-- gmd:contactInfo -->
                              
                              <xsl:element name="gmd:role">
                                 <xsl:element name="gmd:CI_RoleCode">
                                    <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_RoleCode</xsl:attribute>
                                    <xsl:attribute name="codeListValue">resourceProvider</xsl:attribute>
                                    resourceProvider
                                 </xsl:element>
                              </xsl:element><!-- gmd:role -->
                              
                           </xsl:element> <!-- gmd:citedResponsibleParty -->
                        </xsl:element> <!-- gmd:CI_ResponsibleParty-->
                     </xsl:element> <!-- gmd:CI_Citation -->
                  </xsl:element> <!-- gmd:authority -->
                  
                  <xsl:element name="gmd:code">
                     <xsl:element name="gco:CharacterString">urn:ogc:def:crs:EPSG::3395</xsl:element>
                  </xsl:element>
                  
               </xsl:element> <!--gmd:RS_Identifier  -->
            </xsl:element> <!-- gmd:MD_ReferenceSystem -->
         </xsl:element> <!-- gmd:MD_ReferenceSystem -->
      </xsl:element><!-- gmd:referenceSystemInfo -->
   </xsl:template>
   
   <xsl:template name="spatialReferenceSystemInfo">
      <xsl:if test="/MRF/Spatial_Reference_Information[1]/Horizontal_Coordinate_System_Definition[1]/Geodetic_Model[1]">
         <xsl:variable name="DatumName" select="/MRF/Spatial_Reference_Information[1]/Horizontal_Coordinate_System_Definition[1]/Geodetic_Model[1]/Horizontal_Datum_Name[1]"/>
         <xsl:choose>
            <xsl:when test="contains($DatumName,'North American Datum of 1983')">
               <xsl:element name="gmd:referenceSystemInfo">
                  <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/65f8b220-95ed-11e0-aa80-0800200c9a66</xsl:attribute>
                  <xsl:attribute name="xlink:title">North American Datum 1983</xsl:attribute>
               </xsl:element>
            </xsl:when>
            <xsl:when test="contains($DatumName, 'WGS 84 / World Mercator')">
               <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/895cc120-95ed-11e0-aa80-0800200c9a66</xsl:attribute>
               <xsl:attribute name="xlink:title">WGS 84 / World Mercator</xsl:attribute>
            </xsl:when>
         </xsl:choose>
      </xsl:if>
   </xsl:template>
</xsl:stylesheet>
