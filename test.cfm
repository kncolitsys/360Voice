<!--- call the feed --->

<style type="text/css">
	* {margin:0px; padding:0px; border: 0px;}

	.xbox-header-container {float:left; width: 400px; border: 1px #000 solid;}
	.xbox-header {font-family: 'Arial'; width: 300px; border: 1px #000 solid; padding: 0px;}
	.xbox-date {float: left;}
	.xbox-gamer-icon {font-family: 'Arial'; float: right;}

	.xbox-entries-container {float: left;}
	.xbox-entries-header {font-family: 'Arial'; padding-top: 5px; font-weight: bold;}
	.xbox-entries-body {font-family: 'Arial'; padding-bottom: 10px;}

	.holder {float: left; clear:both; padding: 20px;}

</style>


<div class="holder">
	<h2>Entries test (html):</h2>
	<cfset getEntries.args['count'] = 5>
	<cfset getEntries.args['returnFormat'] = 'html'>
	<cfset getEntries.args['userName'] = 'ect0z'>

	<cfset createObject('component','360').getEntries(argumentCollection = getEntries.args)>

</div>


<div class="holder">
	<h2>Entries test (xml):</h2>
	<cfset getEntries.args['count'] = 5>
	<cfset getEntries.args['returnFormat'] = 'xml'>
	<cfset getEntries.args['userName'] = 'ect0z'>

	<cfset variables.getEntries = createObject('component','360').getEntries(argumentCollection = getEntries.args)>

	<cfdump var="#variables.getEntries#" label="Entries XML" expand="true">
</div>


<div class="holder">
	<h2>Profile test:</h2>

	<cfset profile.args['userName'] = 'ect0z'>
	<cfset variables.myProfile = createObject('component','360').profile(argumentCollection = profile.args)>

	<cfdump var="#variables.myProfile#" label="Profile XML" expand="true">
</div>

<div class="holder">
	<h2>Vitals test:</h2>

	<cfset vitals.args['userName'] = 'ect0z'>
	<cfset variables.vitals = createObject('component','360').vitals(argumentCollection = vitals.args)>

	<cfdump var="#variables.vitals#" label="Vitals XML" expand="true">
</div>

<div class="holder">
	<h2>badges test:</h2>

	<cfset badges.args['userName'] = 'ect0z'>
	<cfset variables.badges = createObject('component','360').badges(argumentCollection = badges.args)>

	<cfdump var="#variables.badges#" label="Badges XML" expand="true">
</div>
