<%@ page import="com.rabbahsoft.diorhprofiler.Candidature" %>
<table class="widthtable">
<tr>
<td width="250"><label for="spontanee" class="control-label"><g:message code="candidature.spontanee.label" default="Spontanee" /></label></td>
<div>
<td><bs:checkBox name="spontanee" value="${candidatureInstance?.spontanee}" /></td>
</div>
</div>
<td width="250"><label for="dateCandidature" class="control-label"><g:message code="candidature.dateCandidature.label" default="Date Candidature" /></label></td>
<div>
<td><bs:datePicker name="dateCandidature" precision="day"  value="${candidatureInstance?.dateCandidature}" default="none" noSelection="['': '']" /></td>
</div>
</div>
</tr>
</table>
<table class="widthtable">
  <tr>
    <td width="250"><label for="lettreMotivation" class="control-label"><g:message code="candidature.lettreMotivation.label" default="Lettre Motivation" /></label></td>
  <div>
    <td><g:textArea class="form-control" name="lettreMotivation" cols="40" rows="5" maxlength="65535" value="${candidatureInstance?.lettreMotivation}"/></td>
  </div>
</div>
<td width="250"><label for="evaluationCommentaire" class="control-label"><g:message code="candidature.evaluationCommentaire.label" default="Evaluation Commentaire" /></label></td>
<div>
  <td><g:textArea class="form-control" name="evaluationCommentaire" cols="40" rows="5" maxlength="65535" value="${candidatureInstance?.evaluationCommentaire}"/></td>
</div>
</div>
</tr>
</table>
<table class="widthtable">
  <tr>
<td width="250"><label for="oldStatut" class="control-label"><g:message code="candidature.oldStatut.label" default="Old Statut" /></label></td>
<div>
<td><g:textField class="form-control" name="oldStatut" value="${candidatureInstance?.oldStatut}"/></td>
</div>
</div>
<td width="250"><label for="sourceCandidature" class="control-label"><g:message code="candidature.sourceCandidature.label" default="Source Candidature" /></label></td>
<div>
<td><g:textField class="form-control" name="sourceCandidature" maxlength="50" value="${candidatureInstance?.sourceCandidature}"/></td>
</div>
</div>
</tr>
</table>
<table class="widthtable">
<tr>
<td width="250"><label for="candidat" class="control-label"><g:message code="candidature.candidat.label" default="Candidat" /><span class="required-indicator">* :</span></label></td>
<div>
<td><g:select class="form-control" id="candidat" name="candidat.id" from="${com.rabbahsoft.diorhprofiler.Candidat.list()}" optionKey="id" required="" value="${candidatureInstance?.candidat?.id}" class="form-control"/></td>
</div>
</div>
<td width="250"><label for="etapeAvancement" class="control-label"><g:message code="candidature.etapeAvancement.label" default="Etape Avancement" /><span class="required-indicator">* :</span></label></td>
<div>
<td><g:select class="form-control" id="etapeAvancement" name="etapeAvancement.id" from="${com.rabbahsoft.diorhprofiler.EtapeAvancementCandidature.list()}" optionKey="id" required="" value="${candidatureInstance?.etapeAvancement?.id}" class="form-control"/></td>
</div>
</div>
</tr>
</table>
<table class="widthtable">
<tr>
<td width="250"><label for="evaluation" class="control-label"><g:message code="candidature.evaluation.label" default="Evaluation" /><span class="required-indicator">* :</span></label></td>
<div>
<td><g:select class="form-control" id="evaluation" name="evaluation.id" from="${com.rabbahsoft.diorhprofiler.EvaluationCandidature.list()}" optionKey="id" required="" value="${candidatureInstance?.evaluation?.id}" class="form-control"/></td>
</div>
</div>
<td width="250"><label for="evenementCandidatures" class="control-label"><g:message code="candidature.evenementCandidatures.label" default="Evenement Candidatures" /></label></td>
<div>
  <td>
    <ul class="one-to-many">
      <g:each in="${candidatureInstance?.evenementCandidatures?}" var="e">
        <li><g:link controller="evenementCandidature" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
      </g:each>
      <li class="add">
      <g:link controller="evenementCandidature" action="create" params="['candidature.id': candidatureInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'evenementCandidature.label', default: 'EvenementCandidature')])}</g:link>
      </li>
    </ul>
  </td>
</div>
</div>
</tr>
</table>
<table class="widthtable">
<tr>
<td width="250"><label for="mission" class="control-label"><g:message code="candidature.mission.label" default="Mission" /><span class="required-indicator">* :</span></label></td>
<div>
<td><g:select class="form-control" id="mission" name="mission.id" from="${com.rabbahsoft.diorhprofiler.Mission.list()}" optionKey="id" required="" value="${candidatureInstance?.mission?.id}" class="form-control"/></td>
</div>
</div>
<td width="250"><label for="statut" class="control-label"><g:message code="candidature.statut.label" default="Statut" /><span class="required-indicator">* :</span></label></td>
<div>
<td><g:select class="form-control" id="statut" name="statut.id" from="${com.rabbahsoft.diorhprofiler.StatutCandidature.list()}" optionKey="id" required="" value="${candidatureInstance?.statut?.id}" class="form-control"/></td>
</div>
</div>
</tr>
</table>



