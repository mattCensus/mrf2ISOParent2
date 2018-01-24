<?xml version="1.0" encoding="UTF-8" ?>

<!--
   Name: ExtraContent.xsl 
   Author:  Matthew J. McCready
   Date:  20120418
   Description:  XSLT stylesheet that provides the correct values for the gmd:featureTypes and gmd:title elements of the gmd:contentInfo section. This stylesheet is called by the 
                 12_gmd:contentInfo.xsl stylesheet.  
   Modification History:
   Initial   Date      Change Request ID   Description
   MMC      1/8/2014                        Modified to work on the MRF Format      
-->

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
   xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="fn grp vmf xs xsi xsl xd"
   xmlns="http://www.isotc211.org/2005/gmi">
   <xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>

   <xsl:template name="FeatureType">
    <!--   <xsl:comment>In the Feature Type Template</xsl:comment> -->
      <xsl:variable name="FeatureCatolog">Feature Catolog for the</xsl:variable>
      <xsl:variable name="Theme" select="/MRF/Identification_Information/Citation/Title"/>
      <!--  <xsl:comment>Theme:<xsl:value-of select="$Theme"/></xsl:comment> -->

      <xsl:choose>


         <xsl:when test="contains($Theme,'Census')">
          <!--   <xsl:comment> IN the new when </xsl:comment> -->
            <xsl:variable name="PreTitle" select="substring-after($Theme,'-')"/>
            <xsl:variable name="Title" select="substring-before($PreTitle,'for')"/>

            <xsl:choose>
               <xsl:when test="contains($Theme,'UGA')">
                  <xsl:element name="gmd:featureTypes">
                     <xsl:element name="gco:LocalName">Urban Growth Area</xsl:element>
                  </xsl:element>
               </xsl:when>

               <xsl:otherwise>
                  <xsl:element name="gmd:featureTypes">

                     <xsl:element name="gco:LocalName">
                        <xsl:attribute name="codeSpace">unknown</xsl:attribute>

                        <xsl:value-of select="$Title"/>
                     </xsl:element>
                     <!-- gco:LocalName -->

                  </xsl:element>
               </xsl:otherwise>
            </xsl:choose>
            <!-- gmd:featureTypes -->

         </xsl:when>


         <xsl:when test="contains($Theme,'TIGER/Line')">
           <!-- <xsl:comment>In the TIGER Section!!!!!!!!!!!!!!</xsl:comment> -->
            <xsl:variable name="type" select="substring-before($Theme,',')"/>
            <xsl:variable name="first" select="substring-after($Theme,',')"/>
            <xsl:variable name="EAyear" select="substring-before($first,',')"/>
            <xsl:variable name="second" select="substring-after($first,',')"/>
            <xsl:variable name="third" select="substring-after($second,',')"/>
            <xsl:variable name="fourth" select="substring-after($third,',')"/>
           <!-- <xsl:comment>fourth:<xsl:value-of select="$fourth"/></xsl:comment> -->

            <xsl:choose>
               <xsl:when test="contains($fourth,',')">
                  <!-- <xsl:comment>In the comma section!!!!!!!!!!!!!!!</xsl:comment> -->
                  <xsl:variable name="finalTheme" select="substring-after($fourth,',')"/>
                  <xsl:variable name="featureType" select="substring-after($fourth, ',')"/>

                  <xsl:choose>
                     <xsl:when test="contains($featureType,'Shapefile')">
                        <xsl:variable name="featureTypeB"
                           select="substring-before($featureType,'Shapefile')"/>
                        <xsl:variable name="finalTitle"
                           select="concat($FeatureCatolog, $EAyear, ' ', $type, $finalTheme)"/>
                        <xsl:element name="gmd:featureTypes">

                           <xsl:element name="gco:LocalName">
                              <xsl:attribute name="codeSpace">unknown</xsl:attribute>

                              <xsl:value-of select="$featureTypeB"/>
                              <!-- <xsl:comment> IN the old when </xsl:comment> -->
                           </xsl:element>
                           <!-- gco:LocalName -->

                        </xsl:element>
                     </xsl:when>



                     <xsl:otherwise>
                        <!-- <xsl:variable name="finalTitle"
                     select="concat($FeatureCatolog, $EAyear, ' ', $type, $finalTheme)"/> -->
                        <xsl:element name="gmd:featureTypes">

                           <xsl:element name="gco:LocalName">
                              <xsl:attribute name="codeSpace">unknown</xsl:attribute>

                              <xsl:value-of select="$featureType"/>
                              <!-- <xsl:comment> IN the old when </xsl:comment> -->
                           </xsl:element>
                           <!-- gco:LocalName -->

                        </xsl:element>
                        <!-- gmd:featureTypes -->
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:when>

               <xsl:otherwise>
                  <!-- <xsl:comment>In the first otherwise</xsl:comment> -->
                  <!-- <xsl:variable name="finalTitle"
                     select="concat($FeatureCatolog, $EAyear, ' ', $type, $fourth)"/> -->
                  <xsl:choose>
                     <xsl:when test="contains($fourth,'nation')">
                        <!--  <xsl:comment>In the nation LC</xsl:comment> -->


                        <xsl:variable name="featureType"
                           select="substring-before($fourth, 'nation')"/>


                        <xsl:element name="gmd:featureTypes">

                           <xsl:element name="gco:LocalName">
                              <xsl:attribute name="codeSpace">unknown</xsl:attribute>

                              <xsl:value-of select="$featureType"/>

                           </xsl:element>
                           <!-- gco:LocalName -->


                        </xsl:element>
                        <!-- gmd:featureTypes -->


                     </xsl:when>
                     <xsl:when test="contains($fourth,'Nation')">

                        <!-- <xsl:comment>In the nation CAPS</xsl:comment> -->
                        <xsl:choose>
                           <xsl:when test="contains($fourth,'th')">
                              <xsl:variable name="featureTypea"
                                 select="substring-before($fourth, 'Nation')"/>
                              <xsl:variable name="featureType"
                                 select="substring-after($featureTypea, 'th')"/>
                              <xsl:element name="gmd:featureTypes">

                                 <xsl:element name="gco:LocalName">
                                    <xsl:attribute name="codeSpace">unknown</xsl:attribute>

                                    <xsl:value-of select="$featureType"/>
                                    <!-- <xsl:comment> IN the old when </xsl:comment> -->
                                 </xsl:element>
                                 <!-- gco:LocalName -->

                              </xsl:element>
                           </xsl:when>
                           <xsl:otherwise>
                              <xsl:variable name="featureType"
                                 select="substring-before($fourth, 'Nation')"/>

                              <xsl:element name="gmd:featureTypes">

                                 <xsl:element name="gco:LocalName">
                                    <xsl:attribute name="codeSpace">unknown</xsl:attribute>

                                    <xsl:value-of select="$featureType"/>
                                    <!-- <xsl:comment> IN the old when </xsl:comment> -->
                                 </xsl:element>
                                 <!-- gco:LocalName -->

                              </xsl:element>
                              <!-- gmd:featureTypes -->
                           </xsl:otherwise>
                        </xsl:choose>
                     </xsl:when>


                     <xsl:when test="contains($fourth,'state')">
                        <xsl:variable name="featureType" select="substring-before($fourth, 'state')"/>

                        <xsl:element name="gmd:featureTypes">

                           <xsl:element name="gco:LocalName">
                              <xsl:attribute name="codeSpace">unknown</xsl:attribute>

                              <xsl:value-of select="$featureType"/>
                              <!-- <xsl:comment> IN the old when </xsl:comment> -->
                           </xsl:element>
                           <!-- gco:LocalName -->

                        </xsl:element>
                     </xsl:when>
                     <xsl:when test="contains($fourth,'State')">
                        <!-- <xsl:comment>In the State!!!!!!!!!!</xsl:comment> -->
                        <xsl:variable name="featureType" select="substring-before($fourth, 'State')"/>

                        <xsl:element name="gmd:featureTypes">

                           <xsl:element name="gco:LocalName">
                              <xsl:attribute name="codeSpace">unknown</xsl:attribute>

                              <xsl:value-of select="$featureType"/>
                              <!-- <xsl:comment> IN the old when </xsl:comment> -->
                           </xsl:element>
                           <!-- gco:LocalName -->

                        </xsl:element>
                     </xsl:when>
                  </xsl:choose>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>

      </xsl:choose>
   </xsl:template>



   <xsl:template name="ContentTitle">
      <!--  <xsl:comment>In the ContentTitle template</xsl:comment> -->
      <xsl:variable name="FeatureCatolog">Feature Catalog for the</xsl:variable>
      <xsl:variable name="Theme" select="/MRF/Identification_Information/Citation/Title"/>
      <xsl:variable name="hasUGA" select="contains($Theme,'UGA')"/>
      <xsl:variable name="UGAString" select="string($hasUGA)"/>
      <!-- <xsl:comment>theme:<xsl:value-of select="$Theme"/></xsl:comment>
       <xsl:comment>hasUGA: <xsl:value-of select="$hasUGA"/></xsl:comment>
      <xsl:comment>UGAString: <xsl:value-of select="$UGAString"/></xsl:comment> -->
      <xsl:choose>
         <xsl:when test="contains($Theme,'Cartographic')" >
           <!--   <xsl:text>&#10;</xsl:text>
            <xsl:comment> Dealing with the cartographic boundary files</xsl:comment>-->
            
            <xsl:variable name="type" select="substring-before($Theme,',')"/>
            <xsl:variable name="finalType" select="substring($type,5)"/>
            <xsl:variable name="first" select="substring-after($Theme,',')"/>
            <xsl:variable name="Regtheme" select="substring-before($Theme,'for')"/>
            <xsl:variable name="FinalRegTheme" select="substring-after($Regtheme,',')"/>
            <xsl:variable name="EAyear" select="substring-before($Theme,'Cartographic')"/>
            <xsl:variable name="scale" select="substring-after($first,',')"/>
            
            
       <!--      <xsl:text>&#10;</xsl:text>
            <xsl:comment>type:<xsl:value-of select="$type"/></xsl:comment>
            <xsl:text>&#10;</xsl:text>
            <xsl:comment>first:<xsl:value-of select="$first"/> </xsl:comment>
            <xsl:text>&#10;</xsl:text>
            <xsl:comment>theme:<xsl:value-of select="$Theme"/></xsl:comment>
            <xsl:text>&#10;</xsl:text>
            <xsl:comment>year: <xsl:value-of select="$EAyear"/></xsl:comment>
            <xsl:text>&#10;</xsl:text>
            <xsl:comment>scale:<xsl:value-of select="$scale"/></xsl:comment>
            <xsl:text>&#10;</xsl:text>
            <xsl:comment>regtheme<xsl:value-of select="$Regtheme"/></xsl:comment>
            <xsl:text>&#10;</xsl:text>
            <xsl:comment>FinalRegTheme:<xsl:value-of select="$FinalRegTheme"/></xsl:comment>
            <xsl:text>&#10;</xsl:text>
            <xsl:comment>finalTitle:<xsl:value-of select="$finalTitle"/></xsl:comment> 
            <xsl:comment>Feature Catalog: <xsl:value-of select="$FeatureCatolog"/></xsl:comment> --> 
         
            <xsl:variable name="finalTitle" select="concat($FeatureCatolog,' ', $EAyear, ' ', $FinalRegTheme, $scale,' ',  $finalType)"/>
            <xsl:element name="gmd:title">
               <xsl:element name="gco:CharacterString"><xsl:value-of select="$finalTitle"/></xsl:element>
            </xsl:element>
            
            
            
         </xsl:when>

         <xsl:when test="contains($Theme,'Census')">
            <!--  <xsl:comment>In the census section!!!!!!!!</xsl:comment> -->
            <xsl:variable name="PreTitle" select="substring-after($Theme,'-')"/>
            <!--  <xsl:comment>PreTitle:<xsl:value-of select="$PreTitle"/></xsl:comment> -->
            <xsl:choose>
               <xsl:when test="contains($PreTitle,'VTD') or contains($Theme,'UGA')">
                  <!--   <xsl:comment>in the VTD UGA!!!!!!!!!</xsl:comment> -->
                  <xsl:variable name="type" select="substring-before($Theme,',')"/>
                  <xsl:variable name="first" select="substring-after($Theme,',')"/>
                  <xsl:variable name="EAyear" select="substring-before($first,',')"/>
                  <xsl:variable name="second" select="substring-after($first,',')"/>
                  <xsl:variable name="third" select="substring-after($second,',')"/>
                  <xsl:variable name="finalTheme" select="substring-after($third,',')"/>
                  <!-- <xsl:comment>third:<xsl:value-of select="$third"/> </xsl:comment> -->

                  <xsl:variable name="finalTitle" select="concat($FeatureCatolog, $EAyear, ' ', $type, $finalTheme)"/>

                  <xsl:element name="gmd:title">
                     <xsl:element name="gco:CharacterString">
                        <xsl:value-of select="$finalTitle"/>
                     </xsl:element>
                     <!-- gco:CharacterString -->

                  </xsl:element>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:variable name="Title" select="substring-before($PreTitle,'for')"/>
                  <xsl:element name="gmd:title">
                     <xsl:element name="gco:CharacterString">
                        <xsl:value-of select="$Title"/>
                     </xsl:element>
                     <!-- gco:CharacterString -->
                  </xsl:element>
                  <!-- gmd:title -->
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>

         <!-- <xsl:when test="contains($UGAString,'true')">
            <xsl:comment>In the UGA section!!!!!!!!</xsl:comment>
            <xsl:variable name="type" select="substring-before($Theme,',')"/>
            <xsl:variable name="first" select="substring-after($Theme,',')"/>
            <xsl:variable name="EAyear" select="substring-before($first,',')"/>
            <xsl:variable name="second" select="substring-after($first,',')"/>
            <xsl:variable name="third" select="substring-after($second,',')"/>
            <xsl:variable name="finalTheme" select="substring-after($third,',')"/>
           

            <xsl:variable name="finalTitle"
               select="concat($FeatureCatolog, $EAyear, ' ', $type, $finalTheme)"/>

            <xsl:element name="gmd:title">
               <xsl:element name="gco:CharacterString">
                  <xsl:value-of select="$finalTitle"/>
               </xsl:element>
              

            </xsl:element>
         </xsl:when> -->

         <xsl:when test="contains($Theme,'County')">
            <xsl:variable name="type" select="substring-before($Theme,',')"/>
            <xsl:variable name="first" select="substring-after($Theme,',')"/>
            <xsl:variable name="EAyear" select="substring-before($first,',')"/>
            <xsl:variable name="second" select="substring-after($first,',')"/>
            <xsl:variable name="third" select="substring-after($second,',')"/>
            <xsl:variable name="fourth" select="substring-after($third,',')"/>
            <xsl:variable name="finalTheme" select="substring-after($fourth,',')"/>
            <xsl:variable name="featureType" select="substring-before($finalTheme, 'County')"/>
            <xsl:variable name="finalTitle"
               select="concat($FeatureCatolog, $EAyear, ' ', $type, $finalTheme)"/>

            <xsl:element name="gmd:title">
               <xsl:element name="gco:CharacterString">
                  <xsl:value-of select="$finalTitle"/>
               </xsl:element>
               <!-- gco:CharacterString -->

            </xsl:element>
            <!-- gmd:title -->
         </xsl:when>

         <xsl:when test="contains($Theme,'State')">
            <xsl:variable name="type" select="substring-before($Theme,',')"/>
            <xsl:variable name="first" select="substring-after($Theme,',')"/>
            <xsl:variable name="EAyear" select="substring-before($first,',')"/>
            <xsl:variable name="second" select="substring-after($first,',')"/>
            <xsl:variable name="third" select="substring-after($second,',')"/>
            
            <!--  <xsl:text>&#10;</xsl:text>
            <xsl:comment>type:<xsl:value-of select="$type"/></xsl:comment>
            <xsl:text>&#10;</xsl:text>
            <xsl:comment>first:<xsl:value-of select="$first"/> </xsl:comment>
            <xsl:text>&#10;</xsl:text>
            <xsl:comment>second:<xsl:value-of select="$second"/></xsl:comment>
            <xsl:text>&#10;</xsl:text>
            <xsl:comment>third:<xsl:value-of select="$third"/> </xsl:comment>
            <xsl:text>&#10;</xsl:text>-->
            
            <xsl:variable name="lengthThird" select="string-length($third)"/>
            
            
          <!--    <xsl:choose>
               <xsl:when test="$lengthThird >4">-->
            <xsl:variable name="finalTheme" select="substring-after($third,',')"/>
           <!--  <xsl:comment>finalTheme<xsl:value-of select="$finalTheme"/></xsl:comment>-->
            <xsl:variable name="finalTitle"
               select="concat($FeatureCatolog, $EAyear, ' ', $type, $finalTheme)"/>

            <xsl:element name="gmd:title">
               <xsl:element name="gco:CharacterString">
                  <xsl:value-of select="$finalTitle"/>
               </xsl:element>
               <!-- gco:CharacterString -->

            </xsl:element>
             <!--  
                </xsl:when>
               <xsl:otherwise>
                  <xsl:comment>In the otherwise!!!!!!!!!!!!!!</xsl:comment>
                  <xsl:variable name="finalTheme" select="substring-after($second,',')"/>
                  <xsl:comment>finalTheme<xsl:value-of select="$finalTheme"/></xsl:comment>
                  <xsl:variable name="finalTitle"
                     select="concat($FeatureCatolog, $EAyear, ' ', $type, $finalTheme)"/>
                  
                  <xsl:element name="gmd:title">
                     <xsl:element name="gco:CharacterString">
                        <xsl:value-of select="$finalTitle"/>
                     </xsl:element>
                    
                     
                  </xsl:element>
               </xsl:otherwise>
            </xsl:choose> -->
         </xsl:when>
         <xsl:when test="contains($Theme,'state')">
            <xsl:variable name="type" select="substring-before($Theme,',')"/>
            <xsl:variable name="first" select="substring-after($Theme,',')"/>
            <xsl:variable name="EAyear" select="substring-before($first,',')"/>
            <xsl:variable name="second" select="substring-after($first,',')"/>
            <xsl:variable name="third" select="substring-after($second,',')"/>
            <xsl:variable name="finalTheme" select="substring-after($third,',')"/>
            <!-- <xsl:comment>third:<xsl:value-of select="$third"/> </xsl:comment> -->

            <xsl:variable name="finalTitle"
               select="concat($FeatureCatolog, $EAyear, ' ', $type, $finalTheme)"/>

            <xsl:element name="gmd:title">
               <xsl:element name="gco:CharacterString">
                  <xsl:value-of select="$finalTitle"/>
               </xsl:element>
               <!-- gco:CharacterString -->

            </xsl:element>
         </xsl:when>




         <xsl:when test="contains($Theme,'Nation')">
            <xsl:variable name="type" select="substring-before($Theme,',')"/>
            <xsl:variable name="first" select="substring-after($Theme,',')"/>
            <xsl:variable name="EAyear" select="substring-before($first,',')"/>
            <xsl:variable name="second" select="substring-after($first,',')"/>
            <xsl:variable name="third" select="substring-after($second,',')"/>
            <xsl:variable name="finalTheme" select="substring-after($third,',')"/>
            <!-- <xsl:comment>third:<xsl:value-of select="$third"/> </xsl:comment> -->

            <xsl:variable name="finalTitle"
               select="concat($FeatureCatolog, $EAyear, ' ', $type, $finalTheme)"/>

            <xsl:element name="gmd:title">
               <xsl:element name="gco:CharacterString">
                  <xsl:value-of select="$finalTitle"/>
               </xsl:element>
               <!-- gco:CharacterString -->

            </xsl:element>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

</xsl:stylesheet>
