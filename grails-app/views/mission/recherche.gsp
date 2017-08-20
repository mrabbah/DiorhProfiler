<%@ page import="com.rabbahsoft.diorhprofiler.Mission" %>
<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'mission.label', default: 'Mission')}" />
  <title><g:message code="default.create.label" args="[entityName]" /></title>
  <g:javascript src="bootstrap-datepicker.js" />
  <script>
    $(document).ready(function() {
  $("#dateDemarrageDE").datepicker({
 dateFormat: 'dd/mm/yy'   
});
  $("#dateDemarrageA").datepicker({
 dateFormat: 'dd/mm/yy'   
});
});
  </script>   
</head>

<body>
<g:if test="${!layout_nosecondarymenu}">
  <g:render template="submenubar"/>														
</g:if>
<section id="create-mission" class="first">
  <div class="row">
    <div class="col-sm-12">
      <div class="panel panel-danger">
        <div class="panel-heading">
          <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class="label label-danger">Recherche missions</span></h3>
        </div>
        <div class="panel-body">
          <g:form name="mission" action="list_recherche" class="form-horizontal" role="form" >
            <g:render template="form_recherche"/>
            <input type="hidden" name="c" value="3" />
            <div class="form-actions margin-top-medium">
              <g:submitButton name="recherche" class="btn btn-danger" return false;" value="${message(code: 'default.button.recherchemission.label', default: 'Rechercher missions')}" />
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
</body>

</html>
