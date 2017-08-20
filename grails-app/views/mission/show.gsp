
<%@ page import="com.rabbahsoft.diorhprofiler.Mission" %>
<!DOCTYPE html>
<html>
Déscription
  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'mission.label', default: 'Mission')}" />
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
<section id="show-mission" class="first">
  <div class="row">
    <div class="col-sm-12">
      <div class="panel panel-danger">
        <div class="panel-heading">
          <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class="label label-danger">Détail de la mission</span></h3>
        </div>
        <div class="panel-body">
          <div class="tabbable tabbable-bordered">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#tab_br1" data-toggle="tab">Informations mission</a></li>
              <li><a href="#tab_br2" data-toggle="tab">Description du poste </a></li>
              <li><a href="#tab_br3" data-toggle="tab">Suivi poste</a></li>
              <g:if test="${session.droits!=null && session.droits.PLANIFIER_MISSION!=null}">
              <li><a href="#tab_br4" data-toggle="tab">Planifications</a></li>
              </g:if>
    <li><a href="#tab_br5" data-toggle="tab">Candidatures</a></li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="tab_br1">
                <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Description de la mission</span></h3>

                <div class="row"> 
                  <div class="col-sm-3 showlabel"><g:message code="mission.reference.label" default="Référence" />:</div>
                  <div class="col-sm-3 showvalue">${fieldValue(bean: missionInstance, field: "reference")}</div>
                  <div class="col-sm-3 showlabel"><g:message code="mission.dateDemarrage.label" default="Date de démarrage" />:</div>
                  <div class="col-sm-3 showvalue"><g:formatDate date="${missionInstance?.dateDemarrage}" format="dd/MM/yyyy" /></div>
                </div>

                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="mission.poste.label" default="Poste" />:</div>
                  <div class="col-sm-3 showvalue">${fieldValue(bean: missionInstance, field: "poste")}</div>
                  <div class="col-sm-3 showlabel"><g:message code="mission.localisation.label" default="Localisation" />:</div>
                  <div class="col-sm-3 showvalue">${fieldValue(bean: missionInstance, field: "localisation")}</div>
                </div>

                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="mission.contexte.label" default="Contexte" />:</div>
                  <div class="col-sm-3 showvalue">${fieldValue(bean: missionInstance, field: "contexte")}</div>
                  <div class="col-sm-3 showlabel"><g:message code="mission.contact.label" default="Contact" />:</div>
                  <div class="col-sm-3 showvalue">${missionInstance?.contact?.encodeAsHTML()}</div>
                </div>

                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="mission.approche.label" default="Approche" />:</div>
                  <div class="col-sm-3 showvalue">${fieldValue(bean: missionInstance, field: "approche")}</div>
                  <div class="col-sm-3 showlabel"><g:message code="mission.interlocuteur.label" default="Interlocuteur" />:</div>
                  <div class="col-sm-3 showvalue">${missionInstance?.interlocuteur?.encodeAsHTML()}</div>
                </div>

                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="mission.rattachementHierarchique.label" default="Rattachement Hierarchique" />:</div>
                  <div class="col-sm-3 showvalue">${fieldValue(bean: missionInstance, field: "rattachementHierarchique")}</div>
                  <div class="col-sm-3 showlabel"><g:message code="mission.rattachementFonctionnel.label" default="Rattachement Fonctionnel" />:</div>
                  <div class="col-sm-3 showvalue">${fieldValue(bean: missionInstance, field: "rattachementFonctionnel")}</div>
                </div>

                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="mission.statut.label" default="Statut" />:</div>
                  <div class="col-sm-3 showvalue">${missionInstance?.statut?.encodeAsHTML()}</div>
                </div>
    
                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="mission.description.label" default="Déscription" />:</div>
<!--                  <div class="col-sm-9 showvalue">${raw(missionInstance.description)}</div>-->
    <div class="col-sm-9"><g:textArea class="form-control" id="description" name="description" cols="140" rows="5" style="overflow:auto;resize:none" value="${missionInstance?.description}"/></div>
                </div>

                <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Equipe mission</span></h3>

                <div class="row">
