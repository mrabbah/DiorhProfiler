
<%@ page import="com.rabbahsoft.diorhprofiler.InterlocuteurContact" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'interlocuteurContact.label', default: 'InterlocuteurContact')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-interlocuteurContact" class="first">

	<table class="table table-striped table-bordered table-condensed">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="interlocuteurContact.nom.label" default="Nom" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: interlocuteurContactInstance, field: "nom")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="interlocuteurContact.prenom.label" default="Prenom" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: interlocuteurContactInstance, field: "prenom")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="interlocuteurContact.fonction.label" default="Fonction" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: interlocuteurContactInstance, field: "fonction")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="interlocuteurContact.telephonePortable.label" default="Telephone Portable" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: interlocuteurContactInstance, field: "telephonePortable")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="interlocuteurContact.telephoneFixe.label" default="Telephone Fixe" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: interlocuteurContactInstance, field: "telephoneFixe")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="interlocuteurContact.email.label" default="Email" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: interlocuteurContactInstance, field: "email")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="interlocuteurContact.contact.label" default="Contact" /></td>
				
				<td valign="top" class="value"><g:link controller="contact" action="show" id="${interlocuteurContactInstance?.contact?.id}">${interlocuteurContactInstance?.contact?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
