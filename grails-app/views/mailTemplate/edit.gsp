<%@ page import="com.rabbahsoft.diorhprofiler.MailTemplate" %>
<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'mailTemplate.label', default: 'MailTemplate')}" />
  <title><g:message code="default.edit.label" args="[entityName]" /></title>
  <ckeditor:resources/>
</head>

<body>
  <g:if test="${!layout_nosecondarymenu}">
  <g:render template="submenubar"/>														
</g:if>
  <section id="edit-mailTemplate" class="first">

    <g:hasErrors bean="${mailTemplateInstance}">
      <div class="alert alert-danger">
        <g:renderErrors bean="${mailTemplateInstance}" as="list" />
      </div>
    </g:hasErrors>
    <div class="row">
      <div class="col-sm-12">
        <div class="panel panel-danger">
          <div class="panel-heading">
            <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class='label label-danger'>Modification</span></h3>
          </div>
          <div class="panel-body">
            <g:form method="post" class="form-horizontal" role="form" >
                    <g:hiddenField name="id" value="${mailTemplateInstance?.id}" />
              <g:hiddenField name="version" value="${mailTemplateInstance?.version}" />
              <g:hiddenField name="_method" value="PUT" />

              <g:render template="form"/>
              <h3 class="dashed"></h3>
              <div class="form-actions margin-top-medium">
                <g:actionSubmit class="btn btn-danger" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
              </div>
            </g:form>
          </div>
        </div>
      </div>
    </div>
  </section>

</body>

</html>
