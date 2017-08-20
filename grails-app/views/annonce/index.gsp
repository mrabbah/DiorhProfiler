
<%@ page import="com.rabbahsoft.diorhprofiler.Mission" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="globallayout" />
	<g:set var="entityName" value="${message(code: 'mission.label', default: 'Mission')}" />
</head>

<body>
<g:if test="${!layout_nosecondarymenu}">
		<g:render template="submenubar"/>														
	</g:if>
<section id="index-mission" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="code" title="${message(code: 'mission.code.label', default: 'Code')}" />
			
				<g:sortableColumn property="reference" title="${message(code: 'mission.reference.label', default: 'Reference')}" />
			
				<g:sortableColumn property="poste" title="${message(code: 'mission.poste.label', default: 'Poste')}" />
			
				<g:sortableColumn property="localisation" title="${message(code: 'mission.localisation.label', default: 'Localisation')}" />
			
				<g:sortableColumn property="contexte" title="${message(code: 'mission.contexte.label', default: 'Contexte')}" />
			
				<g:sortableColumn property="approche" title="${message(code: 'mission.approche.label', default: 'Approche')}" />
			
			</tr>
		</thead>
		<tbody>
                  <g:if test='${missionInstanceList} == null'>
         
        </g:if>
        <g:else>
		<g:each in="${missionInstanceList}" status="i" var="missionInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${missionInstance.id}">${fieldValue(bean: missionInstance, field: "code")}</g:link></td>
			
				<td>${fieldValue(bean: missionInstance, field: "reference")}</td>
			
				<td>${fieldValue(bean: missionInstance, field: "poste")}</td>
			
				<td>${fieldValue(bean: missionInstance, field: "localisation")}</td>
			
				<td>${fieldValue(bean: missionInstance, field: "contexte")}</td>
			
				<td>${fieldValue(bean: missionInstance, field: "approche")}</td>
			
			</tr>
		</g:each>
          </g:else>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${missionInstanceCount}" />
	</div>
</section>

</body>

</html>
