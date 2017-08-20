<%@ page import="com.rabbahsoft.diorhprofiler.MailTemplate" %>
<%@page defaultCodec="none"%>
<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'mailTemplate.label', default: 'MailTemplate')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
  <style type="text/css" media="screen">
@media screen and (min-width: 768px) {
  .modal-dialog {
    width: 300px;
    margin: 30px auto;
    }
    .modal-content {
      -webkit-box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
    }
    }
  </style>
</head>

<body>
<g:if test="${!layout_nosecondarymenu}">
  <g:render template="submenubar"/>														
</g:if>
<section id="show-mailTemplate" class="first">
  <div class="row">
    <div class="col-sm-12">
      <div class="panel panel-danger">
        <div class="panel-heading">
          <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class='label label-danger'>Détail</span></h3>
        </div>
        <div class="panel-body">
          <table class="table table-striped table-bordered table-condensed">
            <tbody>
              <tr class="prop">
                <td valign="top" class="name"><g:message code="mailTemplate.code.label" default="Code" /></td>
            <td valign="top" class="value">${fieldValue(bean: mailTemplateInstance, field: "code")}</td>
            </tr>
            <tr class="prop">
              <td valign="top" class="name"><g:message code="mailTemplate.description.label" default="Description" /></td>
            <td valign="top" class="value">${fieldValue(bean: mailTemplateInstance, field: "description")}</td>
            </tr>
            <tr class="prop">
              <td valign="top" class="name"><g:message code="mailTemplate.template.label" default="Template" /></td>
            <td valign="top" class="value">${raw(mailTemplateInstance.template)}</td>
            </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>
