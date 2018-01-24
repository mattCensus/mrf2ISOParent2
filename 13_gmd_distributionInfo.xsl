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
   
   
   <xsl:import href="../mrf2ISO/distCont.xsl"/>
   <xsl:import href="../mrf2ISO/MD_MediumFormatCode.xsl"/>
   <xsl:import href="../mrf2ISOParent/OtherCitationDetails.xsl"/>
   <xsl:import href="../mrf2ISOParent/ESRIRestPoint.xsl"/>
   <xsl:import href="../mrf2ISOParent/WMSDist.xsl"/>
   
   <xd:doc scope="stylesheet">
      <xd:desc>
         <xd:p>mrf2ISOParent/13_gmd_distributionInfo.xsl</xd:p>
         <xd:p>called by the mrf2ISOParent/MRF2ISOParent.xsl template</xd:p>
         <xd:p><xd:b>Created on:</xd:b> Jan 27, 2014</xd:p>
         <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
         <xd:p> calls on the following template</xd:p>
         <xd:p> Template                 Stylesheet/File                     Description
                distPointofContact        SeriesInfoTitle.xsl                formats the gmd:title element for the parent file
                MD_MediumFormatCode       MD_MediumFormatCode.xsl            Handles the gmd:mediumFormat element      
                OtherCitationDetails      OtherCitationDetails.xsl           Handles the the gmd:otherCitationDetails 
         </xd:p>
         <xd:ul>
            <xd:li>Template                       Explanation                             </xd:li>
            <xd:li>distributionInfo               Handles the gmd:distributionInfo element</xd:li>
           
            
         </xd:ul>
         <xd:p>
            Initial   Date                           Description
            MMC       12/12/13                      Inserted the gmd:fileDecompressionTechnique element. This is represented by File_Decompression_Technique in the 
                                                      MIF file.
            MMC       1/8/2014                      Modified to work on the MRF Format
            MMC       1/7/2015                      Modified the gmd:online element to have a choice structure to accomadate KML files. 
            MMC       2/2/2015                      Modified the if to work with version 2.0 
            MMC       2/17/17                       Fixed the spelling of "HTML"
            MMC       2/17/17                       
         </xd:p>
      </xd:desc>
   </xd:doc>
   
   
   <xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>


   <xsl:template name="distributionInfo" match="/">
      <xsl:variable name="FileType" select="/MRF/Identification_Information/Citation/Title"/>
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

            <xsl:element name="gmd:distributionFormat">   
               <xsl:element name="gmd:MD_Format">
                  <xsl:element name="gmd:name">
                     <xsl:element name="gco:CharacterString">HTML</xsl:element><!-- gco:CharacterString -->
                  </xsl:element><!-- gmd:name -->
                  
                  <xsl:element name="gmd:version">
                     <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                  </xsl:element>
               </xsl:element>
            </xsl:element>
            
            <xsl:element name="gmd:distributor">
               <xsl:element name="gmd:MD_Distributor">


                  <!--  <xsl:comment>calling the template</xsl:comment>
                  <xsl:comment>template: distPointofContact</xsl:comment>--> 
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
                 <!--  <xsl:comment>Tranfer options#1</xsl:comment> -->
                  <xsl:variable name="formatType" select="/MRF/Distribution_Information/Standard_Order_Process/Digital_Form/Format_Name"/>
                 <!-- <xsl:comment>formatType:<xsl:value-of select="$formatType"/></xsl:comment> -->
                  
                  <xsl:choose>
                     <xsl:when test="$formatType = 'KML'">
                       <!--   <xsl:comment>This is where the KML format goes!!!!!!!!!!!!!!</xsl:comment>-->
                        <xsl:element name="gmd:onLine">
                           <xsl:element name="gmd:CI_OnlineResource">
                              
                              <xsl:element name="gmd:linkage">
                                 <xsl:element name="gmd:URL">
                                    <xsl:variable name="NetResName" select="/MRF/Distribution_Information/Standard_Order_Process/Digital_Form/Digital_Transfer_Option/Network_Resource_Name"/>
                                    <xsl:choose>
                                       <xsl:when test="contains($NetResName,'cb')">
                                          <!--  <xsl:comment>In the cb!!!!!!!!!!!!</xsl:comment>-->
                                          <xsl:variable name="downloadURl" select="substring-before($NetResName,'cb')"/>
                                          <xsl:value-of select="$downloadURl"/>
                                       </xsl:when>
                                       <xsl:when test="contains($NetResName,'tl')">
                                          <xsl:variable name="downloadURl" select="substring-before($NetResName,'tl')"/>
                                          <xsl:value-of select="$downloadURl"/>
                                       </xsl:when>
                                    </xsl:choose>
                                 </xsl:element> <!-- gmd:URL -->
                              </xsl:element> <!--gmd:linkage  -->
                          
                        
                           <xsl:element name="gmd:protocol">
                              <xsl:element name="gco:CharacterString">http</xsl:element>
                           </xsl:element>
                           
                           <xsl:element name="gmd:applicationProfile">
                              <xsl:element name="gco:CharacterString">Google Earth</xsl:element>
                           </xsl:element>
                           
                           <xsl:element name="gmd:name">
                              <xsl:element name="gco:CharacterString">Keyhole Markup Language (KML)</xsl:element>
                           </xsl:element>
                           
                           <xsl:element name="gmd:description">
                              <xsl:element name="gco:CharacterString"><xsl:value-of select="/MRF/Distribution_Information/Standard_Order_Process/Digital_Form/Online_Description"/></xsl:element>
                           </xsl:element>
                           
                           <xsl:element name="gmd:function">
                              <xsl:element name="gmd:CI_OnLineFunctionCode">
                                 <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_OnLineFunctionCode</xsl:attribute>
                                 <xsl:attribute name="codeListValue">download</xsl:attribute>download</xsl:element>
                              <!-- gmd:CI_OnLineFunctionCode  --> 
                           </xsl:element><!-- gmd:function  -->
                           </xsl:element> <!-- gmd:CI_OnlineResource -->
                        </xsl:element><!-- gmd:onLine -->
                     </xsl:when>
                  <xsl:otherwise>
                  <xsl:element name="gmd:onLine">
                     <!-- <xsl:comment>Here we are!!!!!!!!!!!!!!</xsl:comment> -->
                     <xsl:element name="gmd:CI_OnlineResource">
                        <xsl:element name="gmd:linkage">
                           <xsl:element name="gmd:URL">
                              <!--  <xsl:comment>In the download URL</xsl:comment>-->
                              <!--  <xsl:value-of select="/MRF/Distribution_Information/Standard_Order_Process/Digital_Form/Digital_Transfer_Option/Network_Resource_Name"/>-->
                              <xsl:variable name="NetResName" select="/MRF/Distribution_Information/Standard_Order_Process/Digital_Form/Digital_Transfer_Option/Network_Resource_Name"/>
                              <xsl:choose>
                                 <xsl:when test="contains($NetResName,'cb')">
                                      <xsl:comment>In the cb!!!!!!!!!!!!</xsl:comment>
                                    <xsl:variable name="downloadURl" select="substring-before($NetResName,'cb')"/>
                                    <xsl:value-of select="$downloadURl"/>
                                 </xsl:when>
                                 <xsl:when test="contains($NetResName,'tl')">
                                    <xsl:variable name="downloadURl" select="substring-before($NetResName,'tl')"/>
                                    <xsl:value-of select="$downloadURl"/>
                                 </xsl:when>
                              </xsl:choose>
                              <xsl:variable name="PreZip" select="sub"></xsl:variable>
                           </xsl:element><!-- gmd:URL -->
                           </xsl:element><!-- gmd:linkage -->
                           <xsl:element name="gmd:name">
                              <xsl:element name="gco:CharacterString">Shapefile Zip File</xsl:element>
                           </xsl:element>
                        
                          
                     </xsl:element> <!-- gmd:CI_OnlineResource -->
                  </xsl:element> <!-- gmd:onLine -->
                  </xsl:otherwise>
                </xsl:choose>
               </xsl:element>
               <!-- gmd:MD_DigitalTransferOptions -->
            </xsl:element>
            <!-- gmd:transferOptions -->
            <xsl:choose>
               <xsl:when test="contains($FileType,'Cartographic')">
                  <!--  <xsl:comment>template:cartFiles</xsl:comment>-->
                  <xsl:call-template name="cartFiles"/>
               </xsl:when>
               <xsl:when test="contains($FileType,'TIGER')">
                  <!--  <xsl:comment>template:tigerFiles</xsl:comment>-->
                  <xsl:call-template name="tigerFiles"/>
               </xsl:when>
            </xsl:choose>
            <!-- offline -->
           <!--   <xsl:comment>template:distEA</xsl:comment>-->
            <xsl:call-template name="distEA"/>
           <!--   <xsl:comment>End of distEA</xsl:comment>-->
            <xsl:if test="/MIF/Recording_Format">
               <xsl:element name="gmd:transferOptions">
                  <!--  <xsl:comment>Here we are!!!!!!!!!!!!!!!!!!!!</xsl:comment>
                  <xsl:comment>Tranfer options#2</xsl:comment>-->
                  <xsl:element name="gmd:MD_DigitalTransferOptions">

                     <xsl:element name="gmd:offLine">
                        <xsl:element name="gmd:MD_Medium">

                           <xsl:element name="gmd:name"> </xsl:element>
                           <!-- gmd:name -->

                           <xsl:if test="/MIF/Recording_Format">
                              
                              <xsl:comment>IN the recording Format </xsl:comment>
                              <!-- <xsl:comment>template:MD_MediumFormatCode</xsl:comment> -->
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
   
   <xsl:template name="cartFiles">
      <xsl:element name="gmd:transferOptions">
         <xsl:element name="gmd:MD_DigitalTransferOptions">
            <xsl:element name="gmd:onLine">
               <xsl:element name="gmd:CI_OnlineResource">
                  <xsl:element name="gmd:linkage">
                    <!--   <xsl:comment>Tranfer options#3</xsl:comment>-->
                     <xsl:element name="gmd:URL">https://www.census.gov/geo/maps-data/data/tiger-cart-boundary.html</xsl:element>
                  </xsl:element>
                  <xsl:element name="gmd:name">
                     <xsl:element name="gco:CharacterString">Cartographic Boundary Shapefiles</xsl:element>
                  </xsl:element>
                  <xsl:element name="gmd:description">
                     <xsl:element name="gco:CharacterString">Simplified representations of selected geographic areas from the Census Bureau&apos;s MAF/TIGER geographic
                                                             database</xsl:element>
                  </xsl:element>
               </xsl:element>
            </xsl:element>
            
         </xsl:element>
      </xsl:element>
   </xsl:template>
   
   <xsl:template name="tigerFiles">
      <xsl:element name="gmd:transferOptions">
       <!--   <xsl:comment>Tranfer options#4</xsl:comment>-->
         <xsl:element name="gmd:MD_DigitalTransferOptions">
            <xsl:element name="gmd:onLine">
               <xsl:element name="gmd:CI_OnlineResource">
                  <xsl:element name="gmd:linkage">
                     <xsl:element name="gmd:URL">http://www.census.gov/geo/maps-data/data/tiger-line.html</xsl:element>
                  </xsl:element>
                  <xsl:element name="gmd:name">
                     <xsl:element name="gco:CharacterString">TIGER/Line&#174; Shapefiles</xsl:element>
                  </xsl:element>
                  <xsl:element name="gmd:description">
                     <xsl:element name="gco:CharacterString">Should be used for most mapping projects--this is our most comprehensive dataset. Designed for use with
                                                             GIS (geographic information systems).</xsl:element>
                  </xsl:element>
               </xsl:element>
            </xsl:element> 
            
         </xsl:element>
      </xsl:element>
      
      <xsl:variable name="NgdaCheck" select="/MRF/Identification_Information[1]/Keywords[1]/Theme[1]/Theme_Keyword_Thesaurus[1]"/>
      <!--   <xsl:comment><xsl:value-of select="$NgdaCheck"/></xsl:comment>-->
      <xsl:if test="contains($NgdaCheck,'NGDA Portfolio Themes')">
         <!--  <xsl:comment>calling the WMS and Rest Point Templates</xsl:comment>-->
         <xsl:call-template name="WMSDist"/>
         <xsl:call-template name="EsriRest"/>
      </xsl:if>
     <!-- <xsl:comment>where do we go from here?</xsl:comment> --> 
   </xsl:template>
</xsl:stylesheet>
