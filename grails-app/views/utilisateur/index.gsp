
<%@ page import="com.rabbahsoft.diorhprofiler.Utilisateur" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'utilisateur.label', default: 'Utilisateur')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-utilisateur" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="firstName" title="${message(code: 'utilisateur.firstName.label', default: 'First Name')}" />
			
				<g:sortableColumn property="lastName" title="${message(code: 'utilisateur.lastName.label', default: 'Last Name')}" />
			
				<g:sortableColumn property="username" title="${message(code: 'utilisateur.username.label', default: 'Username')}" />
			
				<g:sortableColumn property="password" title="${message(code: 'utilisateur.password.label', default: 'Password')}" />
			
				<g:sortableColumn property="email" title="${message(code: 'utilisateur.email.label', default: 'Email')}" />
			
				<th><g:message code="utilisateur.profil.label" default="Profil" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${utilisateurInstanceList}" status="i" var="utilisateurInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${utilisateurInstance.id}">${fieldValue(bean: utilisateurInstance, field: "firstName")}</g:link></td>
			
				<td>${fieldValue(bean: utilisateurInstance, field: "lastName")}</td>
			
				<td>${fieldValue(bean: utilisateurInstance, field: "username")}</td>
			
				<td>${fieldValue(bean: utilisateurInstance, field: "password")}</td>
			
				<td>${fieldValue(bean: utilisateurInstance, field: "email")}</td>
			
				<td>${fieldValue(bean: utilisateurInstance, field: "profil")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${utilisateurInstanceCount}" />
	</div>
</section>

</body>

</html>
