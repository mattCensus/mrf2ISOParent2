<?xml version="1.0" encoding="UTF-8"?>


<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gfc="http://www.isotc211.org/2005/gfc"
    xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gmx="http://www.isotc211.org/2005/gmx"
    xmlns:gsr="http://www.isotc211.org/2005/gsr" xmlns:gss="http://www.isotc211.org/2005/gss"
    xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:gml="http://www.opengis.net/gml/3.2"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:grp="http://www.altova.com/Mapforce/grouping" exclude-result-prefixes="fn grp xs xsi xsl"
    xmlns="http://www.isotc211.org/2005/gfc">

    <xsl:import href="../MIF2ISO/05_gmd_contact.xsl"/>


    <!-- <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Apr 17, 2013</xd:p>
            <xd:p><xd:b>Author:</xd:b> Matthew J McCready</xd:p>
            <xd:p>This stylesheet handles the UUIDs for the CI_Responsible_Party section
            Initial   Date              Change Request ID       Description
            MMC       12/16/2013                                Modified  both templates so that the stylesheet applies the right template from the 
                                                                 05_gmd_contact.xsl stylesheet. Also corrected the variables so that the correct UUID
                                                                 is placed in the metadata file.
            MMC      1/8/2014                                   Modified to work on the MRF Format                                                      
                                                                 
            </xd:p>
        </xd:desc>
    </xd:doc> -->

    <xsl:template name="CitedResponsibleParty">
        <xsl:variable name="FullOrg" select="/MRF/Identification_Information[1]/Citation[1]/Originator[1]"/>
        <xsl:variable name="postComma1" select="substring-after($FullOrg,',')"/>
        <xsl:variable name="postComma2" select="substring-after($postComma1,',')"/>
        <xsl:variable name="postComma2HasGeo" select="contains($postComma2,'Geo')"></xsl:variable>
        <xsl:variable name="hasSlash" select="contains($postComma2,'/')"/>
        <xsl:variable name="hasComma" select="contains($postComma2,',')"></xsl:variable>

       <!--  <xsl:comment>FullOrg:<xsl:value-of select="$FullOrg"/> </xsl:comment>
        <xsl:comment>postComma1:<xsl:value-of select="$postComma1"/></xsl:comment>
        <xsl:comment>postComma2:<xsl:value-of select="$postComma2"/></xsl:comment> -->

        <xsl:choose>
            <xsl:when test="$hasSlash='true'">
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
                
               <!-- <xsl:comment>division:<xsl:value-of select="$division"/></xsl:comment>
                <xsl:comment>fullBranch<xsl:value-of select="$fullBranch"/></xsl:comment>
                <xsl:comment>finalBranch<xsl:value-of select="$finalBranch"/></xsl:comment> -->
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
            
            <xsl:when test="$postComma2HasGeo ='true'">
                <xsl:call-template name="GeographyDivisionOriginator"/>
            </xsl:when>
            
            <xsl:otherwise>
                <xsl:comment> In the second otherwise</xsl:comment>
                <xsl:element name="gmd:citedResponsibleParty">
                    <xsl:element name="gmd:CI_ResponsibleParty">
                        <xsl:element name="gmd:organisationName">
                            <xsl:element name="gco:CharacterString">
                                <xsl:value-of select="/MRF/Identification_Information[1]/Citation[1]/Originator[1]"/>
                            </xsl:element>
                        </xsl:element>
                        <xsl:element name="gmd:role">
                            <xsl:element name="gmd:CI_RoleCode">
                                <xsl:attribute name="codeList"
                                    >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_RoleCode</xsl:attribute>
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
        <xsl:variable name="fullOrg"
            select="/MRF/Identification_Information/Point_of_Contact/Contact_Organization"/>
        <xsl:variable name="postComma1" select="substring-after($fullOrg,',')"/>
        <xsl:variable name="division" select="substring-after($postComma1,',')"/>
        <xsl:variable name="divisionHasGeo" select="contains($division,'Geo')"></xsl:variable>
        <xsl:variable name="branch" select="substring-after($division,',')"/>
        <xsl:variable name="branchHasGeo" select="contains($branch,'Geo')"/>
        <xsl:variable name="branchHasCarto" select="contains($branch,'Cart')"></xsl:variable>

       <!--  <xsl:comment>fullOrg:<xsl:value-of select="$fullOrg"/></xsl:comment>
        <xsl:comment>postComma1:<xsl:value-of select="$postComma1"/></xsl:comment>
        <xsl:comment>division:<xsl:value-of select="$division"/></xsl:comment>
        <xsl:comment>branch:<xsl:value-of select="$branch"/></xsl:comment> -->

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
            <xsl:otherwise>
                <xsl:element name="gmd:pointOfContact">
                    <xsl:element name="gmd:CI_ResponsibleParty">
                        <xsl:text>
