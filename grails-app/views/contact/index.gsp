
<%@ page import="com.rabbahsoft.diorhprofiler.Contact" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="globallayout" />
	<g:set var="entityName" value="${message(code: 'contact.label', default: 'Contact')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>
<g:if test="${!layout_nosecondarymenu}">
		<g:render template="submenubar"/>														
	</g:if>
<section id="index-contact" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="raisonSociale" title="${message(code: 'contact.raisonSociale.label', default: 'Raison Sociale')}" />
			
				<g:sortableColumn property="type" title="${message(code: 'contact.type.label', default: 'Type')}" />
			
				<g:sortableColumn property="directeurGeneral" title="${message(code: 'contact.directeurGeneral.label', default: 'Directeur General')}" />
			
				<g:sortableColumn property="effectif" title="${message(code: 'contact.effectif.label', default: 'Effectif')}" />
			
				<g:sortableColumn property="effectifCadre" title="${message(code: 'contact.effectifCadre.label', default: 'Effectif Cadre')}" />
			
				<g:sortableColumn property="chiffreAffaire" title="${message(code: 'contact.chiffreAffaire.label', default: 'Chiffre Affaire')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${contactInstanceList}" status="i" var="contactInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${contactInstance.id}">${fieldValue(bean: contactInstance, field: "raisonSociale")}</g:link></td>
			
				<td>${fieldValue(bean: contactInstance, field: "type")}</td>
			
				<td>${fieldValue(bean: contactInstance, field: "directeurGeneral")}</td>
			
				<td>${fieldValue(bean: contactInstance, field: "effectif")}</td>
			
				<td>${fieldValue(bean: contactInstance, field: "effectifCadre")}</td>
			
				<td>${fieldValue(bean: contactInstance, field: "chiffreAffaire")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${contactInstanceCount}" />
	</div>
</section>

</body>

</html>
