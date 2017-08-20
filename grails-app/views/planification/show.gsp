
<%@ page import="com.rabbahsoft.diorhprofiler.Planification" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'planification.label', default: 'Planification')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-planification" class="first">

	<table class="table table-striped table-bordered table-condensed">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="planification.dateDebut.label" default="Date Debut" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${planificationInstance?.dateDebut}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="planification.dateFin.label" default="Date Fin" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${planificationInstance?.dateFin}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="planification.etape.label" default="Etape" /></td>
				
				<td valign="top" class="value"><g:link controller="etapePlanning" action="show" id="${planificationInstance?.etape?.id}">${planificationInstance?.etape?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="planification.mission.label" default="Mission" /></td>
				
				<td valign="top" class="value"><g:link controller="mission" action="show" id="${planificationInstance?.mission?.id}">${planificationInstance?.mission?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
