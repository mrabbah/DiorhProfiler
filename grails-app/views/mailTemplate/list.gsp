
<%@ page import="com.rabbahsoft.diorhprofiler.MailTemplate" %>
<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'mailTemplate.label', default: 'MailTemplate')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
<g:if test="${!layout_nosecondarymenu}">
  <g:render template="submenubar"/>														
</g:if>
<section id="list-mailTemplate" class="first">
  <div class="row">
    <div class="col-sm-12">
      <div class="panel panel-danger">
        <div class="panel-heading">
          <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class='label label-danger'>Liste</span></h3>
        </div>
        <div class="panel-body">
          <table class="table table-striped table-bordered table-condensed">
            <thead>
              <tr>

            <g:sortableColumn property="code" title="${message(code: 'mailTemplate.code.label', default: 'Code')}" />

            <g:sortableColumn property="description" title="${message(code: 'mailTemplate.description.label', default: 'Description')}" />

            </tr>
            </thead>
            <tbody>
            <g:each in="${mailTemplateInstanceList}" status="i" var="mailTemplateInstance">
              <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

              <td><g:link action="show" id="${mailTemplateInstance.id}">${fieldValue(bean: mailTemplateInstance, field: "code")}</g:link></td>

              <td>${fieldValue(bean: mailTemplateInstance, field: "description")}</td>

              </tr>
            </g:each>
            </tbody>
          </table>
          <div>
            <bs:paginate total="${mailTemplateInstanceCount}" />
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>

</html>
