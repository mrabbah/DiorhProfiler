<%@ page import="com.rabbahsoft.diorhprofiler.Candidat" %>
<%@ page import="com.rabbahsoft.diorhprofiler.Experience" %>
<%@ page import="org.springframework.util.ClassUtils" %>
<%@ page import="grails.plugin.searchable.internal.lucene.LuceneUtils" %>
<%@ page import="grails.plugin.searchable.internal.util.StringQueryUtils" %>
<%@ page import="com.macrobit.grails.plugins.attachmentable.domains.Attachment" %>
<%@ page import="com.macrobit.grails.plugins.attachmentable.domains.AttachmentLink" %>
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
          <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class="label label-danger">Résultat de la recherche combiner</span></h3>
        </div>
        <div class="panel-body">
          <div class="panel panel-danger">
            <div class="panel-body">
              <g:form url='[controller: "candidat", action: "enregistrer_recherche_combiner"]' id="enregistrerrecherche" name="enregistrerrecherche" method="get">
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
            <th>Poste actuel</th>
            <th>Entreprise actuelle</th>
            <g:sortableColumn property="profil1" title="${message(code: 'candidat.profil1.label', default: 'Nom candidat')}" />
            <g:sortableColumn property="annotation1" title="${message(code: 'candidat.annotation1.label', default: 'Nom candidat')}" />
            
            
            <g:sortableColumn property="type" title="${message(code: 'candidat.type.label', default: 'Type class')}" />
            
            
            
            </tr>
            </thead>
            <tbody>
            <g:each in="${candidatInstanceList}" status="i" var="candidatInstance">
              <g:set var="className" value="${ClassUtils.getShortName(candidatInstance.getClass())}" />
                    <g:set var="link" value="${createLink(controller: className[0].toLowerCase() + className[1..-1], action: 'show', id: candidatInstance.id)}" />
                    <g:if test="${className == 'Attachment'}">
                 <g:set var="candidatinsctance1" value="${Candidat.get(Attachment.get(candidatInstance.id).lnk.referenceId)}"/>
                 <g:set var="id1" value="${Attachment.get(candidatInstance.id).lnk.referenceId}"/>
                 <g:set var="candidat" value="${Candidat.createCriteria().get{eq('id',id1)}}"/>
                  <tr class="prop">
                     <g:if test='${session.candidatsSelectedMap["${candidatinsctance1.id}"] == null || session.candidatsSelectedMap["${candidatinsctance1.id}"] == false }'>
          <td class="value"><input type="checkbox" name="idcandidat[]" id="${idcandidat}" value="" /></td>
        </g:if>
        <g:else>
          <td class="value"><input type="checkbox" name="idcandidat[]" id="${idcandidat}" value="" checked="true" /></td>
        </g:else>
         <g:if test='${candidat.profil1==null || candidat.annotation1==null || candidat.profil2==null || candidat.annotation2==null}'>
          <td class="value"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'bullet_red.png')}" width="10px" height="10px"/></td>
        </g:if>
        <g:else>
          <td  class="value"></td>   
        </g:else>
        <g:if test='${!session.candidatsshow.contains(Long.parseLong("${candidat.id}"))}'>
          <td  class="value"></td>
        </g:if>
        <g:else>
          <td  class="value"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'eye.png')}" width="10px" height="10px"/></td>
        </g:else>      
                  
                      
                      <td><a href="${createLink(controller: 'candidat', action: 'show', id: candidatinsctance1.id)}" target="_blank">${candidatinsctance1}</a></td>
                           <td  class="value">${candidat.plageExperience}</td>
                       <g:if test="${candidat.experiences}">
          <g:set var="experience" value="${Experience.createCriteria().get{eq('candidat',candidat) max('dateDebut') maxResults(1)}}"/>
        </g:if>
                       <g:if test="${experience}">
          <td>${experience.poste}</td>
          <td>${experience.entreprise}</td>
        </g:if>
        <g:else>
          <td></td>
          <td></td>
        </g:else>
                      
                      <td  class="value">${candidat.profil1}</td>
                      <td  class="value">${candidat.annotation1}</td>
                      <td>Attachement</td>
                      <td><a href="${createLink(controller: 'candidat', action: 'download', id: candidatInstance.id)}">Télécharger l'attachement</a></td>
                      </tr>
                    </g:if>
              <g:if test="${className == 'Candidat'}">
                
<!--                <g:set var="candidatinstance1" value="${Candidat.get(candidatInstance.id)}"/>-->
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
        <td  class="value"><g:link action="show" id="${candidatInstance.id}" id22="${i}" params="[index:i,list:'list' ]">${candidatInstance} </g:link></td>
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
        <td  class="value">Candidat</td>
        <td  class="value"></td>
        </tr> 
        </g:if>
             
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
