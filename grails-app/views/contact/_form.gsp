<%@ page import="com.rabbahsoft.diorhprofiler.Contact" %>

<div class="tabbable tabbable-bordered">
  <ul class="nav nav-tabs">
    <li class="active"><a href="#tab_br1" data-toggle="tab">Informations du contact</a></li>
    <li><a href="#tab_br2" data-toggle="tab">Interlocuteurs</a></li>
  </ul>
  <div class="tab-content">
    <div class="tab-pane active" id="tab_br1">
      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Identification</span></h3> 
      <div class="row">
        <div class="col-sm-3"><label for="raisonSociale" class="control-label"><g:message code="contact.raisonSociale.label" default="Raison Sociale" /><span class="required-indicator">* :</span></label></div>
        <div class="col-sm-3"><g:textField class="form-control" name="raisonSociale" id="raisonSociale" maxlength="60" value="${contactInstance?.raisonSociale}"/></div>			
      </div>			


      <div class="row">  
        <div class="col-sm-3"><label for="type" class="control-label"><g:message code="contact.type.label" default="Type" /><span class="required-indicator">* :</span></label></div>
        <div class="col-sm-3"><g:select class="form-control" name="type" id="type" from="${contactInstance.constraints.type.inList}" value="${contactInstance?.type}" valueMessagePrefix="contact.type" noSelection="['': 'Sélectionner...']"/></div>			
        <div class="col-sm-3"><label for="directeurGeneral" class="control-label"><g:message code="contact.directeurGeneral.label" default="Directeur General" /></label><span class="required-indicator">* :</span></div>
        <div class="col-sm-3"><g:textField class="form-control" name="directeurGeneral" id="directeurGeneral" maxlength="50" value="${contactInstance?.directeurGeneral}"/></div>			
      </div>

      <div class="row">
        <div class="col-sm-3"><label for="secteurActivite" class="control-label"><g:message code="contact.secteurActivite.label" default="Secteur Activite" /><span class="required-indicator">* :</span></label></div>
        <div class="col-sm-3"><g:select class="form-control" id="secteurActivite" name="secteurActivite.id" from="${com.rabbahsoft.diorhprofiler.SecteurActivite.list()}" optionKey="id" value="${contactInstance?.secteurActivite?.id}" noSelection="['': 'Sélectionner...']"/></div>
        <div class="col-sm-3"><label for="typeEntreprise" class="control-label"><g:message code="contact.typeEntreprise.label" default="Type Entreprise" /></label></div>
        <div class="col-sm-3"><g:select class="form-control" id="typeEntreprise" name="typeEntreprise.id" from="${com.rabbahsoft.diorhprofiler.TypeEntreprise.list()}" optionKey="id" value="${contactInstance?.typeEntreprise?.id}" class="form-control" noSelection="['null': '']"/></div>
      </div>


      <div class="row">
        <div class="col-sm-3"><label for="effectif" class="control-label"><g:message code="contact.effectif.label" default="Effectif" /></label></div>
        <div class="col-sm-3"><g:textField class="form-control" name="effectif" id="effectif" value="${contactInstance.effectif}"/></div>
        <div class="col-sm-3"><label for="effectifCadre" class="control-label"><g:message code="contact.effectifCadre.label" default="Effectif Cadre" /></label></div>
        <div class="col-sm-3"><g:textField class="form-control" name="effectifCadre" id="effectifCadre" value="${contactInstance.effectifCadre}"/></div>
      </div>

      <div class="row">
        <div class="col-sm-3"><label for="chiffreAffaire" class="control-label"><g:message code="contact.chiffreAffaire.label" default="Chiffre Affaire" /></label></div>
        <div class="col-sm-3"><g:textField class="form-control" name="chiffreAffaire" id="chiffreAffaire" maxlength="20" value="${contactInstance?.chiffreAffaire}"/></div>
        <div class="col-sm-3"><label for="dateCreationEntrep" class="control-label"><g:message code="contact.dateCreationEntrep.label" default="Date Creation Entrep" /></label></div>
        <div class="col-sm-3"><g:textField type="text" class="datecss form-control" name="dateCreationEntrep" id="dateCreationEntrep" precision="day"  value="${formatDate(format:'dd/MM/yyyy',date:contactInstance?.dateCreationEntrep)}"/></div>
      </div>

      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Coordonnées</span></h3> 

      <div class="row">
        <div class="col-sm-3"><label for="adresse1" class="control-label"><g:message code="contact.adresse1.label" default="Adresse1" /></label></div>
        <div class="col-sm-3"><g:textField class="form-control" name="adresse1" maxlength="100" value="${contactInstance?.adresse1}"/></div>
        <div class="col-sm-3"><label for="ville" class="control-label"><g:message code="contact.ville.label" default="Ville" /></label></div>
        <div class="col-sm-3"><g:select class="form-control" id="ville" name="ville.id" from="${com.rabbahsoft.diorhprofiler.Ville.list()}" optionKey="id" value="${contactInstance?.ville?.id}" class="form-control" noSelection="['null': '']"/></div>
      </div> 


      <div class="row">
        <div class="col-sm-3"><label for="adresse2" class="control-label"><g:message code="contact.adresse2.label" default="Adresse2" /></label></div>
        <div class="col-sm-3"><g:textField class="form-control" name="adresse2" maxlength="100" value="${contactInstance?.adresse2}"/></div>
        <div class="col-sm-3"><label for="codePostal" class="control-label"><g:message code="contact.codePostal.label" default="Code Postal" /></label></div>
        <div class="col-sm-3"><g:textField class="form-control" name="codePostal" id="codePostal" value="${contactInstance.codePostal}"/></div>
      </div>

      <div class="row">
        <div class="col-sm-3"><label for="adresse3" class="control-label"><g:message code="contact.adresse3.label" default="Adresse3" /></label></div>
        <div class="col-sm-3"><g:textField class="form-control" name="adresse3" maxlength="100" value="${contactInstance?.adresse3}"/></div>
      </div>


      <div class="row">
        <div class="col-sm-3"><label for="telephone" class="control-label"><g:message code="contact.telephone.label" default="Telephone" /></label></div>
        <div class="col-sm-3"><g:textField class="form-control" name="telephone" id="telephone" maxlength="30" value="${contactInstance?.telephone}"/></div>
        <div class="col-sm-3"><label for="fax" class="control-label"><g:message code="contact.fax.label" default="Fax" /></label></div>
        <div class="col-sm-3"><g:textField class="form-control" name="fax" maxlength="30" value="${contactInstance?.fax}"/></div>
      </div>

    </div>

    <div class="tab-pane" id="tab_br2">
      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Interlocuteurs</span></h3>                    
      
          <div class="row">
        <g:render template="interlocuteurcontacts" model="['contactInstance':contactInstance]"/>
          </div>
    </div>
  </div>
</div>
<g:hiddenField id="addinterlocuteurcontact" name="addinterlocuteurcontact" value="${contactInstance?.interlocuteurcontacts == null? 0: contactInstance?.interlocuteurcontacts.size()}"/>
