<%@ page import="com.rabbahsoft.diorhprofiler.ConnaissanceLinguistiqueNiveau" %>

<div id="connaissanceLinguistique${i}" class="connaissanceLinguistique-div" <g:if test="${hidden}">style="display:none;"</g:if>>
  <g:hiddenField name='connaissanceLinguistiques[${i}].id' value='${connaissanceLinguistique?.id}'/>
  <g:hiddenField name='connaissanceLinguistiques[${i}].deleted' value='false'/>
  <g:hiddenField name='connaissanceLinguistiques[${i}].new' value="${connaissanceLinguistique?.id == null?'true':'false'}"/>
  <div class="row">
    <div class="col-sm-2">
      <label for="connaissancesInfo" class="control-label"><g:message code="candidat.langue.label" default="Langue" /></label></td>
    </div>
    <div class="col-sm-3">
      <g:select class="form-control" id="connaissanceLinguistiques[${i}].langue" name="connaissanceLinguistiques[${i}].langue.id" from="${com.rabbahsoft.diorhprofiler.ConnaissanceLinguistique.list()}" optionKey="id" value="${connaissanceLinguistique?.langue?.id}" class="form-control"/>
    </div>
    <div class="col-sm-2">
      <label for="connaissancesInfo" class="control-label"><g:message code="candidat.niveau.label" default="Niveau" /></label></td>
    </div>
    <div class="col-sm-2">
      <g:select class="form-control" id="connaissanceLinguistiques[${i}].niveau" name="connaissanceLinguistiques[${i}].niveau.id" from="${com.rabbahsoft.diorhprofiler.NiveauConnaissanceLinguistique.list()}" optionKey="id" value="${connaissanceLinguistique?.niveau?.id}" class="form-control"/>
    </div> 
    <div class="col-sm-1"></div> 
    <div class="col-sm-1">
      <span class="del-connaissanceLinguistique">
        <img src="${resource(dir:'images/icon', file:'delete-item.png')}" 
             style="vertical-align:middle;" width="18px" height="18px"/>
      </span>
    </div> 
  </div>
</div>
