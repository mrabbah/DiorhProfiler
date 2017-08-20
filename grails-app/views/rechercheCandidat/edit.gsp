<%@ page import="com.rabbahsoft.diorhprofiler.RechercheCandidat" %>
<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'rechercheCandidat.label', default: 'RechercheCandidat')}" />
  <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

  <section id="edit-rechercheCandidat" class="first">

    <g:hasErrors bean="${rechercheCandidatInstance}">
      <div class="alert alert-danger">
        <g:renderErrors bean="${rechercheCandidatInstance}" as="list" />
      </div>
    </g:hasErrors>

    <g:form method="post" class="form-horizontal" role="form" >
      <g:hiddenField name="id" value="${rechercheCandidatInstance?.id}" />
      <g:hiddenField name="version" value="${rechercheCandidatInstance?.version}" />
      <g:hiddenField name="_method" value="PUT" />

      <g:render template="form"/>

      <div class="form-actions margin-top-medium">
        <g:actionSubmit class="btn btn-danger" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
        <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
      </div>
    </g:form>

  </section>

</body>

</html>
