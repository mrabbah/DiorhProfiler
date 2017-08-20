<%@ page import="com.rabbahsoft.diorhprofiler.Candidature" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'candidature.label', default: 'Candidature')}" />
  <title><g:message code="default.create.label" args="[entityName]" /></title>
  <g:javascript src="bootstrap-datepicker.js" />
  <script>
           $(document).ready(function() {
         $("#dateCandidaturede").datepicker({
        dateFormat: 'dd/mm/yy'   
    });
         $("#dateCandidaturea").datepicker({
        dateFormat: 'dd/mm/yy'   
    });
});
  </script>
</head>

<body>
<g:if test="${!layout_nosecondarymenu}">
  <g:render template="submenubar"/>														
</g:if>
<section id="create-candidature" class="first">
  <div class="row">
    <div class="col-sm-12">
      <div class="panel panel-danger">
        <div class="panel-heading">
          <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class="label label-danger">Recherche</span></h3>
        </div>
        <div class="panel-body">
          <g:form action="recherche_candidat" class="form-horizontal" role="form" >
            <g:render template="form_recherche"/>
            <h3 class="dashed"></h3>
            <div class="clearfix">
              <g:submitButton name="recherche" class="btn btn-danger" value="${message(code: 'default.button.recherchecandidature.label', default: 'Recherche')}" />
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
