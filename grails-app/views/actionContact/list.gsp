
<%@ page import="com.rabbahsoft.diorhprofiler.ActionContact" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'actionContact.label', default: 'ActionContact')}" />
  <g:javascript src="jquery-ui.min.js" />
</head>

<body>
<g:if test="${!layout_nosecondarymenu}">
  <g:render template="submenubar"/>														
</g:if>
<section id="list-actionContact" class="first">
  <div class="row">
    <div class="col-sm-12">
      <div class="panel panel-danger">
        <div class="panel-heading">
          <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class='label label-danger'>Historique</span></h3>
        </div>
        <div class="panel-body">
          <table class="table table-striped table-bordered table-condensed">
            <thead>
              <tr>
                <th><g:message code="actionContact.contact.label" default="Contact" /></th>
            <th><g:message code="actionContact.responsable.label" default="Responsable" /></th>
            <g:sortableColumn property="dateAction" title="${message(code: 'actionContact.dateAction.label', default: "Date de l'action")}" />
            <th><g:message code="actionContact.statut.label" default="Statut" /></th>
            <g:sortableColumn property="contenu" title="${message(code: 'actionContact.contenu.label', default: 'Contenu')}" />
            </tr>
            </thead>
            <tbody>
            <g:each in="${actionContactInstanceList}" status="i" var="actionContactInstance">
              <tr class="prop">
                <td><g:link action="show" id="${actionContactInstance.id}">${fieldValue(bean: actionContactInstance, field: "contact")}</g:link></td>
              <td>${fieldValue(bean: actionContactInstance, field: "responsable")}</td>
              <td><g:formatDate date="${actionContactInstance.dateAction}" format="dd/MM/yyyy" /></td>
              <td>${fieldValue(bean: actionContactInstance, field: "statutAction")}</td>
              <td>${fieldValue(bean: actionContactInstance, field: "contenu")}</td>
              </tr>
            </g:each>
            </tbody>
          </table>
          <div>
            <bs:paginate total="${actionContactInstanceCount}" />
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>
