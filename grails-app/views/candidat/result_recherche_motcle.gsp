<%@ page import="com.rabbahsoft.diorhprofiler.Candidat" %>
<%@ page import="com.rabbahsoft.diorhprofiler.Experience" %>
<%@ page import="com.rabbahsoft.diorhprofiler.Nationalite" %>
<%@ page import="com.rabbahsoft.diorhprofiler.ConnaissanceInformatique" %>
<%@ page import="org.springframework.util.ClassUtils" %>
<%@ page import="grails.plugin.searchable.internal.lucene.LuceneUtils" %>
<%@ page import="grails.plugin.searchable.internal.util.StringQueryUtils" %>
<%@ page import="com.macrobit.grails.plugins.attachmentable.domains.Attachment" %>
<%@ page import="com.macrobit.grails.plugins.attachmentable.domains.AttachmentLink" %>

<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="globallayout" />
    <title>Résultat recherche CV</title>
    <link href="css/bootstrap.css" rel="stylesheet">
<r:require modules="jquery-ui" />
    <script type="text/javascript">
        var focusQueryInput = function() {
            document.getElementById("motCle").focus();
        }
    </script>
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
    
});
  </script>
  </head>

  <body onload="focusQueryInput();">
  <g:if test="${!layout_nosecondarymenu}">
    <g:render template="submenubar"/>														
  </g:if>
  <section id="index-candidat" class="first">
    <div class="row">
      <div class="col-sm-12">
        <div class="panel panel-danger">
          <div class="panel-heading">
            <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class="label label-danger">Résultat de la recherche</span></h3>
          </div>
          <div class="panel-body">
            <div class="panel panel-danger">
              <div class="panel-body">
                <g:form url='[controller: "candidat", action: "result_recherche_motcle"]' id="searchableForm" name="searchableForm" method="get">
                  <div class="col-sm-3"><label for="libellerecherche" class="control-label"><g:message code="rechercheCandidat.libellerecherche.label" default="Mots clés" />:</label></div>
                  <div class="col-sm-3"><g:textField name="motCle" class="form-control" value="${params.motCle}" size="50"/></div>
                  <div class="col-sm-3"><input type="submit"class="btn btn-xs btn-danger" value="Lancer une nouvelle recherche" /></div>
                </g:form>
              </div>
            </div>
            <g:set var="haveQuery" value="${params.motCle?.trim()}" />
            <g:if test="${searchResult1}">
             <g:set var="searchResult" value="${searchResult1}" /> 
            </g:if>

            <g:set var="haveResults" value="${searchResult?.results}" />
            <div class="row">
              <table class="table table-striped table-bordered table-condensed">
               <thead>
                  <th></th>
                  <th></th>
                  <th></th>
<!--                <th>Nom et Prénom</th>-->
                <g:sortableColumn property="nomStockage" title="${message(code: 'candidat.nomStockage.label', default: 'Nom candidat')}" params='[motCle:"${params.motCle}"]' />
                <th>Experience Global</th>
                <th>Poste actuel</th>
                <th>Entreprise actuelle</th>
                <th>Profil</th>
                <th>Annotation</th>
                <th>Type</th>
                <th>Attachment</th>
                </thead>
                <tbody>
                <g:if test="${haveResults}">
                  <g:each var="result" in="${searchResult.results}" status="index">
                    <g:set var="className" value="${ClassUtils.getShortName(result.getClass())}" />
                    <g:set var="link" value="${createLink(controller: className[0].toLowerCase() + className[1..-1], action: 'show_motcle', id: result.id)}" />
                    <g:if test="${className == 'Attachment'}">
                 <g:set var="candidatinsctance1" value="${Candidat.get(Attachment.get(result.id).lnk.referenceId)}"/>
                 <g:set var="id1" value="${Attachment.get(result.id).lnk.referenceId}"/>
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
                  
                      
                      <td><a href="${createLink(controller: 'candidat', action: 'show_motcle', id: candidatinsctance1.id)}" target="_blank">${candidatinsctance1} </a></td>
                           <td  class="value">${candidat.plageExperience}</td>
                       <g:if test="${candidat.experiences!=null}">
          <g:set var="experience" value="${Experience.createCriteria().get{eq('candidat',candidat) max('dateDebut') maxResults(1)}}"/>
         <g:if test="${experience}">
          <td>${experience.poste}</td>
          <td>${experience.entreprise}</td>
        </g:if>
        <g:else>
          <td></td>
          <td></td>
        </g:else>
                       </g:if>
                      
                      
                      <td  class="value">${candidat.profil1}</td>
                      <td  class="value">${candidat.annotation1}</td>
                      <td>Attachement</td>
                      <td><a href="${createLink(controller: 'candidat', action: 'download', id: result.id)}">Télécharger l'attachement</a></td>
                      </tr>
                    </g:if>
              <g:if test="${className == 'Candidat'}">
                <g:set var="candidatInstance" value="${Candidat.findById(result.id)}" />
                <g:if test="${candidatInstance != null}">
                
                 <g:if test="${candidatInstance.experiences}">
          <g:set var="experience" value="${Experience.createCriteria().get{eq('candidat',candidatInstance) max('dateDebut') maxResults(1)}}"/>
        </g:if>
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
        <td  class="value"><g:link action="show_motcle" id="${candidatInstance.id}" id22="${i}" params="[index:i,list:'list']">${candidatInstance}</g:link></td>
        <td  class="value">${fieldValue(bean: candidatInstance, field: "plageExperience")}</td>
        <g:if test="${experience}">
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
                 </g:if>
