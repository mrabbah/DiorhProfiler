<%@ page import="com.rabbahsoft.diorhprofiler.ActionContact" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'actionContact.label', default: 'ActionContact')}" />
  <g:javascript src="jquery-ui.min.js" />
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
<section id="show-actionContact" class="first">
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
                <td valign="top" class="name"><g:message code="actionContact.contact.label" default="Contact" /></td>
            <td valign="top" class="value">${actionContactInstance?.contact?.encodeAsHTML()}</td>
            </tr>
            <tr class="prop">
              <td valign="top" class="name"><g:message code="actionContact.responsable.label" default="Consultant " /></td>
            <td valign="top" class="value">${actionContactInstance?.responsable?.encodeAsHTML()}</td>
            </tr>
            <tr class="prop">
              <td valign="top" class="name"><g:message code="actionContact.dateActionPrevue.label" default="Date Action Prevue" /></td>
            <td valign="top" class="value"><g:formatDate date="${actionContactInstance?.dateAction}" format="dd/MM/yyyy"/></td>
            </tr>
            <tr class="prop">
              <td valign="top" class="name"><g:message code="actionContact.statut.label" default="Statut" /></td>
            <td valign="top" class="value">${actionContactInstance?.statutAction?.encodeAsHTML()}</td>
            </tr>
            <tr class="prop">
              <td valign="top" class="name"><g:message code="actionContact.contenu.label" default="Contenu" /></td>
            <td valign="top" class="value">${fieldValue(bean: actionContactInstance, field: "contenu")}</td>
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
