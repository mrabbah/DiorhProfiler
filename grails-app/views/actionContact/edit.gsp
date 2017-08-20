<%@ page import="com.rabbahsoft.diorhprofiler.ActionContact" %>
<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'actionContact.label', default: 'ActionContact')}" />
  <g:javascript src="bootstrap-datepicker.js" />
  <g:javascript src="valideractioncontact.js" />
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
  <script>
    $(document).ready(function() {
  $("#dateAction").datepicker({
 dateFormat: 'dd/mm/yy'   
});
});
  </script>
</head>

<body>
<g:if test="${!layout_nosecondarymenu}">
  <g:render template="submenubar"/>														
</g:if>
<section id="edit-actionContact" class="first">
  <div id="messageerreur"></div>
  <div class="row">
    <div class="col-sm-12">
      <div class="panel panel-danger">
        <div class="panel-heading">
          <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class='label label-danger'>Modification d'une action</span></h3>
        </div>
        <div class="panel-body">
          <g:form method="post" class="form-horizontal" role="form" >
            <g:hiddenField name="id" value="${actionContactInstance?.id}" />
            <g:hiddenField name="version" value="${actionContactInstance?.version}" />
            <g:hiddenField name="_method" value="PUT" />
            <g:render template="form"/>
            <h3 class="dashed"></h3>
            <div class="clearfix">
              <g:actionSubmit class="btn btn-danger" action="update" onclick="valideractioncontact(); return false;" value="${message(code: 'default.button.update.label', default: 'Update')}" />
            </div>
          </g:form>
        </div>
      </div>
    </div>
  </div>
</section>
<g:javascript src="prettify.js" />
<g:javascript src="jquery.js" />
<g:javascript src="jquery-ui.min.js" />
<g:javascript src="chosen.jquery.js" />
<g:javascript src="deleteonetomany.js" />
<g:javascript src="datepickerscript.js" />
</body>

</html>
