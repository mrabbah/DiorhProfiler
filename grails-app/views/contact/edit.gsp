<%@ page import="com.rabbahsoft.diorhprofiler.Contact" %>
<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'contact.label', default: 'Contact')}" />
  <g:javascript src="bootstrap-datepicker.js" />
  <g:javascript src="validercontact.js" />
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
<section id="edit-contact" class="first">
  <div id="messageerreur"></div>
  <g:hasErrors bean="${contactInstance}">
    <div class="alert alert-danger">
      <g:renderErrors bean="${contactInstance}" as="list" />
    </div>
  </g:hasErrors>
   <div class="row">
        <div class="col-sm-12">
          <div class="panel panel-danger">
            <div class="panel-heading">
              <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class="label label-danger">Modification d'un contact</span></h3>
            </div>
            <div class="panel-body">
  <g:form method="post" class="form-horizontal" role="form" >
    <g:hiddenField name="id" value="${contactInstance?.id}" />
    <g:hiddenField name="version" value="${contactInstance?.version}" />
    <g:hiddenField name="_method" value="PUT" />

    <g:render template="form"/>

    <div class="form-actions margin-top-medium">
      <g:actionSubmit class="btn btn-danger" name="update" id="update" action="update" onclick="validercontactupdate(); return false;" value="${message(code: 'default.button.update.label', default: 'Update')}" />
    </div>
  </g:form>
            </div>
            </div>
            </div>
            </div>
</section>
<g:render template='interlocuteurcontact' model="['interlocuteurcontact':null,'i':'_clone','hidden':true]"/>
<g:javascript src="prettify.js" />
<g:javascript src="jquery.js" />
<g:javascript src="jquery-ui.min.js" />
<g:javascript src="deleteonetomany.js" />
<g:javascript src="datepickerscript.js" />
</body>

</html>
