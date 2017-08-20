
<%@ page import="com.rabbahsoft.diorhprofiler.Profil" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'profil.label', default: 'Profil')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-profil" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="libelle" title="${message(code: 'profil.libelle.label', default: 'Libelle')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${profilInstanceList}" status="i" var="profilInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${profilInstance.id}">${fieldValue(bean: profilInstance, field: "libelle")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${profilInstanceCount}" />
	</div>
</section>

</body>

</html>
