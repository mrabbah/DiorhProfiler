<%@ page import="com.rabbahsoft.diorhprofiler.Utilisateur" %>
<!DOCTYPE html>
<html>

  <head>
  <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'utilisateur.label', default: 'Utilisateur')}" />
  <link href="${resource(dir:'css',file:'bootstrap-tagsinput.css')}" type="text/css" rel="stylesheet" />
  <link href="${resource(dir:'css',file:'app.css')}" type="text/css" rel="stylesheet" />
  <g:javascript src="validerutilisateur.js" />
</head>

<body>
<g:if test="${!layout_nosecondarymenu}">
  <g:render template="submenubar"/>														
</g:if>
<section id="create-utilisateur" class="first">
  <div id="messageerreur"></div>
  <div class="row">
    <div class="col-sm-12">
      <div class="panel panel-danger">
        <div class="panel-heading">
          <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class="label label-danger">L'ajout d'un utilisateur</span></h3>
        </div>
        <div class="panel-body">
          <g:form name="utilisateur" action="save" class="form-horizontal" role="form" >
            <g:render template="form"/>
            <h3 class="dashed"></h3>
            <g:if test="${session.droits.AJOUTER_UTILISATEUR != null}">
            <div class="clearfix">
              <g:submitButton name="create" class="btn btn-danger" onclick="validerutilisateur(); return false;" value="${message(code: 'default.button.create.label', default: 'Create')}" />
              <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
            </div>
            </g:if>
          </g:form>
        </div>
      </div>
    </div>
  </div>
</section>
<g:javascript src="jquery.js" />
<g:javascript src="jquery-ui.min.js" />
<g:javascript src="angular.min.js" />
<g:javascript src="prettify.js" />
<g:javascript src="bootstrap-tagsinput.js" />
<g:javascript src="bootstrap-tagsinput-angular.js" />
<g:javascript src="app_bs2.js" />
<g:javascript src="app.js" />
</body>

</html>
