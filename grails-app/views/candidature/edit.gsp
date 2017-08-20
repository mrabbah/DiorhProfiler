<%@ page import="com.rabbahsoft.diorhprofiler.Candidature" %>
<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'candidature.label', default: 'Candidature')}" />
  <title><g:message code="default.edit.label" args="[entityName]" /></title>
  <g:javascript src="jquery.js" />
  <g:javascript src="jquery-ui.min.js" />
  <g:javascript src="validercandidature.js" />
</head>

<body>

  <section id="edit-candidature" class="first">
    <g:if test="${!layout_nosecondarymenu}">
      <g:render template="submenubar"/>														
    </g:if>
    <div id="messageerreur"></div>
    <div class="row">
      <div class="col-sm-12">
        <div class="panel panel-danger">
          <div class="panel-heading">
            <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class="label label-danger">Fiche de candidature </span></h3>
          </div>
          <div class="panel-body">
            <g:form method="post" class="form-horizontal" role="form" >
              <g:hiddenField name="id" value="${candidatureInstance?.id}" />
              <input type="hidden" value="${candidatureInstance?.id}" id='h_v' class='h_v'>
              <g:hiddenField name="version" value="${candidatureInstance?.version}" />
              <g:hiddenField name="_method" value="PUT" />

              <g:render template="form_1"/>

              <div class="form-actions margin-top-medium">
                <g:actionSubmit class="btn btn-danger" action="update" onclick="validercandidature(); return false;" value="${message(code: 'default.button.update.label', default: 'Update')}" />
              </div>
            </g:form>
          </div>
        </div>
      </div>
    </div>
  </section>

<g:render template='avancement' model="['avancement':null,'i':'_clone','hidden':true]"/>
<g:javascript src="prettify.js" />
<g:javascript src="jquery.js" />
<g:javascript src="jquery-ui.min.js" />
<g:javascript src="deleteonetomany.js" />
<g:javascript src="datepickerscript.js" />
</body>

</html>
