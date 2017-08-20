<%@ page import="com.rabbahsoft.diorhprofiler.MailTemplate" %>
<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'mailTemplate.label', default: 'MailTemplate')}" />
  <title><g:message code="default.create.label" args="[entityName]" /></title>
  <ckeditor:resources/>
</head>

<body>
<g:if test="${!layout_nosecondarymenu}">
  <g:render template="submenubar"/>														
</g:if>
<section id="create-mailTemplate" class="first">

  <g:hasErrors bean="${mailTemplateInstance}">
    <div class="alert alert-danger">
      <g:renderErrors bean="${mailTemplateInstance}" as="list" />
    </div>
  </g:hasErrors>
  <div class="row">
    <div class="col-sm-12">
      <div class="panel panel-danger">
        <div class="panel-heading">
          <h3 class="panel-title">L'ajout</h3>
        </div>
        <div class="panel-body">
          <g:form action="save" class="form-horizontal" role="form" >
            <g:render template="form"/>
            <h3 class="dashed"></h3>
            <div class="form-actions margin-top-medium">
              <g:submitButton name="create" class="btn btn-danger" value="${message(code: 'default.button.create.label', default: 'Create')}" />
              <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
            </div>
          </g:form>
        </div>
      </div>
    </div>
  </div>
</section>

</body>

</html>
