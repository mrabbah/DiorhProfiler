<%@ page import="com.rabbahsoft.diorhprofiler.Contact" %>

<div class="row">
  <div class="col-sm-3"><label for="raisonSociale" class="control-label"><g:message code="contact.raisonSociale.label" default="Raison Sociale" /><span class="required-indicator">* :</span></label></div>
  <div class="col-sm-9"><g:textField class="form-control" name="raisonSociale" id="raisonSociale" maxlength="60" value="${contactInstance?.raisonSociale}"/></div>			
</div>

<div class="row">
  <div class="col-sm-3"><label for="secteurActivite" class="control-label"><g:message code="contact.secteurActivite.label" default="Secteur Activite" /></label></div>
  <div class="col-sm-9"><g:select data-placeholder="" multiple class="chosen-select" id="secteurActivite" name="secteurActivite.id" from="${com.rabbahsoft.diorhprofiler.SecteurActivite.list()}" optionKey="id" value="${contactInstance?.secteurActivite?.id}" style="width:100%;"/></div>
</div>

<div class="row">
  <div class="col-sm-3"><label for="typeEntreprise" class="control-label"><g:message code="contact.typeEntreprise.label" default="Type d'entrprise" /></label></div>
  <div class="col-sm-9"><g:select data-placeholder=""  multiple class="chosen-select form-control" id="typeEntreprise" name="typeEntreprise.id" from="${com.rabbahsoft.diorhprofiler.TypeEntreprise.list()}" optionKey="id" value="${contactInstance?.typeEntreprise?.id}" noSelection="['null': '']" style="width:100%;"/></div>
</div>

<div class="row">
  <div class="col-sm-3"><label for="typeEntreprise" class="control-label"><g:message code="contact.type.label" default="Type d'entrprise" /></label></div>
  <div class="col-sm-9"><g:select data-placeholder=""  multiple class="chosen-select form-control" name="type" id="type" from="${Contact.constraints.type.inList}" value="${contactInstance?.type}" valueMessagePrefix="contact.type" noSelection="['null': '']" style="width:100%;"/></div>
</div>

