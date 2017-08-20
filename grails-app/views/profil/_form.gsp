<%@ page import="com.rabbahsoft.diorhprofiler.Profil" %>

    <div class="panel panel-danger">
        <div class="panel-body">
          <div class="col-sm-3"><label for="libelle" class="control-label"><g:message code="profil.libelle.label" default="Libellé" /><span class="required-indicator">* :</span></label></div>
          <div class="col-sm-9"><g:textField class="form-control" name="libelle" id="libelle" value="${profilInstance?.libelle}"/></div>		
        </div>
    </div>
    
<div class="tabbable tabbable-bordered">
  <ul class="nav nav-tabs">
    <li class="active"><a href="#tab_br1" data-toggle="tab">Module Candidat</a></li>
    <li><a href="#tab_br2" data-toggle="tab">Module Contact</a></li>
    <li><a href="#tab_br3" data-toggle="tab">Module Mission</a></li>
    <li><a href="#tab_br4" data-toggle="tab">Module Candidature</a></li>
    <li><a href="#tab_br5" data-toggle="tab">Module Administration</a></li>
  </ul>
  <div class="tab-content">
    <div class="tab-pane active" id="tab_br1">
      
      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Candidat</span></h3>
       
        <div class="row">
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('AJOUTER_CANDIDAT')}" <g:if test="${droits!=null && droits['AJOUTER_CANDIDAT']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Créer candidat" /></span></div>
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('MODIFIER_CANDIDAT')}" <g:if test="${droits!=null && droits['MODIFIER_CANDIDAT']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Modifier candidat" /></span></div>
        </div>
        
        <div class="row">
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('SUPPRIMER_CANDIDAT')}" <g:if test="${droits!=null && droits['SUPPRIMER_CANDIDAT']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Supprimer candidat" /></span></div>
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('CONSULTER_CANDIDAT')}" <g:if test="${droits!=null && droits['CONSULTER_CANDIDAT']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Consulter candidat" /></span></div>
        </div>
               
        <div class="row">
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('RECHERCHER_CANDIDAT')}" <g:if test="${droits!=null && droits['RECHERCHER_CANDIDAT']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Recherche des candidats" /></span></div>
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('GERER_CANDIDAT')}" <g:if test="${droits!=null && droits['GERER_CANDIDAT']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Gérer et suivre candidat" /></span></div>
        </div>
       
        <div class="row">
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('IMPRIMERFICHE_CANDIDAT')}" <g:if test="${droits!=null && droits['IMPRIMERFICHE_CANDIDAT']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Impression fiche candidat" /></span></div>
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('AFFECTER_MISSION_CANDIDAT')}" <g:if test="${droits!=null && droits['AFFECTER_MISSION_CANDIDAT']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Proposer candidat à une mission" /></span></div>
        </div>
        
        <div class="row">
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('LISTE_CANDIDAT')}" <g:if test="${droits!=null && droits['LISTE_CANDIDAT']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Liste des candidats" /></span></div>
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('ENVOYERMAIL_CANDIDAT')}" <g:if test="${droits!=null && droits['ENVOYERMAIL_CANDIDAT']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Envoyer mail" /></span></div>
        </div>
    
        
    </div>
    <div class="tab-pane" id="tab_br2">
      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Contact</span></h3>     
     
        <div class="row">
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('AJOUTER_CONTACT')}" <g:if test="${droits!=null && droits['AJOUTER_CONTACT']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Créer contact" /></span></div>
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('MODIFIER_CONTACT')}" <g:if test="${droits!=null && droits['MODIFIER_CONTACT']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Modifier contact" /></span></div>
        </div>
         
        <div class="row">
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('CONSULTER_CONTACT')}" <g:if test="${droits!=null && droits['CONSULTER_CONTACT']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Consulter contact" /></span></div>
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('SUPPRIMER_CONTACT')}" <g:if test="${droits!=null && droits['SUPPRIMER_CONTACT']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Supprimer contact" /></span></div>
        </div>
        
        <div class="row">
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('LISTE_CONTACT')}" <g:if test="${droits!=null && droits['LISTE_CONTACT']!=null}">checked</g:if> /><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="La liste des contacts" /></span></div>
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('RECHERCHER_CONTACT')}" <g:if test="${droits!=null && droits['RECHERCHER_CONTACT']!=null}">checked</g:if> /><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Recherche des contacts" /></span></div>
        </div>
     
        <div class="row">
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('ENVOYERMAIL_CONTACT')}" <g:if test="${droits!=null && droits['ENVOYERMAIL_CONTACT']!=null}">checked</g:if> /><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Envoyer mail" /></span></div>
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('LISTE_ACTIONCONTACT')}" <g:if test="${droits!=null && droits['LISTE_ACTIONCONTACT']!=null}">checked</g:if> /><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Historique contact" /></span></div>
        </div>
    </div>
    <div class="tab-pane" id="tab_br3">
      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Mission</span></h3>
       
        <div class="row">
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('AJOUTER_MISSION')}" <g:if test="${droits!=null && droits['AJOUTER_MISSION']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Créer mission" /></span></div>
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('MODIFIER_MISSION')}" <g:if test="${droits!=null && droits['MODIFIER_MISSION']!=null}">checked</g:if> /><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Modifier mission" /></span></div>
        </div>
        
        <div class="row">
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('CONSULTER_MISSION')}" <g:if test="${droits!=null && droits['CONSULTER_MISSION']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Consulter mission" /></span></div>
         <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('CLOTURER_MISSION')}" <g:if test="${droits!=null && droits['CLOTURER_MISSION']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Clôturer mission" /></span></div>
        </div>
        
        <div class="row">
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('RECHERCHER_MISSION')}" <g:if test="${droits!=null && droits['RECHERCHER_MISSION']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Recherche mission" /></span></div>
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('PLANIFIER_MISSION')}" <g:if test="${droits!=null && droits['PLANIFIER_MISSION']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Planifier mission" /></span></div>
        </div>

        <div class="row">
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('ARCHIVER_MISSION')}" <g:if test="${droits!=null && droits['ARCHIVER_MISSION']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Archiver mission" /></span></div>
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('LISTE_MISSION')}" <g:if test="${droits!=null && droits['LISTE_MISSION']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Liste des missions" /></span></div>
        </div>
      
        <div class="row">
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('SUPPRIMER_MISSION')}" <g:if test="${droits!=null && droits['SUPPRIMER_MISSION']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Supprimer mission" /></span></div>
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('REPRENDRE_MISSION')}" <g:if test="${droits!=null && droits['SUPPRIMER_MISSION']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Reprendre mission" /></span></div>
        </div>
      
        <div class="row">
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('SUPPRIMER_MISSION')}" <g:if test="${droits!=null && droits['SUSPENDRE_MISSION']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Suspendre mission" /></span></div>
        </div>  
      
    </div>
    <div class="tab-pane" id="tab_br4">
      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Candidature</span></h3>
        
        <div class="row">
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('AJOUTER_CANDIDATURE')}" <g:if test="${droits!=null && droits['AJOUTER_CANDIDATURE']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Ajouter candidature" /></span></div>
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('MODIFIER_CANDIDATURE')}" <g:if test="${droits!=null && droits['MODIFIER_CANDIDATURE']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Modifier candidature" /></span></div>
        </div>
        
        <div class="row">
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('CONSULTER_CANDIDATURE')}" <g:if test="${droits!=null && droits['CONSULTER_CANDIDATURE']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Consulter candidature" /></span></div>
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('SUPPRIMER_CANDIDATURE')}" <g:if test="${droits!=null && droits['SUPPRIMER_CANDIDATURE']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Supprimer candidature" /></span></div>
        </div>
        
        <div class="row">
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('RECHERCHER_CANDIDATURE')}" <g:if test="${droits!=null && droits['RECHERCHER_CANDIDATURE']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Recherche des candidatures" /></span></div>
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('GERER_CANDIDATURE')}" <g:if test="${droits!=null && droits['GERER_CANDIDATURE']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Gérer candidature" /></span></div>
        </div>
      
        <div class="row">
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('LISTE_CANDIDATURE')}" <g:if test="${droits!=null && droits['LISTE_CANDIDATURE']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Liste des candidatures" /></span></div>
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('LISTE_RENDEZVOUS')}" <g:if test="${droits!=null && droits['LISTE_RENDEZVOUS']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Créer rendez-vous" /></span></div>
        </div>
        
    </div>
    <div class="tab-pane" id="tab_br5">
      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Administration</span></h3>
       
        <div class="row">
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('AJOUTER_UTILISATEUR')}" <g:if test="${droits!=null && droits['AJOUTER_UTILISATEUR']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Créer utilisateur" /></span></div>
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('MODIFIER_UTILISATEUR')}" <g:if test="${droits!=null && droits['MODIFIER_UTILISATEUR']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Modifier utilisateur" /></span></div>
        </div>
        
        <div class="row">
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('LISTE_UTILISATEUR')}" <g:if test="${droits!=null && droits['LISTE_UTILISATEUR']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Consulter la liste des utilisateurs" /></span></div>
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('SUPPRIMER_UTILISATEUR')}" <g:if test="${droits!=null && droits['SUPPRIMER_UTILISATEUR']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Supprimer utilisateur" /></span></div>
        </div>
        <div class="row">
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('CONSULTER_UTILISATEUR')}" <g:if test="${droits!=null && droits['CONSULTER_UTILISATEUR']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Consulter utilisateur" /></span></div>
        </div>
        
        <div class="row">
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('AJOUTER_PROFIL')}" <g:if test="${droits!=null && droits['AJOUTER_PROFIL']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Créer profil" /></span></div>
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('LISTE_PROFIL')}" <g:if test="${droits!=null && droits['LISTE_PROFIL']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Consulter la liste des profils" /></span></div>
        </div>
        
        <div class="row">
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('SUPPRIMER_PROFIL')}" <g:if test="${droits!=null && droits['SUPPRIMER_PROFIL']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Supprimer profil" /></span></div>
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('MODIFIER_PROFIL')}" <g:if test="${droits!=null && droits['MODIFIER_PROFIL']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Modifier profil" /></span></div>
        </div>
        <div class="row">
        <div class="col-sm-6"><input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.diorhprofiler.Droit.findByCode('PARAMETRAGE')}" <g:if test="${droits!=null && droits['PARAMETRAGE']!=null}">checked</g:if>/><span class="libelledroit"><g:message code="utilisateur.enabled.label" default="Paramétrage" /></span></div>
        </div>
        
    </div>
    </div>
    </div>
                                                  

