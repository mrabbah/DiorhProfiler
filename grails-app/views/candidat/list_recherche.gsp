<%@ page import="com.rabbahsoft.diorhprofiler.Candidat" %>
<%@ page import="com.rabbahsoft.diorhprofiler.Experience" %>
<%@page defaultCodec="none" %>
<!DOCTYPE html>
<html>
  <head>
    <link href="css/bootstrap.css" rel="stylesheet">
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'candidat.label', default: 'Candidat')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>
  <r:require modules="jquery-ui" />
  <g:javascript src="validerrecherche.js" />
  <script type="text/javascript">
   $(function(){
   $("input[type='checkbox']").click(function(){
        var state;
       if (this.checked) {
        state="checked";
        }
        else {
        state="unchecked";
        }
       $.post("/DiorhProfiler/Candidat/testcheck",
            {
              value:this.id,
              state:state
            },
             function(data) {
             alert(data); 
            }
          );
  });
  $("input[type='checkbox']").click(function(){
        var state;
       if (this.checked) {
        state="checked";
        }
        else {
        state="unchecked";
        }
       $.post("/DiorhProfiler/Candidat/testcheck1",
            {
              value:this.id,
              state:state
            },
             function(data) {
             alert(data); 
            }
          );
  });
    
});
  </script>
  <STYLE type="text/css">
button-standard{
WIDTH: 350px;}
</STYLE>
</head>

<body>
<g:if test="${!layout_nosecondarymenu}">
  <g:render template="submenubar"/>														
</g:if>
<section id="index-candidat" class="first">
    <div id="messageerreur"></div>
  <div class="row">
    <div class="col-sm-12">
      <div class="panel panel-danger">
        <div class="panel-heading">
          <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class="label label-danger">Résultat de la recherche</span></h3>
        </div>
        <div class="panel-body">
          <div class="panel panel-danger">
            <div class="panel-body">
              <g:form url='[controller: "candidat", action: "enregistrer_recherche"]' id="enregistrerrecherche" name="enregistrerrecherche" method="get">
                <div class="col-sm-3"><label for="libellerecherche" class="control-label"><g:message code="rechercheCandidat.libellerecherche.label" default="libellerecherche" />:</label></div>
                <div class="col-sm-3"> <g:textField class="form-control" id="libellerecherche" name="libellerecherche" value="${session.libellerecherche}"/></div>
                <div class="col-sm-3"><g:submitButton class="btn btn-xs btn-danger" onclick="validerlibelle(); return false;" name="Enregistrer cette recherche"  /></div>
            </g:form>
              <g:form url='[controller: "candidat", action: "retour"]'  name="retour" method="get" >
                <input type="hidden" name="etape" value="retour" />
                <div class="col-sm-3"><g:submitButton class="btn btn-xs btn-danger"  name="Retour vers creation recherche" width="300px" /></div>
                
            </g:form>
          </div>
        </div>
        <g:form name="recherchecandidarmail" action="">
          <table class="table table-striped table-bordered table-condensed">
            <thead>
              <tr>
                <th></th>
                <th></th>
                <th></th>
            <g:sortableColumn property="nomStockage" title="${message(code: 'candidat.nomStockage.label', default: 'Nom candidat')}" />
            <g:sortableColumn property="plageExperience" title="${message(code: 'candidat.plageExperience.label', default: 'Expérience globale ')}" />
            <th>Poste actuel1</th>
            <th>Entreprise actuelle1</th>
            <g:sortableColumn property="profil1" title="${message(code: 'candidat.profil1.label', default: 'Nom candidat')}" />
            <g:sortableColumn property="annotation1" title="${message(code: 'candidat.annotation1.label', default: 'Nom candidat')}" />
            </tr>
            </thead>
            <tbody>
            <g:each in="${candidatInstanceList}" status="i" var="candidatInstance">
        <tr class="prop">
        <g:if test='${session.candidatsSelectedMap["${candidatInstance.id}"] == null || session.candidatsSelectedMap["${candidatInstance.id}"] == false }'>
          <td class="value"><input type="checkbox" name="idcandidat[]" id="${candidatInstance.id}" value="" /></td>
        </g:if>
        <g:else>
          <td class="value"><input type="checkbox" name="idcandidat[]" id="${candidatInstance.id}" value="" checked="true" /></td>
        </g:else>
        <g:if test='${candidatInstance.profil1==null || candidatInstance.annotation1==null || candidatInstance.profil2==null || candidatInstance.annotation2==null}'>
          <td class="value"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'bullet_red.png')}" width="10px" height="10px"/></td>
        </g:if>
        <g:else>
          <td  class="value"></td>   
        </g:else>
        <g:if test='${!session.candidatsshow.contains(Long.parseLong("${candidatInstance.id}"))}'>
          <td  class="value"></td>
        </g:if>
        <g:else>
          <td  class="value"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'eye.png')}" width="10px" height="10px"/></td>
        </g:else>
        <td  class="value"><g:link action="show" id="${candidatInstance.id}" id22="${i}" params="[index:i,list:'list',recherchenormale:'criteria' ]">${candidatInstance} </g:link></td>
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
<r:layoutResources />
<script src="js/bootstrap.js"></script>
     <script src="js/jquery.js"></script>
</body>
</html>
