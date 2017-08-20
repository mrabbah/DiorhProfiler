<%@ page import="com.rabbahsoft.diorhprofiler.Profil" %>
<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'profil.label', default: 'Profil')}" />
  <title><g:message code="default.edit.label" args="[entityName]" /></title>
  <style type="text/css" media="screen">
@media screen and (min-width: 768px) {
  .modal-dialog {
    width: 300px;
    margin: 30px auto;
    }
    .modal-content {
      -webkit-box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
    }
    }
  </style>
</head>

<body>
<g:if test="${!layout_nosecondarymenu}">
  <g:render template="submenubar"/>														
</g:if>
<section id="edit-profil" class="first">

  <g:hasErrors bean="${profilInstance}">
    <div class="alert alert-danger">
      <g:renderErrors bean="${profilInstance}" as="list" />
    </div>
  </g:hasErrors>
  <div class="row">
    <div class="col-sm-12">
      <div class="panel panel-danger">
        <div class="panel-heading">
          <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class="label label-danger">Modification d'un profil</span></h3>
        </div>
        <div class="panel-body">
          <g:form method="post" class="form-horizontal" role="form" id="${profilInstance.id}">
            <g:hiddenField name="id" value="${profilInstance?.id}" />
            <g:hiddenField name="version" value="${profilInstance?.version}" />
            <g:hiddenField name="_method" value="PUT" />

            <g:render template="form"/>

            <div class="form-actions margin-top-medium">
              <g:if test="${session.droits.MODIFIER_PROFIL != null}">
              <g:actionSubmit class="btn btn-danger" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
              </g:if>
            </div>
          </g:form>
        </div>
      </div>
    </div>
  </div>
</section>

</body>

</html>
