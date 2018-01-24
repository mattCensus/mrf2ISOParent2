<?xml version="1.0" encoding="UTF-8" ?>

<!--
   Name:  12_gmd:contentInfo.xsl
   Author:  Matthew J. McCready
   Date:  20110601
   Description:  XSLT stylesheet that provides the link to the feature catolog, which contains the entity and attribute information. This stylesheet calls the ExtraContent.xsl stylesheet for the
                  FeatureType and ContentTitle templates. This stylesheet consists of two templates: contentInfo and featureCatalogueCitationDateA.
                  The contentInfo template consists of the main body of the contentInfo section. 
                  The featureCatalogueCitationDateA template is called by the contentInfo template and handles the format of the date element.
   Modification History:
      Initial   Date      Change Request ID   Description
      MMC          07/07/2011                 Changed the contentInfo to gmd:contentInfo
      MMC          07/07/2011                 Created the featureCatalogueCitationDate template to handle the date under the CI_Citation package
                                               changed CI_Citation gmd:CI_Citation.
      MMC          07/07/2011                 Added the gco:CharacterString under the gmd:title element.
      MMC          03/27/2012                 Modified to transform MIF Files  
      MMC          04/17/2012                 Created the featureCatalogueCitationDateA to handle dates for the gmd:CI_Datepackage. This package indicates when the EA
                                               file was created.   
      MMC          04/18/2012                 Eliminated the gmd:featureTypes and gmd:title elements and replaced them with template calls. These elements are now handled by the
                                               FeatureType and ContentTitle templates in the ExtraContent.xsl stylesheet.
      MMC          04/19/2012                 Changed the $Metdate value from Metadata_Date to Edition.
      MMC          06/01/2012                 Inserted the FC_CitedResponsibleParty template to deal with the URL for the EA file. This is basically the CI_ResponsibleParty/CI_Contact
                                               packages.
      MMC          12/04/2013                 Ensured that all the calls to the ISO codelist have the correct URL. 
      MMC          12/13/2013                 Corrected the gco:date value for MIF Edition Dates that only have a year. Also corrected the  
      MMC          1/8/2014                   Modified to work on the MRF Format      
-->


<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gco="http://www.isotc211.org/2005/gco"
        xmlns:xlink="http://www.w3.org/1999/xlink">
        <xsl:import href="../mrf2ISO/05_gmd_contact.xsl"/>
        <xsl:import href="../mrf2ISO/ExtraContent.xsl"/>
        <xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>



        <xsl:template name="contentInfo" match="/">
                <xsl:comment>This section provides the link for the file containing the Entity and
                        Attribute Information. </xsl:comment>
                <xsl:text>
</xsl:text>
                <xsl:element name="gmd:contentInfo">
                        <xsl:element name="gmd:MD_FeatureCatalogueDescription">


                                <!--   <xsl:element name="gmd:includedWithDataset"> -->
                                <!-- <xsl:comment>calling the included with Dataset
                                        template</xsl:comment>-->
                                <xsl:call-template name="includedWithDatasetA"/>
                                <!--</xsl:element>
                                 gmd:includedWithDataset -->


                                <!-- <xsl:comment> calling the FeatureType Template </xsl:comment> -->
                                <xsl:call-template name="FeatureType"/>

                                <xsl:element name="gmd:featureCatalogueCitation">
                                        <xsl:element name="gmd:CI_Citation">



                                                <xsl:call-template name="ContentTitle"/>
                                                <xsl:element name="gmd:date">
                                                  <xsl:element name="gmd:CI_Date">
                                                  <!-- <xsl:element name="gmd:date"> -->


                                                  <!--  <xsl:comment> Calling the featureCatalogueCitationDate Template </xsl:comment> -->
                                                  <xsl:text>
</xsl:text>
                                                  <xsl:call-template
                                                  name="featureCatalogueCitationDateA"/>
                                                  <!-- <xsl:comment> Post Template</xsl:comment> -->
                                                  <xsl:text>
