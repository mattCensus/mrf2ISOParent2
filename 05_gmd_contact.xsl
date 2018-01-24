<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
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
    <xd:p>mrf2ISO/05_gmd_contact.xsl</xd:p>
    <xd:p>called by the mrf2ISO/mrf2ISOMaster.xsl template</xd:p>
    <xd:desc>
      <xd:p><xd:b>Created on:</xd:b> Jan 7, 2014</xd:p>
      <xd:p><xd:b>Author:</xd:b> Matthew McCready</xd:p>
      <xd:ul>
        <xd:li>Template                                                   Explanation                              </xd:li>
        <xd:li>contact                                                    Master template for all the contacts</xd:li>
        <xd:li>GeographicProductsBranchPointOfContact                     Handles the contact information for the Geographic Products Branch(GPB)when it is the contact</xd:li>
        <xd:li>GeographicProductsBranchDistributor                        Handles the contact information for the Geographic Products Branch(GPB)  when it is the
                                                                           distributor</xd:li>
        <xd:li>GeographicProductsBranchDistributorNonDistributionSection  Handles the contact information for the Geographic Products Branch (GPB) when it is the
                                                                           distributor (duplicate?)  </xd:li>                
        <xd:li>GeographicProductsBranchDistributorcitedResponsibleParty   Handles the contact information for the Geographic Products Branch(GPB) when it is the cited
                                                                           responsible party</xd:li>             
        <xd:li>GeographicProductsBranchCustodian                          Handles the contact information for the Geographic Products Branch(GPB) when it is the
                                                                           custodian of the records   </xd:li> 
        <xd:li>CartographicProductsBranchPointOfContact                   Handles the contact information for the Cartographic Products Branch(CPB) when it is the Point
                                                                           of Contact for the metadata</xd:li>
        <xd:li>CartographicBrachOriginator                                Handles the contact information for Cartographic Products Branch (CPB) when it is the
                                                                           Originator for the metadata</xd:li>
        <xd:li>CartographicProductsBranchCustodian                        Handles the contact information for the Cartographic Products Branch (CPB) when it is the
                                                                           Custodian of the records</xd:li>             
        <xd:li>GeographyDivisionDistributor                               Handles the contact information for the Geography Division (GEO) when it is the distributor of
                                                                           the metadata (duplicate?)</xd:li>
        <xd:li>GeographyDivisionDistributorNonDistributionSection         Handles the contact information for the Geography Division (GEO) when it is the distributor of
                                                                           the metadata (duplicate?)</xd:li>
        <xd:li>GeographyDivisionDistributorcitedResponsibleParty          Handles the contact information for the Geography Division (GEO) when it is the distributor of
                                                                           the metadata (duplicate?)</xd:li>
        <xd:li>GeographyDivisionOriginator                                Handles the contact information for the Geography Division (GEO) when it is the originator of
                                                                           the metadata</xd:li>              
        <xd:li>GeographyDivisionPointOfContact                            Handles the contact information for the Geography Division (GEO) when it is the point of
        contact for the metadata</xd:li>
        <xd:li>SpatialDataCollectionProductsBranchPointOfContact          Handles the Point of Contact (Indentification Information) information for the Spatial Data
                                                                           Collection and Products Branch  </xd:li>
        <xd:li>SpatialDataCollectionProductsBranchContact                 Handles the SpatialDataCollectionProductsBranchContact information for the Spatial Data
                                                                           Collection and Products Branch </xd:li>
        <xd:li>SpatialDataCollectionProductsBranchDistributor             Handles the distributorContact(Distribution Section) for the Spatial Data
                                                                           Collection and Products Branch  </xd:li>
        <xd:li>defaultContact                                             Handles the contact information when the Branch Division could not be determined </xd:li>
      
      </xd:ul>
      <xd:p>
        Initial   Date         Description
        MMC       12/13/2013   Updated to handle branch names with both a slash and a comma. Also sepereated the code for each branch into its own template. Also
                                created a template for the defalut Contact Information if the branch in the MIF file has not had a UUID made for it.
        MMC      1/8/2014      Modified to work on the MRF Format. 
        MMC      2/2/2015      Modified the if to work with version 2.0 
        MMC      1/21/2015     Modified the Cartographic Products and Services from Cartographic Products to Cartographic Products and Services
        MMC      6/10/2016     Modified for the new Spatial Data Collection and Products Branch
        MMC      6/13/2016     Modified to include the  Spatial Products Software Branch 
        
      </xd:p>
    </xd:desc>
  </xd:doc>
  
  <xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>



  <xsl:template name="contactParent" match="/">
   <!--<xsl:comment>IN the regular contactZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ</xsl:comment>
    <xsl:comment>In the main contact</xsl:comment>  -->
    <xsl:variable name="FullContact" select="/MRF/Metadata_Reference_Information/Metadata_Contact/Contact_Organization"/>
    <xsl:variable name="postComma1" select="substring-after($FullContact,',')"/>
    <xsl:variable name="division" select="substring-after($postComma1,',')"/>
    <xsl:variable name="containsComma" select="contains($division,',')"/>
    <xsl:variable name="containsSlash" select="contains($division,'/')"/>

    <!-- <xsl:comment>division:<xsl:value-of select="$division"></xsl:value-of></xsl:comment> -->

    <xsl:choose>
    <!--  <xsl:when test="$containsComma='true'"> -->
      <xsl:when test="contains($division,',')">

        <xsl:variable name="postComma" select="substring-after($division,',')"/>
        <xsl:variable name="Branch" select="substring($postComma,1,3)"/>
        <xsl:variable name="hasGeo" select="contains($postComma,'Geo')"/>
        <xsl:variable name="hasCarto" select="contains($postComma,'Carto')"/>
        <xsl:variable name="hasNSGPB"  select="contains($postComma,'National')"/>



         <!-- <xsl:comment>we have a comma</xsl:comment> -->


        <xsl:choose>
          <xsl:when test="contains($postComma,'Carto')">
            <xsl:call-template name="CartographicProductsBranchPointOfContact"/>
          </xsl:when>
          <xsl:when test="contains($postComma,'National')">
            <xsl:call-template name="NSGPBPointOfContact"/>
          </xsl:when>
          <xsl:when test="contains($postComma, 'Customer')">
            <xsl:call-template name="GeographyDivisionDistributorNonDistributionSection"/>
          </xsl:when>
          <xsl:when test="contains($postComma,'Geo')">
            <xsl:call-template name="GeographicProductsBranchPointOfContact"/>
          </xsl:when>
          <xsl:when test="contains($postComma,'Spatial')">
            <xsl:call-template name="SpatialDataCollectionProductsBranchContact"/>
          </xsl:when>
         
          <xsl:otherwise>
            <xsl:call-template name="defaultContact"/>
          </xsl:otherwise>
        </xsl:choose>



      </xsl:when>
      <xsl:when test="contains($division,'/')">
        <xsl:variable name="postSlash" select="substring-after($division,'/')"/>
        <xsl:variable name="BranchpostSlash" select="substring($postSlash,1,3)"/>
        <xsl:variable name="hasCartoPostSlash" select="contains($postSlash,'Carto')"/>
        <xsl:variable name="hasGeoPostSlash" select="contains($postSlash,'Geo')"/>
        <xsl:comment>right here</xsl:comment>
        <xsl:choose>
          <xsl:when test="contains($postSlash,'Carto')">
            <xsl:call-template name="CartographicProductsBranchPointOfContact"/>
          </xsl:when>
          <xsl:when test="contains($postSlash, 'Customer')">
            <xsl:call-template name="GeographyDivisionDistributorNonDistributionSection"/>
          </xsl:when>
          <xsl:when test="contains($postSlash,'Geo')">
            <xsl:call-template name="GeographicProductsBranchPointOfContact"/>
          </xsl:when>
          <xsl:when test="contains($postSlash,'Spatial')">
            <xsl:call-template name="SpatialDataCollectionProductsBranchContact"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="defaultContact"/>
          </xsl:otherwise>
        </xsl:choose>

      </xsl:when>
      
      <xsl:when test="contains($division,'Geo')">
        <xsl:call-template name="GeographyDivisionDistributorNonDistributionSection"/>
      </xsl:when>

      <xsl:otherwise>

        <xsl:call-template name="defaultContact"/>

