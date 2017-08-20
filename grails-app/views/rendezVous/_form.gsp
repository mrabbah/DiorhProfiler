<%@ page import="com.rabbahsoft.diorhprofiler.RendezVous" %>

<h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Informations du RDV</span></h3>
<div class="row">
<div class="col-sm-3"><label for="dateRdv" class="control-label"><g:message code="rendezVous.dateRdv.label" default="Date Rdv" /><span class="required-indicator">* :</span></label></div>
<div class="col-sm-3"><g:textField type="text" class="form-control" name="dateRdv" id="dateRdv" precision="day"  value="${formatDate(format:'dd/MM/yyyy',date:rendezVousInstance?.dateRdv)}"  /></div>
<div class="col-sm-3"><label for="typage" class="control-label"><g:message code="rendezVous.typage.label" default="Typage" /><span class="required-indicator">* :</span></label></div>
<div class="col-sm-3"><g:select class="form-control" id="typage" name="typage.id" from="${com.rabbahsoft.diorhprofiler.TypeRendezvous.list()}" optionKey="id" value="${rendezVousInstance?.typage?.id}" class="form-control"/></div>
</div>

<div class="row">
<div class="col-sm-3"><label for="emplacement" class="control-label"><g:message code="rendezVous.emplacement.label" default="Emplacement" /></label></div>
<div class="col-sm-3"><g:textArea class="form-control" name="emplacement" cols="40" rows="5" maxlength="400" value="${rendezVousInstance?.emplacement}"/></div>
<div class="col-sm-3"><label for="commentaire" class="control-label"><g:message code="rendezVous.commentaire.label" default="Commentaire" /></label></div>
<div class="col-sm-3"><g:textArea class="form-control" name="commentaire" cols="40" rows="5" maxlength="65535" value="${rendezVousInstance?.commentaire}"/></div>
</div>

<h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Participants</span></h3> 

<div class="row">
<div class="col-sm-3"><label for="contact" class="control-label"><g:message code="rendezVous.contact.label" default="Contact" /><span class="required-indicator">* :</span></label></div>
<div class="col-sm-3"><g:select class="form-control" id="contact" name="contact.id" from="${com.rabbahsoft.diorhprofiler.Contact.list()}" optionKey="id" required="" value="${rendezVousInstance?.contact?.id}" class="form-control"/></div>
<div class="col-sm-3"><label for="candidat" class="control-label"><g:message code="rendezVous.candidat.label" default="Candidat" /><span class="required-indicator">* :</span></label></div>
<div class="col-sm-3"><g:select class="form-control" id="candidat" name="candidat.id" from="${com.rabbahsoft.diorhprofiler.Candidat.list()}" optionKey="id" required="" value="${rendezVousInstance?.candidat?.id}" class="form-control"/></div>
</div>

<div class="row">
<div class="col-sm-3"><label for="utilisateur" class="control-label"><g:message code="rendezVous.utilisateur.label" default="Utilisateur" /><span class="required-indicator">* :</span></label></div>
<div class="col-sm-3"><g:select class="form-control" id="utilisateur" name="utilisateur.id" from="${com.rabbahsoft.diorhprofiler.Utilisateur.list()}" optionKey="id" required="" value="${rendezVousInstance?.utilisateur?.id}" class="form-control"/></div>
</div>