</xsl:text>
                                                  <!-- </xsl:element> -->
                                                  <!-- gmd:date -->


                                                  <xsl:element name="gmd:dateType">

                                                  <xsl:element name="gmd:CI_DateTypeCode">
                                                  <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_DateTypeCode</xsl:attribute>
                                                  <xsl:attribute name="codeListValue"
                                                  >publication</xsl:attribute>
                                                  <xsl:attribute name="codeSpace"
                                                  >002</xsl:attribute>
                                                  </xsl:element>
                                                  <!-- gmd:CI_DateTypeCode -->

                                                  </xsl:element>
                                                  <!-- gmd:dateType -->

                                                  <!-- </xsl:element> -->
                                                  <!-- gmd:date -->
                                                  </xsl:element>
                                                  <!-- gmd:CI_Date -->
                                                </xsl:element>
                                                <!-- gmd:date -->

                                                <xsl:call-template
                                                  name="FCCitedResponsiblePartyList"/>

                                                <xsl:element name="gmd:otherCitationDetails">
                                                  <xsl:variable name="baseURL"
                                                  >http://meta.geo.census.gov/data/existing/decennial/GEO</xsl:variable>
                                                  <xsl:variable name="fileName"
                                                  select="/MRF/Metadata_Reference_Information/Metadata_File_Identifier"/>
                                                  <xsl:variable name="firstTwo"
                                                  select="substring($fileName,1,2)"/>
                                                  <!-- <xsl:comment>firstTwo:<xsl:value-of select="$firstTwo"/></xsl:comment> -->
                                                  <xsl:choose>
                                                  <xsl:when test="$firstTwo='tl'">
                                                  <!--  <xsl:comment>in the tl section!!!!!!!!!!</xsl:comment> -->
                                                  <xsl:variable name="nextPart"
                                                  >/GPMB/TIGERline/</xsl:variable>
                                                  <!-- Change this every year!!!!!!!!!!!!!!!!!!!!!!!! -->
                                                  <!-- tl_2013_09009_areawater.shp.xml -->
                                                  <xsl:variable name="folder">TIGER2014</xsl:variable>

                                                  <xsl:variable name="postUnder"
                                                  select="substring-after($fileName,'_')"/>
                                                  <xsl:variable name="year"
                                                  select="substring-before($postUnder,'_')"/>
                                                  <xsl:variable name="postUnder2"
                                                  select="substring-after($postUnder,'_')"/>
                                                  <xsl:variable name="postUnder3"
                                                  select="substring-after($postUnder2,'_')"/>
                                                  <xsl:variable name="theme"
                                                  select="substring-before($postUnder3,'.')"/>
                                                  <xsl:variable name="eaFile"
                                                  select="concat($year,'_',$theme,'.ea.iso.xml')"/>
                                                  <xsl:variable name="newFile"
                                                  select="concat($baseURL,$nextPart,$folder,'/',$theme,'/',$eaFile)"/>

                                                  <xsl:element name="gco:CharacterString">
                                                  <xsl:value-of select="$newFile"/>
                                                  </xsl:element>
                                                  </xsl:when>
                                                  <xsl:when test="$firstTwo='cb'">
                                                  <xsl:variable name="nextPart"
                                                  >/CPMB/boundary/</xsl:variable>
                                                  <!-- Change this every year!!!!!!!!!!!!!!!!!!!!!!!! -->
                                                  <!-- cb_rd13_06_sldl_500k.xml -->
                                                  <xsl:variable name="folder">2013gz</xsl:variable>
                                                  <!-- Change this every year!!!!!!!!!!!!!!!!!!!!!!!! -->
                                                  <xsl:variable name="year">2013</xsl:variable>
                                                  <xsl:variable name="postUnder"
                                                  select="substring-after($fileName,'_')"/>
                                                  <xsl:variable name="postUnder2"
                                                  select="substring-after($postUnder,'_')"/>
                                                  <xsl:variable name="postUnder3"
                                                  select="substring-after($postUnder2,'_')"/>
                                                  <xsl:variable name="theme"
                                                  select="substring-before($postUnder3,'.')"/>
                                                  <xsl:variable name="eaFile"
                                                  select="concat($year,'_',$theme,'.ea.iso.xml')"/>
                                                  <xsl:variable name="newFile"
                                                  select="concat($baseURL,$nextPart,$folder,'/',$theme,'/',$eaFile)"/>

                                                  <xsl:element name="gco:CharacterString">
                                                  <xsl:value-of select="$newFile"/>
                                                  </xsl:element>
                                                  </xsl:when>
                                                  </xsl:choose>
                                                  <!-- gco:CharacterString -->
                                                </xsl:element>
                                                <!-- gmd:otherCitationDetails -->



                                        </xsl:element>
                                        <!-- CI_Citation -->
                                </xsl:element>
                                <!-- gmd:featureCatalogueCitation -->


                        </xsl:element>
                        <!-- gmd:MD_FeatureCatalogueDescription -->
                </xsl:element>
                <!--  contentInfo -->

        </xsl:template>

        <xsl:template name="includedWithDatasetA">
                <xsl:element name="gmd:includedWithDataset">
                        <xsl:choose>

                                <xsl:when
                                        test="/MRF/Entity_and_Attribute_Information/Detailed_Description/Entity_Type/Entity_Type_Label">
                                        <xsl:element name="gco:Boolean">true</xsl:element>
                                </xsl:when>
                                <xsl:when
                                        test="/MRF/Entity_and_Attribute_Information/Overview_Description/Entity_and_Attribute_Overview">
                                        <xsl:element name="gco:Boolean">false</xsl:element>
                                </xsl:when>
                                <xsl:otherwise>
                                        <xsl:element name="gco:Boolean">false</xsl:element>
                                </xsl:otherwise>
                        </xsl:choose>
                </xsl:element>
        </xsl:template>


        <xsl:template name="featureCatalogueCitationDateA">
                <xsl:text>
