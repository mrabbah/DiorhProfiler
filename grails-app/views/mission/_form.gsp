<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.rabbahsoft.diorhprofiler.Mission" %>
<%@ page import="com.rabbahsoft.diorhprofiler.FonctionDior" %>
<%@page defaultCodec="none" %>
<div class="tabbable tabbable-bordered">
  <ul class="nav nav-tabs">
    <li class="active"><a href="#tab_br1" data-toggle="tab">Informations mission</a></li>
    <li><a href="#tab_br2" data-toggle="tab">Description du poste </a></li>
    <li><a href="#tab_br3" data-toggle="tab">Suivi poste</a></li>
    <g:if test="${session.droits!=null && session.droits.PLANIFIER_MISSION!=null}">
    <li><a href="#tab_br4" data-toggle="tab">Planifications</a></li>
    </g:if>
  </ul>
  <div class="tab-content">
    <div class="tab-pane active" id="tab_br1">
      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Description de la mission</span></h3>

      <div class="row">
        <div class="col-sm-3"><label for="reference" class="control-label"><g:message code="mission.reference.label" default="Référence" /></label></div>
        <div class="col-sm-3"><g:textField class="form-control" name="reference" value="${missionInstance?.reference}"/></div>
        <div class="col-sm-3"><label for="dateDemarrage" class="control-label"><g:message code="mission.dateDemarrage.label" default="Date de démarrage" /></label></div>
        <div class="col-sm-3"><g:textField type="text" class="form-control" name="dateDemarrage" id="dateDemarrage" precision="day"  value="${formatDate(format:'dd/MM/yyyy',date:missionInstance?.dateDemarrage)}" default="none" noSelection="['': '']" /></div>
      </div>

      <div class="row">
        <div class="col-sm-3"><label for="poste" class="control-label"><g:message code="mission.poste.label" default="Poste" /></label></div>
        <div class="col-sm-3"><g:textField class="form-control" name="poste" id="poste" value="${missionInstance?.poste}"/></div>
        <div class="col-sm-3"><label for="localisation" class="control-label"><g:message code="mission.localisation.label" default="Localisation" /></label></div>
        <div class="col-sm-3"><g:textField class="form-control" name="localisation" value="${missionInstance?.localisation}"/></div>
      </div>

      <div class="row">
        <div class="col-sm-3"><label for="contact" class="control-label"><g:message code="mission.contact.label" default="Contact" /><span class="required-indicator">* :</span></label></div>
        <div class="col-sm-3"><g:select class="form-control" id="contact" name="contact.id" from="${com.rabbahsoft.diorhprofiler.Contact.list()}" optionKey="id"  value="${missionInstance?.contact?.id}"/></div>
        <div class="col-sm-3"><label for="contexte" class="control-label"><g:message code="mission.contexte.label" default="Contexte" /></label></div>
        <div class="col-sm-3"><g:select class="form-control" name="contexte" from="${missionInstance.constraints.contexte.inList}" value="${missionInstance?.contexte}" valueMessagePrefix="mission.contexte"/></div>
      </div>                         

      <div class="row">
        <div class="col-sm-3"><label for="approche" class="control-label"><g:message code="mission.approche.label" default="Approche" /></label></div>
        <div class="col-sm-3"><g:select class="form-control" name="approche" id="approche" from="${missionInstance.constraints.approche.inList}" value="${missionInstance?.approche}" valueMessagePrefix="mission.approche"/></div>
        <div class="col-sm-3"><label for="interlocuteur" class="control-label"><g:message code="mission.interlocuteur.label" default="Interlocuteur" /></label></div>
        <div class="col-sm-3"><g:select class="form-control" id="interlocuteur" name="interlocuteur.id" from="${missionInstance?.contact?.interlocuteurcontacts}" optionKey="id" value="${missionInstance?.interlocuteur?.id}" class="form-control" noSelection="['': 'Sélectionner...']"/></div>
      </div>

      
      <div class="row">
        <div class="col-sm-3"><label for="rattachementHierarchique" class="control-label"><g:message code="mission.rattachementHierarchique.label" default="Rattachement Hierarchique" /></label></div>
        <div class="col-sm-3"><g:textField class="form-control" name="rattachementHierarchique" value="${missionInstance?.rattachementHierarchique}"/></div>
        <div class="col-sm-3"><label for="rattachementFonctionnel" class="control-label"><g:message code="mission.rattachementFonctionnel.label" default="Rattachement Fonctionnel" /></label></div>
        <div class="col-sm-3"><g:textField class="form-control" name="rattachementFonctionnel" value="${missionInstance?.rattachementFonctionnel}"/></div>
      </div>

      <div class="row">
        <div class="col-sm-3"><label for="description" class="control-label"><g:message code="mission.description.label" default="Description" /></label></div>
        <div class="col-sm-3"><g:textArea class="form-control" id="description" name="description" cols="40" rows="5" maxlength="65535" value="${missionInstance?.description}"/></div>
        <div class="col-sm-3"><label for="statut" class="control-label"><g:message code="mission.statut.label" default="Statut" /><span class="required-indicator">* :</span></label></div>
        <div class="col-sm-3"><g:select class="form-control" id="statut" name="statut.id" from="${com.rabbahsoft.diorhprofiler.StatutMission.list()}" optionKey="id"  value="${missionInstance?.statut?.id}"/></div>
      </div>

      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Equipe mission</span></h3>

      <div class="row">
        <div class="col-sm-3"><label for="assistant" class="control-label"><g:message code="mission.assistant.label" default="Chef de projet" /><span class="required-indicator">* :</span></label></div>
        <div class="col-sm-3"><g:select class="form-control" id="assistant" name="assistant.id" from="${com.rabbahsoft.diorhprofiler.Utilisateur.createCriteria().list() { eq("fonctionDior",FonctionDior.findByLibelle("Assistant(e)"))} }" optionKey="id"  value="${missionInstance?.assistant?.id}" noSelection="['': 'Sélectionner...']"/></div>
        <div class="col-sm-3"><label for="chargeRecherche" class="control-label"><g:message code="mission.chargeRecherche.label" default="Charger de Recherche" /><span class="required-indicator">* :</span></label></div>
        <div class="col-sm-3"><g:select class="form-control" id="chargeRecherche" name="chargeRecherche.id" from="${com.rabbahsoft.diorhprofiler.Utilisateur.createCriteria().list() { eq("fonctionDior",FonctionDior.findByLibelle("Chargé(e) de recherche"))} }" optionKey="id"  value="${missionInstance?.chargeRecherche?.id}" noSelection="['': 'Sélectionner...']"/></div>
      </div>

      <div class="row">
        <div class="col-sm-3"><label for="consultant" class="control-label"><g:message code="mission.consultant.label" default="Consultant" /><span class="required-indicator">* :</span></label></div>
        <div class="col-sm-3"><g:select class="form-control" id="consultant" name="consultant.id" from="${com.rabbahsoft.diorhprofiler.Utilisateur.createCriteria().list() { eq("fonctionDior",FonctionDior.findByLibelle("Consultant(e)"))} }" optionKey="id"  value="${missionInstance?.consultant?.id}" noSelection="['': 'Sélectionner...']"/></div>
      </div>

      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Annonce</span></h3>

      <div class="row">
        <div class="col-sm-3"><label for="datePublication" class="control-label"><g:message code="mission.datePublication.label" default="Date Publication" /></label></div>
        <div class="col-sm-3"><g:textField class="form-control" type="text" name="datePublication" id="datePublication" precision="day"  value="${formatDate(format:'dd/MM/yyyy',date:missionInstance?.datePublication)}" default="none" noSelection="['': '']" /></div>
        <div class="col-sm-3"><label for="entreprise" class="control-label"><g:message code="mission.entreprise.label" default="Entreprise" /></label></div>
        <div class="col-sm-3"><g:textField class="form-control" name="entreprise" value="${missionInstance?.entreprise}"/></div>
      </div>

      <div class="row">
        <div class="col-sm-3"><label for="descriptifSociete" class="control-label"><g:message code="mission.descriptifSociete.label" default="Descriptif de la société" /></label></div>
        <div class="col-sm-9"><g:textArea class="form-control" name="descriptifSociete" cols="100" rows="8" maxlength="65535" value="${missionInstance?.descriptifSociete}" style="width:600px;"/></div>
        
      </div>
 <div class="row">
        <div class="col-sm-3"><label for="descriptifPoste" class="control-label"><g:message code="mission.descriptifPoste.label" default="Descriptif du poste" /></label></div>
        <div class="col-sm-9"><g:textArea class="form-control" name="descriptifPoste" cols="100" rows="8" maxlength="65535" value="${missionInstance?.descriptifPoste}" style="width:600px;"/></div>
      </div>
      <div class="row">
        <div class="col-sm-3"><label for="profilCandidat" class="control-label"><g:message code="mission.profilCandidat.label" default="Profil du candidat" /></label></div>
        <div class="col-sm-9"><g:textArea class="form-control" name="profilCandidat" cols="40" rows="5" maxlength="65535" value="${missionInstance?.profilCandidat}" style="width:600px;"/></div>
      </div>
      <div class="row">
        <div class="col-sm-3"><label for="publierAnnonce" class="control-label"><g:message code="mission.publierAnnonce.label" default="Publier annonce" /></label></div>
        <div class="col-sm-9"><g:checkBox name="publierAnnonce" value="${missionInstance?.publierAnnonce}" /></div>
      </div>
      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Garantie</span></h3>

      <div class="row">
        <div class="col-sm-3"><label for="dureeGarantie" class="control-label"><g:message code="mission.dureeGarantie.label" default="Durée de garantie" /></label></div>
