
<%@ page import="com.rabbahsoft.diorhprofiler.Candidature" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'candidature.label', default: 'Candidature')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
        <g:javascript src="jquery-ui.min.js" />
</head>

<body>

<section id="list-candidature" class="first">

	<table class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
			
				<g:sortableColumn property="reference" title="${message(code: 'candidature.referrencemission.label', default: 'Reference mission')}" />
			
				<g:sortableColumn property="dateCandidature" title="${message(code: 'candidature.dateCandidature.label', default: 'Date Candidature')}" />
			
				<g:sortableColumn property="candidat" title="${message(code: 'candidature.candidat.label', default: 'Candidat')}" />
			
				<g:sortableColumn property="etapeavancement" title="${message(code: 'candidature.etapeavancement.label', default: 'Etape avancement')}" />
			
				<g:sortableColumn property="oldStatut" title="${message(code: 'candidature.evaluationcandidat.label', default: 'evaluation du candidat')}" />
			
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${candidatureInstanceList}" status="i" var="candidatureInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${candidatureInstance.mission.id}">${candidatureInstance?.mission.encodeAsHTML()}</g:link></td>
			
<!--				<td><g:formatDate date="${candidatureInstance.dateCandidature}" /></td>-->
			        <td>${fieldValue(bean: candidatureInstance, field: "dateCandidature")}</td>
                                
				<td>${candidatureInstance?.candidat.encodeAsHTML()}</td>
			
				<td>${candidatureInstance?.etapeAvancement?.encodeAsHTML()}</td>
			
				<td>${candidatureInstance?.evaluation?.encodeAsHTML()}</td>
			
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${candidatureInstanceCount}" />
	</div>
</section>
</body>

</html>