<!--  <xsl:comment> calling the default contact template!!!!!!!!!!!!!!!!!!!</xsl:comment>-->
      </xsl:otherwise>

    </xsl:choose>
  </xsl:template>

<!-- Contact Information -->
  <!-- Geographic Products Brach -->
  <xsl:template name="GeographicProductsBranchPointOfContact">
    <xsl:element name="gmd:contact">
      <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/c5ceb003-1ed6-4126-8a16-bc08ce8fc267</xsl:attribute>
      <xsl:attribute name="xlink:title">U.S. Department of Commerce, U.S. Census Bureau, Geography Division, Geographic Products Branch</xsl:attribute>
    </xsl:element>
  </xsl:template>
  
  <xsl:template name="GeographicProductsBranchDistributor">
    <xsl:element name="gmd:distributorContact">
      <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/f48e4893-a57f-4f2b-ad5d-0cca1b34ec62</xsl:attribute>
      <xsl:attribute name="xlink:title">U.S Department of Commerce, U.S Census Bureau, Geography Division, Geographic Products Branch (distributor)</xsl:attribute>
    </xsl:element>
  </xsl:template>
  
  <xsl:template name="GeographicProductsBranchDistributorNonDistributionSection">
    <xsl:element name="gmd:Contact">
      <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/f48e4893-a57f-4f2b-ad5d-0cca1b34ec62</xsl:attribute>
      <xsl:attribute name="xlink:title">U.S Department of Commerce, U.S Census Bureau, Geography Division, Geographic Products Branch (distributor)</xsl:attribute>
    </xsl:element>
  </xsl:template>
  
  <xsl:template name="GeographicProductsBranchDistributorcitedResponsibleParty">
    <xsl:element name="gmd:citedResponsibleParty">
      <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/f48e4893-a57f-4f2b-ad5d-0cca1b34ec62</xsl:attribute>
      <xsl:attribute name="xlink:title">U.S Department of Commerce, U.S Census Bureau, Geography Division, Geographic Products Branch (distributor)</xsl:attribute>
    </xsl:element>
  </xsl:template>
  
  <xsl:template name="GeographicProductsBranchCustodian">
    <xsl:element name="gmd:contact">
      <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/B04DFA5D-40CD-B677-E040-0AC8C5BB4473</xsl:attribute>
      <xsl:attribute name="xlink:title"> U.S. Department of Commerce, U.S. Census Bureau, Geography Division, Geographic Products Branch (custodian)</xsl:attribute>
    </xsl:element>
  </xsl:template>
  
  <!-- Spatial Data Collection  -->
  <xsl:template name="SpatialDataCollectionProductsBranchPointOfContact">
    <xsl:element name="gmd:pointOfContact">
      <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/c5ceb003-1ed6-4126-8a16-bc08ce8fc267</xsl:attribute>
      <xsl:attribute name="xlink:title">U.S. Department of Commerce, U.S. Census Bureau, Geography Division, Spatial Data Collection and Products Branch</xsl:attribute>
    </xsl:element>
  </xsl:template>
  
  <xsl:template name="SpatialDataCollectionProductsBranchContact">
    <xsl:element name="gmd:contact">
      <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/B04DFA5D-40CD-B677-E040-0AC8C5BB4473</xsl:attribute>
      <xsl:attribute name="xlink:title"> U.S. Department of Commerce, U.S. Census Bureau, Geography Division, Spatial Data Collection and Products Branch(custodian)</xsl:attribute>
    </xsl:element>
  </xsl:template>
  
  <xsl:template name="SpatialDataCollectionProductsBranchDistributor">
    <xsl:element name="gmd:distributorContact">
      <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/f48e4893-a57f-4f2b-ad5d-0cca1b34ec62</xsl:attribute>
      <xsl:attribute name="xlink:title">U.S Department of Commerce, U.S Census Bureau, Geography Division, Spatial Data Collection and Products Branch (distributor)</xsl:attribute>
    </xsl:element>
  </xsl:template>
  
  <!-- Cartographic Products Brach -->

  <xsl:template name="CartographicProductsBranchPointOfContact">
    <xsl:comment>revised template!!!!!!!!!!!!!</xsl:comment>
    <xsl:element name="gmd:contact">
      <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/8dd6ee96-96e1-492c-be55-76cdde8f27f1</xsl:attribute>
      <xsl:attribute name="xlink:title">pointofContact - U.S. Department of Commerce, U.S. Census Bureau, Geography Division/Cartographic Products and Services Branch</xsl:attribute>
    </xsl:element>
  </xsl:template>
  
  <xsl:template name="CartographicProductsBranchCustodian">
    <xsl:element name="gmd:contact">
      <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/e2a02c3c-01bf-42e7-bee9-0f64f2ef611c </xsl:attribute>
      <xsl:attribute name="xlink:title">U.S. Department of Commerce, U.S. Census Bureau, Geography Division/Cartographic Products and Services Branch  (custodian) </xsl:attribute>
    </xsl:element>
  </xsl:template>
  
  <xsl:template name="CartographicBrachOriginator">
    <xsl:element name="gmd:citedResponsibleParty">
      <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/ddd21bfb-2229-465b-95b2-bee36200b0e5</xsl:attribute>
      <xsl:attribute name="xlink:title">originator - U.S. Department of Commerce, U.S. Census Bureau, Geography Division/Cartographic Products and Services Branch</xsl:attribute>
    </xsl:element>
  </xsl:template>
  
  <!-- NSGPB -->
  
  <xsl:template name="NSGPBPointOfContact">
    <xsl:element name="gmd:contact">
      <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/4204476c-7eef-420f-84a1-85d5eb5d8e55</xsl:attribute>
      <xsl:attribute name="xlink:title">pointofContact - U.S. Department of Commerce, U.S. Census Bureau, Geography Division, National/State Geographic Partnerships Branch" </xsl:attribute>
    </xsl:element>
  </xsl:template>

