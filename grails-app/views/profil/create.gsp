<%@ page import="com.rabbahsoft.diorhprofiler.Profil" %>
<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'profil.label', default: 'Profil')}" />
  <title><g:message code="default.create.label" args="[entityName]" /></title>
  <g:javascript src="validerprofil.js" />
</head>

<body>
<g:if test="${!layout_nosecondarymenu}">
  <g:render template="submenubar"/>														
</g:if>
<section id="create-profil" class="first">
 <div id="messageerreur"></div>
  <g:hasErrors bean="${profilInstance}">
    <div class="alert alert-danger">
      <g:renderErrors bean="${profilInstance}" as="list" />
    </div>
  </g:hasErrors>
  <div class="row">
    <div class="col-sm-12">
      <div class="panel panel-danger">
        <div class="panel-heading">
          <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class="label label-danger">L'ajout d'un profil</span></h3>
        </div>
        <div class="panel-body">
          <g:form name="profil" action="save" class="form-horizontal" role="form" >
            <g:render template="form"/>

            <div class="form-actions margin-top-medium">
              <g:if test="${session.droits.AJOUTER_PROFIL != null}">
              <g:submitButton name="create" class="btn btn-danger" onclick="validerprofil(); return false;" value="${message(code: 'default.button.create.label', default: 'Create')}" />
              </g:if>
            </div>
          </g:form>
        </div>
      </div>
    </div>
  </div>
</section>
<g:javascript src="jquery.js" />
</body>

</html>
