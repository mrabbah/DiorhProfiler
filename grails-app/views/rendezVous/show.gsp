
<%@ page import="com.rabbahsoft.diorhprofiler.RendezVous" %>
<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'rendezVous.label', default: 'RendezVous')}" />
  <r:require modules="jquery-ui" />
  <r:require modules="easygrid-jqgrid-dev,export"/>
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
<section id="show-rendezVous" class="first">
  <div class="row">
    <div class="col-sm-12">
      <div class="panel panel-danger">
        <div class="panel-heading">
          <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" alt="Back to top" width="19px" height="19px" title="Viadeo" width="19px" height="19px"/><span class="label label-danger">Détail du rendez-vous</span></h3>
        </div>
        <div class="panel-body">
          <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Informations du RDV</span></h3>
         
          <div class="row">
            <div class="col-sm-3 showlabel"><g:message code="rendezVous.dateRdv.label" default="Date Rdv" />:</div>
            <div class="col-sm-3 showvalue"><g:formatDate date="${rendezVousInstance?.dateRdv}" format="dd/MM/yyyy" /></div>
            <div class="col-sm-3 showlabel"><g:message code="rendezVous.typage.label" default="Typage" />:</div>
            <div class="col-sm-3 showvalue">${rendezVousInstance?.typage?.encodeAsHTML()}</div>
          </div>

          <div class="row">
            <div class="col-sm-3 showlabel"><g:message code="rendezVous.emplacement.label" default="Emplacement" />:</div>
            <div class="col-sm-3 showvalue">${fieldValue(bean: rendezVousInstance, field: "emplacement")}</div>
            <div class="col-sm-3 showlabel"><g:message code="rendezVous.commentaire.label" default="Commentaire" />:</div>
            <div class="col-sm-3 showvalue">${fieldValue(bean: rendezVousInstance, field: "commentaire")}</div>
          </div>

          <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Participants</span></h3>

          <div class="row">
            <div class="col-sm-3 showlabel"><g:message code="rendezVous.contact.label" default="Contact" />:</div>
            <div class="col-sm-3 showvalue">${rendezVousInstance?.contact?.encodeAsHTML()}</div>
            <div class="col-sm-3 showlabel"><g:message code="rendezVous.candidat.label" default="Candidat" />:</div>
            <div class="col-sm-3 showvalue">${rendezVousInstance?.candidat?.encodeAsHTML()}</div>
          </div>

          <div class="row">
            <div class="col-sm-3 showlabel"><g:message code="rendezVous.utilisateur.label" default="Utilisateur"/>:</div>
            <div class="col-sm-3 showvalue">${fieldValue(bean: rendezVousInstance, field: "utilisateur")}</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

</body>

</html>