<!-- Geography Division  Customer services branch-->
  <xsl:template name="GeographyDivisionDistributor">
    <xsl:element name="gmd:distributorContact">
      <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/1df27e57-4768-42de-909b-52f530601fba</xsl:attribute>
      <xsl:attribute name="xlink:title">U.S. Department of Commerce, U.S. Census Bureau, Geography Division, Geographic Customer Services Branch (distributor)</xsl:attribute>
    </xsl:element>
  </xsl:template>
  
  <xsl:template name="GeographyDivisionDistributorNonDistributionSection">
    <xsl:element name="gmd:contact">
      <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/1df27e57-4768-42de-909b-52f530601fba</xsl:attribute>
      <xsl:attribute name="xlink:title">U.S Department of Commerce, U.S Census Bureau, Geographic Customer Services Branch (point of Contact)</xsl:attribute>
    </xsl:element>
  </xsl:template>


<xsl:template name="GeographyDivisionPointOfContact">
    <!-- Here we are!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
    <xsl:element name="gmd:pointOfContact">
      <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/09b8253a-e2dc-4a6b-a905-11f1e0e87b3b</xsl:attribute>
      <xsl:attribute name="xlink:title">U.S Department of Commerce, U.S Census Bureau, Geographic Customer Services Branch (point of Contact)</xsl:attribute>
    </xsl:element>
  </xsl:template>
  
  <!-- geography division -->

  <xsl:template name="GeographyDivisionDistributorcitedResponsibleParty">
    <xsl:element name="gmd:citedResponsibleParty">
      <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/1df27e57-4768-42de-909b-52f530601fba</xsl:attribute>
      <xsl:attribute name="xlink:title">U.S Department of Commerce, U.S Census Bureau, Geography Division (distributor)</xsl:attribute>
    </xsl:element>
  </xsl:template>
  
  <xsl:template name="GeographyDivisionOriginator">
    <xsl:element name="gmd:citedResponsibleParty">
    <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/cf2b3bf2-5dd9-4fed-a495-1ddfb9a41de2 </xsl:attribute>
    <xsl:attribute name="xlink:title">U.S. Department of Commerce, U.S. Census Bureau, Geography Division (Originator) </xsl:attribute>
      </xsl:element>
  </xsl:template>
  
  
  
 

