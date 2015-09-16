<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <!--copy everything-->
<!-- KS 20150831 This stylesheet takes the output from the Excel-to-DSC_CJH xsl and moves up the container to before the did -->
  <xsl:output omit-xml-declaration="yes"/>
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="did">
        <xsl:copy>
            <xsl:apply-templates select="@*|comment()"/>
            <xsl:apply-templates select="container"/>  <!-- bring the containers to the top -->
            <xsl:apply-templates select="* except container"/> <!-- process everything else -->
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>