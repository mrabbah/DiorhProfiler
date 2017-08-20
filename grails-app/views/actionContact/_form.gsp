<%@ page import="com.rabbahsoft.diorhprofiler.ActionContact" %>
<%@ page import="com.rabbahsoft.diorhprofiler.FonctionDior" %>

<div class="row">
  <div class="col-sm-3"><label for="contact" class="control-label"><g:message code="actionContact.contact.label" default="Contact" /><span class="required-indicator">* :</span></label></div>
  <div class="col-sm-3"><g:select class="form-control" id="contact" name="contact.id" from="${com.rabbahsoft.diorhprofiler.Contact.list()}" optionKey="id" value="${contactinstance!=null ? contactinstance?.id : actionContactInstance?.contact?.id}" class="form-control" noSelection="['': 'Sélectionner...']"/></div>
  <div class="col-sm-3"><label for="responsable" class="control-label"><g:message code="actionContact.responsable.label" default="Consultant " /><span class="required-indicator">* :</span></label></div>
  <div class="col-sm-3"><g:select class="form-control" id="responsable" name="responsable.id" from="${com.rabbahsoft.diorhprofiler.Utilisateur.createCriteria().list() { eq("fonctionDior",FonctionDior.findByLibelle("Consultant(e)"))} }" optionKey="id"  value="${actionContactInstance?.responsable?.id}" class="form-control" noSelection="['': 'Sélectionner...']"/></div>   
</div>

<div class="row">
  <div class="col-sm-3"><label for="dateActionReelle" class="control-label"><g:message code="actionContact.dateAction.label" default="Date de l'action" /><span class="required-indicator">* :</span></label></div>
  <div class="col-sm-3"><g:textField type="text"  class="form-control" name="dateAction" id="dateAction" precision="day" value="${formatDate(format:'dd/MM/yyyy',date:actionContactInstance?.dateAction)}"  /></div>
  <div class="col-sm-3"><label for="statut" class="control-label"><g:message code="mission.statut.label" default="Statut" /><span class="required-indicator">* :</span></label></div>
  <div class="col-sm-3"><g:select class="form-control" name="statutAction" id="statutAction" from="${actionContactInstance.constraints.statutAction.inList}" value="${actionContactInstance?.statutAction}" valueMessagePrefix="actionContact.statutAction" noSelection="['': 'Sélectionner...']"/></div> 
</div>

<div class="row">
  <div class="col-sm-3"><label for="contenu" class="control-label"><g:message code="actionContact.contenu.label" default="Contenu" /></label></div>
  <div class="col-sm-3"><g:textArea class="form-control" name="contenu" id="contenu" cols="40" rows="5" maxlength="65535" value="${actionContactInstance?.contenu}"/></div>
</div>





