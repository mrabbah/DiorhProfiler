<%@ page import="com.rabbahsoft.diorhprofiler.RechercheCandidat" %>
<div class="tabbable tabbable-bordered">
  <ul class="nav nav-tabs">
    <li class="active"><a href="#tab_br1" data-toggle="tab">Informations personnelles.</a></li>
    <li><a href="#tab_br2" data-toggle="tab">Formations et Compétences </a></li>
    <li><a href="#tab_br3" data-toggle="tab">Expériences Professionnelles</a></li>
    <li><a href="#tab_br4" data-toggle="tab">Suivi du candidat</a></li>
    <li><a href="#tab_br5" data-toggle="tab">Mots clés</a></li>
  </ul>
  <div class="tab-content">
    <div class="tab-pane active" id="tab_br1">
      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/>Identité</h3>
      <table class="widthtable">
        <tr>
        <div class="${hasErrors(bean: rechercheCandidatInstance, field: 'prenomStockage', 'error')} ">
          <td width="250"><label for="prenomStockage" class="control-label"><g:message code="rechercheCandidat.prenomStockage.label" default="Prenom Stockage" /></label></td>
          <div>
            <td><g:textField class="form-control" name="prenomStockage" value="${rechercheCandidatInstance?.prenomStockage}"/></td>
            <span class="help-inline">${hasErrors(bean: rechercheCandidatInstance, field: 'prenomStockage', 'error')}</span>			
          </div>
        </div>

        <div class="${hasErrors(bean: candidatInstance, field: 'nomStockage', 'error')} ">
          <td width="250"><label for="nomStockage" class="control-label"><g:message code="candidat.nomStockage.label" default="Nom Stockage" /></label></td>
          <div>
            <td width="200"><g:textField class="form-control" name="nomStockage" maxlength="50" value="${candidatInstance?.nomStockage}"/></td>
            <span class="help-inline">${hasErrors(bean: candidatInstance, field: 'nomStockage', 'error')}</span>			
          </div>
        </div>
        </tr>
      </table>

      <table class="widthtable">
        <tr>
        <div class="${hasErrors(bean: rechercheCandidatInstance, field: 'civilite', 'error')} ">
          <td width="215"><label for="civilite" class="control-label"><g:message code="rechercheCandidat.civilite.label" default="Civilite" /></label></td>
          <div>
            <td><g:select class="form-control" id="civilite" name="civilite.id" from="${com.rabbahsoft.diorhprofiler.Civilite.list()}" optionKey="id" value="${rechercheCandidatInstance?.civilite?.id}" class="form-control" noSelection="['null': '']"/></td>
            <span class="help-inline">${hasErrors(bean: rechercheCandidatInstance, field: 'civilite', 'error')}</span>			
          </div>
        </div>

        <div class="${hasErrors(bean: rechercheCandidatInstance, field: 'ageMin', 'error')} ">
          <td width="210"><label for="ageMin" class="control-label"><g:message code="rechercheCandidat.ageMin.label" default="Age Min" /></label></td>
          <div>
            <td width="135"><g:field class="form-controlnumber" name="ageMin" type="number" value="${rechercheCandidatInstance.ageMin}"/></td><td width="135"><g:field class="form-controlnumber" name="ageMax" type="number" value="${rechercheCandidatInstance.ageMax}"/></td>
            <span class="help-inline">${hasErrors(bean: rechercheCandidatInstance, field: 'ageMin', 'error')}</span>			
          </div>
        </div>
        </tr>
      </table>
      <table class="widthtable">
        <tr>
        <div class="${hasErrors(bean: rechercheCandidatInstance, field: 'villes', 'error')} ">
          <td width="187"><label for="villes" class="control-label"><g:message code="rechercheCandidat.villes.label" default="Villes" /></label></td>
          <div>
            <td><g:select class="form-control" name="villes" from="${com.rabbahsoft.diorhprofiler.Ville.list()}" multiple="multiple" optionKey="id" size="5" value="${rechercheCandidatInstance?.villes*.id}"/></td>
            <span class="help-inline">${hasErrors(bean: rechercheCandidatInstance, field: 'villes', 'error')}</span>			
          </div>
        </div>
        <td></td>
        <td></td>
        </tr>
      </table>
    </div>
    <div class="tab-pane" id="tab_br2">
      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/>Formations</h3>
      <table class="widthtable">
        <tr>
        <div class="${hasErrors(bean: rechercheCandidatInstance, field: 'niveauetudes', 'error')} ">
          <td width="250"><label for="niveauetudes" class="control-label"><g:message code="rechercheCandidat.niveauetudes.label" default="Niveau Etude" /></label></td>
          <div>
            <td width="10"><g:select multiple="multiple" class="form-control" id="niveauEtude" name="niveauetudes" from="${com.rabbahsoft.diorhprofiler.NiveauEtude.list()}" optionKey="id" size="5" value="${rechercheCandidatInstance?.niveauetudes?.id}"/></td>
            <span class="help-inline">${hasErrors(bean: rechercheCandidatInstance, field: 'niveauetudes', 'error')}</span>			
          </div>
        </div>
        <div class="${hasErrors(bean: rechercheCandidatInstance, field: 'diplomes', 'error')} ">
          <td width="250"><label for="diplomes" class="control-label"><g:message code="rechercheCandidat.diplomes.label" default="Diplomes" /></label></td>
          <div>
            <td><g:select class="form-control" name="diplomes" from="${com.rabbahsoft.diorhprofiler.Diplome.list()}" multiple="multiple" optionKey="id" size="5" value="${rechercheCandidatInstance?.diplomes?.id}"/></td>
            <span class="help-inline">${hasErrors(bean: rechercheCandidatInstance, field: 'diplomes', 'error')}</span>			
          </div>
        </div>
        </tr>
      </table>
    </div>
    <div class="tab-pane" id="tab_br3">
      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/>Expériences</h3>
      <table class="widthtable">
        <tr>
        <div class="${hasErrors(bean: rechercheCandidatInstance, field: 'postes', 'error')} ">
          <td width="250"><label for="postes" class="control-label"><g:message code="rechercheCandidat.postes.label" default="Postes" /></label></td>
          <div>
            <td><g:select class="form-control" name="postes" from="${com.rabbahsoft.diorhprofiler.Poste.list()}" multiple="multiple" optionKey="id" size="5" value="${rechercheCandidatInstance?.postes*.id}"/></td>
            <span class="help-inline">${hasErrors(bean: rechercheCandidatInstance, field: 'postes', 'error')}</span>			
          </div>
        </div>
        <div class="${hasErrors(bean: rechercheCandidatInstance, field: 'plageexperiences', 'error')} ">
          <td width="250"><label for="plageexperiences" class="control-label"><g:message code="rechercheCandidat.plageexperiences.label" default="Plageexperiences" /></label></td>
          <div>
            <td><g:select class="form-control" name="plageexperiences" from="${com.rabbahsoft.diorhprofiler.PlageExperience.list()}" multiple="multiple" optionKey="id" size="5" value="${rechercheCandidatInstance?.plageexperiences*.id}"/></td>
            <span class="help-inline">${hasErrors(bean: rechercheCandidatInstance, field: 'plageexperiences', 'error')}</span>			
          </div>
        </div>
        </tr>
      </table>

      <table class="widthtable">
        <tr>
        <div class="${hasErrors(bean: rechercheCandidatInstance, field: 'secteuractivites', 'error')} ">
          <td width="250"><label for="secteuractivites" class="control-label"><g:message code="rechercheCandidat.secteuractivites.label" default="Secteuractivites" /></label></td>
          <div>
            <td><g:select class="form-control" name="secteuractivites" from="${com.rabbahsoft.diorhprofiler.SecteurActivite.list()}" multiple="multiple" optionKey="id" size="5" value="${rechercheCandidatInstance?.secteuractivites*.id}"/></td>
            <span class="help-inline">${hasErrors(bean: rechercheCandidatInstance, field: 'secteuractivites', 'error')}</span>			
          </div>
        </div>
        <div class="${hasErrors(bean: rechercheCandidatInstance, field: 'typeentreprises', 'error')} ">
          <td width="250"><label for="typeentreprises" class="control-label"><g:message code="rechercheCandidat.typeentreprises.label" default="Typeentreprises" /></label></td>
          <div>
            <td><g:select class="form-control" name="typeentreprises" from="${com.rabbahsoft.diorhprofiler.TypeEntreprise.list()}" multiple="multiple" optionKey="id" size="5" value="${rechercheCandidatInstance?.typeentreprises*.id}"/></td>
            <span class="help-inline">${hasErrors(bean: rechercheCandidatInstance, field: 'typeentreprises', 'error')}</span>			
          </div>
        </div>
        </tr>
      </table>
    </div>
    <div class="tab-pane" id="tab_br4">
      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/> Annotation</h3>
      <table class="widthtable">
        <tr>         
        <div class="${hasErrors(bean: rechercheCandidatInstance, field: 'annote', 'error')} ">
          <td width="205"><label for="annote" class="control-label"><g:message code="rechercheCandidat.annote.label" default="Annote" /></label></td>
          <div>
            <td width="200"><g:checkBox name="annote" value="${rechercheCandidatInstance?.annote}" /></td>
            <span class="help-inline">${hasErrors(bean: rechercheCandidatInstance, field: 'annote', 'error')}</span>			
          </div>
        </div>
        <div class="${hasErrors(bean: rechercheCandidatInstance, field: 'sourceInscription', 'error')} ">
          <td width="200"><label for="sourceInscription" class="control-label"><g:message code="rechercheCandidat.sourceInscription.label" default="Source Inscription" /></label></td>
          <div>
            <td><g:select class="form-control" id="sourceInscription" name="sourceInscription.id" from="${com.rabbahsoft.diorhprofiler.SourceInscription.list()}" optionKey="id" value="${rechercheCandidatInstance?.sourceInscription?.id}" class="form-control" noSelection="['null': '']"/></td>
            <span class="help-inline">${hasErrors(bean: rechercheCandidatInstance, field: 'sourceInscription', 'error')}</span>			
          </div>
        </div>
        </tr>
      </table>

      <table class="widthtable">
        <tr>
        <div class="${hasErrors(bean: rechercheCandidatInstance, field: 'profil1', 'error')} ">
          <td width="250"><label for="profil1" class="control-label"><g:message code="rechercheCandidat.profil1.label" default="Profil1" /></label></td>
          <div>
            <td><g:select class="form-control" id="profil1" name="profil1.id" from="${com.rabbahsoft.diorhprofiler.AnnotationProfil.list()}" optionKey="id" value="${rechercheCandidatInstance?.profil1?.id}" class="form-control" noSelection="['null': '']"/></td>
            <span class="help-inline">${hasErrors(bean: rechercheCandidatInstance, field: 'profil1', 'error')}</span>			
          </div>
        </div>

        <div class="${hasErrors(bean: rechercheCandidatInstance, field: 'annotation1', 'error')} ">
          <td width="250"><label for="annotation1" class="control-label"><g:message code="rechercheCandidat.annotation1.label" default="Annotation1" /></label></td>
          <div>
            <td><g:select class="form-control" id="annotation1" name="annotation1.id" from="${com.rabbahsoft.diorhprofiler.AnnotationNote.list()}" optionKey="id" value="${rechercheCandidatInstance?.annotation1?.id}" class="form-control" noSelection="['null': '']"/></td>
            <span class="help-inline">${hasErrors(bean: rechercheCandidatInstance, field: 'annotation1', 'error')}</span>			
          </div>
        </div>
        </tr>
      </table>

      <table class="widthtable">
        <tr>
        <div class="${hasErrors(bean: rechercheCandidatInstance, field: 'profil2', 'error')} ">
          <td width="250"><label for="profil2" class="control-label"><g:message code="rechercheCandidat.profil2.label" default="Profil2" /></label></td>
          <div>
            <td><g:select class="form-control" id="profil2" name="profil2.id" from="${com.rabbahsoft.diorhprofiler.AnnotationProfil.list()}" optionKey="id" value="${rechercheCandidatInstance?.profil2?.id}" class="form-control" noSelection="['null': '']"/></td>
            <span class="help-inline">${hasErrors(bean: rechercheCandidatInstance, field: 'profil2', 'error')}</span>			
          </div>
        </div>
        <div class="${hasErrors(bean: rechercheCandidatInstance, field: 'annotation2', 'error')} ">
          <td width="250"><label for="annotation2" class="control-label"><g:message code="rechercheCandidat.annotation2.label" default="Annotation2" /></label></td>
          <div>
            <td><g:select class="form-control" id="annotation2" name="annotation2.id" from="${com.rabbahsoft.diorhprofiler.AnnotationNote.list()}" optionKey="id" value="${rechercheCandidatInstance?.annotation2?.id}" class="form-control" noSelection="['null': '']"/></td>
            <span class="help-inline">${hasErrors(bean: rechercheCandidatInstance, field: 'annotation2', 'error')}</span>			
          </div>
        </div>
        </tr>
      </table>



    </div>
    <div class="tab-pane" id="tab_br5">
      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/>Mots clés</h3>
      <table class="widthtable">
        <tr>         
        <div class="${hasErrors(bean: rechercheCandidatInstance, field: 'motCle', 'error')} ">
          <td width="205"><label for="motCle" class="control-label"><g:message code="rechercheCandidat.motCle.label" default="Mot Cle" /></label></td>
          <div>
            <td><g:textField class="form-control" name="motCle" value="${rechercheCandidatInstance?.motCle}"/></td>
            <span class="help-inline">${hasErrors(bean: rechercheCandidatInstance, field: 'motCle', 'error')}</span>			
          </div>
        </div>
        <td></td>
        <td></td>
        </tr>
      </table>
    </div>
  </div>
</div>