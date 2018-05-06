<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/series">
		<html>
			<head>
				<title>Manga Library >> <xsl:value-of select="title"/></title>
				<meta charset="UTF-8"/>
				<meta name="viewport" content="width=device-width, initial-scale=1"/>
				 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/> 
				<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous"/>
				<style>body,h1,h2,h3,h4,h5,h6 {font-family: sans-serif}</style>
			</head>
		<body class="w3-content" style="max-width:1600px">
			<div class="w3-bar w3-border w3-grey w3-margin-top w3-text-white">
				<a href="javascript:history.back()" style="width:33.33%" class="w3-bar-item w3-button w3-border-right w3-mobile"><i class="w3-text-gray far fa-arrow-alt-circle-left fa-2x w3-margin-right"></i></a>
				<div style="width:66.66%;font-size:x-large; font-weight:bolder" class="w3-bar-item w3-padding w3-mobile"><b><xsl:value-of select="title"/></b></div>
			</div>
			<div class="w3-row w3-margin-top">
				<div class="w3-third w3-container w3-light-gray w3-center"><img src="{pic}" style="width:80%" /></div>
				<div class="w3-twothird w3-container" style="max-width:800px">
					<table class="w3-table w3-bordered w3-striped">
						<tbody>
							<tr><td style="width:25%">Kanji</td><td><xsl:value-of select="title_kan"/></td></tr>
							<xsl:if test="type"><tr><td>Type</td><td><xsl:value-of select="type"/> <xsl:if test="AOrating"><b> (18+)</b></xsl:if></td></tr></xsl:if>
							<tr><td>Link</td>
								<td>
									<xsl:if test="akiID"><a href="https://manga.akihabara.cz/manga/{akiID}" class="w3-margin-right">AKI</a></xsl:if>
									<xsl:if test="muID"><a href="https://www.mangaupdates.com/series.html?id={muID}" class="w3-margin-right">MU</a></xsl:if>
									<xsl:if test="malID"> <a href="https://myanimelist.net/manga/{malID}/" class="w3-margin-right">MAL</a></xsl:if>
								</td>
							</tr>
							<tr><td>Volumes</td><td><xsl:value-of select="volumes"/></td></tr>							
							<tr><td>Status</td><td><xsl:value-of select="status"/></td></tr>
							<tr><td>Rating</td><td>MU: <xsl:value-of select="muRate"/>, MAL: <xsl:value-of select="malRate"/></td></tr>
							<tr><td>Date</td><td><xsl:value-of select="date/start"/><xsl:if test="date/start"><xsl:if test="date/end"> - </xsl:if></xsl:if><xsl:value-of select="date/end"/></td></tr>
							<tr><td>Author</td>
								<td>
									<xsl:for-each select="authors/name">
										<xsl:value-of select="."/> (<xsl:value-of select="@role"/>),
									</xsl:for-each>
								</td>
							</tr>
							<tr><td>Tags</td>
								<td>
									<xsl:for-each select="tags/tag">
										<xsl:value-of select="."/>,
									</xsl:for-each>
								</td>
							</tr>
							<tr><td>Description</td><td><p><xsl:value-of select="desc"/></p></td></tr>
							<xsl:if test="folder"><tr><td>Path</td><td>//VAULT/temp/to/<xsl:value-of select="folder"/></td></tr></xsl:if>
						</tbody>
					</table>
				</div>
			</div>
			<div style="max-width:1000px;margin-right: auto;margin-left: auto;">
				<table class="w3-table w3-striped w3-bordered w3-margin-top">
					<tbody>
						<tr><th style="width:10%">Volume</th><th style="width:30%">Filename</th><th style="width:10%">Size</th><th style="width:10%">Ext</th><th style="width:10%">Download</th></tr>
						<xsl:if test="files">
							<xsl:for-each select="files/file">
							<xsl:value-of select="path"/>
								<tr><td><xsl:value-of select="@vol"/></td><td><xsl:value-of select="."/></td><td><xsl:value-of select="@size"/></td><td><xsl:value-of select="@ext"/></td><td><a href="{.}.{@ext}"><i class="fas fa-download fa-lg"></i></a></td></tr>
							</xsl:for-each>
						</xsl:if>
					</tbody>
				</table>
			</div>
			<div class="w3-bar w3-border w3-grey w3-margin-top w3-text-white">
				<div style="width:100%" class="w3-bar-item w3-padding w3-mobile w3-center">Manga Library by LostExistence | version:dev</div>
			</div>
		</body>
		</html>
	</xsl:template>
</xsl:stylesheet>