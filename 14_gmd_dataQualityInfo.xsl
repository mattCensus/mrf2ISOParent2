<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gfc="http://www.isotc211.org/2005/gfc"
   xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gmx="http://www.isotc211.org/2005/gmx"
   xmlns:gsr="http://www.isotc211.org/2005/gsr" xmlns:gss="http://www.isotc211.org/2005/gss"
   xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:gml="http://www.opengis.net/gml/3.2"
   xmlns:xlink="http://www.w3.org/1999/xlink"   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:fn="http://www.w3.org/2005/xpath-functions"
   xmlns:grp="http://www.altova.com/Mapforce/grouping"
   xmlns:mdb="	http://www.isotc211.org/schemas/2012/mdb"
   xmlns:ci="http://www.isotc211.org/schemas/2012/ci" exclude-result-prefixes="fn grp xs xsi xsl xd"
   xmlns="http://www.isotc211.org/2005/gfc">


   <xd:doc scope="stylesheet">
      <xd:desc>
         <xd:p>mrf2ISOParent/14_gmd_dataQualityInfo.xsl</xd:p>
         <xd:p>called by the mrf2ISOParent/MRF2ISOParent.xsl template</xd:p>
         <xd:p> XSLT stylesheet that transforms a MIF file into the gmd:DQ_DataQuality section of an ISO file. This stylesheet is called by 
            the  MIF2iso19115-2_master.xslt stylesheet. This template calls on the dateTimeTemp template, located in this stylesheet, and the DataQualitySource template, 
            located in the DataQualitySource.xsl stylesheet. The DataQualitySource template handles all the gmd:lineage information.</xd:p>
         <xd:p><xd:b>Created on:</xd:b> Jan 27, 2014</xd:p>
         <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
         <xd:ul>
            <xd:li>Template                       Explanation                                                      </xd:li>
            <xd:li>dataQualityInfo                Handles the gmd:dataQualityInfo element                          </xd:li>
            <xd:li>dateTimeTemp                   Handles the date and time information for the dataQuality section</xd:li>
            
         </xd:ul>
         <xd:p>
            Initial   Date                 Description
            MMC		07/07/2011            Added the gmd:DQ_Scope, md:level and gmd:MD_ScopeCode elements to comply with the ISO standard.
            MMC      07/07/2011            Added the gmd:DQ_CompletenessCommission to one of the gmd:report elements
            MMC		07/08/2011            Created the dateTimeTemp template to work with dates and times for the gmd:DateTime element. This 
                                            element has to be in the MMDDYYYYT00:00:00 format, even when oly a year is given in the 
                                            /metadata/dataqual/lineage/procstep/procdate FGDC element. To correctly format this ISO element, a default -01-01 for 
                                            the month is inserted and all 0, for the time when only a year is given in the FGDC XML. 
            MMC      07/08/2011             Inserted the CI_Date package under the gmd:source/CI_Citation section. Previously, the gco:date element was not in this
                                           package.
            MMC      07/13/2011            Modified the dateTimeTemp template to include the actual time for the gmd:DateTime ISO element and not the default 
                                            01T00:00:00 for transforming FGDC files that have the Process Time element. The correct ISO format was inserted for the
                                            Process Date elements that do not include the month or day.
            MMC      11/1/2011             Changed the gco:Date element to the gco:DateTime element in the dateTimeTemp template to better adhere to the standard. 
            MMC      03/15/2012            Modified to transform from a MIF file to an ISO file
            MMC      04/18/2012            Modified the gmd:DateTime element so that the correct value is inserted in the correct format.  
            MMC      12/04/2013            Included the gmd:description element under LI_Source to describe the type of source media 
            MMC       1/10/2014            Modified to work on the MRF Format
            MMC      12/12/2013            Inserted the gmd:fileDecompressionTechnique element. This is represented by File_Decompression_Technique in the MIF file.
            MMC        1/8/2014            Modified to work on the MRF Format
            MMC        1/7/2015            Modified the gmd:online element to have a choice structure to accomadate KML files. 
            MMC        2/2/2015            Modified the if to work with version 2.0 
         </xd:p>
      </xd:desc>
   </xd:doc>

   <xsl:template name="dataQualityInfo" match="/">
      <xsl:element name="gmd:dataQualityInfo">
         <xsl:element name="gmd:DQ_DataQuality">

            <xsl:element name="gmd:scope">
               <xsl:element name="gmd:DQ_Scope">

                  <xsl:element name="gmd:level">
                     <xsl:element name="gmd:MD_ScopeCode">
                        <xsl:attribute name="codeList"
                           >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_ScopeCode</xsl:attribute>
                        <xsl:attribute name="codeListValue">dataset</xsl:attribute>
                        <xsl:attribute name="codeSpace">005</xsl:attribute> dataset </xsl:element>
                     <!-- gmd:MD_ScopeCode -->
                  </xsl:element>
                  <!-- gmd:level -->

               </xsl:element>
               <!-- gmd:DQ_Scope -->
            </xsl:element>
            <!-- gmd:scope -->

            <!-- /metadata/dataqual/posacc/horizpa -->
            <xsl:if test="/MRF/Data_Quality_Information/Horizontal_Positional_Accuracy_Report">
               <xsl:element name="gmd:report">
                  <xsl:element name="gmd:DQ_AbsoluteExternalPositionalAccuracy">

                     <xsl:element name="gmd:nameOfMeasure">
                        <xsl:element name="gco:CharacterString">Horizontal Positional
                           Accuracy</xsl:element>
                        <!-- gco:CharacterString -->
                     </xsl:element>
                     <!-- gmd:nameOfMeasure -->

                     <!-- /metadata/dataqual/posacc/horizpa/qhorizpa/horizpae -->
                     <xsl:element name="gmd:measureDescription">
                        <xsl:element name="gco:CharacterString">
                           <xsl:value-of
                              select="/MRF/Data_Quality_Information/Quantitative_Horizontal_Positional_Accuracy_Assessment/Horizontal_Positional_Accuracy_Explanation"
                           />
                        </xsl:element>
                     </xsl:element>
                     <!-- gmd:measureDescription -->

                     <xsl:element name="gmd:evaluationMethodDescription">
                        <xsl:element name="gco:CharacterString">
                           <xsl:value-of
                              select="/MRF/Data_Quality_Information/Horizontal_Positional_Accuracy_Report"
                           />
                        </xsl:element>
                        <!-- gco:CharacterString -->
                     </xsl:element>
                     <!-- gmd:evaluationMethodDescription -->

                     <xsl:choose>
                        <xsl:when
                           test="/MRF/Data_Quality_Information/Quantitative_Horizontal_Positional_Accuracy_Assessment/Horizontal_Positional_Accuracy_Value">
                           <!-- <xsl:if test="/MRF/Data_Quality_Information/Quantitative_Horizontal_Positional_Accuracy_Assessment/Horizontal_Positional_Accuracy_Value"> -->
                           <xsl:element name="gmd:result">
                              <xsl:element name="gmd:DQ_QuantitativeResult">

                                 <xsl:element name="gmd:valueUnit">

                                    <xsl:element name="gml:BaseUnit">

                                       <xsl:attribute name="gml:id">meters</xsl:attribute>
                                       <xsl:element name="gml:identifier">
                                          <xsl:attribute name="codeSpace">meters </xsl:attribute>
                                          meters</xsl:element>


                                       <xsl:element name="gml:unitsSystem">
                                          <xsl:attribute name="xlink:href"
                                             >http://www.bipm.org/en/si/ </xsl:attribute>
                                       </xsl:element>
                                       <!-- gml:unitsSystem -->

                                    </xsl:element>
                                    <!-- gml:BaseUnit -->
                                 </xsl:element>
                                 <!-- gmd:valueUnit -->

                                 <!-- /metadata/dataqual/posacc/horizpa/qhorizpa/horizpav -->
                                 <xsl:choose>

                                    <xsl:when
                                       test="/MRF/Data_Quality_Information/Quantitative_Horizontal_Positional_Accuracy_Assessment/Horizontal_Positional_Accuracy_Value">
                                       <xsl:element name="gmd:value">
                                          <xsl:element name="gco:Record">
                                             <xsl:value-of
                                                select="/MRF/Data_Quality_Information/Quantitative_Horizontal_Positional_Accuracy_Assessment/Horizontal_Positional_Accuracy_Value"
                                             />
                                          </xsl:element>
                                          <!-- gco:Record -->
                                       </xsl:element>
                                       <!-- gmd:value -->
                                    </xsl:when>

                                    <xsl:otherwise>
                                       <!-- nilReason -->

                                       <xsl:element name="gmd:value">
                                          <xsl:attribute name="nilReason">missing</xsl:attribute>
                                       </xsl:element>
                                       <!-- gmd:value -->

                                    </xsl:otherwise>

                                 </xsl:choose>
                              </xsl:element>
                              <!-- gmd:DQ_QuantitativeResult -->
                           </xsl:element>
                           <!-- gmd:result -->
                           <!-- </xsl:if> -->
                        </xsl:when>

                        <xsl:otherwise>
                           <!-- <xsl:element name="gmd:result">
