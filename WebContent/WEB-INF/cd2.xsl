<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
 			<head>
 				<style>
   					table.tracklist { border: solid 1px black; border-collapse: collapse; }
   					table.tracklist td { border: solid 1px #999; }
   					.artist { font-style: italic; margin-bottom: 20px; }
   					.even { background: #fff; }
   					.odd { background: #f2f2f2; }
 				</style>
 			</head>
 			<body>
 				<xsl:apply-templates/>
 				<p>Total number of tracks: <xsl:value-of select="count(/cd/tracklist/track)"></xsl:value-of></p>
  				<p>Average track rating: <xsl:value-of select="sum(.//rating) div count(.//track)"></xsl:value-of></p>
 			</body>
 		</html>
 	</xsl:template>
 	
 	<xsl:template match="/cd/title">
 		<h1><xsl:apply-templates/></h1>
 	</xsl:template>
 	
 	<xsl:template match="/cd/artist">
 		<div class="artist"><xsl:apply-templates/></div>
 	</xsl:template>
 	
 	<xsl:template match="tracklist">
 		<table class="tracklist">
   			<thead>
   			<tr>
     			<th>Track</th>
     			<th>Info</th>
     			<th>Rating</th>
    		</tr>
   			</thead>
   			<tbody>
   			<xsl:apply-templates/>
   			</tbody>
   		</table>
 	</xsl:template>
 	
 	<xsl:template match="track">
 		<xsl:choose>
 			<xsl:when test="@id mod 2 = 1">
 				<tr class="odd">
 					<td>#<xsl:value-of select="@id"/></td>
     				<td><xsl:value-of select="time"/> - <xsl:value-of select="./title"/></td>
     				<td><div style="width: {rating * 20}px; height: 12px; background: blue;"></div></td>
     			</tr>
 			</xsl:when>
 			<xsl:otherwise>
 				<tr class="even">
 					<td>#<xsl:value-of select="@id"/></td>
     				<td><xsl:value-of select="time"/> - <xsl:value-of select="./title"/></td>
     				<td><div style="width: {rating * 20}px; height: 12px; background: blue;"></div></td>
     			</tr>
 			</xsl:otherwise>
 		</xsl:choose>
 	</xsl:template>
</xsl:stylesheet>