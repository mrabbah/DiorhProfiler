
<%@ page import="com.rabbahsoft.diorhprofiler.Profil" %>
<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'profil.label', default: 'Profil')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
<g:if test="${!layout_nosecondarymenu}">
  <g:render template="submenubar"/>														
</g:if>
<section id="list-profil" class="first">
  <div class="row">
    <div class="col-sm-12">
      <div class="panel panel-danger">
        <div class="panel-heading">
          <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class="label label-danger">Liste des profils</span></h3>
        </div>
        <div class="panel-body">
          <table class="table table-striped table-bordered table-condensed">
            <thead>
              <tr>

            <g:sortableColumn property="libelle" title="${message(code: 'profil.libelle.label', default: 'Libelle')}" />

            </tr>
            </thead>
            <tbody>
            <g:each in="${profilInstanceList}" status="i" var="profilInstance">
              <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
              <g:if test="${session.droits.MODIFIER_PROFIL != null}">
                <td><g:link action="edit" id="${profilInstance.id}">${fieldValue(bean: profilInstance, field: "libelle")}</g:link></td>
              </g:if>
              <g:else>
                <td>${fieldValue(bean: profilInstance, field: "libelle")}</td>
              </g:else>
              </tr>
            </g:each>
            </tbody>
          </table>
          <div>
            <bs:paginate total="${profilInstanceCount}" />
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>

</html>