<xsl:attribute name="nilReason">missing</xsl:attribute>
</xsl:element> -->
                           <!-- gmd:result -->

                           <xsl:element name="gmd:result">
                              <xsl:element name="gmd:DQ_QuantitativeResult">
                                 <xsl:element name="gmd:valueUnit">

                                    <xsl:element name="gml:BaseUnit">

                                       <xsl:attribute name="gml:id">meters</xsl:attribute>
                                       <xsl:element name="gml:identifier">
                                          <xsl:attribute name="codeSpace">meters </xsl:attribute>
                                          meters</xsl:element>


                                       <xsl:element name="gml:unitsSystem">
                                          <xsl:attribute name="xlink:href"
                                             >http://www.bipm.org/en/si/ </xsl:attribute>
                                       </xsl:element>
                                       <!-- gml:unitsSystem -->

                                    </xsl:element>
                                    <!-- gml:BaseUnit -->
                                 </xsl:element>
                                 <!-- gmd:valueUnit -->


                                 <xsl:element name="gmd:value">
                                    <xsl:element name="gco:Record">Missing </xsl:element>
                                    <!-- gco:Record -->
                                 </xsl:element>
                                 <!-- gmd:value -->
                              </xsl:element>
                              <!-- gmd:DQ_QuantitativeResult -->
                           </xsl:element>
                           <!-- gmd:result -->

                        </xsl:otherwise>

                     </xsl:choose>





                  </xsl:element>
                  <!-- gmd:DQ_AbsoluteExternalPositionalAccuracy -->

               </xsl:element>
               <!-- gmd:report -->
            </xsl:if>
            <!-- /metadata/dataqual/posacc/horizpa -->

            <xsl:element name="gmd:report">
               <xsl:element name="gmd:DQ_CompletenessCommission">
                  <xsl:element name="gmd:result">
                     <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                  </xsl:element>
                  <!-- gmd:result -->
               </xsl:element>
               <!-- gmd:DQ_CompletenessCommission -->
            </xsl:element>
            <!-- gmd:report -->

            <xsl:if test="/MRF/Data_Quality_Information/Completeness_Report">
               <xsl:element name="gmd:report">
                  <xsl:element name="gmd:DQ_CompletenessOmission">

                     <xsl:element name="gmd:evaluationMethodDescription">
                        <xsl:element name="gco:CharacterString">
                           <xsl:value-of select="/MRF/Data_Quality_Information/Completeness_Report"
                           />
                        </xsl:element>
                        <!-- gco:CharacterString -->
                     </xsl:element>
                     <!-- gmd:evaluationMethodDescription -->

                     <xsl:element name="gmd:result">
                        <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                     </xsl:element>
                     <!-- gmd:result -->


                  </xsl:element>
                  <!-- gmd:DQ_CompletenessOmission -->
               </xsl:element>
               <!-- gmd:report -->
            </xsl:if>
            <!-- /metadata/dataqual/complete -->

            <xsl:if test="/MRF/Data_Quality_Information/Logical_Consistency_Report">
               <xsl:element name="gmd:report">

                  <xsl:element name="gmd:DQ_ConceptualConsistency">
                     <xsl:element name="gmd:measureDescription">
                        <xsl:element name="gco:CharacterString">
                           <xsl:value-of
                              select="/MRF/Data_Quality_Information/Logical_Consistency_Report"/>
                        </xsl:element>
                        <!-- gco:CharacterString -->
                     </xsl:element>
                     <!-- gmd:measureDescription -->

                     <xsl:element name="gmd:result">
                        <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                     </xsl:element>
                     <!-- gmd:result -->

                  </xsl:element>
                  <!-- gmd:DQ_ConceptualConsistency -->

               </xsl:element>
               <!-- gmd:report -->
            </xsl:if>
            <!-- /metadata/dataqual[1]/logic[1] -->

            <xsl:element name="gmd:lineage">
               <xsl:element name="gmd:LI_Lineage">
                  <xsl:element name="gmd:processStep">
                     <xsl:element name="gmd:LI_ProcessStep">

                        <xsl:element name="gmd:description">
                           <xsl:element name="gco:CharacterString">
                              <xsl:value-of
                                 select="/MRF/Data_Quality_Information/Process_Step/Process_Description"
                              />
                           </xsl:element>
                           <!-- gco:CharacterString -->
                        </xsl:element>
                        <!-- gmd:description -->

                        <xsl:element name="gmd:dateTime">
                           <!-- <xsl:comment> calling the "dateTimeTemp template for the first time</xsl:comment> -->
                           <xsl:call-template name="dateTimeTemp"/>

                           <!-- <xsl:element name="gco:DateTime"><xsl:value-of select="/metadata/dataqual/lineage/procstep/procdate"/>  </xsl:element>-->
                           <!-- gco:DateTime -->
                        </xsl:element>
                        <!-- gmd:dateTime -->

                        <xsl:element name="gmd:source">
                           <xsl:element name="gmd:LI_Source">

                              <xsl:element name="gmd:description">
                                 <xsl:choose>
                                    <xsl:when
                                       test="/MRF/Data_Quality_Information/Process_Step/Process_Description">
                                       <xsl:element name="gco:CharacterString">
                                          <xsl:value-of
                                             select="/MRF/Data_Quality_Information/Source_Information/Type_of_Source_Media"
                                          />
                                       </xsl:element>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:attribute name="nilReason">missing</xsl:attribute>
                                    </xsl:otherwise>
                                 </xsl:choose>

                              </xsl:element>



                              <xsl:element name="gmd:sourceCitation">
                                 <xsl:element name="gmd:CI_Citation">
                                    <!-- <xsl:comment> In the Citation Package </xsl:comment> -->
                                    <xsl:element name="gmd:title">
                                       <xsl:element name="gco:CharacterString">
                                          <xsl:value-of
                                             select="/MRF/Data_Quality_Information/Process_Step/Source_Used_Citation_Abbreviation"
                                          />
                                       </xsl:element>
                                       <!-- gco:CharacterString -->
                                    </xsl:element>
                                    <!-- gmd:title -->

                                    <xsl:element name="gmd:date">
                                       <xsl:element name="gmd:CI_Date">
                                          <xsl:element name="gmd:date">
                                             <!-- <xsl:comment> IN THE gmd:date section </xsl:comment> -->
                                             <xsl:element name="gco:Date">
                                                <xsl:value-of
                                                  select="/MRF/Data_Quality_Information/Process_Step/Process_Date"
                                                />
                                             </xsl:element>
                                             <!-- gco:Date -->
                                          </xsl:element>
                                          <!-- gmd:date -->
                                          <!-- <xsl:comment> calling the "dateTimeTemp template for the second time</xsl:comment> -->
                                          <!-- <xsl:call-template name="dateTimeTemp"/> -->
                                          <!-- </xsl:element> -->
                                          <!-- gmd:CI_Date -->

                                          <xsl:element name="gmd:dateType">
                                             <xsl:element name="gmd:CI_DateTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_DateTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >revision</xsl:attribute>
                                                <xsl:attribute name="codeSpace">003</xsl:attribute>
                                                revision </xsl:element>
                                             <!-- gmd:CI_DateTypeCode -->
                                          </xsl:element>
                                          <!-- gmd:CI_Date -->
                                       </xsl:element>
                                       <!-- gmd:date -->

                                       <!-- </xsl:element> -->
                                       <!-- gmd:CI_Date -->
                                    </xsl:element>
                                    <!-- gmd:date -->

                                 </xsl:element>
                                 <!-- gmd:CI_Citation -->
                              </xsl:element>
                              <!-- gmd:sourceCitation -->
                           </xsl:element>
                           <!-- gmd:LI_Source -->
                        </xsl:element>
                        <!-- gmd:source -->

                     </xsl:element>
                     <!-- gmd:LI_ProcessStep -->
                  </xsl:element>
                  <!-- gmd:processStep -->
                  <!-- <xsl:comment> calling the DataQualitySource template !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</xsl:comment> -->
                  <!-- <xsl:call-template name="DataQualitySource"/> -->

               </xsl:element>
               <!-- gmd:LI_Lineage -->
            </xsl:element>
            <!-- gmd:lineage -->

         </xsl:element>
         <!-- gmd:DQ_DataQuality -->
      </xsl:element>
      <!-- gmd:dataQualityInfo -->

   </xsl:template>

   <xsl:template name="dateTimeTemp">
      <xsl:variable name="ProcDate" select="/MRF/Data_Quality_Information/Process_Step/Process_Date"/>
      <xsl:variable name="ProcTime" select="/MRF/Data_Quality_Information/Process_Step/Process_Time"/>
      <xsl:variable name="ProcTimeLength"
         select="string-length(/MRF/Data_Quality_Information/Process_Step/Process_Time/Process_Time)"/>
      <xsl:variable name="year" select="substring($ProcDate,1,4)"/>
      <xsl:variable name="month" select="substring($ProcDate,5,2)"/>
      <xsl:variable name="monthLength" select="string-length($month)"/>
      <xsl:variable name="day" select="substring($ProcDate,7,2)"/>
      <xsl:variable name="dayLength" select="string-length($day)"/>

      <xsl:choose>
         <xsl:when test="$ProcTimeLength=0">
            <!-- <xsl:comment>Here 1!!!!!!!!!!!!!!!</xsl:comment> -->
            <xsl:choose>
               <xsl:when test="$dayLength>0">
                  <!-- <xsl:comment>Here 2!!!!!!!!!!!!!!!</xsl:comment> -->
                  <xsl:variable name="dateFormat"
                     select="concat($year, '-',$month,'-',$day ,'-','T00:00:00')"/>
                  <xsl:element name="gco:Date">
                     <xsl:value-of select="$dateFormat"/>
                  </xsl:element>
               </xsl:when>

               <xsl:when test="$monthLength >0">
                  <!-- <xsl:comment>Here 3!!!!!!!!!!!!!!!</xsl:comment> -->
                  <xsl:variable name="dateFormat"
                     select="concat($year, '-',$month,'-','01T00:00:00')"/>
                  <xsl:element name="gco:DateTime">
                     <xsl:value-of select="$dateFormat"/>
                  </xsl:element>
               </xsl:when>
               <xsl:otherwise>
                  <!-- <xsl:comment> Last Resort</xsl:comment> -->
                  <!-- <xsl:comment>Here 4!!!!!!!!!!!!!!!</xsl:comment> -->
                  <!-- YYYY-MM-DDThh:mm:ss -->
                  <xsl:variable name="dateFormatA" select="concat($year,'-','01','-','01T00:00:00')"/>

                  <xsl:element name="gco:DateTime">
                     <!--     <xsl:comment> I hope this is correct! it is!!!!!!! In the right Template</xsl:comment> -->
                     <!-- <xsl:value-of select ="$dateFormatA"/> -->
                     <xsl:value-of select="$dateFormatA"/>
                  </xsl:element>
                  <!-- <xsl:comment> End of Last Resort</xsl:comment> -->
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$ProcTimeLength>0">
            <!-- <xsl:comment>Here 5!!!!!!!!!!!!!!!</xsl:comment> -->
            <!-- Thh:mm:ss -->
            <xsl:variable name="Hour" select="substring($ProcTime,1,2)"/>
            <xsl:variable name="Min" select="substring($ProcTime,3,2)"/>
            <xsl:variable name="Sec" select="substring($ProcTime,5,2)"/>
            <xsl:variable name="dateFormatA"
               select="concat($year, '-',$month,'-',$day,'T',$Hour,':',$Min,':',$Sec )"/>
            <xsl:element name="gco:DateTime">
               <!-- <xsl:comment>Here 6!!!!!!!!!!!!!!!</xsl:comment>
     <xsl:comment> I hope this is correct! (TIME) it is!!!!!!!</xsl:comment> -->
               <xsl:value-of select="$dateFormatA"/>
            </xsl:element>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

</xsl:stylesheet>
