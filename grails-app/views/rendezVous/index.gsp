
<%@ page import="com.rabbahsoft.diorhprofiler.RendezVous" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="globallayout" />
	<g:set var="entityName" value="${message(code: 'rendezVous.label', default: 'RendezVous')}" />
</head>

<body>
<g:if test="${!layout_nosecondarymenu}">
		<g:render template="submenubar"/>														
	</g:if>
<section id="index-rendezVous" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="emplacement" title="${message(code: 'rendezVous.emplacement.label', default: 'Emplacement')}" />
			
				<g:sortableColumn property="commentaire" title="${message(code: 'rendezVous.commentaire.label', default: 'Commentaire')}" />
			
				<th><g:message code="rendezVous.candidat.label" default="Candidat" /></th>
			
				<th><g:message code="rendezVous.contact.label" default="Contact" /></th>
			
				<g:sortableColumn property="dateRdv" title="${message(code: 'rendezVous.dateRdv.label', default: 'Date Rdv')}" />
			
				<th><g:message code="rendezVous.typage.label" default="Typage" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${rendezVousInstanceList}" status="i" var="rendezVousInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${rendezVousInstance.id}">${fieldValue(bean: rendezVousInstance, field: "emplacement")}</g:link></td>
			
				<td>${fieldValue(bean: rendezVousInstance, field: "commentaire")}</td>
			
				<td>${fieldValue(bean: rendezVousInstance, field: "candidat")}</td>
			
				<td>${fieldValue(bean: rendezVousInstance, field: "contact")}</td>
			
				<td><g:formatDate date="${rendezVousInstance.dateRdv}" /></td>
			
				<td>${fieldValue(bean: rendezVousInstance, field: "typage")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${rendezVousInstanceCount}" />
	</div>
</section>

</body>

</html>
