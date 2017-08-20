
<%@ page import="com.rabbahsoft.diorhprofiler.Mission" %>
<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'mission.label', default: 'Mission')}" />
  <g:javascript src="jquery-ui.min.js" />
</head>

<body>
<g:if test="${!layout_nosecondarymenu}">
  <g:render template="submenubar"/>														
</g:if>
<section id="list-annonce" class="first">
  <div class="row">
    <div class="col-sm-12">
      <div class="panel panel-danger">
        <div class="panel-heading">
          <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class="label label-danger">Liste des annonces</span></h3>
        </div>
        <div class="panel-body">
          <table class="table table-striped table-bordered table-condensed">
            <thead>
              <tr>

            <g:sortableColumn property="datePublication" title="${message(code: 'mission.datePublication.label', default: 'Date de Publication')}" />

            <g:sortableColumn property="poste" title="${message(code: 'mission.poste.label', default: 'Poste proposé')}" />

            <g:sortableColumn property="localisation" title="${message(code: 'mission.localisation.label', default: 'Localisation')}" />

            <g:sortableColumn property="descriptifPoste" title="${message(code: 'mission.descriptifPoste.label', default: 'Description du poste')}" />


            </tr>
            </thead>
            <tbody>
            <g:each in="${missionInstanceList}" status="i" var="missionInstance">
              <tr class="prop">

                <td width="130">${fieldValue(bean: missionInstance, field: "datePublication")}</td>

                <td width="140"><g:link controller="annonce" action="show" id="${missionInstance.id}">${fieldValue(bean: missionInstance, field: "poste")}</g:link></td>

              <td width="140">${fieldValue(bean: missionInstance, field: "localisation")}</td>

              <td>
              <g:if test='${missionInstance?.descriptifPoste==null || missionInstance?.descriptifPoste.length()<120}'>
              ${raw(missionInstance?.descriptifPoste)}
              </g:if>
              <g:else>
              ${raw(missionInstance?.descriptifPoste.substring(0,120)+ "...")}
              </g:else>
              </td>

              </tr>
            </g:each>
            </tbody>
          </table>
          <div>
            <bs:paginate total="${missionInstanceCount}" />
          </div>
          <span class="countcandidat">Nombre total : ${missionInstanceCount}</span> 
        </div>
      </div>
    </div>
  </div>
</section>
</body>

</html>
