
<%@ page import="com.rabbahsoft.diorhprofiler.RendezVous" %>
<!DOCTYPE html>
<html>

  <head>
  <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'rendezVous.label', default: 'RendezVous')}" />
  <g:javascript src="jquery-ui.min.js" />
</head>
<body>
<g:if test="${!layout_nosecondarymenu}">
  <g:render template="submenubar"/>														
</g:if>
<section id="list-rendezVous" class="first">
    <div class="row">
    <div class="col-sm-12">
      <div class="panel panel-danger">
        <div class="panel-heading">
          <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class="label label-danger">Liste des rendez-vous</span></h3>
        </div>
        <div class="panel-body">
  <table class="table table-striped table-bordered table-condensed">
    <thead>
      <tr>
    <g:sortableColumn property="Contact" title="${message(code: 'rendezVous.contact.label', default: 'Contact')}" />
    <th><g:message code="rendezVous.candidat.label" default="Candidat" /></th>
    <g:sortableColumn property="Utilisateur" title="${message(code: 'rendezVous.utilisateur.label', default: 'Utilisateur')}" />
    <g:sortableColumn property="dateRdv" title="${message(code: 'rendezVous.dateRdv.label', default: 'Date Rdv')}" />
    <th><g:message code="rendezVous.typage.label" default="Typage" /></th>
    <th><g:message code="rendezVous.emplacement.label" default="Emplacement" /></th>
    <th><g:message code="rendezVous.commentaire.label" default="Commentaire" /></th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${rendezVousInstanceList}" status="i" var="rendezVousInstance">
      <tr class="prop">
        <td><g:link action="show" id="${rendezVousInstance.id}">${fieldValue(bean: rendezVousInstance, field: "contact")}</g:link></td>
      <td>${fieldValue(bean: rendezVousInstance, field: "candidat")}</td>
      <td>${fieldValue(bean: rendezVousInstance, field: "utilisateur")}</td>
      <td><g:formatDate date="${rendezVousInstance.dateRdv}" format="dd/MM/yyyy"/></td>
      <td>${fieldValue(bean: rendezVousInstance, field: "typage")}</td>
      <td>${fieldValue(bean: rendezVousInstance, field: "emplacement")}</td>
      <td>${fieldValue(bean: rendezVousInstance, field: "commentaire")}</td>
      </tr>
    </g:each>
    </tbody>
  </table>
  <div>
    <bs:paginate total="${rendezVousInstanceCount}" />
  </div>
        </div>
        </div>
        </div>
        </div>
</section>
</body>
</html>
