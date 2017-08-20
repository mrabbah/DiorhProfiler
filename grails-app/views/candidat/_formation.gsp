<%@ page import="com.rabbahsoft.diorhprofiler.FormationCandidat" %>
<div id="formation"  class="modal fade" tabindex="-1" role="dialog" aria-labelledby="DeleteModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button class="close" data-dismiss="modal">×</button>
        <h3><div id="titremodalformation"></div></h3>
      </div>
      <div class="modal-body">
        <div class="erreur"></div>
        <g:form name="formationcandidat" id="formationcandidat" >
          <g:hiddenField name='addupdate' id='addupdate' value=''/>
          <g:hiddenField name='element' id='element' value=''/>
          <div class="row">
            <div class="col-sm-3">
              <label for="diplome" class="control-label"><g:message code="formationCandidat.diplome.label" default="Diplome" /><span class="required-indicator">* :</span></label>
            </div>
            <div class="col-sm-3">
              <g:select class="form-control" id="diplome" name="diplome.id" from="${com.rabbahsoft.diorhprofiler.Diplome.list()}" optionKey="id" required="" value="${formationcandidats?.diplome?.id}" noSelection="['': 'Sélectionner...']"/>
            </div>
            <div class="col-sm-3">
              <label for="intituleDiplome" class="control-label"><g:message code="formationCandidat.intituleDiplome.label" default="Intitule Diplome" /><span class="required-indicator">* :</span></label>
            </div>
            <div class="col-sm-3">
              <g:textField class="form-control" name="intituleDiplome" id="intituleDiplome" maxlength="100" value=""/>
            </div>
          </div>

          <div class="row">
            <div class="col-sm-3">
              <label for="annee" class="control-label"><g:message code="formationCandidat.annee.label" default="Annee obtention" /><span class="required-indicator">* :</span></label>
            </div>
            <div class="col-sm-3">
              <g:select class="form-control" name="annee" id="annee" from="${2014..1970}" value="${formationcandidats?.annee}" noSelection="['': 'Sélectionner...']"/>
            </div>
            <div class="col-sm-3">
              <label for="optionFormation" class="control-label"><g:message code="formationCandidat.optionFormation.label" default="Option Formation" /><span class="required-indicator"> :</span></label>
            </div>
            <div class="col-sm-3">
              <g:textField class="form-control" name="optionFormation" id="optionFormation" maxlength="100" value="${formationcandidats?.optionFormation}"/>
            </div>
          </div>

          <div class="row">
            <div class="col-sm-3">
              <label for="etablissement" class="control-label"><g:message code="formationCandidat.etablissement.label" default="Etablissement" /><span class="required-indicator">* :</span></label>
            </div>
            <div class="col-sm-3">
              <g:textField class="form-control" name="etablissement" id="etablissement" maxlength="100" value="${formationcandidats?.etablissement}"/>
            </div>
            <div class="col-sm-3">
              <label for="typeEtablissement" class="control-label"><g:message code="formationCandidat.typeEtablissement.label" default="Type Etablissement" /><span class="required-indicator">* :</span></label>
            </div>
            <div class="col-sm-3">
              <g:select class="form-control" id="typeEtablissement" name="typeEtablissement.id" from="${com.rabbahsoft.diorhprofiler.TypeEtablissement.list()}" optionKey="id" required="" value="${formationcandidats?.typeEtablissement?.id}" noSelection="['': 'Sélectionner...']"/>
            </div>
          </div>

          <div class="row">
            <div class="col-sm-3">
                <label for="ville" class="control-label"><g:message code="formationCandidat.ville.label" default="Ville" /><span class="required-indicator">* :</span></label>
            </div>
            <div class="col-sm-3">
                <g:select class="form-control" id="villef" name="ville.id" from="${com.rabbahsoft.diorhprofiler.Ville.list()}" optionKey="id" required="" value="${formationcandidats?.ville?.id}" noSelection="['null': 'Sélectionner...']"/>		
            </div>
            <div class="col-sm-3">
            <label for="description" class="control-label"><g:message code="formationCandidat.description1.label" default="Description" /></label>
            </div>
            <div class="col-sm-3">
            <g:textArea class="form-control" name="description" id="description" cols="40" rows="5" maxlength="65535" value="${formationcandidats?.description}"/>
            </div>
          </div>
        </g:form>
      </div>
      <div class="modal-footer">
        <button class="btn btn-danger" onclick="createformation();">Enregistrer</button><button class="btn" data-dismiss="modal">Fermer</button>
      </div>
    </div>
  </div>
</div>