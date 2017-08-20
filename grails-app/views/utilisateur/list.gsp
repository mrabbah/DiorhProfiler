
<%@ page import="com.rabbahsoft.diorhprofiler.Utilisateur" %>
<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'utilisateur.label', default: 'Utilisateur')}" />
</head>

<body>
<g:if test="${!layout_nosecondarymenu}">
  <g:render template="submenubar"/>														
</g:if>
<section id="list-utilisateur" class="first">
  <div class="row">
    <div class="col-sm-12">
      <div class="panel panel-danger">
        <div class="panel-heading">
          <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class="label label-danger">Liste des utilisateurs</span></h3>
        </div>
        <div class="panel-body">
          <table class="table table-striped table-bordered table-condensed">
            <thead>
              <tr>

            <g:sortableColumn property="firstName" title="${message(code: 'utilisateur.firstName.label', default: 'Prénom')}" />

            <g:sortableColumn property="lastName" title="${message(code: 'utilisateur.lastName.label', default: 'Nom')}" />

            <g:sortableColumn property="email" title="${message(code: 'utilisateur.email.label', default: 'Email')}" />

            <th><g:message code="utilisateur.profil.label" default="Profil" /></th>

            <th><g:message code="utilisateur.fonctionDior.label" default="Fonction" /></th>

            <th><g:message code="utilisateur.etat.label" default="Acitivé" /></th>

            </tr>
            </thead>
            <tbody>
            <g:each in="${utilisateurInstanceList}" status="i" var="utilisateurInstance">
              <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
              <g:if test="${session.droits.CONSULTER_UTILISATEUR != null}">
                <td><g:link action="show" id="${utilisateurInstance.id}">${fieldValue(bean: utilisateurInstance, field: "firstName")}</g:link></td>
              </g:if>
              <g:else>
                <td>${fieldValue(bean: utilisateurInstance, field: "firstName")}</td>
              </g:else>
              <td>${fieldValue(bean: utilisateurInstance, field: "lastName")}</td>

              <td>${fieldValue(bean: utilisateurInstance, field: "email")}</td>

              <td>${fieldValue(bean: utilisateurInstance, field: "profil")}</td>

              <td>${fieldValue(bean: utilisateurInstance, field: "fonctionDior")}</td>

              <g:if test="${utilisateurInstance.enabled}">
                <td><span class="label label-info">OUI</span></td>
              </g:if>
              <g:else>
                <td><span class="label label-warning">NON</span></td>
              </g:else>
              </tr>
            </g:each>
            </tbody>
          </table>
          <div>
            <bs:paginate total="${utilisateurInstanceCount}" />
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>

</html>
