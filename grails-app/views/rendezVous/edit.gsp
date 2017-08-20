<%@ page import="com.rabbahsoft.diorhprofiler.RendezVous" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'rendezVous.label', default: 'RendezVous')}" />
  <g:javascript src="bootstrap-datepicker.js" />
  <g:javascript src="validerrendezvous.js" />
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
  $("#dateRdv").datepicker({
 dateFormat: 'dd/mm/yy' 
  });
});
  </script>
</head>

<body>
<g:if test="${!layout_nosecondarymenu}">
  <g:render template="submenubar"/>														
</g:if>
<section id="edit-rendezVous" class="first">
  <div id="messageerreur"></div>
      <div class="row">
    <div class="col-sm-12">
      <div class="panel panel-danger">
        <div class="panel-heading">
          <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class="label label-danger">Modification d'un rendez-vous</span></h3>
        </div>
        <div class="panel-body">
    <g:form method="post" class="form-horizontal" role="form" >
      <g:hiddenField name="id" value="${rendezVousInstance?.id}" />
      <g:hiddenField name="version" value="${rendezVousInstance?.version}" />
      <g:hiddenField name="_method" value="PUT" />			
      <g:render template="form"/>
      <h3 class="dashed"></h3>
      <div class="clearfix">
        <g:actionSubmit class="btn btn-danger" action="update" onclick="validerrendezvous(); return false;" value="${message(code: 'default.button.update.label', default: 'Update')}" />
      </div>
    </g:form>
  </div>
  </div>
  </div>
</div>
</section>
<g:javascript src="jquery.js" />
<g:javascript src="jquery-ui.min.js" />
<g:javascript src="datepickerscript.js" />
</body>

</html>
