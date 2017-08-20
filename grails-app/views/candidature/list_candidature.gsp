
<%@ page import="com.rabbahsoft.diorhprofiler.Candidature" %>
<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'candidature.label', default: 'Candidature')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>
  <g:javascript src="jquery-ui.min.js" />
</head>

<body>

  <section id="list-candidature" class="first">
    <div class="row">
      <div class="col-sm-12">
        <div class="panel panel-danger">
          <div class="panel-heading">
            <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class="label label-danger">Résultat de la recherche</span></h3>
          </div>
          <div class="panel-body">
            <table class="table table-striped table-bordered table-condensed">
              <thead>
                <tr>
              <g:sortableColumn property="nomprenomcandidat" title="${message(code: 'nomprenomcandidat.label', default: 'Nom Prenom candidat')}" />
              <th>${message(code: 'candidature.approche.label', default: 'approche')}</th>
              <th>${message(code: 'candidature.statutmission.label', default: 'Statut Mission')}</th>
              <th>${message(code: 'candidature.statutcandidature.label', default: 'Statut Candidature')}</th>

              </tr>
              </thead>
              <tbody>
              <g:each in="${candidatureInstanceList}" status="i" var="candidatureInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                  <td><g:link action="show" id="${candidatureInstance.id}">${candidatureInstance?.candidat?.encodeAsHTML()}</g:link></td>
                 <td>${candidatureInstance?.mission?.approche}</td>
                <td>${candidatureInstance?.mission?.statut}</td>
                <td>${candidatureInstance?.statut}</td>
                </tr>
              </g:each>
              </tbody>
            </table>
            <div>
              <bs:paginate total="${candidatureInstanceCount}" />
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</body>

</html>
