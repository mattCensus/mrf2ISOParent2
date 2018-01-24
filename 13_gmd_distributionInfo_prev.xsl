<?xml version="1.0" encoding="UTF-8" ?>

<!--
   Name:  13_gmd:distributionInfo.xsl
   Author:  Matthew J. McCready
   Date:  20120124
   Description:  XSLT stylesheet that transforms MIF elements into section 13 of the ISO Standard.
                
   Modification History:
      Initial   Date      Change Request ID   Description
      MMC       12/12/13                      Inserted the gmd:fileDecompressionTechnique element. This is represented by File_Decompression_Technique in the 
                                               MIF file.
      MMC       1/8/2014                      Modified to work on the MRF Format                                      
-->

<!-- 
List of Related Templates and associated stylesheets
Template                                     Stylesheet/File
MD_MediumFormatCode                          MD_MediumFormatCode.xsl
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gco="http://www.isotc211.org/2005/gco">
   
   <xsl:import href="../mrf2ISO/distCont.xsl"/>
   <xsl:import href="../mrf2ISO/MD_MediumFormatCode.xsl"/>
   
   <xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>


   <xsl:template name="distributionInfo" match="/">

      <xsl:element name="gmd:distributionInfo">
         <xsl:element name="gmd:MD_Distribution">
            <xsl:element name="gmd:distributionFormat">
               <xsl:element name="gmd:MD_Format">

                  <xsl:element name="gmd:name">
                     <xsl:element name="gco:CharacterString">
                        <xsl:value-of select="/MRF/Distribution_Information/Standard_Order_Process/Digital_Form/Format_Name"/>
                     </xsl:element>
                     <!-- gco:CharacterString -->
                  </xsl:element>
                  <!-- gmd:name -->



                  <xsl:choose>
                     <xsl:when test="/MRF/Distribution_Information/Standard_Order_Process/Digital_Form/Format_Version">
                        <xsl:element name="gmd:version">
                           <xsl:element name="gco:CharacterString">
                              <xsl:value-of select="/MRF/Distribution_Information/Standard_Order_Process/Digital_Form/Format_Version"/>
                           </xsl:element>
                           <!-- gco:CharacterString -->
                        </xsl:element>
                        <!-- gmd:version -->
                     </xsl:when>

                     <xsl:when test="/MRF/Distribution_Information/Standard_Order_Process/Digital_Form/Format_Version_Date">
                        <xsl:element name="gmd:version">
                           <xsl:element name="gco:CharacterString">
                              <xsl:value-of select="/MRF/Distribution_Information/Standard_Order_Process/Digital_Form/Format_Version_Date"/>
                           </xsl:element>
                           <!-- gco:CharacterString -->
                        </xsl:element>
                        <!-- gmd:amendmentNumber -->
                     </xsl:when>


                     <xsl:otherwise>
                        <xsl:element name="gmd:version">
                           <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                        </xsl:element>
                     </xsl:otherwise>
                  </xsl:choose>

                  <xsl:choose>
                     <xsl:when test="/MRF/Distribution_Information/Technical_Prerequisites">
                        <xsl:element name="gmd:fileDecompressionTechnique">
                           <xsl:element name="gco:CharacterString">
                              <xsl:value-of select="/MRF/Distribution_Information/Technical_Prerequisites"/>
                           </xsl:element>
                        </xsl:element>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:element name="gmd:fileDecompressionTechnique">
                           <xsl:attribute name="nilReason">missing</xsl:attribute>
                        </xsl:element>
                     </xsl:otherwise>
                     
                  </xsl:choose>

               </xsl:element>
               <!-- gmd:MD_Format -->
            </xsl:element>
            <!-- gmd:distributionFormat -->

            <xsl:element name="gmd:distributor">
               <xsl:element name="gmd:MD_Distributor">


                  <!--  <xsl:comment>calling the template</xsl:comment>--> 
                  <xsl:call-template name="distPointofContact"/>


                  <xsl:element name="gmd:distributionOrderProcess">
                     <xsl:element name="gmd:MD_StandardOrderProcess">

                        <xsl:element name="gmd:fees">
                           <xsl:element name="gco:CharacterString">
                              <xsl:value-of select="/MRF/Distribution_Information/Standard_Order_Process/Fees"/>
                           </xsl:element>
                           <!-- gco:CharacterString -->
                        </xsl:element>
                        <!-- gmd:fees -->

                        <xsl:if test="/MRF/Distribution_Information/Standard_Order_Process/Ordering_Instructions">
                           <xsl:element name="gmd:orderingInstructions">
                              <xsl:element name="gco:CharacterString">
                                 <xsl:value-of select="/MRF/Distribution_Information/Standard_Order_Process/Ordering_Instructions"/>
                              </xsl:element>
                              <!-- gco:CharacterString -->
                           </xsl:element>
                           <!-- gmd:orderingInstructions -->
                        </xsl:if>

                     </xsl:element>
                     <!-- gmd:MD_StandardOrderProcess -->
                  </xsl:element>
                  <!-- gmd:distributionOrderProcess -->

               </xsl:element>
               <!-- gmd:MD_Distributor -->
            </xsl:element>
            <!-- gmd:distributor -->

            <!-- online -->
            <xsl:element name="gmd:transferOptions">
               <xsl:element name="gmd:MD_DigitalTransferOptions">

                  <xsl:element name="gmd:onLine">
                     <xsl:element name="gmd:CI_OnlineResource">
                        <xsl:element name="gmd:linkage">
                           <xsl:element name="gmd:URL">
                              <xsl:value-of select="/MRF/Distribution_Information/Standard_Order_Process/Digital_Form/Digital_Transfer_Option/Network_Resource_Name"/>
                           </xsl:element>
                           <!-- gmd:URL -->
                        </xsl:element>
                        <!-- gmd:linkage -->
                     </xsl:element>
                     <!-- gmd:CI_OnlineResource -->
                  </xsl:element>
                  <!-- gmd:onLine -->

               </xsl:element>
               <!-- gmd:MD_DigitalTransferOptions -->
            </xsl:element>
            <!-- gmd:transferOptions -->

            <!-- offline -->

            <xsl:if test="/MIF/Recording_Format">
               <xsl:element name="gmd:transferOptions">
                  <xsl:element name="gmd:MD_DigitalTransferOptions">

                     <xsl:element name="gmd:offLine">
                        <xsl:element name="gmd:MD_Medium">

                           <xsl:element name="gmd:name"> </xsl:element>/
                           <!-- gmd:name -->

                           <xsl:if test="/MIF/Recording_Format">
                              <xsl:comment>IN the recording Format </xsl:comment>
                              <xsl:call-template name="MD_MediumFormatCode"/>
                           </xsl:if>


                        </xsl:element>
                        <!-- gmd:MD_Medium -->
                     </xsl:element>
                     <!-- gmd:offLine -->
                     <!-- </xsl:if> -->

                  </xsl:element>
                  <!-- gmd:MD_DigitalTransferOptions -->
               </xsl:element>
               <!-- gmd:transferOptions -->
            </xsl:if>

            <!-- ending the elements -->
         </xsl:element>
         <!-- gmd:MD_Distribution -->
      </xsl:element>
      <!-- gmd:distributionInfo -->

   </xsl:template>
</xsl:stylesheet>
