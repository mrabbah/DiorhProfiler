
<%@ page import="com.rabbahsoft.diorhprofiler.RechercheCandidat" %>
<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="kickstart" />
  <g:set var="entityName" value="${message(code: 'rechercheCandidat.label', default: 'RechercheCandidat')}" />
</head>

<body>

  <section id="list-rechercheCandidat" class="first">
    <div class="row">
      <div class="col-sm-12">
        <div class="panel panel-danger">
          <div class="panel-heading">
            <h3 class="panel-title"><span class='label label-danger'>Liste</span></h3>
          </div>
          <div class="panel-body">
            <table class="table table-striped table-bordered table-condensed">
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
          </div>
        </div>
      </div>
    </div>
  </section>
</body>

</html>
