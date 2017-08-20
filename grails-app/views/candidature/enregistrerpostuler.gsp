
<%@ page import="com.rabbahsoft.diorhprofiler.Candidature" %>
<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'candidature.label', default: 'Candidature')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

  <section id="show-candidature" class="first">
    <div class="row">
      <div class="col-sm-12">
        <div class="panel panel-danger">
          <div class="panel-heading">
            <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class="label label-danger">Fiche de candidature</span></h3>
          </div>
          <div class="panel-body">   

            <div class="row">
              <div class="col-sm-3 showlabel"><g:message code="candidature.nomCandidat.label" default="Nom Candidat" />:</div>
              <div class="col-sm-3 showvalue">${fieldValue(bean: candidatureInstance, field: "candidat")}</div>
              <div class="col-sm-3 showlabel"><g:message code="candidature.dateCandidature.label" default="Date Candidature" />:</div>
              <div class="col-sm-3 showvalue"><g:formatDate date="${candidatureInstance?.dateCandidature}" format="dd/MM/yyyy HH:MM" /></div>
            </div>

            <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class='label label-info'>L'annonce</span></h3>

            <div class="row table-bordered2 odd">
              <div class="col-sm-3 fontrowtabletitle">Réference mission</div>
              <div class="col-sm-3 fontrowtabletitle">Poste</div>
              <div class="col-sm-3 fontrowtabletitle">Societé</div>
              <div class="col-sm-3 fontrowtabletitle">Lieu</div>
            </div>

            <div class='row table-bordered2 even'>
              <div class="col-sm-3 fontrowtabletitle"><g:link controller="mission" action="show" id="${candidatureInstance?.mission?.id}">${candidatureInstance?.mission?.reference?.encodeAsHTML()}</g:link></div>
              <div class="col-sm-3 fontrowtabletitle">${candidatureInstance?.mission?.poste?.encodeAsHTML()}</div>
              <div class="col-sm-3 fontrowtabletitle">${candidatureInstance?.mission?.entreprise?.encodeAsHTML()}</div>
              <div class="col-sm-3 fontrowtabletitle">${candidatureInstance?.mission?.localisation?.encodeAsHTML()}</div>
            </div>

            <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class='label label-info'>Lettre de motivation</span></h3>  
            <div class="row">
              <div class="col-sm-3 showlabel"><g:message code="candidature.lettreMotivation.label" default="Texte de la lettre " />:</div>
              <div class="col-sm-9 showvalue">${fieldValue(bean: candidatureInstance, field: "lettreMotivation")}</div>
              </tr>
            </div>
          </div>
        </div>
      </div>
  </section>

</body>

</html>
