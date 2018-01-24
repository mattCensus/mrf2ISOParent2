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

    <xsl:import href="../mrf2ISO/05_gmd_contact.xsl"/>

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p>mrf2ISOParent/IdPointOfContact.xsl</xd:p>
            <xd:p>called by the mrf2ISOParent/11_gmd_identificationInfo.xsl template</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Jan 27, 2014</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p> calls on the following template</xd:p>
            <xd:p> Template                                                      Stylesheet/File                        Description
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
            </xd:p>
            <xd:ul>
                <xd:li>Template                        Explanation                                      </xd:li>
                <xd:li>CitedResponsibleParty           Handles the contact info for Citation information</xd:li> 
                <xd:li>pointOfContact                  default contact direct form metadata no UUID</xd:li>
            </xd:ul>
            <xd:p>
                Initial   Date                           Description
                MMC       1/8/2014                       Modified to work on the MRF Format.
                MMC       2/2/2015                       Modified the if to work with version 2.0 
            </xd:p>
        </xd:desc>
    </xd:doc>


    <xsl:template name="CitedResponsibleParty">
<!--  <xsl:comment> in the CitedResponsibleParty Template</xsl:comment>-->
        <xsl:variable name="FullOrg" select="/MRF/Identification_Information[1]/Citation[1]/Originator[1]"/>
        <xsl:variable name="postComma1" select="substring-after($FullOrg,',')"/>
        <xsl:variable name="postComma2" select="substring-after($postComma1,',')"/>
        <xsl:variable name="postComma2HasGeo" select="contains($postComma2,'Geo')"/>
        <xsl:variable name="hasSlash" select="contains($postComma2,'/')"/>
        <xsl:variable name="hasComma" select="contains($postComma2,',')"/>
          
        <!--  <xsl:comment>FullOrg:<xsl:value-of select="$FullOrg"/> </xsl:comment>
        <xsl:comment>postComma1:<xsl:value-of select="$postComma1"/></xsl:comment>
        <xsl:comment>postComma2:<xsl:value-of select="$postComma2"/></xsl:comment> -->

        <xsl:choose>
            
            <xsl:when test="$hasSlash='true'">
                <!--  <xsl:comment>In the slash</xsl:comment>-->
                <xsl:variable name="division" select="substring-before($postComma2 ,'/')"/>
                <xsl:variable name="fullBranch" select="substring-after($postComma2,'/')"/>
                <xsl:variable name="finalBranch" select="substring($fullBranch,1,3)"/>

                <xsl:choose>
                    <xsl:when test="$finalBranch='Car'">
                        <xsl:call-template name="CartographicBrachOriginator"/>
                    </xsl:when>
                    <xsl:when test="$division='Geography Division'">
                        <xsl:call-template name="GeographyDivisionOriginator"/>
                    </xsl:when>

                    <xsl:otherwise>
                        <xsl:call-template name="pointOfContact"/>
                    </xsl:otherwise>
                </xsl:choose>

            </xsl:when>
            <xsl:when test="$hasComma='true'">
                <xsl:variable name="division" select="substring-before($postComma2 ,',')"/>
                <xsl:variable name="fullBranch" select="substring-after($postComma2,',')"/>
                <xsl:variable name="finalBranch" select="substring($fullBranch,1,3)"/>
                 <!--  <xsl:comment>In the comma</xsl:comment>
                 <xsl:comment>division:<xsl:value-of select="$division"/></xsl:comment>
                <xsl:comment>fullBranch<xsl:value-of select="$fullBranch"/></xsl:comment>
                <xsl:comment>finalBranch<xsl:value-of select="$finalBranch"/></xsl:comment>  --> 
                <xsl:choose>
                    <xsl:when test="contains($fullBranch,'Cartographic')">
                        <xsl:call-template name="CartographicBrachOriginator"/>
                    </xsl:when>
                    <xsl:when test="contains($finalBranch,'Customer')">
                        <xsl:call-template name="CartographicBrachOriginator"/>
                    </xsl:when>
                    <xsl:when test="$finalBranch='Car'">
                        <xsl:comment>right here</xsl:comment>
                        <xsl:call-template name="CartographicBrachOriginator"/>
                    </xsl:when>
                    <xsl:when test="$division='Geography Division'">
                        <xsl:call-template name="GeographyDivisionOriginator"/>
                    </xsl:when>
                    

                    <xsl:otherwise>
                        <xsl:call-template name="pointOfContact"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>

            <xsl:when test="$postComma2HasGeo ='true'">
                <xsl:call-template name="GeographyDivisionOriginator"/>
            </xsl:when>

            <xsl:otherwise>
                <!--  <xsl:comment> In the second otherwise</xsl:comment>-->
                <xsl:element name="gmd:citedResponsibleParty">
                    <xsl:element name="gmd:CI_ResponsibleParty">
                        <xsl:element name="gmd:organisationName">
                            <xsl:element name="gco:CharacterString">
                                <xsl:value-of select="/MRF/Identification_Information[1]/Citation[1]/Originator[1]"/>
                            </xsl:element>
                        </xsl:element>
                        <xsl:element name="gmd:role">
                            <xsl:element name="gmd:CI_RoleCode">
                                <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_RoleCode</xsl:attribute>
                                <xsl:attribute name="codeListValue">originator</xsl:attribute>
                                <xsl:attribute name="codeSpace">006</xsl:attribute> originator
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>

            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="pointOfContact">
        <xsl:for-each select="/MRF/Identification_Information/Point_of_Contact">
            <xsl:variable name="fullOrg" select="./Contact_Organization"/>
            <xsl:variable name="postComma1" select="substring-after($fullOrg,',')"/>
            <xsl:variable name="division" select="substring-after($postComma1,',')"/>
            <xsl:variable name="divisionHasGeo" select="contains($division,'Geo')"/>
            <xsl:variable name="branch" select="substring-after($division,',')"/>
            <xsl:variable name="branchHasGeo" select="contains($branch,'Geo')"/>
            <xsl:variable name="branchHasCarto" select="contains($branch,'Cart')"/>
            <xsl:variable name="hasRegional" select="contains($division,'Regional')"/>
            <xsl:variable name="hasNSGPB"  select="contains($branch,'National')"/>

         <!--     <xsl:comment>fullOrg:<xsl:value-of select="$fullOrg"/></xsl:comment>
        <xsl:comment>postComma1:<xsl:value-of select="$postComma1"/></xsl:comment>
        <xsl:comment>division:<xsl:value-of select="$division"/></xsl:comment>
        <xsl:comment>branch:<xsl:value-of select="$branch"/></xsl:comment> 
        <xsl:comment>hasRegional <xsl:value-of select="$hasRegional"/></xsl:comment>--> 
            
            <xsl:choose>
                <xsl:when test="$branchHasGeo='true'">
                    <xsl:call-template name="GeographyDivisionPointOfContact"/>
                </xsl:when>
                <xsl:when test="$branchHasCarto='true'">
                    <xsl:call-template name="CartographicProductsBranchPointOfContact"/>
                </xsl:when>
                <xsl:when test="$divisionHasGeo='true'">
                    <xsl:call-template name="GeographyDivisionPointOfContact"/>
                </xsl:when>
                <xsl:when test="$hasNSGPB='true'">
                    <xsl:call-template name="NSGPBPointOfContact"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:element name="gmd:pointOfContact">
                        <xsl:element name="gmd:CI_ResponsibleParty">
                            <xsl:text>&#10;</xsl:text>
                            <xsl:comment> From section 1 of the FGDC Standard </xsl:comment>
                           
                            <xsl:element name="gmd:organisationName">
                                <xsl:element name="gco:CharacterString">
                                    <xsl:value-of select="./Contact_Organization"/>
                                </xsl:element>

                            </xsl:element>

                            <xsl:element name="gmd:contactInfo">
                                <xsl:element name="gmd:CI_Contact">
                                    <xsl:element name="gmd:phone">
                                        <xsl:element name="gmd:CI_Telephone">

                                            <xsl:element name="gmd:voice">
                                                <xsl:element name="gco:CharacterString">
                                                  <xsl:value-of select="./Contact_Voice_Telephone"/>
                                                </xsl:element>
                                            </xsl:element>

                                            <xsl:element name="gmd:facsimile">
                                                <xsl:element name="gco:CharacterString">
                                                  <xsl:value-of
                                                  select="./Contact_Facsimile_Telephone"/>
                                                </xsl:element>
                                            </xsl:element>


                                        </xsl:element>
                                    </xsl:element>

                                    <xsl:element name="gmd:address">
                                        <xsl:element name="gmd:CI_Address">

                                            <xsl:element name="gmd:deliveryPoint">
                                                <xsl:element name="gco:CharacterString">
                                                  <xsl:value-of select="./Contact_Address/Address"/>
                                                </xsl:element>
                                            </xsl:element>

                                            <xsl:element name="gmd:city">
                                                <xsl:element name="gco:CharacterString">
                                                  <xsl:value-of select="./Contact_Address/City"/>
                                                </xsl:element>
                                            </xsl:element>
                                            <xsl:element name="gmd:administrativeArea">
                                                <xsl:element name="gco:CharacterString">
                                                  <xsl:value-of select="./Contact_Address/State_or_Province"/>
                                                </xsl:element>
                                            </xsl:element>

                                            <xsl:element name="gmd:postalCode">
                                                <xsl:element name="gco:CharacterString">
                                                  <xsl:value-of
                                                  select="./Contact_Address/Postal_Code"/>
                                                </xsl:element>
                                            </xsl:element>

                                            <xsl:element name="gmd:country">
                                                <xsl:element name="gco:CharacterString">
                                                  <xsl:value-of select="./Contact_Address/Country"/>
                                                </xsl:element>
                                            </xsl:element>

                                            <xsl:element name="gmd:electronicMailAddress">
                                                <xsl:element name="gco:CharacterString">
                                                  <xsl:value-of select="./Contact_Electronic_Mail_Address"/>
                                                </xsl:element>
                                            </xsl:element>
                                        </xsl:element>
                                    </xsl:element>

                                </xsl:element>
                            </xsl:element>

                            <xsl:element name="gmd:role">
                                <xsl:choose>

                                    <xsl:when test="$hasRegional ='true'">
                                        <xsl:element name="gmd:CI_RoleCode">
                                            <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_RoleCode</xsl:attribute>
                                            <xsl:attribute name="codeListValue">pointOfContact</xsl:attribute>
                                            <xsl:attribute name="codeSpace">007</xsl:attribute>pointOfContact</xsl:element>


                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:element name="gmd:CI_RoleCode">
                                            <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_RoleCode</xsl:attribute>
                                            <xsl:attribute name="codeListValue">originator</xsl:attribute>
                                            <xsl:attribute name="codeSpace">007</xsl:attribute>originator</xsl:element>

                                    </xsl:otherwise>
                                </xsl:choose>

                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
