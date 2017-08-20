
<%@ page import="com.rabbahsoft.diorhprofiler.Experience" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'experience.label', default: 'Experience')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-experience" class="first">

	<table class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
			
				<th><g:message code="experience.candidat.label" default="Candidat" /></th>
			
				<g:sortableColumn property="intitulePoste" title="${message(code: 'experience.intitulePoste.label', default: 'Intitule Poste')}" />
			
				<g:sortableColumn property="entreprise" title="${message(code: 'experience.entreprise.label', default: 'Entreprise')}" />
			
				<g:sortableColumn property="mission" title="${message(code: 'experience.mission.label', default: 'Mission')}" />
			
				<g:sortableColumn property="rattachement" title="${message(code: 'experience.rattachement.label', default: 'Rattachement')}" />
			
				<g:sortableColumn property="dateDebut" title="${message(code: 'experience.dateDebut.label', default: 'Date Debut')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${experienceInstanceList}" status="i" var="experienceInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${experienceInstance.id}">${fieldValue(bean: experienceInstance, field: "candidat")}</g:link></td>
			
				<td>${fieldValue(bean: experienceInstance, field: "intitulePoste")}</td>
			
				<td>${fieldValue(bean: experienceInstance, field: "entreprise")}</td>
			
				<td>${fieldValue(bean: experienceInstance, field: "mission")}</td>
			
				<td>${fieldValue(bean: experienceInstance, field: "rattachement")}</td>
			
				<td><g:formatDate date="${experienceInstance.dateDebut}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${experienceInstanceCount}" />
	</div>
</section>
</body>

</html>
