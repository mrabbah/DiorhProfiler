<%@ page import="com.rabbahsoft.diorhprofiler.RendezVous" %>
<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'rendezVous.label', default: 'RendezVous')}" />
  <g:javascript src="bootstrap-datepicker.js" />
  <g:javascript src="validerrendezvous.js" />
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
<section id="create-rendezVous" class="first">
  <div id="messageerreur"></div>
  <div class="row">
    <div class="col-sm-12">
      <div class="panel panel-danger">
        <div class="panel-heading">
          <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class="label label-danger">Planification d'un rendez-vous</span></h3>
        </div>
        <div class="panel-body">
      <g:form action="save" class="form-horizontal" role="form" >
        <g:render template="form"/>
        <h3 class="dashed"></h3>
        <div class="clearfix">
          <g:submitButton name="create" class="btn btn-danger" onclick="validerrendezvous(); return false;" value="${message(code: 'default.button.create.label', default: 'Create')}" />
          <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button> 
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
