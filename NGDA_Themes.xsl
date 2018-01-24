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
    
    
    <xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p>mrf2ISOParent/NGDA_Themes.xsl</xd:p>
            <xd:p>called by the mrf2ISOParent/11_gmd_identificationInfo.xsl template</xd:p>
           
            <xd:p><xd:b>Created on:</xd:b> Jan 27, 2014</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            
            <xd:ul>
                <xd:li>Template             Explanation                                                                                     </xd:li>
                <xd:li>NGDAThemes           Master template handling all the NGDA themes                                                    </xd:li>
                <xd:li>BiotaKey             Template for handling the Biota Theme                                                           </xd:li>
                <xd:li>CultResKey           Template for handling the Cultural Resources Theme                                              </xd:li>
                <xd:li>GovUnitKey           Template for handling the Governmental Units and Administrative and Statistical Boundaries Theme</xd:li>
                <xd:li>TransKey             Template for handling the Transportation Theme                                                  </xd:li>
                <xd:li>ClimateKey           Template for handling the Climate and Weather Theme                                             </xd:li>
                <xd:li>ElevationKey         Template for handling the Elevation Theme                                                       </xd:li>
                <xd:li>GeoKey               Template for handling the Geology Theme                                                         </xd:li>
                <xd:li>ImageKey             Template for handling the Imagery Theme                                                         </xd:li>
                <xd:li>InlandWaterKey       Template for handling the Water Inland Theme                                                    </xd:li>
                <xd:li>OceansKey            Template for handling the Water Oceans and Coasts Theme                                         </xd:li>
                <xd:li>CadKey               Template for handling the Cadastre Theme                                                        </xd:li>
                <xd:li>PropKey              Template for handling the Real Property Theme                                                   </xd:li>
                <xd:li>UtilKey              Template for handling the Utilities Theme                                                       </xd:li>
                
            </xd:ul>
            <xd:p>
                Initial   Date              Description
                MMC        4/23/2013        Changed the formatting on the gmd:keyword/gco:characterstring element so that the entire element appear on one line.
                MMC       1/8/2014          Modified to work on the MRF Format.
                MMC       2/2/2015          Modified the if to work with version 2.0 
                MMC       2/11/2015         Updated the NGDA keywords for each theme and the general NGDA keywords
            </xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:template name="NGDAThemes">
        <xsl:variable name="FullTitle" select="/MRF/Identification_Information/Citation/Title"/>
        <xsl:variable name="postPara" select="substring-after($FullTitle,'(')"/>
        <xsl:variable name="CensusTheme" select="substring-before($postPara,')')"/>
        <xsl:variable name="ContainsPoint"
            select="contains($FullTitle,'Current Point Landmarks Shapefile')"/>
        <xsl:variable name="ContainsAreaLM"
            select="contains($FullTitle,'Current Area Landmark Shapefile')"/>
        <xsl:variable name="ContainsFaces"
            select="contains($FullTitle,'Faces-Area Landmark Relationship File')"/>
        <xsl:variable name="FileName" select="/MRF/Metadata_Reference_Information/Metadata_File_Identifier"/>

