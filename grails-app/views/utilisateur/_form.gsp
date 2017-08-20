<%@ page import="com.rabbahsoft.diorhprofiler.Utilisateur" %>

<h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Utilisateur</span></h3>

<div class="row">
  <div class="col-sm-3"><label for="firstName" class="control-label"><g:message code="utilisateur.firstName.label" default="Prénom" /></label></div>
  <div class="col-sm-3"><g:textField class="form-control" name="firstName" id="firstName" value="${utilisateurInstance?.firstName}"/></div>
  <div class="col-sm-3"><label for="lastName" class="control-label"><g:message code="utilisateur.lastName.label" default="Nom" /></label></div>
  <div class="col-sm-3"><g:textField class="form-control" name="lastName" id="lastName" value="${utilisateurInstance?.lastName}"/></div>
</div>

<h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Droits</span></h3>

<div class="row">
  <div class="col-sm-3"><label for="profil" class="control-label"><g:message code="utilisateur.profil.label" default="Profil" /></label></div>
  <div class="col-sm-3"><g:select class="form-control" id="profil" name="profil.id" from="${com.rabbahsoft.diorhprofiler.Profil.list()}" optionKey="id" value="${utilisateurInstance?.profil?.id}" class="form-control" noSelection="['null': 'Sélectionner']"/></div>
  <div class="col-sm-3"><label for="fonctionDior" class="control-label"><g:message code="utilisateur.fonctionDior.label" default="Fonction" /></label></div>
  <div class="col-sm-3"><g:select class="form-control" id="fonctionDior" name="fonctionDior.id" from="${com.rabbahsoft.diorhprofiler.FonctionDior.list()}" optionKey="id" value="${utilisateurInstance?.fonctionDior?.id}" class="form-control" noSelection="['null': 'Sélectionner']"/></div>
</div>

<h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Authentification</span></h3>

<div class="row">
  <div class="col-sm-3"><label for="email" class="control-label"><g:message code="utilisateur.email.label" default="Adresse mail" /><span class="required-indicator">* :</span></label></div>
  <div class="col-sm-3"><g:field class="form-control" type="email" name="email" id="email"  value="${utilisateurInstance?.email}"/></div>
  <div class="col-sm-3"><label for="enabled" class="control-label"><g:message code="utilisateur.enabled.label" default="Activer l'utilisateur" /></label></div>
  <div class="col-sm-3"><input type="checkBox"  name="enabled" id="enabled" value="${utilisateurInstance?.enabled}" <g:if test="${utilisateurInstance?.enabled!=null && utilisateurInstance?.enabled==true}">checked</g:if>/></div>
</div>

<div class="row">
  <div class="col-sm-3"><g:message code="mail.emails.label" default="Emails" />:</div>
  <div class="col-sm-9"><input type="text" id="adresseIp" name="adresseIp" value="${params.action=="create" ? "81.192.114.12,41.214.132.134" : utilisateurInstance?.adresseIp}" data-role="tagsinput" placeholder="Ajouter une adresse Ip" /></div>
</div>