</xsl:text>
                        <xsl:comment> From section 1 of the FGDC Standard </xsl:comment>
                        <xsl:text>
</xsl:text>
                        <xsl:element name="gmd:organisationName">
                            <xsl:element name="gco:CharacterString">
                                <xsl:value-of
                                    select="/MRF/Identification_Information/Point_of_Contact/Contact_Organization"
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

                                        <xsl:element name="gmd:facsimile">
                                            <xsl:element name="gco:CharacterString">
                                                <xsl:value-of
                                                  select="/MRF/Identification_Information/Point_of_Contact/Contact_Facsimile_Telephone"
                                                />
                                            </xsl:element>
                                        </xsl:element>


                                    </xsl:element>
                                </xsl:element>

                                <xsl:element name="gmd:address">
                                    <xsl:element name="gmd:CI_Address">

                                        <xsl:element name="gmd:deliveryPoint">
                                            <xsl:element name="gco:CharacterString">
                                                <xsl:value-of
                                                  select="/MRF/Identification_Information/Point_of_Contact/Contact_Address/Address"
                                                />
                                            </xsl:element>
                                        </xsl:element>

                                        <xsl:element name="gmd:city">
                                            <xsl:element name="gco:CharacterString">
                                                <xsl:value-of
                                                  select="/MRF/Identification_Information/Point_of_Contact/Contact_Address/City"/>
                                            </xsl:element>
                                        </xsl:element>
                                        <xsl:element name="gmd:administrativeArea">
                                            <xsl:element name="gco:CharacterString">
                                                <xsl:value-of
                                                  select="/MRF/Identification_Information/Point_of_Contact/Contact_Address/State_or_Province"
                                                />
                                            </xsl:element>
                                        </xsl:element>

                                        <xsl:element name="gmd:postalCode">
                                            <xsl:element name="gco:CharacterString">
                                                <xsl:value-of
                                                  select="/MRF/Identification_Information/Point_of_Contact/Contact_Address/Postal_Code"
                                                />
                                            </xsl:element>
                                        </xsl:element>

                                        <xsl:element name="gmd:country">
                                            <xsl:element name="gco:CharacterString">
                                                <xsl:value-of
                                                  select="/MRF/Identification_Information/Point_of_Contact/Contact_Address/Country"
                                                />
                                            </xsl:element>
                                        </xsl:element>

                                        <xsl:element name="gmd:electronicMailAddress">
                                            <xsl:element name="gco:CharacterString">
                                                <xsl:value-of
                                                  select="/MRF/Identification_Information/Point_of_Contact/Contact_Electronic_Mail_Address"
                                                />
                                            </xsl:element>
                                        </xsl:element>
                                    </xsl:element>
                                </xsl:element>

                            </xsl:element>
                        </xsl:element>

                        <xsl:element name="gmd:role">

                            <xsl:element name="gmd:CI_RoleCode">
                                <xsl:attribute name="codeList"
                                    >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_RoleCode</xsl:attribute>
                                <xsl:attribute name="codeListValue">pointOfContact</xsl:attribute>
                                <xsl:attribute name="codeSpace">007</xsl:attribute>originator</xsl:element>

                        </xsl:element>

                    </xsl:element>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
