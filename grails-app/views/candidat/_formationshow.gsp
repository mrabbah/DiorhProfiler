<%@ page import="com.rabbahsoft.diorhprofiler.FormationCandidat" %>
<div id="formation${i}" class="formation-div" <g:if test="${hidden}">style="display:none;"</g:if>>
  <g:hiddenField name='formationcandidats[${i}].id' value='${formationcandidat?.id}'/>
  <g:hiddenField name='formationcandidats[${i}].deleted' value='false'/>
  <g:hiddenField name='formationcandidats[${i}].new' value="${formationcandidat?.id == null?'true':'false'}"/>
  <g:hiddenField name='formationcandidats[${i}].diplome.id' id="formationcandidats[${i}].diplome" value="${formationcandidat?.diplome?.id}"/>
  <g:hiddenField name='formationcandidats[${i}].intituleDiplome' id="formationcandidats[${i}].intituleDiplome" value="${formationcandidat?.intituleDiplome}"/>
  <g:hiddenField name='formationcandidats[${i}].annee' id="formationcandidats[${i}].annee" value="${formationcandidat?.annee}"/>
  <g:hiddenField name='formationcandidats[${i}].optionFormation' id="formationcandidats[${i}].optionFormation" value="${formationcandidat?.optionFormation}"/>
  <g:hiddenField name='formationcandidats[${i}].etablissement' id="formationcandidats[${i}].etablissement" value="${formationcandidat?.etablissement}"/>
  <g:hiddenField name='formationcandidats[${i}].typeEtablissement.id' id="formationcandidats[${i}].typeEtablissement" value="${formationcandidat?.typeEtablissement?.id}"/>
  <g:hiddenField name='formationcandidats[${i}].ville.id' id="formationcandidats[${i}].ville" value="${formationcandidat?.ville?.id}"/>
  <g:hiddenField name='formationcandidats[${i}].description' id="formationcandidats[${i}].description" value="${formationcandidat?.description}"/>
  <div class="row table-bordered2 even">
    <div class="col-sm-1 fontrowtabledetail" id='formationcandidats[${i}].anneeshow'>
${formationcandidat?.annee}
    </div>
    <g:if test="${formationcandidat?.diplome!=null || formationcandidat?.diplome!='null' || formationcandidat?.diplome!=''}">
    <div class="col-sm-2 fontrowtabledetail" id='formationcandidats[${i}].intituleDiplomeshow'>
<strong>${formationcandidat?.diplome}</strong>-
    </div>
      </g:if>
    <g:else>
      - -
    </g:else>
    <g:if test="${formationcandidat?.intituleDiplome!=null && formationcandidat?.intituleDiplome!='null' && formationcandidat?.intituleDiplome!=''}">
      <div class="col-sm-2 fontrowtabledetail" id='formationcandidats[${i}].intituleDiplomeshow'>
<strong>${formationcandidat?.intituleDiplome}</strong></br>
    </div>
      </g:if>
    <g:if test="${formationcandidat?.etablissement!=null && formationcandidat?.etablissement!='null' && formationcandidat?.etablissement!=''}">
      <div class="col-sm-2 fontrowtabledetail" id='formationcandidats[${i}].intituleDiplomeshow'>
${formationcandidat?.etablissement}
    </div>
     </g:if> 
       <g:if test="${formationcandidat?.typeEtablissement!=null  && formationcandidat?.typeEtablissement!='null' && formationcandidat?.typeEtablissement!=''}">
      <div class="col-sm-2 fontrowtabledetail" id='formationcandidats[${i}].intituleDiplomeshow'>
${formationcandidat?.typeEtablissement}
    </div>
     </g:if> 
    <g:if test="${formationcandidat?.ville!=null && formationcandidat?.ville!='null' && formationcandidat?.ville!=''}">
      <div class="col-sm-2 fontrowtabledetail" id='formationcandidats[${i}].intituleDiplomeshow'>
${formationcandidat?.ville}
    </div>
     </g:if> 
    <div class="col-sm-1 pull-right">
      <span>
        <a data-toggle="modal" data-backdrop="static"  id="update" onclick="javascript:updateformation(this.id,'${i}');" data-target="#formation">
          <img src="${resource(dir:'images/icon', file:'edit.png')}"
               style="vertical-align:middle;" width="18px" height="18px"/>
        </a>
      </span>
       <span class="del-formationcandidat">
        <img src="${resource(dir:'images/icon', file:'delete-item.png')}" 
             style="vertical-align:middle;" width="18px" height="18px"/>
      </span>
    </div>
  </div>
</div>