<xsl:if test="contains($FileName,'tl_')">
       <!--   <xsl:comment>In the ngda template!!!!!!!!!!!!!!!!</xsl:comment>-->
        <!--<xsl:comment>containsFaces <xsl:value-of select="$ContainsFaces"/></xsl:comment> -->
        <!--  <xsl:for-each select="/MRF/Identification_Information/Keywords/Theme_ISO/Theme_Keywordd"> -->
        <xsl:for-each select="/MRF/Identification_Information/Keywords/Theme_ISO/Theme_Keyword">
            <!--<xsl:comment> Current Keyword: <xsl:value-of select="."/></xsl:comment> -->
            <!--<xsl:comment> In the loop!!!!!!!!!!!!!</xsl:comment> -->
            <!--<xsl:comment>Full Title: <xsl:value-of select="$FullTitle"/></xsl:comment> -->
            <!--<xsl:comment>postPara:<xsl:value-of select="$postPara"/></xsl:comment> -->
            <!--<xsl:comment>Census Theme: <xsl:value-of select="$CensusTheme"/></xsl:comment> -->
            <xsl:variable name="ThemeKey" select="normalize-space(.)"/>
            <xsl:if  test="$ThemeKey ='Biota' or $ThemeKey ='biota' or  $ThemeKey ='Boundaries' or $ThemeKey ='boundaries' or $ThemeKey ='Economy' or 
                                $ThemeKey ='ClimatologyMeteorologyAtmosphere' or $ThemeKey ='climatologyMeteorologyAtmosphere' or $ThemeKey ='Elevation' or 
                                $ThemeKey='elevation' or $ThemeKey ='GeoscientificInformation' or $ThemeKey='geoscientificInformation' or $ThemeKey ='Environment'
                                or $ThemeKey='ImageryBaseMapsEarthCover' or $ThemeKey='imageryBaseMapsEarthCover'  or $ThemeKey='InlandWaters' or $ThemeKey='inlandWaters'
                                or $ThemeKey='Oceans' or $ThemeKey='oceans' or $ThemeKey='PlanningCadastre' or $ThemeKey='planningCadastre' or $ThemeKey='Structure' or
                                $ThemeKey='structure' or $ThemeKey ='Transportation' or $ThemeKey ='transportation' or $ThemeKey='UtilitiesCommunication' or 
                                $ThemeKey='utilitiesCommunication'">

                <!--<xsl:comment>ThemeKey:<xsl:value-of select="$ThemeKey"/></xsl:comment> -->

                <xsl:choose>
                    <xsl:when test="$ThemeKey ='Boundaries'">
                      <!--  <xsl:comment>In the test (UC)!!!!!!!!!!!!!!!!!!</xsl:comment>-->
                        <xsl:choose>
                            <xsl:when test="$CensusTheme='TAZ'">
                                <xsl:element name="gmd:descriptiveKeywords">
                                    <xsl:element name="gmd:MD_Keywords">
                                        <xsl:call-template name="TransKey"/>
                                        <xsl:call-template name="ndaDefaultThemeKeyword"/>
                                        <xsl:call-template name="thesTypeName"/>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($FullTitle,'All Lines')">
                              <!--  <xsl:comment>No NGDA Theme!!!!!</xsl:comment> -->  
                            </xsl:when>
                            <xsl:when test="contains($FullTitle,'Area Hydrography')">
                             <!--   <xsl:comment>No NGDA Theme!!!!!</xsl:comment>  -->
                            </xsl:when>
                            <xsl:when test="contains($FullTitle,'Military Installation')">
                               <xsl:comment>No NGDA Theme!!!!!</xsl:comment> 
                            </xsl:when>
                            <xsl:when test="contains($FullTitle,'Current Area Landmark Shapefile')">
                                <!--  <xsl:comment>cultural</xsl:comment>-->
                                <xsl:call-template name="CultResKey"/>
                                <xsl:call-template name="ndaDefaultThemeKeyword"/>
                                <xsl:call-template name="thesTypeName"/>
                            </xsl:when>
                            <xsl:when test="contains($FullTitle,'Point Landmark')">
                                <!-- <xsl:comment> point lm</xsl:comment> -->
                                <xsl:call-template name="CultResKey"/>
                                <xsl:call-template name="ndaDefaultThemeKeyword"/>
                                <xsl:call-template name="thesTypeName"/>
                            </xsl:when>
                            <xsl:when test="$ContainsAreaLM='true'">
                                <xsl:element name="gmd:descriptiveKeywords">
                                    <!--  <xsl:comment>landmark</xsl:comment>-->
                                    <xsl:element name="gmd:MD_Keywords">
                                        <xsl:call-template name="CultResKey"/>
                                        <xsl:call-template name="ndaDefaultThemeKeyword"/>
                                        <xsl:call-template name="thesTypeName"/>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="$ContainsFaces='true'">
                                <xsl:element name="gmd:descriptiveKeywords">
                                   <!-- <xsl:comment>In the faces!!!!!!!!!!!!!!</xsl:comment> --> 
                                    <xsl:element name="gmd:MD_Keywords">
                                        <xsl:call-template name="CultResKey"/>
                                        <xsl:call-template name="ndaDefaultThemeKeyword"/>
                                        <xsl:call-template name="thesTypeName"/>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:element name="gmd:descriptiveKeywords">
                                     <!-- <xsl:comment>In the otherwise!!!!!!!!!!!!!!</xsl:comment> -->
                                    <xsl:element name="gmd:MD_Keywords">
                                        <xsl:call-template name="GovUnitKey"/>
                                        <xsl:call-template name="ndaDefaultThemeKeyword"/>
                                        <xsl:call-template name="thesTypeName"/>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>

                    <xsl:when test="$ThemeKey ='boundaries'">
                       <!--   <xsl:comment>In the test (lc)!!!!!!!!!!!!!!!!!!</xsl:comment> -->
                        <xsl:choose>
                            <xsl:when test="$CensusTheme='TAZ'">
                                <xsl:element name="gmd:descriptiveKeywords">
                                    <xsl:element name="gmd:MD_Keywords">
                                        <xsl:call-template name="TransKey"/>
                                        <xsl:call-template name="ndaDefaultThemeKeyword"/>
                                        <xsl:call-template name="thesTypeName"/>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($FullTitle,'All Lines')">
                                <!--<xsl:comment>No NGDA Theme!!!!!</xsl:comment> -->
                            </xsl:when>
                            <xsl:when test="contains($FullTitle,'Area Hydrography')">
                                <!--<xsl:comment>No NGDA Theme!!!!!</xsl:comment> -->
                            </xsl:when>
                            <xsl:when test="contains($FullTitle,'Current Area Landmark Shapefile')">
                                <xsl:call-template name="CultResKey"/>
                                <xsl:call-template name="ndaDefaultThemeKeyword"/>
                                <xsl:call-template name="thesTypeName"/>
                            </xsl:when>
                            <xsl:when test="contains($FullTitle,'Point Landmark')">
                                <xsl:call-template name="CultResKey"/>
                                <xsl:call-template name="ndaDefaultThemeKeyword"/>
                                <xsl:call-template name="thesTypeName"/>
                            </xsl:when>
                            <xsl:when test="$ContainsAreaLM='true'">
                                <xsl:element name="gmd:descriptiveKeywords">
                                    <xsl:element name="gmd:MD_Keywords">
                                        <xsl:call-template name="CultResKey"/>
                                        <xsl:call-template name="ndaDefaultThemeKeyword"/>
                                        <xsl:call-template name="thesTypeName"/>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="$ContainsFaces='true'">
                                <xsl:element name="gmd:descriptiveKeywords">
                                    <xsl:element name="gmd:MD_Keywords">
                                        <xsl:call-template name="CultResKey"/>
                                        <xsl:call-template name="ndaDefaultThemeKeyword"/>
                                        <xsl:call-template name="thesTypeName"/>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:element name="gmd:descriptiveKeywords">
                                    <xsl:element name="gmd:MD_Keywords">
                                        <xsl:call-template name="GovUnitKey"/>
                                        <xsl:call-template name="ndaDefaultThemeKeyword"/>
                                        <xsl:call-template name="thesTypeName"/>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>

                    <xsl:when test="$ThemeKey='Structure'">
                        <!--<xsl:comment>In this one!!!!!!!!!!!!!!</xsl:comment> -->
                        <xsl:choose>
                            <xsl:when test="$ContainsPoint='true'">
                                <xsl:element name="gmd:descriptiveKeywords">
                                    <xsl:element name="gmd:MD_Keywords">
                                        <xsl:call-template name="CultResKey"/>
                                        <xsl:call-template name="ndaDefaultThemeKeyword"/>
                                        <xsl:call-template name="thesTypeName"/>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($FullTitle,'Point')">
                                <xsl:element name="gmd:descriptiveKeywords">
                                    <xsl:element name="gmd:MD_Keywords">
                                        <xsl:call-template name="CultResKey"/>
                                        <xsl:call-template name="ndaDefaultThemeKeyword"/>
                                        <xsl:call-template name="thesTypeName"/>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:element name="gmd:descriptiveKeywords">
                                    <xsl:element name="gmd:MD_Keywords">
                                        <xsl:call-template name="PropKey"/>
                                        <xsl:call-template name="ndaDefaultThemeKeyword"/>
                                        <xsl:call-template name="thesTypeName"/>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>

                    <xsl:when test="$ThemeKey='structure'">
                        <xsl:choose>
                            <xsl:when test="$ContainsPoint='true'">
                                <xsl:element name="gmd:descriptiveKeywords">
                                    <xsl:element name="gmd:MD_Keywords">
                                        <xsl:call-template name="CultResKey"/>
                                        <xsl:call-template name="ndaDefaultThemeKeyword"/>
                                        <xsl:call-template name="thesTypeName"/>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:element name="gmd:descriptiveKeywords">
                                    <xsl:element name="gmd:MD_Keywords">
                                        <xsl:call-template name="PropKey"/>
                                        <xsl:call-template name="ndaDefaultThemeKeyword"/>
                                        <xsl:call-template name="thesTypeName"/>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:otherwise>
                        </xsl:choose>

                    </xsl:when>

                    <xsl:when test="$ThemeKey ='Transportation'">

                        <xsl:choose>
                            <xsl:when test="contains($FullTitle,'Primary and Secondary Roads')">
                                <!--<xsl:comment>No NGDA Theme!!!!!</xsl:comment> -->
                            </xsl:when>
                            <xsl:when
                                test="contains($FullTitle,'Address Range-Feature Name Relationship File')">
                                <!--<xsl:comment>addrn</xsl:comment> -->
                                <xsl:element name="gmd:descriptiveKeywords">
                                    <xsl:element name="gmd:MD_Keywords">
                                        <xsl:call-template name="TransKey"/>
                                        <xsl:call-template name="ndaDefaultThemeKeyword"/>
                                        <xsl:call-template name="thesTypeName"/>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($FullTitle,'Address Range-Feature')">
                                <!--<xsl:comment>No NGDA Theme!!!!!</xsl:comment> -->
                            </xsl:when>
                            <xsl:when test="contains($FullTitle,'All Lines')">
                                <!--<xsl:comment>No NGDA Theme!!!!!</xsl:comment> -->
                            </xsl:when>
                            <xsl:when
                                test="contains($FullTitle,'Current Feature Names Relationship File')">
                                <!--<xsl:comment>No NGDA Theme!!!!!</xsl:comment> -->
                            </xsl:when>
                            <xsl:when test="contains($FullTitle,'Current Other Identifiers')">
                                <!--<xsl:comment>No NGDA Theme!!!!!</xsl:comment> -->
                            </xsl:when>
                            <xsl:when test="contains($FullTitle,'Primary Roads')"> </xsl:when>
                            <xsl:when test="contains($FullTitle,'Rails')"> </xsl:when>
                            <xsl:otherwise>
                                <!--<xsl:comment> default</xsl:comment> -->
                                <xsl:element name="gmd:descriptiveKeywords">
                                    <xsl:element name="gmd:MD_Keywords">
                                        <xsl:call-template name="TransKey"/>
                                        <xsl:call-template name="ndaDefaultThemeKeyword"/>
                                        <xsl:call-template name="thesTypeName"/>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>

                    <xsl:when test="$ThemeKey ='transportation'">
                        <xsl:choose>
                            <xsl:when test="contains($FullTitle,'Primary and Secondary Roads')">
                                <!--<xsl:comment>No NGDA Theme!!!!!</xsl:comment> -->
                            </xsl:when>
                            <xsl:when
                                test="contains($FullTitle,'Address Range-Feature Name Relationship File')">
                                <!--<xsl:comment>addrn</xsl:comment> -->
                                <xsl:element name="gmd:descriptiveKeywords">
                                    <xsl:element name="gmd:MD_Keywords">
                                        <xsl:call-template name="TransKey"/>
                                        <xsl:call-template name="ndaDefaultThemeKeyword"/>
                                        <xsl:call-template name="thesTypeName"/>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($FullTitle,'Feature Name Relationship File')">
                                <xsl:element name="gmd:descriptiveKeywords">
                                    <xsl:element name="gmd:MD_Keywords">
                                        <xsl:call-template name="TransKey"/>
                                        <xsl:call-template name="ndaDefaultThemeKeyword"/>
                                        <xsl:call-template name="thesTypeName"/>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:when>
                            <xsl:when test="contains($FullTitle,'Address Range-Feature')">
                                <!--<xsl:comment>No NGDA Theme!!!!!</xsl:comment> -->
                            </xsl:when>
                            <xsl:when test="contains($FullTitle,'All Lines')">
                                <!--<xsl:comment>No NGDA Theme!!!!!</xsl:comment> -->
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:element name="gmd:descriptiveKeywords">
                                    <xsl:element name="gmd:MD_Keywords">
                                        <xsl:call-template name="TransKey"/>
                                        <xsl:call-template name="ndaDefaultThemeKeyword"/>
                                        <xsl:call-template name="thesTypeName"/>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>

                </xsl:choose>

                <!-- <xsl:call-template name="thesTypeName"/>
                                    </xsl:element>
                                </xsl:element> -->
            </xsl:if>
        </xsl:for-each>