<!--        <div class="col-sm-3"><g:select class="form-control" name="dureeGarantie" from="${3..6}" value="${missionInstance.dureeGarantie}" noSelection="['': 'Sélectionner...']"/>mois</div>-->
        <div class="col-sm-3"><g:select class="form-control" name="dureeGarantie" from="${missionInstance.constraints.dureeGarantie.inList}" value="${missionInstance.dureeGarantie}" noSelection="['': 'Sélectionner...']"/></div>
        
        <div class="col-sm-3"><label for="dateFinGarantie" class="control-label"><g:message code="mission.dateFinGarantie.label" default="Date fin de garantie" /></label></div>
        <div class="col-sm-3"><g:textField type="text" class="form-control" name="dateFinGarantie" id="dateFinGarantie" precision="day"  value="${formatDate(format:'dd/MM/yyyy',date:missionInstance?.dateFinGarantie)}" default="none" noSelection="['': '']" /></div>
      </div>

    </div>

    <div class="tab-pane" id="tab_br2">
      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Exigences profil</span></h3>

      <div class="row">
        <div class="col-sm-3"><label for="formation" class="control-label"><g:message code="mission.formation.label" default="Formation" /><span class="required-indicator">* :</span></label></div>
        <div class="col-sm-3"><g:select class="form-control" id="formation" name="formation.id" from="${com.rabbahsoft.diorhprofiler.Formation.list()}" optionKey="id"  value="${missionInstance?.formation?.id}"/></div>
