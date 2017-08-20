
<%@ page import="com.rabbahsoft.diorhprofiler.Test" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'test.label', default: 'Test')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-test" class="first">

	<table class="table table-striped table-bordered table-condensed">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="test.titre.label" default="Titre" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: testInstance, field: "titre")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="test.dateTest.label" default="Date Test" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${testInstance?.dateTest}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="test.commentaire.label" default="Commentaire" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: testInstance, field: "commentaire")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="test.candidat.label" default="Candidat" /></td>
				
				<td valign="top" class="value"><g:link controller="candidat" action="show" id="${testInstance?.candidat?.id}">${testInstance?.candidat?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