</xsl:text>
                <xsl:variable name="MetDate"
                        select="/MRF/Identification_Information/Citation/Edition"/>
                <xsl:variable name="year" select="substring($MetDate,1,4)"/>
                <xsl:variable name="month" select="substring($MetDate,5,2)"/>
                <xsl:variable name="monthLength" select="string-length($month)"/>
                <xsl:variable name="day" select="substring($MetDate,7,2)"/>
                <xsl:variable name="dayLength" select="string-length($day)"/>
                <xsl:variable name="dateStampLength"
                        select="string-length(/MRF/Identification_Information/Citation/Edition)"/>


                <xsl:choose>
                        <xsl:when test="$dayLength>0">
                                <xsl:variable name="dateFormat"
                                        select="concat($year, '-',$month,'-',$day)"/>
                                <xsl:element name="gmd:date">
                                        <xsl:element name="gco:Date">
                                                <xsl:value-of select="$dateFormat"/>
                                        </xsl:element>
                                </xsl:element>
                        </xsl:when>

                        <xsl:when test="$monthLength >0">
                                <xsl:variable name="dateFormat" select="concat($year, '-',$month)"/>
                                <xsl:element name="gmd:date">
                                        <xsl:element name="gco:Date">
                                                <xsl:value-of select="$dateFormat"/>
                                        </xsl:element>
                                </xsl:element>
                        </xsl:when>

                        <xsl:when test="$dateStampLength>0">

                                <xsl:variable name="dateFormat" select="$year"/>
                                <xsl:element name="gmd:date">
                                        <xsl:element name="gco:Date">
                                                <xsl:value-of select="$dateFormat"/>
                                        </xsl:element>
                                </xsl:element>
                        </xsl:when>

                        <xsl:otherwise>


                                <xsl:element name="gmd:date">
                                        <xsl:attribute name="gco:nilReason">missing </xsl:attribute>
                                        <xsl:value-of select="$MetDate"/>
                                </xsl:element>

                        </xsl:otherwise>


                </xsl:choose>


        </xsl:template>



        <xsl:template name="FC_CitedResponsibleParty">
                <xsl:element name="gmd:citedResponsibleParty">
                        <xsl:element name="gmd:CI_ResponsibleParty">

                                <xsl:element name="gmd:organisationName">
                                        <xsl:element name="gco:CharacterString">
                                                <xsl:value-of
                                                  select="/MRF/Identification_Information/Citation/Originator"
                                                />
                                        </xsl:element>
                                </xsl:element>


                                <xsl:element name="gmd:contactInfo">
                                        <xsl:element name="gmd:CI_Contact">

                                                <xsl:element name="gmd:phone">

                                                  <xsl:element name="gmd:CI_Telephone">

                                                  <xsl:element name="gmd:voice">
                                                  <xsl:element name="gco:CharacterString">
                                                  <xsl:value-of
                                                  select="/MRF/Identification_Information/Point_of_Contact/Contact_Voice_Telephone"
                                                  />
                                                  </xsl:element>
                                                  </xsl:element>
                                                  <!-- gmd:voice -->

                                                  <xsl:element name="gmd:facsimile">
                                                  <xsl:element name="gco:CharacterString">
                                                  <xsl:value-of
                                                  select="/MRF/Identification_Information/Point_of_Contact/Contact_Facsimile_Telephone"
                                                  />
                                                  </xsl:element>
                                                  </xsl:element>
                                                  <!-- gmd:facsimile -->


                                                  </xsl:element>
                                                  <!-- gmd:CI_Telephone -->

                                                </xsl:element>
                                                <!-- gmd:phone -->

                                                <xsl:element name="gmd:address">
                                                  <xsl:element name="gmd:CI_Address">

                                                  <xsl:element name="gmd:deliveryPoint">
                                                  <xsl:element name="gco:CharacterString">
                                                  <xsl:value-of
                                                  select="/MRF/Identification_Information/Point_of_Contact/Contact_Address/Address_Type"
                                                  />
                                                  </xsl:element>
                                                  </xsl:element>
                                                  <!-- gmd:deliveryPoint -->

                                                  <xsl:element name="gmd:city">
                                                  <xsl:element name="gco:CharacterString">
                                                  <xsl:value-of
                                                  select="/MRF/Identification_Information/Point_of_Contact/Contact_Address/State_or_Province"
                                                  />
                                                  </xsl:element>
                                                  </xsl:element>
                                                  <!-- gmd:city -->

                                                  <xsl:element name="gmd:administrativeArea">
                                                  <xsl:element name="gco:CharacterString">
                                                  <xsl:value-of
                                                  select="/MRF/Identification_Information[1]/Point_of_Contact[1]/Contact_Address[1]/State_or_Province[1]"/>

                                                  </xsl:element>
                                                  </xsl:element>
                                                  <!-- gmd:administrativeArea -->

                                                  <xsl:element name="gmd:postalCode">
                                                  <xsl:element name="gco:CharacterString">
                                                  <xsl:value-of
                                                  select="/MRF/Identification_Information/Point_of_Contact/Contact_Address/Postal_Code"
                                                  />
                                                  </xsl:element>
                                                  </xsl:element>
                                                  <!-- gmd:postalCode -->

                                                  <xsl:element name="gmd:country">
                                                  <xsl:element name="gco:CharacterString">
                                                  <xsl:value-of
                                                  select="/MRF/Identification_Information/Point_of_Contact/Contact_Address/Country"
                                                  />
                                                  </xsl:element>
                                                  </xsl:element>
                                                  <!-- gmd:country -->

                                                  <xsl:element name="gmd:electronicMailAddress">
                                                  <xsl:element name="gco:CharacterString">
                                                  <xsl:value-of
                                                  select="/MRF/Identification_Information/Point_of_Contact/Contact_Electronic_Mail_Address"
                                                  />
                                                  </xsl:element>
                                                  </xsl:element>
                                                  <!-- gmd:electronicMailAddress -->

                                                  </xsl:element>
                                                  <!-- gmd:CI_Address -->
                                                </xsl:element>
                                                <!-- gmd:address -->

                                                <xsl:element name="gmd:onlineResource">
                                                  <xsl:element name="gmd:CI_OnlineResource">

                                                  <xsl:element name="gmd:linkage">
                                                  <xsl:element name="gmd:URL">Insert the URL
                                                  here!!!!!!!!!! </xsl:element>
                                                  </xsl:element>
                                                  <!-- gmd:linkage -->


                                                  </xsl:element>
                                                  <!-- gmd:CI_OnlineResource -->
                                                </xsl:element>

                                        </xsl:element>
                                        <!-- gmd:CI_Contact -->
                                </xsl:element>
                                <!-- gmd:contactInfo -->

                                <xsl:element name="gmd:role">

                                        <xsl:element name="gmd:CI_RoleCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_RoleCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >pointofContact</xsl:attribute> pointofContact </xsl:element>
                                        <!-- gmd:CI_RoleCode -->

                                </xsl:element>
                                <!-- gmd:role -->



                        </xsl:element>
                        <!-- gmd:CI_ResponsibleParty -->
                </xsl:element>
                <!--  citedResponsibleParty -->
        </xsl:template>


        <xsl:template name="FCCitedResponsiblePartyList">
               <!-- <xsl:comment>In the FCCitedResponsiblePartyList Template</xsl:comment> -->
                <xsl:variable name="FullContact" select="/MRF/Identification_Information/Citation/Originator"/>
                <xsl:variable name="postComma1" select="substring-after($FullContact,',')"/>
                <xsl:variable name="division" select="substring-after($postComma1,',')"/>
                <xsl:variable name="hasComma2" select="contains($division,',')"/>

                <!-- <xsl:comment>FullContact:<xsl:value-of select="$FullContact"/></xsl:comment>
                <xsl:comment>postComma1:<xsl:value-of select="$postComma1"/></xsl:comment>
                <xsl:comment>division<xsl:value-of select="$division"/></xsl:comment>
                <xsl:comment>hascomma2:<xsl:value-of select="$hasComma2"/></xsl:comment> 
                GeographyDivisionDistributorcitedResponsibleParty-->

                <xsl:choose>
                        <xsl:when test="$hasComma2='true'">
                                <!-- <xsl:comment>With the commas</xsl:comment> -->
                                <xsl:variable name="postSlash"
                                        select="substring-after($division,'/')"/>
                                <xsl:variable name="Branch" select="substring($postSlash,1,3)"/>
                                <xsl:choose>
                                        <xsl:when test="$Branch='Car'">
                                                <xsl:call-template
                                                  name="GeographyDivisionDistributorcitedResponsibleParty"
                                                />
                                        </xsl:when>
                                        <xsl:when test="$Branch='Geo'">
                                                <xsl:call-template
                                                  name="GeographicProductsBranchDistributorcitedResponsibleParty"
                                                />
                                        </xsl:when>
                                </xsl:choose>
                        </xsl:when>

                        <xsl:otherwise>
                                <!-- <xsl:comment>In the default</xsl:comment> -->
                                <xsl:variable name="hasGeography"
                                        select="contains($division,'Geography')"/>
                                <xsl:choose>
                                        <xsl:when test="$hasGeography='true'">
                                                <!-- <xsl:comment>for the Geo Division</xsl:comment> -->
                                                <xsl:call-template
                                                  name="GeographyDivisionDistributorcitedResponsibleParty"
                                                />
                                        </xsl:when>
                                        <xsl:otherwise>
                                                <xsl:call-template name="FC_CitedResponsibleParty"/>
                                        </xsl:otherwise>
                                </xsl:choose>

                        </xsl:otherwise>
                </xsl:choose>



        </xsl:template>


</xsl:stylesheet>