<!--        <div class="col-sm-3"><label for="typeFormation" class="control-label"><g:message code="mission.typeFormation.label" default="Type de formation" /></label></div>
        <div class="col-sm-3"><g:textField class="form-control" name="typeFormation" value="${missionInstance?.typeFormation}"/></div>-->
      </div>

      <div class="row">
        <div class="col-sm-3"><label for="plageExperience" class="control-label"><g:message code="mission.plageExperience.label" default="Expérience globale" /></label></div>
        <div class="col-sm-3"><g:select class="form-control" id="plageExperience" name="plageExperience.id" from="${com.rabbahsoft.diorhprofiler.PlageExperience.list()}" optionKey="id" value="${missionInstance?.plageExperience?.id}" class="form-control" noSelection="['': 'Sélectionner...']"/></div>
        <div class="col-sm-3"><label for="nbrAnneeExperience" class="control-label"><g:message code="mission.nbrAnneeExperience.label" default="Nombre d'années d'expérience" /></label></div>
        <div class="col-sm-3"><g:select class="form-control" name="nbrAnneeExperience" from="${0..30}" value="${missionInstance.nbrAnneeExperience}" noSelection="['': 'Sélectionner...']"/></div>
      </div>

      <div class="row">
        <div class="col-sm-3"><label for="secteurActivite" class="control-label"><g:message code="mission.secteurActivite.label" default="Secteur d'activité" /></label></div>
        <div class="col-sm-3"><g:select class="form-control" id="secteurActivite" name="secteurActivite.id" from="${com.rabbahsoft.diorhprofiler.SecteurActivite.list()}" optionKey="id" value="${missionInstance?.secteurActivite?.id}" class="form-control" noSelection="['': 'Sélectionner...']"/></div>
        <div class="col-sm-3"><label for="typeFonction" class="control-label"><g:message code="mission.typeFonction.label" default="Type de fonction" /><span class="required-indicator">* :</span></label></div>
        <div class="col-sm-3"><g:select class="form-control" id="typeFonction" name="typeFonction.id" from="${com.rabbahsoft.diorhprofiler.Poste.list()}" optionKey="id"  value="${missionInstance?.typeFonction?.id}"/></div>
      </div>

      <div class="row">
