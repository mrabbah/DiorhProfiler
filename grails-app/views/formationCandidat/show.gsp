
<%@ page import="com.rabbahsoft.diorhprofiler.FormationCandidat" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'formationCandidat.label', default: 'FormationCandidat')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-formationCandidat" class="first">

	<table class="table table-striped table-bordered table-condensed">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="formationCandidat.intituleDiplome.label" default="Intitule Diplome" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: formationCandidatInstance, field: "intituleDiplome")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="formationCandidat.annee.label" default="Annee" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: formationCandidatInstance, field: "annee")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="formationCandidat.optionFormation.label" default="Option Formation" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: formationCandidatInstance, field: "optionFormation")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="formationCandidat.etablissement.label" default="Etablissement" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: formationCandidatInstance, field: "etablissement")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="formationCandidat.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: formationCandidatInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="formationCandidat.candidat.label" default="Candidat" /></td>
				
				<td valign="top" class="value"><g:link controller="candidat" action="show" id="${formationCandidatInstance?.candidat?.id}">${formationCandidatInstance?.candidat?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="formationCandidat.diplome.label" default="Diplome" /></td>
				
				<td valign="top" class="value"><g:link controller="diplome" action="show" id="${formationCandidatInstance?.diplome?.id}">${formationCandidatInstance?.diplome?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="formationCandidat.typeEtablissement.label" default="Type Etablissement" /></td>
				
				<td valign="top" class="value"><g:link controller="typeEtablissement" action="show" id="${formationCandidatInstance?.typeEtablissement?.id}">${formationCandidatInstance?.typeEtablissement?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="formationCandidat.ville.label" default="Ville" /></td>
				
				<td valign="top" class="value"><g:link controller="ville" action="show" id="${formationCandidatInstance?.ville?.id}">${formationCandidatInstance?.ville?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
