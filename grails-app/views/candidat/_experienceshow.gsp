<%@ page import="com.rabbahsoft.diorhprofiler.Experience" %>

<div id="experience${i}" class="experience-div" <g:if test="${hidden}">style="display:none;"</g:if>>
  <g:hiddenField name='experiences[${i}].id' value='${experience?.id}'/>
  <g:hiddenField name='experiences[${i}].deleted' value='false'/>
  <g:hiddenField name='experiences[${i}].new' value="${experience?.id == null?'true':'false'}"/>
  <g:hiddenField name="experiences[${i}].poste.id" id="experiences[${i}].poste" value="${experience?.poste?.id}"/>
  <g:hiddenField name="experiences[${i}].intitulePoste" id="experiences[${i}].intitulePoste" value="${experience?.intitulePoste}"/>
  <g:hiddenField name="experiences[${i}].entreprise" id="experiences[${i}].entreprise" value="${experience?.entreprise}"/>
  <g:hiddenField name="experiences[${i}].ville.id" id="experiences[${i}].ville" value="${experience?.ville?.id}"/>
  <g:hiddenField name="experiences[${i}].dateDebut" id="experiences[${i}].dateDebut"  format="dd/MM/yyyy" value="${formatDate(format:'dd/MM/yyyy',date:experience?.dateDebut)}"/>
  <g:hiddenField name="experiences[${i}].dateFin" id="experiences[${i}].dateFin" format="dd/MM/yyyy" value="${formatDate(format:'dd/MM/yyyy',date:experience?.dateFin)}"/>
  <g:hiddenField name="experiences[${i}].typeEntreprise.id" id="experiences[${i}].typeEntreprise"   value="${experience?.typeEntreprise?.id}"/>
  <g:hiddenField name="experiences[${i}].secteurActivite.id" id="experiences[${i}].secteurActivite"   value="${experience?.secteurActivite?.id}"/>
  <g:hiddenField name="experiences[${i}].nbrPersonneEncadre" id="experiences[${i}].nbrPersonneEncadre"   value="${experience?.nbrPersonneEncadre}"/>
  <g:hiddenField name="experiences[${i}].rattachement" id="experiences[${i}].rattachement"   value="${experience?.rattachement}"/>
  <g:hiddenField name="experiences[${i}].contact" id="experiences[${i}].contact"  value="${experience?.contact}"/>
  <g:hiddenField name="experiences[${i}].telephoneContact" id="experiences[${i}].telephoneContact"   value="${experience?.telephoneContact}"/>
  <g:hiddenField name="experiences[${i}].fonctionContact" id="experiences[${i}].fonctionContact"   value="${experience?.fonctionContact}"/>
  <g:hiddenField name="experiences[${i}].mission" id="experiences[${i}].mission"  value="${experience?.mission}"/>
  <div class="row table-bordered2 even">
    <div class="col-sm-4 fontrowtabledetail" id='experiences[${i}].intitulePosteshow'><g:formatDate date="${experience?.dateDebut}" format="dd/MM/yyyy" /> - <g:formatDate date="${experience?.dateFin}" format="dd/MM/yyyy" /></div>
      <div class="col-sm-6 fontrowtabledetail" id='experiences[${i}].entrepriseshow'>${experience?.poste==null || experience?.poste=="null" ? "  " : experience?.poste} - ${experience?.intitulePoste==null || experience?.intitulePoste=="null" ? "  " : experience?.intitulePoste} - ${experience?.entreprise==null || experience?.entreprise=="null" ? "  " : experience?.entreprise} - ${experience?.mission==null || experience?.mission=="null" ? "  " : experience?.mission}</div>
      <div class="col-sm-1 pull-right">
        <span>
          <a data-toggle="modal" data-backdrop="static"  id="updateexperience" onclick="javascript:updateexperience(this.id,'${i}');" data-target="#modalexperience">
            <img src="${resource(dir:'images/icon', file:'edit.png')}"
                 style="vertical-align:middle;" width="18px" height="18px"/>
          </a>
        </span>
      </div>
      <div class="col-sm-1 pull-right">
        <span class="del-experience">
          <img src="${resource(dir:'images/icon', file:'delete-item.png')}" 
               style="vertical-align:middle;" width="18px" height="18px"/>
        </span>
      </div>
      </div>
</div>