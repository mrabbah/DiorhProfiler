
<%@ page import="com.rabbahsoft.diorhprofiler.InterlocuteurContact" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'interlocuteurContact.label', default: 'InterlocuteurContact')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-interlocuteurContact" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="nom" title="${message(code: 'interlocuteurContact.nom.label', default: 'Nom')}" />
			
				<g:sortableColumn property="prenom" title="${message(code: 'interlocuteurContact.prenom.label', default: 'Prenom')}" />
			
				<g:sortableColumn property="fonction" title="${message(code: 'interlocuteurContact.fonction.label', default: 'Fonction')}" />
			
				<g:sortableColumn property="telephonePortable" title="${message(code: 'interlocuteurContact.telephonePortable.label', default: 'Telephone Portable')}" />
			
				<g:sortableColumn property="telephoneFixe" title="${message(code: 'interlocuteurContact.telephoneFixe.label', default: 'Telephone Fixe')}" />
			
				<g:sortableColumn property="email" title="${message(code: 'interlocuteurContact.email.label', default: 'Email')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${interlocuteurContactInstanceList}" status="i" var="interlocuteurContactInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${interlocuteurContactInstance.id}">${fieldValue(bean: interlocuteurContactInstance, field: "nom")}</g:link></td>
			
				<td>${fieldValue(bean: interlocuteurContactInstance, field: "prenom")}</td>
			
				<td>${fieldValue(bean: interlocuteurContactInstance, field: "fonction")}</td>
			
				<td>${fieldValue(bean: interlocuteurContactInstance, field: "telephonePortable")}</td>
			
				<td>${fieldValue(bean: interlocuteurContactInstance, field: "telephoneFixe")}</td>
			
				<td>${fieldValue(bean: interlocuteurContactInstance, field: "email")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${interlocuteurContactInstanceCount}" />
	</div>
</section>

</body>

</html>
