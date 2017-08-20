<%@ page import="com.rabbahsoft.diorhprofiler.Candidature" %>
<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'candidature.label', default: 'Candidature')}" />
  <title><g:message code="default.create.label" args="[entityName]" /></title>
  <g:javascript src="validercandidature.js" />
</head>

<body>

  <section id="create-candidature" class="first">
    <div id="messageerreur"></div>
    <div class="row">
      <div class="col-sm-12">
        <div class="panel panel-danger">
          <div class="panel-heading">
            <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class="label label-danger">Fiche de candidature</span></h3>
          </div>
          <div class="panel-body">
            <g:form name='candidature' action="postuler" class="form-horizontal" role="form" >
              <g:hiddenField name="externe" value="${externe}" />
              <g:render template="form"/>

              <div class="form-actions margin-top-medium">
                <g:submitButton name="create" class="btn btn-danger" onclick="validercandidature(); return false;" value="${message(code: 'default.button.create.label', default: 'Create')}" />
              </div>
            </g:form>
          </div>
        </div>
      </div>
    </div>
  </section>
<g:javascript src="jquery.js" />
<g:javascript src="jquery-ui.min.js" />
</body>

</html>
