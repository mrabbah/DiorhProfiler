
<%@ page import="com.rabbahsoft.diorhprofiler.Test" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'test.label', default: 'Test')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-test" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="titre" title="${message(code: 'test.titre.label', default: 'Titre')}" />
			
				<g:sortableColumn property="dateTest" title="${message(code: 'test.dateTest.label', default: 'Date Test')}" />
			
				<g:sortableColumn property="commentaire" title="${message(code: 'test.commentaire.label', default: 'Commentaire')}" />
			
				<th><g:message code="test.candidat.label" default="Candidat" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${testInstanceList}" status="i" var="testInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${testInstance.id}">${fieldValue(bean: testInstance, field: "titre")}</g:link></td>
			
				<td><g:formatDate date="${testInstance.dateTest}" /></td>
			
				<td>${fieldValue(bean: testInstance, field: "commentaire")}</td>
			
				<td>${fieldValue(bean: testInstance, field: "candidat")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${testInstanceCount}" />
	</div>
</section>

</body>

</html>
