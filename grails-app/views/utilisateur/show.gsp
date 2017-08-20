
<%@ page import="com.rabbahsoft.diorhprofiler.Utilisateur" %>
<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'utilisateur.label', default: 'Utilisateur')}" />
  <style type="text/css" media="screen">
@media screen and (min-width: 768px) {
.modal-dialog {
width: 300px;
margin: 30px auto;
}
    .modal-content {
      -webkit-box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
    }
    }
  </style>
</head>

<body>
 <g:if test="${!layout_nosecondarymenu}">
  <g:render template="submenubar"/>														
</g:if>
  <section id="show-utilisateur" class="first">
    <div class="row">
      <div class="col-sm-12">
        <div class="panel panel-danger">
          <div class="panel-heading">
            <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class="label label-danger">Détail d'un utilisateur</span></h3>
          </div>
          <div class="panel-body">
            <table class="table table-striped table-bordered table-condensed">
              <tbody>

                <tr class="prop">
                  <td valign="top" class="name"><g:message code="utilisateur.firstName.label" default="Prénom" /></td>
              <td valign="top" class="value">${fieldValue(bean: utilisateurInstance, field: "firstName")}</td>
              </tr>
              <tr class="prop">
                <td valign="top" class="name"><g:message code="utilisateur.lastName.label" default="Nom" /></td>
              <td valign="top" class="value">${fieldValue(bean: utilisateurInstance, field: "lastName")}</td>
              </tr>

              <tr class="prop">
                <td valign="top" class="name"><g:message code="utilisateur.email.label" default="Adresse mail" /></td>
              <td valign="top" class="value">${fieldValue(bean: utilisateurInstance, field: "email")}</td>
              </tr>

              <tr class="prop">
                <td valign="top" class="name"><g:message code="utilisateur.profil.label" default="Profil" /></td>
              <td valign="top" class="value">${utilisateurInstance?.profil?.encodeAsHTML()}</td>
              </tr>

              <tr class="prop">
                <td valign="top" class="name"><g:message code="utilisateur.fonctionDior.label" default="Fonction" /></td>
              <td valign="top" class="value">${utilisateurInstance?.fonctionDior?.encodeAsHTML()}</td>
              </tr>

              <tr class="prop">
              <td valign="top" class="name"><g:message code="utilisateur.enabled.label" default="Etat" /></td>
              <td valign="top" class="value"><g:formatBoolean boolean="${utilisateurInstance?.enabled}" /></td>
              </tr>
    
              <tr class="prop">
              <td valign="top" class="name"><g:message code="utilisateur.enabled.label" default="Adresses Ip" /></td>
              <td valign="top" class="value"><strong>${utilisateurInstance?.adresseIp}</strong></td>
              </tr>
              </tbody>
            </table>
          <g:if test="${session.droits.MODIFIER_UTILISATEUR != null}">
              <div class="clearfix">
    <g:link action="edit" id="${params.id}"><strong><g:message code="default.button.modifierutilisateur.label"  default="Modifier utilisateur"/></strong></g:link>
    <g:link action="changemotPasse" id="${params.id}"><strong><g:message code="default.button.modifiermotpasseutilisateur.label"  default="Modifier Mot de Passe"/></strong></g:link>
              </div>
            </g:if>
          </div>
           
        </div>
      </div>
    </div>
  </section>
</body>
</html>
