<%@ page import="com.rabbahsoft.diorhprofiler.RechercheCandidat" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="globallayout" />
	<g:set var="entityName" value="${message(code: 'rechercheCandidat.label', default: 'RechercheCandidat')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>
         <g:if test="${!layout_nosecondarymenu}">
		<g:render template="submenubar"/>														
	</g:if>
	<section id="create-rechercheCandidat" class="first">

		<g:hasErrors bean="${rechercheCandidatInstance}">
		<div class="alert alert-danger">
			<g:renderErrors bean="${rechercheCandidatInstance}" as="list" />
		</div>
		</g:hasErrors>

		<g:form action="list" class="form-horizontal" role="form" >
			<g:render template="form"/>

			<div class="form-actions margin-top-medium">
				<g:submitButton name="create" class="btn btn-danger" value="${message(code: 'default.button.recherche.label', default: 'Create&Recherche')}" />
	            
			</div>
		</g:form>

	</section>

</body>

</html>
