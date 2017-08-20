<%@ page import="com.rabbahsoft.diorhprofiler.Experience" %>
<div id="modalexperience"  class="modal fade" tabindex="-1" role="dialog" aria-labelledby="test" aria-hidden="false">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button class="close" data-dismiss="modal">×</button>
        <h3><div id="titremodal"></div></h3>
      </div>
      <div class="modal-body">
        <div class="erreur"></div>
        <g:form name="experiencecandidat" id="experiencecandidat" >
          <g:hiddenField name='addupdateexperience' id='addupdateexperience' value=''/>
          <g:hiddenField name='elementexperience' id='elementexperience' value=''/>
          <div class="row">
            <div class="col-sm-3">
              <label for="poste" class="control-label"><g:message code="experience.poste.label" default="Poste" /><span class="required-indicator">* :</span></label>
            </div>
            <div class="col-sm-3">
              <g:select class="form-control" id="poste" name="poste" from="${com.rabbahsoft.diorhprofiler.Poste.list()}" optionKey="id" class="form-control" noSelection="['': 'Sélectionner...']"/>			
            </div>
            <div class="col-sm-3">
              <label for="intitulePoste" class="control-label"><g:message code="experience.intitulePoste.label" default="Intitule Poste" /><span class="required-indicator">* :</span></label>
            </div>
            <div class="col-sm-3">
              <g:textField class="form-control" name="intitulePoste" id="intitulePoste" maxlength="100" />
            </div>
          </div>

          <div class="row">
            <div class="col-sm-3">
              <label for="entreprise" class="control-label"><g:message code="experience.entreprise.label" default="Entreprise" /><span class="required-indicator">* :</span></label>
            </div>
            <div class="col-sm-3">
              <g:textField class="form-control" name="entreprise" id="entreprise" maxlength="100" />
            </div>
            <div class="col-sm-3">
              <label for="ville" class="control-label"><g:message code="experience.ville.label" default="Ville" /><span class="required-indicator">* :</span></label>
            </div>
            <div class="col-sm-3">
              <g:select class="form-control" id="villeexp" name="villeexp" from="${com.rabbahsoft.diorhprofiler.Ville.list()}" optionKey="id" class="form-control" noSelection="['': 'Sélectionner...']"/>     
            </div> 
          </div>

          <div class="row">
            <div class="col-sm-3">
              <label for="dateDebut" class="control-label"><g:message code="experience.dateDebut.label" default="Date Debut" /><span class="required-indicator">* :</span></label>
            </div>
            <div class="col-sm-3">
              <input type="text" class="form-control" name="dateDebut" id="dateDebut" precision="day"   />
            </div>
            <div class="col-sm-3">
              <label for="dateFin" class="control-label"><g:message code="experience.dateFin.label" default="Date Fin" /> (Ne pas remplir si vous êtes toujours en poste)</label>
            </div>
            <div class="col-sm-3">
              <input type="text" class="form-control" name="dateFin" id="dateFin" precision="day"   default="none" noSelection="['': '']" />
            </div>
          </div>
          <div class="row">
            
          </div>
          <div class="row">
            <div class="col-sm-3">
              <label for="typeEntreprise" class="control-label"><g:message code="experience.typeEntreprise.label" default="Type Entreprise" /><span class="required-indicator">* :</span></label>
            </div>
            <div class="col-sm-3">
              <g:select class="form-control" id="typeEntreprise" name="typeEntreprise" from="${com.rabbahsoft.diorhprofiler.TypeEntreprise.list()}" optionKey="id" required="" class="form-control" noSelection="['': 'Sélectionner...']"/>
            </div>
            <div class="col-sm-3">
              <label for="secteurActivite" class="control-label"><g:message code="experience.secteurActivite.label" default="Secteur Activite" />:</label>
            </div>
            <div class="col-sm-3">
              <g:select class="form-control" id="secteurActivite" name="secteurActivite" from="${com.rabbahsoft.diorhprofiler.SecteurActivite.list()}" optionKey="id"  class="form-control" noSelection="['': 'Sélectionner...']"/>
            </div>
          </div>

          <div class="row">
            <div class="col-sm-3">
              <label for="nbrPersonneEncadre" class="control-label"><g:message code="experience.nbrPersonneEncadre.label" default="Nbr Personne Encadre" /><span class="required-indicator">* :</span></label>
            </div>
            <div class="col-sm-3">
              <g:select class="form-control" name="nbrPersonneEncadre" id="nbrPersonneEncadre" from="${0..10}" noSelection="['': '']" /> 
            </div>
            <div class="col-sm-3">  
              <label for="rattachement" class="control-label"><g:message code="experience.rattachement.label" default="Rattachement" /><span class="required-indicator">* :</span></label>
            </div>
            <div class="col-sm-3">
              <g:textField class="form-control" name="rattachement" id="rattachement" maxlength="50" />
            </div>
          </div>


          <div class="row">
            <div class="col-sm-3">
              <label for="contact" class="control-label"><g:message code="experience.contact.label" default="Contact" /><span class="required-indicator">* :</span></label>
            </div>
            <div class="col-sm-3">
              <g:textField class="form-control" name="contact" id="contact" />
            </div>
            <div class="col-sm-3">
              <label for="telephoneContact" class="control-label"><g:message code="experience.telephoneContact.label" default="Telephone Contact" /><span class="required-indicator">* :</span></label>
            </div>
            <div class="col-sm-3">
              <g:textField class="form-control" name="telephoneContact" id="telephoneContact" />
            </div>
          </div>
          <div class="row">
            <div class="col-sm-3">
              <label for="fonctionContact" class="control-label"><g:message code="experience.fonctionContact.label" default="Fonction Contact" /><span class="required-indicator">* :</span></label>
            </div>
            <div class="col-sm-3">
              <g:textField class="form-control" name="fonctionContact" id="fonctionContact" />
            </div>
            <div class="col-sm-3">
              <label for="mission" class="control-label"><g:message code="experience.mission.label" default="Mission" /><span class="required-indicator">* :</span></label>
            </div>
            <div class="col-sm-3">
              <g:textArea class="form-control" name="mission" id="mission" cols="40" rows="5" maxlength="65535" />
            </div>
          </div>
        </g:form>
      </div>
      <div class="modal-footer">
        <button class="btn btn-danger" onclick="createexperience();">Enregistrer</button><button class="btn" data-dismiss="modal">Fermer</button>
      </div>
    </div>
  </div>
</div>







