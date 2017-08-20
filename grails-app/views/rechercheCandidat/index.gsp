
<%@ page import="com.rabbahsoft.diorhprofiler.RechercheCandidat" %>
<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="kickstart" />
  <g:set var="entityName" value="${message(code: 'rechercheCandidat.label', default: 'RechercheCandidat')}" />
  <title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

  <section id="index-rechercheCandidat" class="first">

    <table class="table table-bordered margin-top-medium">
      <thead>
        <tr>

      <g:sortableColumn property="libellerecherche" title="${message(code: 'rechercheCandidat.libellerecherche.label', default: 'Libellerecherche')}" />

      <g:sortableColumn property="nomStockage" title="${message(code: 'rechercheCandidat.nomStockage.label', default: 'Nom Stockage')}" />

      <g:sortableColumn property="prenomStockage" title="${message(code: 'rechercheCandidat.prenomStockage.label', default: 'Prenom Stockage')}" />

      <th><g:message code="rechercheCandidat.civilite.label" default="Civilite" /></th>

      <g:sortableColumn property="ageMin" title="${message(code: 'rechercheCandidat.ageMin.label', default: 'Age Min')}" />

      <g:sortableColumn property="ageMax" title="${message(code: 'rechercheCandidat.ageMax.label', default: 'Age Max')}" />

      </tr>
      </thead>
      <tbody>
      <g:each in="${rechercheCandidatInstanceList}" status="i" var="rechercheCandidatInstance">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

          <td><g:link action="show" id="${rechercheCandidatInstance.id}">${fieldValue(bean: rechercheCandidatInstance, field: "libellerecherche")}</g:link></td>

        <td>${fieldValue(bean: rechercheCandidatInstance, field: "nomStockage")}</td>

        <td>${fieldValue(bean: rechercheCandidatInstance, field: "prenomStockage")}</td>

        <td>${fieldValue(bean: rechercheCandidatInstance, field: "civilite")}</td>

        <td>${fieldValue(bean: rechercheCandidatInstance, field: "ageMin")}</td>

        <td>${fieldValue(bean: rechercheCandidatInstance, field: "ageMax")}</td>

        </tr>
      </g:each>
      </tbody>
    </table>
    <div>
      <bs:paginate total="${rechercheCandidatInstanceCount}" />
    </div>
  </section>

</body>

</html>