</xsl:if>
    </xsl:template>

    <xsl:template name="BiotaKey">
        <xsl:element name="gmd:keyword">
            <xsl:element name="gco:CharacterString">Biota Theme</xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="CultResKey">
        <xsl:element name="gmd:keyword">
            <xsl:element name="gco:CharacterString">Cultural Resources Theme </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="GovUnitKey">
        <xsl:element name="gmd:keyword">
            <xsl:element name="gco:CharacterString">Governmental Units and Administrative and Statistical Boundaries Theme </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="TransKey">
        <xsl:element name="gmd:keyword">
            <xsl:element name="gco:CharacterString">Transportation Theme</xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="ClimateKey">
        <xsl:element name="gmd:keyword">
            <xsl:element name="gco:CharacterString">Climate and Weather Theme</xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="ElevationKey">
        <xsl:element name="gmd:keyword">
            <xsl:element name="gco:CharacterString">Elevation Theme</xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="GeoKey">
        <xsl:element name="gmd:keyword">
            <xsl:element name="gco:CharacterString">Geology Theme</xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="ImageKey">
        <xsl:element name="gmd:keyword">
            <xsl:element name="gco:CharacterString">Imagery Theme</xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="InlandWaterKey">
        <xsl:element name="gmd:keyword">
            <xsl:element name="gco:CharacterString">Water Inland Theme</xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="OceansKey">
        <xsl:element name="gmd:keyword">
            <xsl:element name="gco:CharacterString">Water Oceans and Coasts Theme</xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="CadKey">
        <xsl:element name="gmd:keyword">
            <xsl:element name="gco:CharacterString">Cadastre Theme</xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="PropKey">
        <xsl:element name="gmd:keyword">
            <xsl:element name="gco:CharacterString">Real Property Theme</xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="UtilKey">
        <xsl:element name="gmd:keyword">
            <xsl:element name="gco:CharacterString">Utilities Theme</xsl:element>
        </xsl:element>
    </xsl:template>


    <xsl:template name="ndaDefaultThemeKeyword">
        <xsl:element name="gmd:keyword">
          <xsl:element name="gco:CharacterString">NGDA Portfolio Themes</xsl:element>
        </xsl:element> 
        <xsl:element name="gmd:keyword">
            <xsl:element name="gco:CharacterString">NGDA</xsl:element>
        </xsl:element>
        <xsl:element name="gmd:keyword">
            <xsl:element name="gco:CharacterString">National Geospatial Data Asset</xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="thesTypeName">

        <xsl:element name="gmd:type">
            <xsl:element name="gmd:MD_KeywordTypeCode">
                <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_KeywordTypeCode</xsl:attribute>
                <xsl:attribute name="codeListValue">theme</xsl:attribute>
                <xsl:attribute name="codeSpace">005</xsl:attribute> theme </xsl:element>
        </xsl:element>

        <xsl:element name="gmd:thesaurusName">
            <xsl:element name="gmd:CI_Citation">

                <xsl:element name="gmd:title">
                    <xsl:element name="gco:CharacterString">NGDA Portfolio Themes</xsl:element>
                </xsl:element>

                <xsl:element name="gmd:date">
                    <xsl:element name="gmd:CI_Date">
                        <xsl:element name="gmd:date">
                            <xsl:element name="gco:Date">2010-02-01</xsl:element>
                        </xsl:element>

                        <xsl:element name="gmd:dateType">
                            <xsl:element name="gmd:CI_DateTypeCode">
                                <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_DateTypeCode</xsl:attribute>
                                <xsl:attribute name="codeListValue">revision</xsl:attribute>
                                <xsl:attribute name="codeSpace">003</xsl:attribute> revision
                            </xsl:element>
                        </xsl:element>



                    </xsl:element>
                </xsl:element>

                <xsl:element name="gmd:otherCitationDetails">
                    <xsl:element name="gco:CharacterString">http://www.fgdc.gov/initiatives/resources/2013-2-1-ngda-data-themes-fgdc-sc-revised.pdf</xsl:element>
                </xsl:element>

            </xsl:element>
        </xsl:element>


    </xsl:template>

</xsl:stylesheet>
