
<%@ page import="com.rabbahsoft.diorhprofiler.Profil" %>
<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'profil.label', default: 'Profil')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
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
<section id="show-profil" class="first">
  <div class="row">
    <div class="col-sm-12">
      <div class="panel panel-danger">
        <div class="panel-heading">
          <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class="label label-danger">Détail du profil</span></h3>
        </div>
        <div class="panel-body">
          <table class="table table-striped table-bordered table-condensed">
            <tbody>

              <tr class="prop">
                <td valign="top" class="name"><g:message code="profil.libelle.label" default="Libelle" /></td>
                <td valign="top" class="value">${fieldValue(bean: profilInstance, field: "libelle")}</td>
             </tr>

            <tr class="prop">
              <td valign="top" class="name"><g:message code="profil.droits.label" default="Droits" /></td>
              <td valign="top" style="text-align: left;" class="value">
              <ul>
                <g:each in="${profilInstance.droits}" var="d">
                  <li><g:link controller="droit" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
                </g:each>
              </ul>
            </td>

            </tr>

            <tr class="prop">
              <td valign="top" class="name"><g:message code="profil.utilisateurs.label" default="Utilisateurs" /></td>

            <td valign="top" style="text-align: left;" class="value">
              <ul>
                <g:each in="${profilInstance.utilisateurs}" var="u">
                  <li><g:link controller="utilisateur" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
                </g:each>
              </ul>
            </td>

            </tr>

            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</section>

</body>

</html>
