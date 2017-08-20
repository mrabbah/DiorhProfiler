
<%@ page import="com.rabbahsoft.diorhprofiler.Candidature" %>
<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'candidature.label', default: 'Candidature')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
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
<div class="row">
  <div class="col-sm-12">
    <div class="panel panel-danger">
      <div class="panel-heading">
        <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class="label label-danger">Fiche de candidature</span></h3>
      </div>
      <div class="panel-body">
        <g:if test="${session.user!=null && session.user.profil.libelle!="candidat"}">
          <div class="tabbable tabbable-bordered">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#tab_br1" data-toggle="tab">Fiche</a></li>
              <li><a href="#tab_br2" data-toggle="tab">Avancement de la candidature</a></li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="tab_br1">
                </g:if>
                <section id="show-candidature" class="first">
                  </br>
                  <div class="panel panel-danger">
                    <div class="panel-body">
                      <div class="row">
                        <div class="col-sm-3 showlabel"><g:message code="candidature.nomCandidat.label" default="Nom Candidat" />:</div>
<!--                        <div class="col-sm-3 showvalue">${fieldValue(bean: candidatureInstance, field: "candidat")}</div>-->
                        <div class="col-sm-3 showvalue"><g:link controller="candidat" action="show" id="${candidatureInstance?.candidat?.id}">${candidatureInstance?.candidat?.encodeAsHTML()}</g:link></div>
                        <div class="col-sm-3 showlabel"><g:message code="candidature.dateCandidature.label" default="Date Candidature" />:</div>
                        <div class="col-sm-3 showvalue"><g:formatDate date="${candidatureInstance?.dateCandidature}" format="dd/MM/yyyy HH:MM" /></div>
                      </div>
                      <div class="row">
                        <div class="col-sm-3 showlabel"><g:message code="candidature.statut.label" default="Statut :" /></div>
                        <div class="col-sm-3 showvalue">${candidatureInstance?.statut}</div>
                      </div>
                    </div>
                  </div>

                  <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class='label label-info'>L'annonce</span></h3>

                  <div class="row table-bordered2 odd">
                    <div class="col-sm-3 fontrowtabletitle">Réference mission</div>
                    <div class="col-sm-3 fontrowtabletitle">Poste</div>
                    <div class="col-sm-3 fontrowtabletitle">Societé</div>
                    <div class="col-sm-3 fontrowtabletitle">Lieu </div>
                  </div>

                  <div class='row table-bordered2 even'>
                    <g:if test="${session.user!=null && session.user.profil.libelle!="candidat"}">
                      <div class="col-sm-3 fontrowtabletitle"><g:link controller="mission" action="show" id="${candidatureInstance?.mission?.id}">${candidatureInstance?.mission?.reference?.encodeAsHTML()}</g:link></div>
                    </g:if>
                    <g:else>
                      <div class="col-sm-3 fontrowtabletitle"><g:link controller="annonce" action="show" id="${candidatureInstance?.mission?.id}">${candidatureInstance?.mission?.reference?.encodeAsHTML()}</g:link></div>
                    </g:else>
                    <div class="col-sm-3 fontrowtabletitle">${candidatureInstance?.mission?.poste?.encodeAsHTML()}</div>
                    <div class="col-sm-3 fontrowtabletitle">${candidatureInstance?.mission?.entreprise?.encodeAsHTML()}</div>
                    <div class="col-sm-3 fontrowtabletitle">${candidatureInstance?.mission?.localisation?.encodeAsHTML()}</div>
                  </div>

                  <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class='label label-info'>Lettre de motivation</span></h3>  
                  <div class="row">
                    <div class="col-sm-3 showlabel"><g:message code="candidature.lettreMotivation.label" default="Texte de la lettre " />:</div>
                    <div class="col-sm-9 showvalue">${fieldValue(bean: candidatureInstance, field: "lettreMotivation")}</div>
                  </div>
                  <g:if test="${session.user!=null && session.user.profil.libelle!="candidat"}">
                    <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class='label label-info'>Evaluation de la candidature</span></h3>  
                    <div class="row">
                      <div class="col-sm-3 showlabel"><g:message code="candidature.evaluationcandidiat.label" default="Evaluation du candidat" />:</div>
                      <div class="col-sm-9 showvalue">${fieldValue(bean: candidatureInstance, field: "evaluation")}</div>
                    </div>
                    <div class="row">
                      <div class="col-sm-3 showlabel"><g:message code="candidature.evaluationCommentaire.label" default="Commentaire" />:</div>
                      <div class="col-sm-9 showvalue">${fieldValue(bean: candidatureInstance, field: "evaluationCommentaire")}</div>
                    </div>
                  </g:if>
                  <g:if test="${session.user!=null && session.user.profil.libelle!="candidat"}">
                    </div>
                    <div class="tab-pane" id="tab_br2">
                      </br>
                      <table class="table table-striped table-bordered table-condensed">
                        <tbody>
                          <tr>
                            <th>Date de l'evénement</th>
                            <th>Type de l'evénement</th>
                          </tr>
                        <g:each in="${candidatureInstance.evenementCandidatures}" var="c">
                          <tr class="prop">
                            <td valign="top" style="text-align: left;" class="value"><g:formatDate date="${c?.dateEvtCandidature}" format="dd/MM/yyyy" /></td>
                          <td valign="top" style="text-align: left;" class="value">${c?.typeEvenement}</td>
                          </tr>
                        </g:each>
                        </tbody>
                      </table>
                    </div>
                    </div>
                  </g:if>
              </div>
            </div>
          </div>
      </div>
      </section>
      </body>

      </html>