<!--        <div class="col-sm-3"><label for="comportement" class="control-label"><g:message code="mission.comportement.label" default="Comportement" /></label></div>
        <div class="col-sm-3"><g:textArea class="form-control" name="comportement" cols="40" rows="5" maxlength="65535" value="${missionInstance?.comportement}"/></div>-->
        <div class="col-sm-3"><label for="niveauEtude" class="control-label"><g:message code="mission.niveauEtude.label" default="Niveau d'études" /><span class="required-indicator">* :</span></label></div>
        <div class="col-sm-3"><g:select class="form-control" id="niveauEtude" name="niveauEtude.id" from="${com.rabbahsoft.diorhprofiler.NiveauEtude.list()}" optionKey="id"  value="${missionInstance?.niveauEtude?.id}"/></div>
      </div>

      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Environnement du poste</span></h3>

      <div class="row">
        <div class="col-sm-3"><label for="effectifEquipe" class="control-label"><g:message code="mission.effectifEquipe.label" default="Effectif Equipe" /></label></div>
        <div class="col-sm-3"><g:select class="form-control" name="effectifEquipe" from="${0..60}" value="${missionInstance.effectifEquipe}" noSelection="['': 'Sélectionner...']"/></div>
        <div class="col-sm-3"><label for="budget" class="control-label"><g:message code="mission.budget.label" default="Budget" /></label></div>
        <div class="col-sm-3"><g:textField class="form-control" name="budget" value="${missionInstance?.budget}"/></div>
      </div>

      <div class="row">
<!--        <div class="col-sm-3"><label for="profilEquipe" class="control-label"><g:message code="mission.profilEquipe.label" default="Profil de l'équipe" /></label></div>
        <div class="col-sm-3"><g:textArea class="form-control" name="profilEquipe" cols="40" rows="5" maxlength="65535" value="${missionInstance?.profilEquipe}"/></div>-->
        <div class="col-sm-3"><label for="remunerationAvantages" class="control-label"><g:message code="mission.remunerationAvantages.label" default="Rémuneration & Avantages" /></label></div>
        <div class="col-sm-3"><g:textArea class="form-control" name="remunerationAvantages" cols="40" rows="5" maxlength="65535" value="${missionInstance?.remunerationAvantages}"/></div>
      </div>

      <div class="row">
        <div class="col-sm-3"><label for="deplacement" class="control-label"><g:message code="mission.deplacement.label" default="Déplacement" /></label></div>
        <div class="col-sm-3"><g:select class="form-control" name="deplacement" from="${missionInstance.constraints.deplacement.inList}" value="${missionInstance?.deplacement}" valueMessagePrefix="mission.deplacement"/></div>
