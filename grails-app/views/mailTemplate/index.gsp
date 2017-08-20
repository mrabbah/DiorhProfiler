
<%@ page import="com.rabbahsoft.diorhprofiler.MailTemplate" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'mailTemplate.label', default: 'MailTemplate')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-mailTemplate" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="code" title="${message(code: 'mailTemplate.code.label', default: 'Code')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'mailTemplate.description.label', default: 'Description')}" />
			
				<g:sortableColumn property="template" title="${message(code: 'mailTemplate.template.label', default: 'Template')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${mailTemplateInstanceList}" status="i" var="mailTemplateInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${mailTemplateInstance.id}">${fieldValue(bean: mailTemplateInstance, field: "code")}</g:link></td>
			
				<td>${fieldValue(bean: mailTemplateInstance, field: "description")}</td>
			
				<td>${fieldValue(bean: mailTemplateInstance, field: "template")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${mailTemplateInstanceCount}" />
	</div>
</section>

</body>

</html>
