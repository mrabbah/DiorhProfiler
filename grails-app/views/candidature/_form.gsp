<%@ page import="com.rabbahsoft.diorhprofiler.Candidature" %>
<script>
  $(document).ready(function(){
  $("#sourceCandidature").change(function (){
    if(this.value=="autre"){
        $(".labelautre").html('<label for="sourceCandidature" class="control-label"><g:message code="candidature.autre.label" default="Autre :" /></label>');
        $(".inputautre").html('<g:textField class="form-control" name="autre" id="autre" value=""/>');
    }
    else{
    $(".labelautre").html('');
    $(".inputautre").html('');
    }
  });
  });
</script>
 <g:if test="${params.action=='edit'}">
<div class="tabbable tabbable-bordered">
  <ul class="nav nav-tabs">
    <li class="active"><a href="#tab_br1" data-toggle="tab">Fiche</a></li>
    <li><a href="#tab_br2" data-toggle="tab">Avancement de la candidature</a></li>
  </ul>
  <div class="tab-content">
    <div class="tab-pane active" id="tab_br1">
      </g:if>
      <g:if test="${session.user!=null && session.user.profil.libelle!="candidat"}">
        </br>
        <div class='row'>
          <div class="panel panel-danger">
            <div class="panel-body">
              <div class="row">
              <div class="col-sm-3 showlabel"><g:message code="candidature.nomcandidat.label" default="Nom candidat :" /></div>
              <div class="col-sm-3 showvalue"><g:if test="${params.action=='edit'}">${candidatureInstance?.candidat}</g:if><g:else>${session.candidat}</g:else></div>
              <div class="col-sm-3 showlabel"><g:message code="candidature.datecandidature.label" default="Date de candidature:" /></div>
              <div class="col-sm-3 showvalue"><g:if test="${params.action=='edit'}"><g:formatDate date="${candidatureInstance?.dateCandidature}" format="dd/MM/yyyy" /></g:if><g:else><g:formatDate date="${new Date()}" format="dd/MM/yyyy" /></g:else></div>
              </div>
              <div class="row">
              <div class="col-sm-3 showlabel"><g:message code="candidature.statut.label" default="Statut :" /></div>
              <div class="col-sm-3 showvalue">${candidatureInstance?.statut}</div>
              </div>
            </div>
          </div>
        </div>
      </g:if>
      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Source de candidature</span></h3>
      <div class='row'>
        <div class="col-sm-3"><label for="sourceCandidature" class="control-label"><g:message code="candidature.sourceCandidature.label" default="Source Candidature :" /></label></div>
        <div class="col-sm-3"><select name="sourceCandidature" id="sourceCandidature" class="form-control">
            <option value="">Sélectionner</option>
            <option value="site diorh" <g:if test="${candidatureInstance?.sourceCandidature=="site diorh"}">selected</g:if>>Site diorh</option>
            <option value="portail web" <g:if test="${candidatureInstance?.sourceCandidature=="portail web"}">selected</g:if>>Portail web</option>
            <option value="presse" <g:if test="${candidatureInstance?.sourceCandidature=="presse"}">selected</g:if>>Presse</option>
            <option value="autre" <g:if test="${!["site diorh","portail web","presse"].contains(candidatureInstance?.sourceCandidature) && params.action=="edit"}">selected</g:if>>autre</option>
          </select>
        </div>
        <div class="col-sm-3 labelautre"><g:if test="${!["site diorh","portail web","presse"].contains(candidatureInstance?.sourceCandidature) && params.action=="edit"}"><label for="sourceCandidature" class="control-label"><g:message code="candidature.autre.label" default="Autre :" /></label></g:if></div>
        <div class="col-sm-3 inputautre"><g:if test="${!["site diorh","portail web","presse"].contains(candidatureInstance?.sourceCandidature) && params.action=="edit"}"><g:textField class="form-control" name="autre" id="autre" value="${candidatureInstance?.sourceCandidature}"/></g:if></div>
      </div>

      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Mission</span></h3>

      <div class="row table-bordered2 odd">
        <div class="col-sm-3 fontrowtabletitle">Référence mission</div>
        <div class="col-sm-3 fontrowtabletitle">Poste</div>
        <div class="col-sm-3 fontrowtabletitle">Societé</div>
        <div class="col-sm-3 fontrowtabletitle">Lieu</div>
      </div>
      <g:if test="${params.action!='edit'}">
        <div class="row table-bordered2 even">
          <div class="col-sm-3 fontrowtabletitle"><g:link controller="mission" action="show" id="${candidatureInstance?.mission?.id}">${session.mission.reference?.encodeAsHTML()}</g:link></div>
          <div class="col-sm-3 fontrowtabletitle">${session.mission.poste}</div>
          <div class="col-sm-3 fontrowtabletitle">${session.mission?.entreprise?.encodeAsHTML()}</div>
          <div class="col-sm-3 fontrowtabletitle">${session.mission?.localisation?.encodeAsHTML()}</div>
        </div>
      </g:if>
      <g:else>
        <div class="row table-bordered2 even">
          <div class="col-sm-3 fontrowtabletitle"><g:link controller="mission" action="show" id="${candidatureInstance?.mission?.id}">${candidatureInstance.mission.reference?.encodeAsHTML()}</g:link></div>
          <div class="col-sm-3 fontrowtabletitle">${candidatureInstance.mission.poste}</div>
          <div class="col-sm-3 fontrowtabletitle">${candidatureInstance.mission?.entreprise?.encodeAsHTML()}</div>
          <div class="col-sm-3 fontrowtabletitle">${candidatureInstance.mission?.localisation?.encodeAsHTML()}</div>
        </div>
      </g:else>
      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Lettre de motivation</span></h3>  

      <h3 class="alert"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'chain.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/></span><g:message code="candidature.messagelettremotivation.label" default="" /></h3>
      <g:if test="${session.user.profil.libelle == 'candidat'}">
      <div class='row'>
        <div class="col-sm-3"><label for="lettreMotivation" class="control-label"><g:message code="candidature.lettreMotivation.label" default="Lettre de motivation" />:</label></div>
          <div class="col-sm-9"><g:textArea class="form-control" name="lettreMotivation" id="lettreMotivation"  rows="5" value="${candidatureInstance?.lettreMotivation}" style="width: 100%;"/></div>
      </div>
        </g:if>
      <g:if test="${session.user!=null && session.user.profil.libelle!="candidat"}">
        <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Evaluation de la candidature</span></h3>  
        <div class='row'>
          <div class="col-sm-3"><label for="lettreMotivation" class="control-label"><g:message code="candidature.evaluationcandidiat.label" default="Evaluation du candidat" />:</label></div>
          <div class="col-sm-3"><g:select class="form-control" id="evaluation" name="evaluation.id" from="${com.rabbahsoft.diorhprofiler.EvaluationCandidature.list()}" optionKey="id" value="${candidatureInstance?.evaluation?.id}" class="form-control" noSelection="['null': 'Sélectionner...']"/></div>
        </div>

        <div class='row'>
          <div class="col-sm-3"><label for="lettreMotivation" class="control-label"><g:message code="candidature.evaluationCommentaire.label" default="Commentaire" />:</label></div>
          <div class="col-sm-9"><g:textArea class="form-control" name="evaluationCommentaire" id="evaluationCommentaire"  rows="5" value="${candidatureInstance?.evaluationCommentaire}" style="width: 100%;"/></div>
        </div>
      </g:if>
<g:if test="${params.action=='edit'}">
    </div>
    <div class="tab-pane" id="tab_br2">
      <g:if test="${params.controller=='candidature' && params.action=='edit'}">
        <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Avancement de la candidature</span></h3>  
        <div class="row">
        <g:render template="avancements" model="['candidatureInstance':candidatureInstance]" /></td>
      </div>
      </g:if>
    </div>
  </div>
</div>
 </g:if>
<g:hiddenField id="addEvenementCandidature" name="addEvenementCandidature" value="${candidatureInstance?.evenementCandidatures == null? 0: candidatureInstance?.evenementCandidatures.size()}"/>

