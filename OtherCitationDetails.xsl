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
    
    <xsl:import href="../mrf2ISOParent/05_gmd_contact.xsl"/>
    <xsl:import href="../mrf2ISOParent/ExtraContent.xsl"/>
    
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p>mrf2ISOParent/OtherCitationDetails.xsl</xd:p>
            <xd:p>called by the mrf2ISOParent/12_gmd_contentInfo.xsl template</xd:p>
            <xd:p>XSLT stylesheet that providesURL for the actual Entity and Attribute File</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Jan 27, 2014</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            Initial     Date                  Description
            MMC         6/20/2016             Updated the folder variable to TIGER2016   
            MMC         1/18/18               Updated the folder variable to TIGER2018
            MMC         1/18/18               Updated the baseURL variable to include "https"                              
            <xd:p>
               
            </xd:p>
        </xd:desc>
    </xd:doc> 
        <xsl:variable name="baseURL">https://meta.geo.census.gov/data/existing/decennial/GEO</xsl:variable>
        <xsl:variable name="fileName" select="/MRF/Metadata_Reference_Information/Metadata_File_Identifier"/>
        <xsl:variable name="firstTwo" select="substring($fileName,1,2)"/>
   
    
    
    <xsl:template name="OtherCitationDetails">
    <xsl:element name="gmd:otherCitationDetails">
        <xsl:choose>
            <xsl:when test="$firstTwo='tl'">
                <!--  <xsl:comment>in the tl section!!!!!!!!!!</xsl:comment> -->
                <xsl:variable name="nextPart">/GPMB/TIGERline/</xsl:variable>
                <!-- Change this every year!!!!!!!!!!!!!!!!!!!!!!!! -->
                <!-- tl_2013_09009_areawater.shp.xml -->
                <xsl:variable name="folder">TIGER2018</xsl:variable>
                
                <xsl:variable name="postUnder" select="substring-after($fileName,'_')"/>
                <xsl:variable name="year" select="substring-before($postUnder,'_')"/>
                <xsl:variable name="postUnder2" select="substring-after($postUnder,'_')"/>
                <xsl:variable name="postUnder3" select="substring-after($postUnder2,'_')"/>
                <xsl:variable name="postUnder4" select="substring-after($postUnder3,'.')"/>
                <xsl:variable name="type" select="substring-before($postUnder4,'.')"/>
                <xsl:variable name="theme" select="substring-before($postUnder3,'.')"/>
                <xsl:variable name="eaFile" select="concat($year,'_',$theme,'.', $type,'.ea.iso.xml')"/>
                <!--   <xsl:variable name="eaFile" select="concat($year,'_',$postUnder3,'.ea.iso.xml')"/>  
                    <xsl:comment>postUnder: <xsl:value-of select="$postUnder"/></xsl:comment>
                    <xsl:comment>postUnder2: <xsl:value-of select="$postUnder2"/></xsl:comment>
                    <xsl:comment>postUnder3: <xsl:value-of select="$postUnder3"/></xsl:comment>
                    <xsl:comment>postUnder4: <xsl:value-of select="$postUnder4"/></xsl:comment> -->
                
                <xsl:variable name="newFile" select="concat($baseURL,$nextPart,$folder,'/',$theme,'/',$eaFile)"/>
                
                <xsl:element name="gco:CharacterString">
                    <xsl:value-of select="$newFile"/>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$firstTwo='cb'">
                   <xsl:comment>In the CB section</xsl:comment>
                <xsl:variable name="nextPart">/CPMB/boundary/</xsl:variable>
                <!-- Change this every year!!!!!!!!!!!!!!!!!!!!!!!! -->
                <!-- cb_rd13_06_sldl_500k.xml -->
                <xsl:variable name="folder">2017cb</xsl:variable>
                <!-- Change this every year!!!!!!!!!!!!!!!!!!!!!!!! -->
                <xsl:variable name="year">2017</xsl:variable>
                <xsl:variable name="postUnder" select="substring-after($fileName,'_')"/>
                <xsl:variable name="postUnder2" select="substring-after($postUnder,'_')"/>
                <xsl:variable name="postUnder3" select="substring-after($postUnder2,'_')"/>
                <xsl:variable name="theme" select="substring-before($postUnder3,'.')"/>
                <xsl:variable name="eaFile" select="concat($year,'_',$theme,'.ea.iso.xml')"/>
                <xsl:variable name="newFile" select="concat($baseURL,$nextPart,$folder,'/',$theme,'/',$eaFile)"/>
                
                <xsl:element name="gco:CharacterString">
                    <xsl:value-of select="$newFile"/>
                </xsl:element>
            </xsl:when>
        </xsl:choose>
        <!--    <xsl:comment>firstTwo:<xsl:value-of select="$firstTwo"/></xsl:comment>-->
        
        <!-- gco:CharacterString -->
    </xsl:element>
    <!-- gmd:otherCitationDetails --></xsl:template>
    
    <xsl:template name="distEA">
        <xsl:element name="gmd:transferOptions">
            <xsl:element name="gmd:MD_DigitalTransferOptions">
                <xsl:element name="gmd:onLine">
                    <xsl:element name="gmd:CI_OnlineResource">
            <xsl:choose>
                <xsl:when test="$firstTwo='tl'">
                    <!--  <xsl:comment>in the tl section!!!!!!!!!!</xsl:comment> -->
                    <xsl:variable name="nextPart">/GPMB/TIGERline/</xsl:variable>
                    <!-- Change this every year!!!!!!!!!!!!!!!!!!!!!!!! -->
                    <!-- tl_2013_09009_areawater.shp.xml -->
                    <xsl:variable name="folder">TIGER2017</xsl:variable> 
                    
                    <xsl:variable name="postUnder" select="substring-after($fileName,'_')"/>
                    <xsl:variable name="year" select="substring-before($postUnder,'_')"/>
                    <xsl:variable name="postUnder2" select="substring-after($postUnder,'_')"/>
                    <xsl:variable name="postUnder3" select="substring-after($postUnder2,'_')"/>
                    <xsl:variable name="postUnder4" select="substring-after($postUnder3,'.')"/>
                    <xsl:variable name="type" select="substring-before($postUnder4,'.')"/>
                    <xsl:variable name="theme" select="substring-before($postUnder3,'.')"/>
                    <xsl:variable name="eaFile" select="concat($year,'_',$theme,'.', $type,'.ea.iso.xml')"/>
                    <!--   <xsl:variable name="eaFile" select="concat($year,'_',$postUnder3,'.ea.iso.xml')"/>  
                        <xsl:comment>postUnder: <xsl:value-of select="$postUnder"/></xsl:comment>
                        <xsl:comment>postUnder2: <xsl:value-of select="$postUnder2"/></xsl:comment>
                        <xsl:comment>postUnder3: <xsl:value-of select="$postUnder3"/></xsl:comment>
                        <xsl:comment>postUnder4: <xsl:value-of select="$postUnder4"/></xsl:comment> -->
                    
                    <xsl:variable name="newFile" select="concat($baseURL,$nextPart,$folder,'/',$theme,'/',$eaFile)"/>
                    
                    <xsl:variable name="fullTitle" select="/MRF/Identification_Information[1]/Citation[1]/Title[1]"/>
                    <xsl:variable name="postComma1" select="substring-after($fullTitle,',')"/>
                    <xsl:variable name="postComma2" select="substring-after($postComma1,',')"/>
                    
                   
                    
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$newFile"/></xsl:element>
                    </xsl:element>
                    
                    <xsl:choose>
                        <xsl:when test="contains($fullTitle,'state')">
                            
                            <xsl:variable name="postComma3" select="substring-after($postComma2,',')"/>
                            <xsl:variable name="Titletheme" select="substring-after($postComma3,',')"/>
                            
                            <xsl:variable name="EAName" select="concat('Entity and Attribute File for the ',$year, $Titletheme)"/>
                            
                            <xsl:element name="gmd:name">
                                <xsl:element name="gco:CharacterString"><xsl:value-of select="$EAName"/></xsl:element>
                            </xsl:element>
                            
                            <!--  <xsl:comment>In the state!!!!!!!!!!!</xsl:comment>
                                <xsl:comment> postComma3:<xsl:value-of select="$postComma3"/></xsl:comment>-->
                            
                        </xsl:when>
                        <xsl:when test="contains($fullTitle,'nation')">
                            <xsl:variable name="postComma3" select="substring-after($postComma2,',')"/>
                            <xsl:variable name="Titletheme" select="substring-after($postComma3,',')"/>
                            <xsl:variable name="EAName" select="concat('Entity and Attribute File for the ',$year, $Titletheme)"/>
                            
                            <xsl:element name="gmd:name">
                                <xsl:element name="gco:CharacterString"><xsl:value-of select="$EAName"/></xsl:element>
                            </xsl:element>
                            
                            <!--  <xsl:comment>In the Nation!!!!!!!!!!!</xsl:comment>
                                <xsl:comment> postComma3:<xsl:value-of select="$postComma3"/></xsl:comment>-->
                           
                        </xsl:when>
                        <xsl:when test="contains($fullTitle,'county')">
                            <xsl:variable name="postComma3" select="substring-after($postComma2,',')"/>
                            <xsl:variable name="postComma4" select="substring-after($postComma3,',')"/>
                            <xsl:variable name="Titletheme" select="substring-after($postComma4,',')"/>
                          <xsl:variable name="EAName" select="concat('Entity and Attribute File for the ',$year, $Titletheme)"/>
                            
                            <xsl:element name="gmd:name">
                                <xsl:element name="gco:CharacterString"><xsl:value-of select="$EAName"/></xsl:element>
                            </xsl:element>
                            <!--  <xsl:comment>In the County!!!!!!!!!!!</xsl:comment>
                                <xsl:comment> postComma3:<xsl:value-of select="$postComma3"/></xsl:comment>-->
                           
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:comment>Can Not determine the level of geography!!!!!!</xsl:comment>
                        </xsl:otherwise>
                    </xsl:choose>
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                </xsl:when>
                <xsl:when test="$firstTwo='cb'">
                    <!--   <xsl:comment>In the CB section</xsl:comment> -->
                    <xsl:variable name="nextPart">/CPMB/boundary/</xsl:variable>
                    <!-- Change this every year!!!!!!!!!!!!!!!!!!!!!!!! -->
                    <!-- cb_rd13_06_sldl_500k.xml -->
                    <xsl:variable name="folder">2017cb</xsl:variable>
                    <!-- Change this every year!!!!!!!!!!!!!!!!!!!!!!!! -->
                    <xsl:variable name="year">2017</xsl:variable>
                    <xsl:variable name="postUnder" select="substring-after($fileName,'_')"/>
                    <xsl:variable name="postUnder2" select="substring-after($postUnder,'_')"/>
                    <xsl:variable name="postUnder3" select="substring-after($postUnder2,'_')"/>
                    <xsl:variable name="theme" select="substring-before($postUnder3,'.')"/>
                    <xsl:variable name="eaFile" select="concat($year,'_',$theme,'.ea.iso.xml')"/>
                    <xsl:variable name="newFile" select="concat($baseURL,$nextPart,$folder,'/',$theme,'/',$eaFile)"/>
                    <xsl:variable name="EAName" select="concat('Entity and Attribute File for the ',$year, $theme)"/>
                    
                    <xsl:element name="gmd:linkage">
                    <xsl:element name="gmd:URL"><xsl:value-of select="$newFile"/></xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"><xsl:value-of select="$EAName"/></xsl:element>
                    </xsl:element>
                </xsl:when>
            </xsl:choose>
            <!--    <xsl:comment>firstTwo:<xsl:value-of select="$firstTwo"/></xsl:comment>-->
            
            <!-- gco:CharacterString -->
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:element>
        
    </xsl:template>
</xsl:stylesheet>