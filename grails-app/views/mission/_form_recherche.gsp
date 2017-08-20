<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.rabbahsoft.diorhprofiler.Mission" %>
<%@page defaultCodec="none" %>
<h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class='label label-info'>Recherche missions</span></h3>
<div class='row'>
  <div class="col-sm-3"><label for="recherchepar" class="control-label"><g:message code="mission.recherchepar.label" default="Recherche par" />:</label></div>
  
  
</div>
<div class='row'>
  <div class="col-sm-3"><label for="client" class="control-label"><g:message code="mission.client.label" default="Client" />:</label></div>
  <div class="col-sm-3"><g:select class="form-control" id="contact" name="contact" from="${com.rabbahsoft.diorhprofiler.Contact.list([sort: 'raisonSociale', order: 'asc'])}"  optionKey="id" value="" class="form-control" noSelection="['null': '']"/></div>
  <div class="col-sm-3"><label for="reference" class="control-label"><g:message code="mission.reference.label" default="Référence" />:</label></div>
  <div class="col-sm-3"><g:textField class="form-control" name="reference" value="${missionInstance?.reference}"/></div>
</div>

<div class='row'>
  <div class="col-sm-3"><label for="typeFonction" class="control-label"><g:message code="mission.typeFonction.label" default="Fonction" /><span class="required-indicator">* </span>:</label></div>
  <div class="col-sm-3"><g:select class="form-control" id="typeFonction" name="typeFonction" from="${com.rabbahsoft.diorhprofiler.Poste.list()}" optionKey="id"  value="" class="form-control" noSelection="['null': '']" /></div>
  <div class="col-sm-3"><label for="secteurActivite" class="control-label"><g:message code="mission.secteurActivite.label" default="Secteur d'activité" />:</label></div>
  <div class="col-sm-3"><g:select class="form-control" id="secteurActivite" name="secteurActivite" from="${com.rabbahsoft.diorhprofiler.SecteurActivite.list()}" optionKey="id"  value="" class="form-control" noSelection="['null': '']"/></div>
</div>
<div class='row'>
  <div class="col-sm-3"><label for="consultant" class="control-label"><g:message code="mission.consultant.label" default="Consultant" />:</label></div>                  
  <div class="col-sm-3"><g:select class="form-control" id="consultant" name="consultant" from="${listconsultant}" optionKey="id"  value="" class="form-control"  noSelection="['null': '']"/></div> 
   <div class="col-sm-3"><label for="chargeRecherche" class="control-label"><g:message code="mission.chargeRecherche.label" default="Charge de Recherche" />:</label></div>
  <div class="col-sm-3"><g:select class="form-control" id="chargeRecherche" name="chargeRecherche" from="${listchargrech}" optionKey="id"  value="" class="form-control"  noSelection="['null': '']"/></div>               
</div>
<div class='row'>
  <div class="col-sm-3"><label for="etapeAvancement" class="control-label"><g:message code="mission.etapeAvancement.label" default="Etape d'avancement" /><span class="required-indicator">* </span>:</label></div>
  <div class="col-sm-3"><g:select class="form-control" id="etapeAvancement" name="etapeAvancement" from="${com.rabbahsoft.diorhprofiler.EtapeAvancement.list()}" optionKey="id"  value="" class="form-control"  noSelection="['null': '']"/></div>
   <div class="col-sm-3"><label for="statut" class="control-label"><g:message code="mission.statut.label" default="Statut" /><span class="required-indicator">* </span>:</label></div>
  <div class="col-sm-3"><g:select class="form-control" id="statut" name="statut" from="${com.rabbahsoft.diorhprofiler.StatutMission.list()}" optionKey="id"  value="" class="form-control"  noSelection="['null': '']"/></div>            
</div>



<div class='row'>
  <div class="col-sm-3"><label for="dateDemarragede" class="control-label"><g:message code="mission.dateDemarragede.label" default="Date de démarrage de" />:</label></div>
  <div class="col-sm-3"><g:textField type="text" class="form-control" name="dateDemarrageDE" id="dateDemarrageDE" precision="day"  value="" default="none" /></div>
  <div class="col-sm-3"><label for="dateDemarragea" class="control-label"><g:message code="mission.dateDemarragea.label" default="à" />:</label></div>
  <div class="col-sm-3"><g:textField type="text" class="form-control" name="dateDemarrageA" id="dateDemarrageA" precision="day"  value="" default="none" /></div>
</div>

