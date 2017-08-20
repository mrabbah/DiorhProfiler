<%@ page import="com.rabbahsoft.diorhprofiler.RechercheCandidat" %>

<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'rechercheCandidat.label', default: 'RechercheCandidat')}" />
  <g:javascript src="jquery-ui.min.js" />
   <r:require modules="jquery-ui" />
  <g:javascript src="validerrecherche.js" />
</head>

<body>
<g:if test="${!layout_nosecondarymenu}">
  <g:render template="submenubar"/>														
</g:if>
<section id="create-rechercheCandidat" class="first">
<div id="messageerreur"></div>
  <div class="row">
    <div class="col-sm-12">
      <div class="panel panel-danger">
        <div class="panel-heading">
          <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class="label label-danger">Recherche</span></h3>
        </div>
        <div class="panel-body">
          <g:form action="list_recherche1" class="form-horizontal" name="recherchecandidat" role="form" >
            <g:render template="form_recherche"/>
            <div class="form-actions margin-top-medium">
              <g:submitButton name="create" class="btn btn-danger" value="${message(code: 'default.button.recherche.label', default: 'Create&Recherche')}" />
            </div>
          </g:form>
        </div>
      </div>
    </div>
  </div>
</section>

</body>

</html>