<!--        <div class="col-sm-3"><label for="deplacementLocalisation" class="control-label"><g:message code="mission.deplacementLocalisation.label" default="Deplacement Localisation" /></label></div>
        <div class="col-sm-3"><g:textField class="form-control" name="deplacementLocalisation" maxlength="60" value="${missionInstance?.deplacementLocalisation}"/></div>-->
      </div>

      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Compétences informatiques & linguistiques</span></h3>

      <div class="row">
        <div class="col-sm-3"><label for="connaissancesInfos" class="control-label"><g:message code="mission.connaissancesInfos.label" default="Connaissances Informatiques" /></label></div>
        <div class="col-sm-3"><g:select class="form-control" name="connaissancesInfos" from="${com.rabbahsoft.diorhprofiler.ConnaissanceInformatique.list()}" multiple="multiple" optionKey="id" size="5" value="${missionInstance?.connaissancesInfos*.id}"/></div>
        <div class="col-sm-3"><label for="connaissanceLinguistiques" class="control-label"><g:message code="mission.connaissanceLinguistiques.label" default="Compétences linguistiques" /></label></div>
        <div class="col-sm-3"><g:select class="form-control" name="connaissanceLinguistiques" from="${com.rabbahsoft.diorhprofiler.ConnaissanceLinguistique.list()}" multiple="multiple" optionKey="id" size="5" value="${missionInstance?.connaissanceLinguistiques*.id}"/></div>
      </div>

      <!--                        <div class="row">
                              
                              <div class="${hasErrors(bean: missionInstance, field: 'code', 'error')} ">
                              <div class="col-sm-3"><label for="code" class="control-label"><g:message code="mission.code.label" default="Code" /></label></div>
                              <div>
                              <div class="col-sm-3"><g:textField class="form-control" name="code" value="${missionInstance?.code}"/></div>
                              <span class="help-inline">${hasErrors(bean: missionInstance, field: 'code', 'error')}</span>			
                              </div>
                              </div>
                              
                              </div>-->
    </div>

    <div class="tab-pane" id="tab_br3">
      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Avancement mission</span></h3>

      <div class="row">
        <div class="col-sm-3"><label for="delaisRealisation" class="control-label"><g:message code="mission.delaisRealisation.label" default="Délais de réalisation" /></label></div>
        <div class="col-sm-3"><g:textField class="form-control" name="delaisRealisation" type="text" value="${missionInstance.delaisRealisation}"/></div>
        <div class="col-sm-3"><label for="etapeAvancement" class="control-label"><g:message code="mission.etapeAvancement.label" default="Etape d'avancement" /><span class="required-indicator">* :</span></label></div>
        <div class="col-sm-3"><g:select class="form-control" id="etapeAvancement" name="etapeAvancement.id" from="${com.rabbahsoft.diorhprofiler.EtapeAvancement.list()}" optionKey="id"  value="${missionInstance?.etapeAvancement?.id}"/></div>
      </div>  

      <div class="row">
        <div class="col-sm-3"><label for="replanifier" class="control-label"><g:message code="mission.replanifier.label" default="Replanifier" /></label></div>
        <div class="col-sm-3"><g:checkBox name="replanifier" value="${missionInstance?.replanifier}" /></div>
        <div class="col-sm-3"><label for="dateFinAnnonce" class="control-label"><g:message code="mission.dateFinAnnonce.label" default="Date fin de l'annonce" /><span class="required-indicator">* :</span></label></div>
        <div class="col-sm-3"><g:textField class="form-control" type="text" name="dateFinAnnonce" id="dateFinAnnonce" precision="day"  value="${formatDate(format:'dd/MM/yyyy',date:missionInstance?.dateFinAnnonce)}"  /></div>
      </div>

    </div>
    <g:if test="${session.droits!=null && session.droits.PLANIFIER_MISSION!=null}">
    <div class="tab-pane" id="tab_br4">
      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Planification mission</span></h3>
      <div class="row">
        <g:render template="planifications" model="['missionInstance':missionInstance]" />
      </div>
    </div>
    </g:if>
  </div>
</div>
<g:hiddenField id="addplanification" name="addplanification" value="${missionInstance?.planifications == null? 0: missionInstance?.planifications.size()}"/>