<!--                    ajouter nationalite-->
                <g:if test="${className == 'Nationalite'}">
                   <g:if test="${result != null}">
                <g:set var="nationaliteInstance" value="${Nationalite.findById(result.id)}" />
                 <g:set var="candidats" value="${Candidat.findAll("from Candidat as book where nationalite_id = :author",[author: nationaliteInstance.id])}"/>
                <g:each var="candidatInstance" in="${candidats}" >
                 <g:if test="${candidatInstance != null}">
                
                 <g:if test="${candidatInstance.experiences}">
          <g:set var="experience" value="${Experience.createCriteria().get{eq('candidat',candidatInstance) max('dateDebut') maxResults(1)}}"/>
        </g:if>
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
        <td  class="value"><g:link action="show_motcle" id="${candidatInstance.id}" id22="${i}" params="[index:i,list:'list']">${candidatInstance}</g:link></td>
        <td  class="value">${fieldValue(bean: candidatInstance, field: "plageExperience")}</td>
        <g:if test="${experience}">
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
                 </g:if>
                   </g:if>

<!--                 fin   ajouter nationalite-->

<!--                    ajouter connaissinform-->
                <g:if test="${className == 'ConnaissanceInformatique'}">
                   <g:if test="${result != null}">
                <g:set var="nationaliteInstance" value="${ConnaissanceInformatique.findById(result.id)}" />
                 <g:set var="candidats" value="${Candidat.createCriteria().list {connaissancesInfo {eq("id", nationaliteInstance.id)}}}"/>
                <g:each var="candidatInstance" in="${candidats}" >
                 <g:if test="${candidatInstance != null}">
                
                 <g:if test="${candidatInstance.experiences}">
          <g:set var="experience" value="${Experience.createCriteria().get{eq('candidat',candidatInstance) max('dateDebut') maxResults(1)}}"/>
        </g:if>
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
        <td  class="value"><g:link action="show_motcle" id="${candidatInstance.id}" id22="${i}" params="[index:i,list:'list']">${candidatInstance}</g:link></td>
        <td  class="value">${fieldValue(bean: candidatInstance, field: "plageExperience")}</td>
        <g:if test="${experience}">
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
                 </g:if>
                   </g:if>

<!--                 fin   ajouter connais-->

                  </g:each>
                </g:if>
                </tbody>
              </table>
            </div>
            <g:if test="${haveQuery && !haveResults && !parseException}">
              <p>Désolé aucun résultat trouvé - <strong>${params.motCle}</strong></p>
              <g:if test="${!searchResult?.suggestedQuery}">
                <p>Suggestions:</p>
                <ul>
                  <li>Testez la requête suivante: <g:link controller="candidat" action="list_recherche" params="[motCle: params.motCle, suggestQuery: true]">Recherchez avec le mot clé suivant</g:link><br />          
                  </li>
                </ul>
              </g:if>
            </g:if>

            <g:if test="${searchResult?.suggestedQuery}">
              <p>Voulez vous dire? <g:link controller="candidat" action="list_recherche" params="[motCle: searchResult.suggestedQuery]">${StringQueryUtils.highlightTermDiffs(params.motCle.trim(), searchResult.suggestedQuery)}</g:link>?</p>
            </g:if>

            <g:if test="${parseException}">
              <p>Votre recherche - <strong>${params.motCle}</strong> - est invalide.</p>
              <p>Suggestions:</p>
              <ul>
                <li>Fixez votre requête: voir <a href="http://lucene.apache.org/core/2_9_4/queryparsersyntax.html">Lucene query syntax</a> pour plus d'exemple</li>
                <g:if test="${LuceneUtils.motCleueryHasSpecialCharacters(params.motCle)}">
                  <li>Remove special characters like <strong>" - [ ]</strong>, before searching, eg, <em><strong>${LuceneUtils.cleanQuery(params.motCle)}</strong></em><br />            
                  </li>
                  <li>Escape special characters like <strong>" - [ ]</strong> with <strong>\</strong>, eg, <em><strong>${LuceneUtils.escapeQuery(params.motCle)}</strong></em><br />
                  </li>
                </g:if>
              </ul>
            </g:if>
         <g:if test="${searchResult1}">
            <g:if test="${haveResults}">
              <div>
                <bs:paginate controller="candidat" action="result_recherche_motcle" params="[motCle: params.motCle]" total="${haveResults.size()}" prev="&lt; précédent" next="suivant &gt;"/>
              </div>
              <span class="countcandidat">Nombre total : ${haveResults.size()}</span>
          </div>
          </g:if>
            </g:if>
           <g:else>
              <g:if test="${haveResults}">
              <div>
                <bs:paginate controller="candidat" action="result_recherche_motcle" params="[motCle: params.motCle]" total="${searchResult.total}" prev="&lt; précédent" next="suivant &gt;"/>
              </div>
              <span class="countcandidat">Nombre total : ${searchResult.total}</span>
          </div>
          </g:if>
            </g:else>
        </div>
      </div>
    </div>
    <script src="js/bootstrap.js"></script>
     <script src="js/jquery.js"></script>
</body>
</html> 