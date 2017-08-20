
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
<section id="list-mission" class="first">
    <div class="row">
    <div class="col-sm-12">
      <div class="panel panel-danger">
        <div class="panel-heading">
          <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class="label label-danger">Liste des missions</span></h3>
        </div>
        <div class="panel-body">
  <table class="table table-striped table-bordered table-condensed">
    <thead>
      <tr>
        <g:sortableColumn property="reference" title="${message(code: 'mission.reference.label', default: 'reference')}" />
<g:sortableColumn property="dateDemarrage" title="${message(code: 'mission.dateDemarrage.label', default: 'dateDemarrage')}" />
<g:sortableColumn property="contact" title="${message(code: 'mission.contact.label', default: 'contact')}" />
<g:sortableColumn property="consultant" title="${message(code: 'mission.consultant.label', default: 'consultant')}" />
<g:sortableColumn property="poste" title="${message(code: 'mission.poste.label', default: 'poste')}" />

    <g:sortableColumn property="etapeAvancement" title="${message(code: 'mission.etapeAvancement.label', default: 'etapeAvancement')}" />

<g:sortableColumn property="statut" title="${message(code: 'mission.statut.label', default: 'statut')}" />
    </tr>
    </thead>
    <tbody>
    <g:each in="${missionInstanceList}" status="i" var="missionInstance">
      <tr class="prop">
        <td><g:link action="show" id="${missionInstance.id}">${fieldValue(bean: missionInstance, field: "reference")}</g:link></td>
<td>${fieldValue(bean: missionInstance, field: "dateDemarrage")}</td>
<td>${fieldValue(bean: missionInstance, field: "contact")}</td>
<td>${fieldValue(bean: missionInstance, field: "consultant")}</td>
<td>${fieldValue(bean: missionInstance, field: "poste")}</td>
<td>${fieldValue(bean: missionInstance, field: "etapeAvancement")}</td>
   <td>${fieldValue(bean: missionInstance, field: "statut")}</td>

    

      </tr>
    </g:each>
    </tbody>
  </table>
  <div>
    <bs:paginate total="${missionInstanceCount}" />
  </div>
  </div>
  </div>
  </div>
</section>
</body>

</html>
