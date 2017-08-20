<%@ page import="com.rabbahsoft.diorhprofiler.FormationCandidat" %>





<table class="widthtable">
  <tr>
  <div class="${hasErrors(bean: formationCandidatInstance, field: 'diplome', 'error')} required">
    <td width="250"><label for="diplome" class="control-label"><g:message code="formationCandidat.diplome.label" default="Diplome" /><span class="required-indicator">* :</span></label></td>
    <div>
      <td><g:select class="form-control" id="diplome" name="diplome.id" from="${com.rabbahsoft.diorhprofiler.Diplome.list()}" optionKey="id" required="" value="${formationCandidatInstance?.diplome?.id}" class="form-control"/></td>
      <span class="help-inline">${hasErrors(bean: formationCandidatInstance, field: 'diplome', 'error')}</span>			
    </div>
  </div>

  <div class="${hasErrors(bean: formationCandidatInstance, field: 'intituleDiplome', 'error')} ">
    <td width="250"><label for="intituleDiplome" class="control-label"><g:message code="formationCandidat.intituleDiplome.label" default="Intitule Diplome" /></label></td>
    <div>
      <td><g:textField class="form-control" name="intituleDiplome" id="intituleDiplome" maxlength="100" value="${formationCandidatInstance?.intituleDiplome}"/></td>
      <span class="help-inline">${hasErrors(bean: formationCandidatInstance, field: 'intituleDiplome', 'error')}</span>			
    </div>
  </div>
</tr>
</table>

<table class="widthtable">
  <tr>
  <div class="${hasErrors(bean: formationCandidatInstance, field: 'annee', 'error')} ">
    <td width="250"><label for="annee" class="control-label"><g:message code="formationCandidat.annee.label" default="Annee" /></label></td>
    <div>
      <td><g:textField class="form-control" name="annee" id="annee" value="${formationCandidatInstance?.annee}"/></td>
      <span class="help-inline">${hasErrors(bean: formationCandidatInstance, field: 'annee', 'error')}</span>			
    </div>
  </div>
  <div class="${hasErrors(bean: formationCandidatInstance, field: 'optionFormation', 'error')} ">
    <td width="250"><label for="optionFormation" class="control-label"><g:message code="formationCandidat.optionFormation.label" default="Option Formation" /></label></td>
    <div>
      <td><g:textField class="form-control" name="optionFormation" id="optionFormation" maxlength="100" value="${formationCandidatInstance?.optionFormation}"/></td>
      <span class="help-inline">${hasErrors(bean: formationCandidatInstance, field: 'optionFormation', 'error')}</span>			
    </div>
  </div>
</tr>
</table>





<table class="widthtable">
  <tr>
  <div class="${hasErrors(bean: formationCandidatInstance, field: 'etablissement', 'error')} ">
    <td width="250"><label for="etablissement" class="control-label"><g:message code="formationCandidat.etablissement.label" default="Etablissement" /></label></td>
    <div>
      <td><g:textField class="form-control" name="etablissement" id="etablissement" maxlength="100" value="${formationCandidatInstance?.etablissement}"/></td>
      <span class="help-inline">${hasErrors(bean: formationCandidatInstance, field: 'etablissement', 'error')}</span>			
    </div>
  </div>
  <div class="${hasErrors(bean: formationCandidatInstance, field: 'typeEtablissement', 'error')} required">
    <td width="250"><label for="typeEtablissement" class="control-label"><g:message code="formationCandidat.typeEtablissement.label" default="Type Etablissement" /><span class="required-indicator">* :</span></label></td>
    <div>
      <td><g:select class="form-control" id="typeEtablissement" name="typeEtablissement.id" from="${com.rabbahsoft.diorhprofiler.TypeEtablissement.list()}" optionKey="id" required="" value="${formationCandidatInstance?.typeEtablissement?.id}" class="form-control"/></td>
      <span class="help-inline">${hasErrors(bean: formationCandidatInstance, field: 'typeEtablissement', 'error')}</span>			
    </div>
  </div>
</tr>
</table>

<table class="widthtable">
  <tr>
  <div class="${hasErrors(bean: formationCandidatInstance, field: 'ville', 'error')} required">
    <td width="222"><label for="ville" class="control-label"><g:message code="formationCandidat.ville.label" default="Ville" /><span class="required-indicator">* :</span></label></td>
    <div>
      <td><g:select class="form-control" id="ville" name="ville.id" from="${com.rabbahsoft.diorhprofiler.Ville.list()}" optionKey="id" required="" value="${formationCandidatInstance?.ville?.id}" class="form-control"/></td>
      <span class="help-inline">${hasErrors(bean: formationCandidatInstance, field: 'ville', 'error')}</span>			
    </div>
  </div>
  <td></td>
  <td></td>
</tr>
</table>


<table class="widthtable">
  <tr>
  <div class="${hasErrors(bean: formationCandidatInstance, field: 'description', 'error')} ">
    <td width="208"><label for="description" class="control-label"><g:message code="formationCandidat.description.label" default="Description" /></label></td>
    <div>
      <td><g:textArea class="form-control" name="description" id="description" cols="40" rows="5" maxlength="65535" value="${formationCandidatInstance?.description}"/></td>
      <span class="help-inline">${hasErrors(bean: formationCandidatInstance, field: 'description', 'error')}</span>			
    </div>
  </div>
  <td></td>
  <td></td>
</tr>
</table>