<!--                  <div class="col-sm-3 showlabel"><g:message code="mission.assistant.label" default="Assistant" />:</div>
                  <div class="col-sm-3 showvalue">${missionInstance?.assistant?.encodeAsHTML()}</div>-->
                  <div class="col-sm-3 showlabel"><g:message code="mission.chargeRecherche.label" default="Charge Recherche" />:</div>
                  <div class="col-sm-3 showvalue">${missionInstance?.chargeRecherche?.encodeAsHTML()}</div>
                  <div class="col-sm-3 showlabel"><g:message code="mission.consultant.label" default="Consultant" />:</div>
                  <div class="col-sm-3 showvalue">${missionInstance?.consultant?.encodeAsHTML()}</div>	
                </div>

                <div class="row">
                
                </div>

                <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Annonce</span></h3>

                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="mission.datePublication.label" default="Date de publication" />:</div>
                  <div class="col-sm-3 showvalue"><g:formatDate date="${missionInstance?.datePublication}" format="dd/MM/yyyy"/></div>
                  <div class="col-sm-3 showlabel"><g:message code="mission.entreprise.label" default="Entreprise" />:</div>
                  <div class="col-sm-3 showvalue">${fieldValue(bean: missionInstance, field: "entreprise")}</div>
                </div>

                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="mission.descriptifSociete.label" default="Descriptif de la société" />:</div>
<!--                  <div class="col-sm-9 showvalue">${raw(missionInstance?.descriptifSociete)}</div>-->
    <div class="col-sm-9"><g:textArea class="form-control" name="descriptifSociete" cols="140" rows="5" style="overflow:auto;resize:none" value="${missionInstance?.descriptifSociete}" style="width:600px;"/></div>
                </div>
    
                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="mission.descriptifPoste.label" default="Descriptif du poste" />:</div>
<!--                  <div class="col-sm-9 showvalue">${raw(missionInstance?.descriptifPoste)}</div>-->
    <div class="col-sm-9"><g:textArea class="form-control" name="descriptifPoste" cols="140" rows="5" style="overflow:auto;resize:none" value="${missionInstance?.descriptifPoste}" style="width:600px;"/></div>
<!--    <div class="col-sm-9 showvalue"><g:textArea disabled class="form-control" name="descriptifPoste" cols="100" rows="8" maxlength="65535" value="${missionInstance?.descriptifPoste}" style="width:600px;" disabled="true"/></div>-->
                </div>

                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="mission.profilCandidat.label" default="Profil du candidat" />:</div>
                  <div class="col-sm-9"><g:textArea class="form-control" name="descriptifPoste" cols="140" rows="5" style="overflow:auto;resize:none" value="${missionInstance?.profilCandidat}" style="width:600px;"/></div>
<!--                  <div class="col-sm-9 showvalue">${raw(missionInstance?.profilCandidat)}</div>-->
                </div>
    
                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="mission.publierAnnonce.label" default="Publier l'annonce" />:</div>
                  <g:if test="${missionInstance?.publierAnnonce == 'true'}">
                  <div class="col-sm-3 showvalue">True</div>
