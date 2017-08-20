

<%@ page import="com.rabbahsoft.diorhprofiler.Candidat" %>
<%@ page import="com.rabbahsoft.diorhprofiler.Experience" %>
<%@page defaultCodec="none" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'candidat.label', default: 'Candidat')}" />
  <g:javascript src="jquery.js" />
  <g:javascript src="jquery-ui.min.js" />
  <g:javascript src="validercandidat.js" />
  <g:javascript src="initcandidat.js" />
</head>

<body>
  <section id="index-candidat" class="first">
    <g:if test="${!layout_nosecondarymenu}">
      <g:render template="submenubar"/>														
    </g:if>
    <g:form name="recherchecandidarmail" action="">
      <div class="row">
        <div class="col-sm-12">
          <div class="panel panel-danger">
            <div class="panel-heading">
              <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class='label label-danger'>Liste des candidats</span></h3>
            </div>
            <div class="panel-body">
              <table class="table table-striped table-bordered table-condensed">
                <thead>
                  <tr>
                <g:sortableColumn property="nomStockage" title="${message(code: 'candidat.nomStockage.label', default: 'Nom candidat')}" />
                <g:sortableColumn property="plageExperience" title="${message(code: 'candidat.plageExperience.label', default: 'Expérience globale ')}" />
                <th>Poste actuel</th>
                <th>Entreprise actuelle</th>
                <g:sortableColumn property="profil1" title="${message(code: 'candidat.profil1.label', default: 'Nom candidat')}" />
                <g:sortableColumn property="annotation1" title="${message(code: 'candidat.annotation1.label', default: 'Nom candidat')}" />
                </tr>
                </thead>
                <tbody>
                <g:each in="${candidatInstanceList}" status="i" var="candidatInstance">
                  
                  <tr class="prop">
                    <td  class="value">
                    <g:if test="${session.droits !=null && session.droits.CONSULTER_CANDIDAT != null}">
                  <g:link action="show_listnormal" id="${candidatInstance.id}" id22="${i}" params="[index:i,list:'list' ]">${candidatInstance}</g:link>
                    </g:if>
                  <g:else>
                    ${candidatInstance}
                  </g:else>
                   </td>
                  <td  class="value">${fieldValue(bean: candidatInstance, field: "plageExperience")}</td>
                  
                  <g:if test="${candidatInstance.experiences}">
                    <g:set var="experience" value="${Experience.createCriteria().get{eq('candidat',candidatInstance) max('dateDebut') maxResults(1)}}"/>
                   <td>${experience.poste}</td>
                    <td>${experience.entreprise}</td>
                  </g:if>
                  <g:else>
                    <td></td>
                    <td></td>
                  </g:else>
                  <td  class="value">${fieldValue(bean: candidatInstance, field: "profil1")}</td>
                  <td  class="value">${fieldValue(bean: candidatInstance, field: "annotation1")}</td>
                  </tr>
                </g:each>
                </tbody>
              </table>
              </g:form>
              <div>
                <bs:paginate total="${candidatInstanceCount}" />
              </div>
              <span class="countcandidat">Nombre total : ${candidatInstanceCount}</span>
                              </div>
                </div>
                </div>
                </div>
              </section>

              </body>
              </html>
