<%@ page import="com.rabbahsoft.diorhprofiler.EvenementCandidature" %>

<div id="evenementCandidature${i}" class="evenementCandidature-div" <g:if test="${hidden}">style="display:none;"</g:if>>
  <g:hiddenField name='evenementCandidatures[${i}].id' value='${evenementCandidatures?.id}'/>
  <g:hiddenField name='evenementCandidatures[${i}].deleted' value='false'/>
  <g:hiddenField name='evenementCandidatures[${i}].new' value="${evenementCandidature?.id == null?'true':'false'}"/>
  <div class="row">
    
    <div class="col-sm-2">
      <label class="control-label"><g:message code="evenement.date.label" default="Date de l'evénement:" /></label></td>
    </div>
    <div class="col-sm-3">
      <input type="text" class="datecss form-control" id="evenementCandidatures[${i}].dateEvtCandidature" name="evenementCandidatures[${i}].dateEvtCandidature" precision="day" value="${formatDate(format:'dd/MM/yyyy',date:evenementCandidature?.dateEvtCandidature)}"  />
    </div> 
    <div class="col-sm-3">
      <label for="connaissancesInfo" class="control-label"><g:message code="evenement.evenement.label" default="Type de l'evénement:" /></label></td>
    </div>
    <div class="col-sm-3">
      <g:select class="form-control" id="evenementCandidatures[${i}].typeEvenement" name="evenementCandidatures[${i}].typeEvenement.id" from="${com.rabbahsoft.diorhprofiler.TypeEvenementCandidature.list()}" optionKey="id" value="${evenementCandidature?.typeEvenement?.id}" noSelection="['null': 'Sélectionner...']"/>
    </div>
    <div class="col-sm-1">
      <span class="del-evenementCandidature">
        <img src="${resource(dir:'images/icon', file:'delete-item.png')}" 
             style="vertical-align:middle;" width="18px" height="18px"/>
      </span>
    </div> 
  </div>
</div>
