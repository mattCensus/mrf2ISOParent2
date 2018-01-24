<?xml version="1.0" encoding="UTF-8"?>

    
    <xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gmd="http://www.isotc211.org/2005/gmd"
    xmlns:gmi="http://www.isotc211.org/2005/gmi" xmlns:gmx="http://www.isotc211.org/2005/gmx"
    xmlns:gsr="http://www.isotc211.org/2005/gsr" xmlns:gss="http://www.isotc211.org/2005/gss"
    xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:gml="http://www.opengis.net/gml/3.2"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:gfc="http://www.isotc211.org/2005/gfc" xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:grp="http://www.altova.com/Mapforce/grouping"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="fn grp vmf xs xsi xsl xd" xmlns="http://www.isotc211.org/2005/gmi">

   <!-- <xsl:import href="../mrf2ISOParent/01_fileIdentifier.xsl"/> -->
    <xsl:import href="../mrf2ISOParent/01_gmd_fileIdentifier.xsl"/>
    <xsl:import href="../mrf2ISOParent/02_gmd_language.xsl"/>
    <xsl:import href="../mrf2ISOParent/03_gmd_characterSet.xsl"/>
    <xsl:import href="../mrf2ISOParent/04_gmd_hierarchySet.xsl"/>
    <xsl:import href="../mrf2ISOParent/05_gmd_contact.xsl"/>
    <xsl:import href="../mrf2ISOParent/06_gmd_dateStamp.xsl"/>
    <xsl:import href="../mrf2ISOParent/07_gmd_metadataStandardName.xsl"/>
    <xsl:import href="../mrf2ISOParent/08_gmd_dataSetURI.xsl"/>
    <xsl:import href="../mrf2ISOParent/10_gmd_referenceSystemInfo.xsl"/>
    <xsl:import href="../mrf2ISOParent/11_gmd_identificationInfo.xsl"/>
    <xsl:import href="../mrf2ISOParent/12_gmd_contentInfo.xsl"/>
    <xsl:import href="../mrf2ISOParent/13_gmd_distributionInfo.xsl"/>
    <xsl:import href="../mrf2ISOParent/15_metadataMaintenance.xsl"/>

        <xd:doc scope="stylesheet">
            <xd:p>mrf2ISOParent/MRF2ISOParent.xsl</xd:p>
            <xd:p>Master template: calls all other templates</xd:p> 
         <xd:p> Template                                                      Stylesheet/File                         Description
             fileIdentifier                                                   01_gmd_fileIdentifier.xsl               Handles the gmd:fileIdentifier element
             gmdLanguage                                                      02_gmd_language.xsl                     Handles the gmd:language element
             gmd_characterSet                                                 03_gmd_characterSet.xsl                 Handles the gmd:characterSet element
             parentIdentifier                                                 03B_gmd_parentIdentifier.xsl            Handles the gmd:parentIdentifier element
             hierarchySet                                                     04_gmd_hierarchySet.xsl                 Handles the gmd:hierarchyLevel element
             GeographicProductsBranchPointOfContact                           05_gmd_contact.xsl                      Handles the Point of Contact info for the Geographic Products Branch 
             GeographicProductsBranchDistributor                              05_gmd_contact.xsl                      Handles the Point of Contact info for the Geographic Products Branch (distributor)
             GeographicProductsBranchDistributorNonDistributionSection        05_gmd_contact.xsl                      Handles the Point of Contact info for the Geographic Products Branch (distributor) (look into)
             GeographicProductsBranchDistributorcitedResponsibleParty         05_gmd_contact.xsl                      Handles the Point of Contact info for the Geography Division, Geographic Products Branch (distributor)
             GeographicProductsBranchCustodian                                05_gmd_contact.xsl                      Handles the Point of Contact info for the Geographic Products Branch (custodian)
             CartographicProductsBranchPointOfContact                         05_gmd_contact.xsl                      Handles the Point of Contact info for the Geography Division/Cartographic Products Branch
             CartographicProductsBranchCustodian                              05_gmd_contact.xsl                      Handles the Point of Contact info for the Geography Division/Cartographic Products Branch (custodian)
             CartographicBrachOriginator                                      05_gmd_contact.xsl                      Handles the Point of Contact info for the Geography Division/Cartographic Products Branch (originator)
             NSGPBPointOfContact                                              05_gmd_contact.xsl                      Handles the Point of Contact info for the National/State Geographic Partnerships Branch
             GeographyDivisionDistributor                                     05_gmd_contact.xsl                      Handles the Point of Contact info for the Geography Division (distributor)
             GeographyDivisionDistributorNonDistributionSection               05_gmd_contact.xsl                      Handles the Point of Contact info for the Geography Division (distributor)
             GeographyDivisionDistributorcitedResponsibleParty                05_gmd_contact.xsl                      Handles the Point of Contact info for the Geography Division (distributor)
             GeographyDivisionOriginator                                      05_gmd_contact.xsl                      Handles the Point of Contact info for the Geography Division (Originator)
             GeographyDivisionPointOfContact                                  05_gmd_contact.xsl                      Handles the Point of Contact info for the Geography Division
             defaultContact                                                   05_gmd_contact.xsl                      default contact- gets info from metadata file - no uuid
             dateStamp                                                        06_gmd_dateStamp.xsl                    Handles the gmd:dateStamp element             
             dateStampFormat                                                  06_gmd_dateStamp.xsl                    formats the date for the gmd:dateStamp element
             StandardName                                                     07_gmd_metadataStandardName.xsl         Handles the gmd:metadataStandardVersion element
             dataSetURI                                                       08_gmd_dataSetURI.xsl                   Handles the gmd:dataSetURI element
             SDTSListValueTemp                                                09_gmd_spatialRepresentationInfo.xsl    Handles the gmd:geometricObjectType element 
             spatialRepresentationInfo                                        09_gmd_spatialRepresentationInfo.xsl    Handles the gmd:spatialRepresentationInfo element
             referenceSystemInfo                                              10_gmd_referenceSystemInfo.xsl          Handles the gmd:referenceSystemInfo element              
             kmlReferenceSystemInfo                                           10_gmd_referenceSystemInfo.xsl          Handles the gmd:referenceSystemInfo element for KML files
             SeriesInfoTitle                                                  SeriesInfoTitle.xsl                     formats the gmd:title element for the parent file
             CitedResponsibleParty                                            IdPointOfContact.xsl                    Handles the contact info for Citation information 
             pointOfContact                                                   IdPointOfContact.xsl                    default contact direct form metadata no UUID
             MD_MaintenanceFrequencyCode                                      MD_MaintenanceFrequencyCode.xsl         transforms the element in the
                                                                                                                      /MRF/Identification_Information/Status/Maintenance_and_Update_Frequency
                                                                                                                      element into a value in the MD_MaintenanceFrequencyCode code list
             NonISOKeywords                                                   NonISOKeywords.xsl                      transforms the values stored in the Theme_Keyword
                                                                                                                       and Theme_Keyword MRF elements to the
                                                                                                                       gmd:descriptiveKeywords element 
             NGDAThemes                                                       NGDA_Themes.xsl                         Master template handling all the NGDA themes 
             spatialRepresentationType                                        MD_SpatialRepresentationType.xsl         transforms the value in the
                                                                                                                       /MRF/Spatial_Data_Organization_Information/Direct_Spatial_Reference_Method element
                                                                                                                       into the correct MD_SpatialRepresentationTypeCode.xsl codeList value 
             Metadata_Character_Set                                           03_gmd_characterSet.xsl                 Handles the gmd:characterset for the identificationInformation section 
             ISO_TopicCategories                                              ISOKeywords.xsl                        transforms the value in the keywords/theme that are
                                                                                                                      related to the ISO Topic Categories  to the
                                                                                                                      ISO_TopicCategories element
             boundingCoordinatesMaster                                        boundingCoordinates.xsl                Master template for the Parent file Bounding
                                                                                                                      Coordinate
             contentInfo                                                      12_gmd_contentInfo.xsl                 Handles the gmd:contentInfo element
             includedWithDatasetA                                             12_gmd_contentInfo.xsl                 Handles the gmd:includedWithDataset element
             featureCatalogueCitationDateA                                    12_gmd_contentInfo.xsl                 Handles the gmd:date element
             FC_CitedResponsibleParty                                         12_gmd_contentInfo.xsl                 Handles the gmd:citedResponsibleParty element
             FCCitedResponsiblePartyList                                      12_gmd_contentInfo.xsl                 Handles the contact information
             distributionInfo                                                 13_gmd_distributionInfo.xsl            Handles the gmd:distributionInfo element 
             metadataMaintenance                                              15_metadataMaintenance.xsl             Handles the gmd:MD_MaintenanceInformation element   
         </xd:p>
            <xd:ul>
                <xd:li></xd:li>
            </xd:ul>
            <xd:desc>
                <xd:p><xd:b>Created on:</xd:b> Jan 7, 2014</xd:p>
                <xd:p><xd:b>Author:</xd:b> Matthew McCready</xd:p>
                <xd:p>
                    Initial   Date         Description
                    MMC       1/8/2014     Modified to work on the MRF Format. 
                    MMC       2/2/2015     Modified the if to work with version 2.0 
                    MMC      2/25/2016     Inserted the xsi namespace and the schemaLocation attribute into the root element. 
                </xd:p>
            </xd:desc>
        </xd:doc>

    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="no"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="/">
        <xsl:text>&#10;</xsl:text>
        <xsl:element name="gmi:MI_Metadata">
            <!-- inserts the xlinx namspace -->
            <xsl:copy-of select="document('')/*/namespace::*[name()='xlink']"/>
            <!-- inserts the gmd namespace -->
            <xsl:copy-of select="document('')/*/namespace::*[name()='gmd']"/>
            <!-- inserts the gco namespace -->
            <xsl:copy-of select="document('')/*/namespace::*[name()='gco']"/>
            <!-- inserts the gml namespace -->
            <xsl:copy-of select="document('')/*/namespace::*[name()='gml']"/>
            <!-- inserts the xsi namespace -->
            <xsl:copy-of select="document('')/*/namespace::*[name()='xsi']"/>
            
            <xsl:attribute name="xsi:schemaLocation">http://www.isotc211.org/2005/gmi http://www.ngdc.noaa.gov/metadata/published/xsd/schema.xsd</xsl:attribute>
            
           <!--   <xsl:comment>Is this the right one??????????????????????</xsl:comment>-->
            <xsl:text>&#10;</xsl:text>
            <xsl:comment>This is the Series Information File</xsl:comment>
            <xsl:text>&#10;</xsl:text>
            <xsl:call-template name="fileIdentifier"/>
            <xsl:call-template name="gmdLanguage"/>
            <xsl:call-template name="Metadata_Character_Set"/>
            <xsl:call-template name="hierarchySet"/>
             <!-- <xsl:comment>calling the contact template!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</xsl:comment>
           <xsl:call-template name="contact"/>--> 
            <xsl:call-template name="contactParent"/>
            <xsl:call-template name="dateStamp"/>
            <xsl:call-template name="StandardName"/>
            <xsl:call-template name="dataSetURI"/>
            <xsl:call-template name="referenceSystemInfo"/>
            
            <xsl:variable name="formatType" select="/MRF/Distribution_Information/Standard_Order_Process/Digital_Form/Format_Name"/>
            <!-- <xsl:comment>formatType:<xsl:value-of select="$formatType"/></xsl:comment> -->
            <xsl:choose>
                <xsl:when test="$formatType = 'KML'">
                 <xsl:call-template name="kmlReferenceSystemInfo"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="spatialReferenceSystemInfo"/>
                </xsl:otherwise>
            </xsl:choose>
            
            <xsl:call-template name="identificationInfo"/>
            <xsl:call-template name="contentInfoParent"/>
            <xsl:call-template name="distributionInfo"/>
            <xsl:call-template name="metadataMaintenance"/>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
