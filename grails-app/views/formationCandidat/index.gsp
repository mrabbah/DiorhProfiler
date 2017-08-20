
<%@ page import="com.rabbahsoft.diorhprofiler.FormationCandidat" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'formationCandidat.label', default: 'FormationCandidat')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-formationCandidat" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="intituleDiplome" title="${message(code: 'formationCandidat.intituleDiplome.label', default: 'Intitule Diplome')}" />
			
				<g:sortableColumn property="annee" title="${message(code: 'formationCandidat.annee.label', default: 'Annee')}" />
			
				<g:sortableColumn property="optionFormation" title="${message(code: 'formationCandidat.optionFormation.label', default: 'Option Formation')}" />
			
				<g:sortableColumn property="etablissement" title="${message(code: 'formationCandidat.etablissement.label', default: 'Etablissement')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'formationCandidat.description.label', default: 'Description')}" />
			
				<th><g:message code="formationCandidat.candidat.label" default="Candidat" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${formationCandidatInstanceList}" status="i" var="formationCandidatInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${formationCandidatInstance.id}">${fieldValue(bean: formationCandidatInstance, field: "intituleDiplome")}</g:link></td>
			
				<td>${fieldValue(bean: formationCandidatInstance, field: "annee")}</td>
			
				<td>${fieldValue(bean: formationCandidatInstance, field: "optionFormation")}</td>
			
				<td>${fieldValue(bean: formationCandidatInstance, field: "etablissement")}</td>
			
				<td>${fieldValue(bean: formationCandidatInstance, field: "description")}</td>
			
				<td>${fieldValue(bean: formationCandidatInstance, field: "candidat")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${formationCandidatInstanceCount}" />
	</div>
</section>

</body>

</html>
