<%@ page import="com.rabbahsoft.diorhprofiler.Candidature" %>                 
<table class="widthtable">
  <tr>
    <td width="250"><label for="Nom Candidat" class="control-label"><g:message code="candidature.nomCandidat.label" default="Nom Candidat" /></label></td>
    <td><g:textField class="form-control" name="nomCandidat" value=""/></td>                        
<td width="250"><label for="Prenom Candidat" class="control-label"><g:message code="candidature.prenomCandidat.label" default="Prenom Candidat" /></label></td>
<td><g:textField class="form-control" name="prenomCandidat" value=""/></td>
</tr>
</table>

<table class="widthtable">
  <tr>
    <td width="250"><label for="referenceMission" class="control-label"><g:message code="candidature.referenceMission.label" default="Référence Mission" /></label></td>
    <td><g:textField class="form-control" name="referenceMission" value=""/></td>
<td width="250"><label for="statut" class="control-label"><g:message code="candidature.statut.label" default="Statut" /><span class="required-indicator">* :</span></label></td>
<td><g:select class="form-control" id="statut" name="statut.id" from="${com.rabbahsoft.diorhprofiler.StatutCandidature.list()}" optionKey="id" noSelection="['null': '']" value="" class="form-control"/></td>
</tr>
</table>

<table class="widthtable">
  <tr>
    <td width="250"><label for="evaluation" class="control-label"><g:message code="candidature.evaluation.label" default="Evaluation" /><span class="required-indicator">* :</span></label></td>
    <td><g:select class="form-control" id="evaluation" name="evaluation.id" from="${com.rabbahsoft.diorhprofiler.EvaluationCandidature.list()}" optionKey="id" noSelection="['null': '']"  value="" class="form-control"/></td>
<td width="250"><label for="etapeAvancement" class="control-label"><g:message code="candidature.etapeAvancement.label" default="Etape Avancement" /><span class="required-indicator">* :</span></label></td>
<td><g:select class="form-control" id="etapeAvancement" name="etapeAvancement.id" from="${com.rabbahsoft.diorhprofiler.EtapeAvancementCandidature.list()}" optionKey="id"  noSelection="['null': '']" value="${candidatureInstance?.etapeAvancement?.id}" class="form-control"/></td>
</tr>
</table>


<table class="widthtable">
  <tr>
    <td width="250"><label for="dateCandidaturede" class="control-label"><g:message code="candidature.dateCandidaturede.label" default="Date de Creation De" /></label></td>
    <td><g:textField name="dateCandidaturede" class="form-control" id="dateCandidaturede" value="${formatDate(format:'dd/MM/yyyy',date:candidatureInstance?.dateCandidature)}"/></td>		
<td width="250"><label for="dateCandidaturea" class="control-label"><g:message code="candidature.dateCandidaturea.label" default="Date de Creation A" /></label></td>
<td><g:textField name="dateCandidaturea" id="dateCandidaturea" class="form-control" value="${formatDate(format:'dd/MM/yyyy',date:candidatureInstance?.dateCandidature)}"/></td>
</tr>
</table>                  