<cfcomponent output="true">

	<cffunction name="getEntries" output="true" access="public" hint="displays the feed of your 360 Voice account">
		<cfargument name="count" type="numeric" default="" required="false" hint="How many records to return from the feed">
		<cfargument name="returnFormat" type="string" default="xml" hint="return the data as an xml value or a block of html">
		<cfargument name="userName" type="string" required="true" hint="userName to pass through feed">
		<cfset var xmlfile = "">
		<cfset var arrHeader = "">
		<cfset var arrEntries = "">
		<cfset var end = "">
		<cfset var remoteUrl = "http://www.360voice.com/api/blog-getentries.asp?tag=" & arguments.userName>


		<cfif len(arguments.count) AND isNumeric(arguments.count)>
			<cfset remoteUrl = remoteUrl & "&num=" & arguments.count>
		</cfif>

		<!--- Call the file --->
		<cfhttp url="#remoteUrl#" method="GET" charset="utf-8">
			<cfhttpparam type="Header" name="Accept-Encoding" value="deflate;q=0">
			<cfhttpparam type="Header" name="TE" value="deflate;q=0">
		</cfhttp>

		<cfscript>
			xmlfile = xmlparse(cfhttp.filecontent);
			arrHeader = xmlfile.api.info;
		</cfscript>

		<cfif arguments.returnFormat EQ "html">

			<cfoutput>

				<div class="xbox-header-container">
					<div class="xbox-gamer-icon"><img src="#arrHeader[1].tile.XmlText#" alt="Gamer Icon"></div>
					<h2 class="xbox-header">#arrHeader[1].gamertag.XmlText# - XBoX 360 Blog</h2>
					<div class="xbox-date">#DateFormat(arrHeader[1].entdate.XmlText, "DD/MM/YYYY")# (V.#arrHeader[1].version.XmlText#)</div>
				</div>

				<!--- write out blog --->
				<cfset arrEntries = xmlfile.api.blog.XmlChildren>

				<cfif len(arguments.count) AND isNumeric(arguments.count)>
					<cfset end = arguments.count>
				<cfelse>
					<cfset end = ArrayLen(arrEntries)>
				</cfif>

				<div class="xbox-entries-container">
					<cfloop index="i" from="1" to="#end#">
						<div class="xbox-entries-header">#arrEntries[i].title.XmlText# -#arrEntries[i].date.XmlText#</div>
						<div class="xbox-entries-body">#arrEntries[i].body.XmlText#</div>
					</cfloop>
				</div>

			</cfoutput>

		<cfelse>
			<cfreturn xmlfile>
		</cfif>

	</cffunction>

	<cffunction name="profile" access="public" output="true" returntype="xml" hint="Pass in a gamertag to get profile and stat information">
		<cfargument name="userName" type="string" required="true" hint="userName to pass through feed">
		<cfset var xmlfile = "">
		<cfset var remoteUrl = "http://www.360voice.com/api/gamertag-profile.asp?tag=" & arguments.userName>

		<!--- Call the file --->
		<cfhttp url="#remoteUrl#" method="GET" charset="utf-8">
			<cfhttpparam type="Header" name="Accept-Encoding" value="deflate;q=0">
			<cfhttpparam type="Header" name="TE" value="deflate;q=0">
		</cfhttp>

		<cfset xmlfile = xmlparse(cfhttp.filecontent)>

		<cfreturn xmlfile>
	</cffunction>

	<cffunction name="vitals" access="public" output="true" returntype="xml" hint="Lists out the stats of a gamertag and all of their challenge results">
		<cfargument name="userName" type="string" required="true" hint="userName to pass through feed">
		<cfset var xmlfile = "">
		<cfset var remoteUrl = "http://www.360voice.com/api/challenge-vitals.asp?tag=" & arguments.userName>

		<!--- Call the file --->
		<cfhttp url="#remoteUrl#" method="GET" charset="utf-8">
			<cfhttpparam type="Header" name="Accept-Encoding" value="deflate;q=0">
			<cfhttpparam type="Header" name="TE" value="deflate;q=0">
		</cfhttp>

		<cfset xmlfile = xmlparse(cfhttp.filecontent)>

		<cfreturn xmlfile>
	</cffunction>

	<cffunction name="badges" access="public" output="true" returntype="xml" hint="Pass in a gamertag and it will list out the badges that the user has">
		<cfargument name="userName" type="string" required="true" hint="userName to pass through feed">
		<cfset var xmlfile = "">
		<cfset var remoteUrl = "http://www.360voice.com/api/gamertag-badges.asp?tag=" & arguments.userName>

		<!--- Call the file --->
		<cfhttp url="#remoteUrl#" method="GET" charset="utf-8">
			<cfhttpparam type="Header" name="Accept-Encoding" value="deflate;q=0">
			<cfhttpparam type="Header" name="TE" value="deflate;q=0">
		</cfhttp>

		<cfset xmlfile = xmlparse(cfhttp.filecontent)>

		<cfreturn xmlfile>
	</cffunction>

</cfcomponent>