
<%@ page import="com.rabbahsoft.diorhprofiler.ActionContact" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="globallayout" />
	<g:set var="entityName" value="${message(code: 'actionContact.label', default: 'ActionContact')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>
      <g:if test="${!layout_nosecondarymenu}">
		<g:render template="submenubar"/>														
	</g:if>
<section id="index-actionContact" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="contenu" title="${message(code: 'actionContact.contenu.label', default: 'Contenu')}" />
			
				<th><g:message code="actionContact.contact.label" default="Contact" /></th>
			
				<g:sortableColumn property="dateActionPrevue" title="${message(code: 'actionContact.dateActionPrevue.label', default: 'Date Action Prevue')}" />
			
				<g:sortableColumn property="dateActionReelle" title="${message(code: 'actionContact.dateActionReelle.label', default: 'Date Action Reelle')}" />
			
				<th><g:message code="actionContact.responsable.label" default="Responsable" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${actionContactInstanceList}" status="i" var="actionContactInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${actionContactInstance.id}">${fieldValue(bean: actionContactInstance, field: "contenu")}</g:link></td>
			
				<td>${fieldValue(bean: actionContactInstance, field: "contact")}</td>
			
				<td><g:formatDate date="${actionContactInstance.dateActionPrevue}" /></td>
			
				<td><g:formatDate date="${actionContactInstance.dateActionReelle}" /></td>
			
				<td>${fieldValue(bean: actionContactInstance, field: "responsable")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${actionContactInstanceCount}" />
	</div>
</section>

</body>

</html>