<!-- default contact -->
  <xsl:template name="defaultContact">

    <xsl:if test="/MRF/Metadata_Reference_Information/Metadata_Contact">

      <xsl:element name="gmd:contact">
        <xsl:element name="gmd:CI_ResponsibleParty">

          <xsl:element name="gmd:organisationName">
            <xsl:element name="gco:CharacterString">
              <!-- <xsl:apply-templates select="//metadata/metainfo/Metadata_Language"/> -->
              <xsl:apply-templates select="/MRF/Metadata_Reference_Information/Metadata_Contact/Contact_Organization"/>
            </xsl:element>
            <!-- gco:CharacterString -->
          </xsl:element>
          <!-- gmd:organisationName -->

          <xsl:element name="gmd:contactInfo">
            <xsl:element name="gmd:CI_Contact">
              <xsl:element name="gmd:phone">
                <xsl:element name="gmd:CI_Telephone">

                  <xsl:element name="gmd:voice">
                    <xsl:element name="gco:CharacterString">
                      <xsl:apply-templates
                        select="/MRF/Metadata_Reference_Information/Metadata_Contact/Contact_Voice_Telephone"/>
                    </xsl:element>
                    <!-- gco:CharacterString -->
                  </xsl:element>
                  <!-- gmd:voice -->

                  <xsl:element name="gmd:facsimile">
                    <xsl:element name="gco:CharacterString">
                      <xsl:apply-templates
                        select="/MRF/Metadata_Reference_Information/Metadata_Contact/Contact_Facsimile_Telephone"/>
                    </xsl:element>
                    <!-- gco:CharacterString -->
                  </xsl:element>
                  <!-- gmd:fax -->

                </xsl:element>
                <!-- gmd:CI_Telephone -->
              </xsl:element>
              <!-- gmd:phone -->

              <xsl:element name="gmd:address">
                <xsl:element name="gmd:CI_Address">

                  <xsl:element name="gmd:deliveryPoint">
                    <xsl:element name="gco:CharacterString">
                      <xsl:apply-templates select="/MRF/Metadata_Reference_Information/Metadata_Contact/Contact_Address/Address"/>
                    </xsl:element>
                    <!-- gco:CharacterString -->
                  </xsl:element>
                  <!-- gmd:deliveryPoint -->

                  <xsl:element name="gmd:city">
                    <xsl:element name="gco:CharacterString">
                      <xsl:apply-templates select="/MRF/Metadata_Reference_Information/Metadata_Contact/Contact_Address/City"/>
                    </xsl:element>
                    <!-- gco:CharacterString -->
                  </xsl:element>
                  <!-- gmd:city -->


                  <xsl:element name="gmd:administrativeArea">
                    <xsl:element name="gco:CharacterString">
                      <xsl:apply-templates select="/MRF/Metadata_Reference_Information/Metadata_Contact/Contact_Address/State_or_Province"/>
                    </xsl:element>
                    <!-- gco:CharacterString -->
                  </xsl:element>
                  <!-- gmd:administrativeArea -->

                  <xsl:element name="gmd:postalCode">
                    <xsl:element name="gco:CharacterString">
                      <xsl:apply-templates select="/MRF/Metadata_Reference_Information/Metadata_Contact/Contact_Address/Postal_Code"/>
                    </xsl:element>
                    <!-- gco:CharacterString -->
                  </xsl:element>
                  <!-- gmd:administrativeArea -->

                  <xsl:element name="gmd:country">
                    <xsl:element name="gco:CharacterString">
                      <xsl:apply-templates select="/MRF/Metadata_Reference_Information/Metadata_Contact/Contact_Address/Country"/>
                    </xsl:element>
                    <!-- gco:CharacterString -->
                  </xsl:element>
                  <!-- gmd:country -->

                  <xsl:element name="gmd:electronicMailAddress">
                    <xsl:element name="gco:CharacterString">
                      <xsl:apply-templates
                        select="/MRF/Metadata_Reference_Information/Metadata_Contact/Contact_Electronic_Mail_Address"/>
                    </xsl:element>
                    <!-- gco:CharacterString -->
                  </xsl:element>
                  <!-- electronicMailAddress -->


                </xsl:element>
                <!-- gmd:CI_Address -->
              </xsl:element>
              <!-- gmd:address -->


            </xsl:element>
            <!-- CI_Contact -->
          </xsl:element>
          <!-- gmd:contactInfo -->

          <xsl:element name="gmd:role">
            <xsl:element name="gmd:CI_RoleCode">
              <xsl:attribute name="codeList"
                >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_RoleCode</xsl:attribute>
              <xsl:attribute name="codeListValue">pointofContact</xsl:attribute> pointofContact </xsl:element>
            <!-- gmd:CI_RoleCode -->
          </xsl:element>
          <!-- gmd:role -->

        </xsl:element>
        <!-- gmd:CI_ResponsibleParty -->
      </xsl:element>
      <!-- gmd:contact -->

    </xsl:if>

  </xsl:template>
</xsl:stylesheet>
