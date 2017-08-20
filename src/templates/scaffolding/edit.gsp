<%=packageName%>
<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="kickstart" />
  <g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
</head>

<body>

  <section id="edit-${domainClass.propertyName}" class="first">

    <g:hasErrors bean="\${${propertyName}}">
      <div class="alert alert-danger">
        <g:renderErrors bean="\${${propertyName}}" as="list" />
      </div>
    </g:hasErrors>
    <div class="row">
      <div class="col-sm-12">
        <div class="panel panel-danger">
          <div class="panel-heading">
            <h3 class="panel-title"><span class='label label-danger'>Modification</span></h3>
          </div>
          <div class="panel-body">
            <g:form method="post" class="form-horizontal" role="form" <%= multiPart ? ' enctype="multipart/form-data"' : '' %>>
                    <g:hiddenField name="id" value="\${${propertyName}?.id}" />
              <g:hiddenField name="version" value="\${${propertyName}?.version}" />
              <g:hiddenField name="_method" value="PUT" />

              <g:render template="form"/>
              <h3 class="dashed"></h3>
              <div class="form-actions margin-top-medium">
                <g:actionSubmit class="btn btn-danger" action="update" value="\${message(code: 'default.button.update.label', default: 'Update')}" />
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
