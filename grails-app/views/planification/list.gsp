
<%@ page import="com.rabbahsoft.diorhprofiler.Planification" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'planification.label', default: 'Planification')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-planification" class="first">

	<table class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
			
				<g:sortableColumn property="dateDebut" title="${message(code: 'planification.dateDebut.label', default: 'Date Debut')}" />
			
				<g:sortableColumn property="dateFin" title="${message(code: 'planification.dateFin.label', default: 'Date Fin')}" />
			
				<th><g:message code="planification.etape.label" default="Etape" /></th>
			
				<th><g:message code="planification.mission.label" default="Mission" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${planificationInstanceList}" status="i" var="planificationInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${planificationInstance.id}">${fieldValue(bean: planificationInstance, field: "dateDebut")}</g:link></td>
			
				<td><g:formatDate date="${planificationInstance.dateFin}" /></td>
			
				<td>${fieldValue(bean: planificationInstance, field: "etape")}</td>
			
				<td>${fieldValue(bean: planificationInstance, field: "mission")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${planificationInstanceCount}" />
	</div>
</section>
</body>

</html>