<!--                  <div class="col-sm-3 showvalue"><g:formatBoolean boolean="${missionInstance?.publierAnnonce}" />:</div>-->
                  </g:if>
                  <g:else>
                  <div class="col-sm-3 showvalue">False</div>
                  </g:else>
                </div>

                <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Garantie</span></h3>

                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="mission.dureeGarantie.label" default="Durée de garantie" />:</div>
                  <div class="col-sm-3 showvalue">${fieldValue(bean: missionInstance, field: "dureeGarantie")}</div>
                  <div class="col-sm-3 showlabel"><g:message code="mission.dateFinGarantie.label" default="Date fin de garantie" />:</div>
                  <div class="col-sm-3 showvalue"><g:formatDate date="${missionInstance?.dateFinGarantie}" format="dd/MM/yyyy"/></div>
                </div>

              </div>

              <div class="tab-pane" id="tab_br2">

                <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Exigences profil</span></h3>

                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="mission.formation.label" default="Formation" />:</div>
                  <div class="col-sm-3 showvalue">${missionInstance?.formation?.encodeAsHTML()}</div>
                  <div class="col-sm-3 showlabel"><g:message code="mission.typeFormation.label" default="Type de formation" />:</div>
                  <div class="col-sm-3 showvalue">${fieldValue(bean: missionInstance, field: "typeFormation")}</div>
                </div>

                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="mission.plageExperience.label" default="Expérience globale" />:</div>
                  <div class="col-sm-3 showvalue">${missionInstance?.plageExperience?.encodeAsHTML()}</div>
                  <div class="col-sm-3 showlabel"><g:message code="mission.nbrAnneeExperience.label" default="Nombre d'années d'expérience" />:</div>
                  <div class="col-sm-3 showvalue">${fieldValue(bean: missionInstance, field: "nbrAnneeExperience")}</div>
                </div>

                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="mission.secteurActivite.label" default="Secteur d'activité" />:</div>
                  <div class="col-sm-3 showvalue">${missionInstance?.secteurActivite?.encodeAsHTML()}</div>
                  <div class="col-sm-3 showlabel"><g:message code="mission.typeFonction.label" default="Type de fonction" />:</div>
                  <div class="col-sm-3 showvalue">${missionInstance?.typeFonction?.encodeAsHTML()}</div>
                </div>

                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="mission.comportement.label" default="Comportement" />:</div>
                  <div class="col-sm-3 showvalue">${fieldValue(bean: missionInstance, field: "comportement")}</div>
                  <div class="col-sm-3 showlabel"><g:message code="mission.niveauEtude.label" default="Niveau d'etudes" />:</div>
                  <div class="col-sm-3 showvalue">${missionInstance?.niveauEtude?.encodeAsHTML()}</div>
                </div>

                <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Environnement du poste</span></h3>

                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="mission.effectifEquipe.label" default="Effectif Equipe" />:</div>
                  <div class="col-sm-3 showvalue">${fieldValue(bean: missionInstance, field: "effectifEquipe")}</div>
                  <div class="col-sm-3 showlabel"><g:message code="mission.budget.label" default="Budget" />:</div>
                  <div class="col-sm-3 showvalue">${fieldValue(bean: missionInstance, field: "budget")}</div>
                </div>

                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="mission.profilEquipe.label" default="Profil de l'équipe" />:</div>
                  <div class="col-sm-3 showvalue">${fieldValue(bean: missionInstance, field: "profilEquipe")}</div>
                  <div class="col-sm-3 showlabel"><g:message code="mission.remunerationAvantages.label" default="Rémuneration & Avantages" />:</div>
                  <div class="col-sm-3 showvalue">${fieldValue(bean: missionInstance, field: "remunerationAvantages")}</div>
                </div>

                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="mission.deplacement.label" default="Deplacement" />:</div>
                  <div class="col-sm-3 showvalue">${fieldValue(bean: missionInstance, field: "deplacement")}</div>
                  <div class="col-sm-3 showlabel"><g:message code="mission.deplacementLocalisation.label" default="Déplacement Localisation" />:</div>
                  <div class="col-sm-3 showvalue">${fieldValue(bean: missionInstance, field: "deplacementLocalisation")}</div>
                </div>

                <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Compétences informatiques</span></h3>

                <table class="table table-striped table-bordered table-condensed">
                  <tbody>
                    <tr>
                      <th>Intitulé de la compétence</th>
                    </tr>
                  <g:each in="${missionInstance.connaissancesInfos}" var="c">
                    <tr class="prop">
                      <td valign="top" style="text-align: left;" class="value">${c?.encodeAsHTML()}</td>
                    </tr>
                  </g:each>
                  </tbody>
                </table>

                <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Compétences linguistiques</span></h3>
                <table class="table table-striped table-bordered table-condensed">
                  <tbody>
                    <tr>
                      <th>Intitulé de la Langue</th>
                    </tr>
                  <g:each in="${missionInstance.connaissanceLinguistiques}" var="c">
                    <tr class="prop">	
                      <td valign="top" style="text-align: left;" class="value">${c?.encodeAsHTML()}</td>
                    </tr>
                  </g:each>
                  </tbody>
                </table>

              </div>

              <div class="tab-pane" id="tab_br3">

                <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Avancement mission</span></h3>

                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="mission.delaisRealisation.label" default="Délais de réalisation" />:</div>
                  <div class="col-sm-3 showvalue">${fieldValue(bean: missionInstance, field: "delaisRealisation")}</div>
                  <div class="col-sm-3 showlabel"><g:message code="mission.etapeAvancement.label" default="Etape d'avancement" />:</div>
                  <div class="col-sm-3 showvalue">${missionInstance?.etapeAvancement?.encodeAsHTML()}</div>
                </div>

                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="mission.replanifier.label" default="Replanifier" />:</div>
                  <div class="col-sm-3 showvalue"><g:formatBoolean boolean="${missionInstance?.replanifier}" />:</div>
                  <div class="col-sm-3 showlabel"><g:message code="mission.dateFinAnnonce.label" default="Date fin de l'annonce" />:</div>
                  <div class="col-sm-3 showvalue"><g:formatDate date="${missionInstance?.dateFinAnnonce}" format="dd/MM/yyyy"/></div>
                </div>

              </div>
              <g:if test="${session.droits!=null && session.droits.PLANIFIER_MISSION!=null}">
              <div class="tab-pane active" id="tab_br4">
                <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Planification mission</span></h3>
                <table class="table table-striped table-bordered table-condensed">
                  <tbody>
                    <tr>
                      <th>Etape</th>
                      <th>Date de début</th>
                      <th>Date de fin</th>
                    </tr>
                  <g:each in="${missionInstance.planifications}" var="p">
                    <tr class="prop">
                      <td valign="top" style="text-align: left;" class="value">${p?.etape?.libelle}</td>	
                      <td valign="top" style="text-align: left;" class="value"><g:formatDate date="${p?.dateDebut}" format="dd/MM/yyyy"/></td>	
                    <td valign="top" style="text-align: left;" class="value"><g:formatDate date="${p?.dateFin}" format="dd/MM/yyyy"/></td>
                    </tr>
                  </g:each>
                  </tbody>
                </table>
              </div>
                </g:if>
               <div class="tab-pane " id="tab_br5">
                 <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">liste des candidatures</span></h3>
                    <table class="table table-striped table-bordered table-condensed">
                  <tbody>
                    <tr>
                      <th>Date de dépôt de candidature</th>
                      <th>Réf. mission</th>
                      <th>Poste</th>
                      <th>Candidat</th>
                      <th>Lieu</th>
                      <th>Source de candidature</th>
                    </tr>
                  <g:each in="${missionInstance.candidatures}" var="c">
                    <tr class="prop">
                      <td valign="top" style="text-align: left;" class="value"><g:link controller="candidature" action="show" id="${c.id}"><g:formatDate date="${c?.dateCandidature}" format="dd/MM/yyyy" /></g:link></td>
                      <td valign="top" style="text-align: left;" class="value">${c?.mission?.reference}</td>
                      <td valign="top" style="text-align: left;" class="value">${c?.mission?.poste}</td>
                      <td valign="top" style="text-align: left;" class="value"><g:link controller="candidat" action="show" id="${c?.candidat?.id}" target="_blank">${c?.candidat}</g:link></td>
                      <td valign="top" style="text-align: left;" class="value">${c?.mission?.localisation}</td>
                      <td valign="top" style="text-align: left;" class="value">${c?.sourceCandidature}</td>
                    </tr>
                  </g:each>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>