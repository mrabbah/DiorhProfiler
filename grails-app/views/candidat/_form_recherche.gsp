<%@ page import="com.rabbahsoft.diorhprofiler.RechercheCandidat" %>
<g:hiddenField class="form-control" name="id" value="${rechercheCandidatInstance?.id}"/>
<g:hiddenField class="form-control" name="libellerecherche" value="${rechercheCandidatInstance?.libellerecherche}"/>
<div class="tabbable tabbable-bordered">
  <ul class="nav nav-tabs">
    <li class="active"><a href="#tab_br1" data-toggle="tab">Informations personnelles.</a></li>
    <li><a href="#tab_br2" data-toggle="tab">formations et compétences </a></li>
    <li><a href="#tab_br3" data-toggle="tab">expériences professionnelles</a></li>
    <li><a href="#tab_br4" data-toggle="tab">suivi du candidat</a></li>
    <li><a href="#tab_br5" data-toggle="tab">mots clés</a></li>
  </ul>
  <div class="tab-content">
    <div class="tab-pane active" id="tab_br1">
      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Identité</span></h3>
      <div class="row">
        <div class="col-sm-3"><label for="prenomStockage" class="control-label"><g:message code="rechercheCandidat.prenomStockage.label" default="Prenom Stockage" />:</label></div>
        <div class="col-sm-3"><g:textField class="form-control" name="prenomStockage" value="${rechercheCandidatInstance?.prenomStockage}"/></div>
        <div class="col-sm-3"><label for="nomStockage" class="control-label"><g:message code="candidat.nomStockage.label" default="Nom Stockage" />:</label></div>
        <div class="col-sm-3"><g:textField class="form-control" name="nomStockage" maxlength="50" value="${rechercheCandidatInstance?.nomStockage}"/></div>
      </div>

      <div class="row">
        <div class="col-sm-3"><label for="civilite" class="control-label"><g:message code="rechercheCandidat.civilite.label" default="Civilite" />:</label></div>
        <div class="col-sm-3"><g:select class="form-control" id="civilite" name="civilite.id" from="${com.rabbahsoft.diorhprofiler.Civilite.list()}" optionKey="id" value="${rechercheCandidatInstance?.civilite?.id}" class="form-control" noSelection="['null': '']"/></div>
        <div class="col-sm-3"><label for="ageMin" class="control-label"><g:message code="rechercheCandidat.ageMin.label" default="Age Min" />:</label></div>
        <div class="col-sm-3"><g:field class="form-controlnumber" name="ageMin" id="ageMin" type="number" value="${rechercheCandidatInstance.ageMin}"/><g:field class="form-controlnumber pull-right" name="ageMax" id="ageMax" type="number" value="${rechercheCandidatInstance.ageMax}"/></div>
      </div>

      <div class="row">
        <div class="col-sm-3"><label for="villes" class="control-label"><g:message code="rechercheCandidat.villes.label" default="Villes" />:</label></div>
        <div class="col-sm-3"><g:select class="form-control" name="villes" from="${com.rabbahsoft.diorhprofiler.Ville.list()}" multiple="multiple" optionKey="id" size="5" value="${rechercheCandidatInstance?.villes*.id}"/></div>
      </div>
    </div>

    <div class="tab-pane" id="tab_br2">
      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Formations</span></h3>

      <div class="row">
        <div class="col-sm-3"><label for="niveauetudes" class="control-label"><g:message code="rechercheCandidat.niveauetudes.label" default="Niveau Etude" />:</label></div>
        <div class="col-sm-3"><g:select multiple="multiple" class="form-control" id="niveauEtude" name="niveauetudes" from="${com.rabbahsoft.diorhprofiler.NiveauEtude.list()}" optionKey="id" size="5" value="${rechercheCandidatInstance?.niveauetudes?.id}"/></div>
        <div class="col-sm-3"><label for="diplomes" class="control-label"><g:message code="rechercheCandidat.diplomes.label" default="Diplomes" />:</label></div>
        <div class="col-sm-3"><g:select class="form-control" name="diplomes" from="${com.rabbahsoft.diorhprofiler.Diplome.list()}" multiple="multiple" optionKey="id" size="5" value="${rechercheCandidatInstance?.diplomes?.id}"/></div>
      </div>
    </div>

    <div class="tab-pane" id="tab_br3">
      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Expériences</span></h3>

      <div class="row">
        <div class="col-sm-3"><label for="postes" class="control-label"><g:message code="rechercheCandidat.postes.label" default="Postes" />:</label></div>
        <div class="col-sm-3"><g:select class="form-control" name="postes" from="${com.rabbahsoft.diorhprofiler.Poste.list()}" multiple="multiple" optionKey="id" size="5" value="${rechercheCandidatInstance?.postes*.id}"/></div>
        <div class="col-sm-3"><label for="plageexperiences" class="control-label"><g:message code="rechercheCandidat.plageexperiences.label" default="Plageexperiences" />:</label></div>
        <div class="col-sm-3"><g:select class="form-control" name="plageexperiences" from="${com.rabbahsoft.diorhprofiler.PlageExperience.list()}" multiple="multiple" optionKey="id" size="5" value="${rechercheCandidatInstance?.plageexperiences*.id}"/></div>
      </div>

      <div class="row">
        <div class="col-sm-3"><label for="secteuractivites" class="control-label"><g:message code="rechercheCandidat.secteuractivites.label" default="Secteuractivites" />:</label></div>
        <div class="col-sm-3"><g:select class="form-control" name="secteuractivites" from="${com.rabbahsoft.diorhprofiler.SecteurActivite.list()}" multiple="multiple" optionKey="id" size="5" value="${rechercheCandidatInstance?.secteuractivites*.id}"/></div>
        <div class="col-sm-3"><label for="typeentreprises" class="control-label"><g:message code="rechercheCandidat.typeentreprises.label" default="Typeentreprises" />:</label></div>
        <div class="col-sm-3"><g:select class="form-control" name="typeentreprises" from="${com.rabbahsoft.diorhprofiler.TypeEntreprise.list()}" multiple="multiple" optionKey="id" size="5" value="${rechercheCandidatInstance?.typeentreprises*.id}"/></div>
      </div>
    </div>
    <div class="tab-pane" id="tab_br4">
      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Annotation</span></h3>
      <div class="row">         
        <div class="col-sm-3"><label for="annote" class="control-label"><g:message code="rechercheCandidat.annote.label" default="Annote" />:</label></div>
        <div class="col-sm-3"><g:checkBox name="annote" value="${rechercheCandidatInstance?.annote}" /></div>
        <div class="col-sm-3"><label for="sourceInscription" class="control-label"><g:message code="rechercheCandidat.sourceInscription.label" default="Source Inscription" />:</label></div>
        <div class="col-sm-3"><g:select class="form-control" id="sourceInscription" name="sourceInscription.id" from="${com.rabbahsoft.diorhprofiler.SourceInscription.list()}" optionKey="id" value="${rechercheCandidatInstance?.sourceInscription?.id}" class="form-control" noSelection="['null': '']"/></div>
      </div>

      <div class="row">
        <div class="col-sm-3"><label for="profil1" class="control-label"><g:message code="rechercheCandidat.profil1.label" default="Profil1" />:</label></div>
        <div class="col-sm-3"><g:select class="form-control" id="profil1" name="profil1.id" from="${com.rabbahsoft.diorhprofiler.AnnotationProfil.list()}" optionKey="id" value="${rechercheCandidatInstance?.profil1?.id}" class="form-control" noSelection="['null': '']"/></div>
        <div class="col-sm-3"><label for="annotation1" class="control-label"><g:message code="rechercheCandidat.annotation1.label" default="Annotation1" />:</label></div>
        <div class="col-sm-3"><g:select class="form-control" id="annotation1" name="annotation1.id" from="${com.rabbahsoft.diorhprofiler.AnnotationNote.list()}" optionKey="id" value="${rechercheCandidatInstance?.annotation1?.id}" class="form-control" noSelection="['null': '']"/></div>
      </div>

      <div class="row">
        <div class="col-sm-3"><label for="profil2" class="control-label"><g:message code="rechercheCandidat.profil2.label" default="Profil2" />:</label></div>
        <div class="col-sm-3"><g:select class="form-control" id="profil2" name="profil2.id" from="${com.rabbahsoft.diorhprofiler.AnnotationProfil.list()}" optionKey="id" value="${rechercheCandidatInstance?.profil2?.id}" class="form-control" noSelection="['null': '']"/></div>
        <div class="col-sm-3"><label for="annotation2" class="control-label"><g:message code="rechercheCandidat.annotation2.label" default="Annotation2" />:</label></div>
        <div class="col-sm-3"><g:select class="form-control" id="annotation2" name="annotation2.id" from="${com.rabbahsoft.diorhprofiler.AnnotationNote.list()}" optionKey="id" value="${rechercheCandidatInstance?.annotation2?.id}" class="form-control" noSelection="['null': '']"/></div>
      </div>
    </div>
    <div class="tab-pane" id="tab_br5">
      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Mots clés</span></h3>

      <div class="row">         
        <div class="col-sm-3"><label for="motCle" class="control-label"><g:message code="rechercheCandidat.motCle.label" default="Mot Cle" />:</label></div>
        <div class="col-sm-3"><g:textField class="form-control" name="motCle" value="${rechercheCandidatInstance?.motCle}"/></div>
      </div>
    </div>
  </div>
</div>