
<%@ page import="com.rabbahsoft.diorhprofiler.Candidature" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'candidature.label', default: 'Candidature')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-candidature" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="spontanee" title="${message(code: 'candidature.spontanee.label', default: 'Spontanee')}" />
			
				<g:sortableColumn property="dateCandidature" title="${message(code: 'candidature.dateCandidature.label', default: 'Date Candidature')}" />
			
				<g:sortableColumn property="lettreMotivation" title="${message(code: 'candidature.lettreMotivation.label', default: 'Lettre Motivation')}" />
			
				<g:sortableColumn property="evaluationCommentaire" title="${message(code: 'candidature.evaluationCommentaire.label', default: 'Evaluation Commentaire')}" />
			
				<g:sortableColumn property="oldStatut" title="${message(code: 'candidature.oldStatut.label', default: 'Old Statut')}" />
			
				<g:sortableColumn property="sourceCandidature" title="${message(code: 'candidature.sourceCandidature.label', default: 'Source Candidature')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${candidatureInstanceList}" status="i" var="candidatureInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${candidatureInstance.id}">${fieldValue(bean: candidatureInstance, field: "spontanee")}</g:link></td>
			
				<td><g:formatDate date="${candidatureInstance.dateCandidature}" /></td>
			
				<td>${fieldValue(bean: candidatureInstance, field: "lettreMotivation")}</td>
			
				<td>${fieldValue(bean: candidatureInstance, field: "evaluationCommentaire")}</td>
			
				<td>${fieldValue(bean: candidatureInstance, field: "oldStatut")}</td>
			
				<td>${fieldValue(bean: candidatureInstance, field: "sourceCandidature")}</td>
			
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
