
<%@ page import="com.rabbahsoft.diorhprofiler.Contact" %>
<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'contact.label', default: 'Contact')}" />
  <g:javascript src="bootstrap-datepicker.js" />
  <g:javascript src="jquery.js" />
  <link href="${resource(dir:'css',file:'chosen.css')}" type="text/css" rel="stylesheet" />
  <script type="text/javascript">
$(function(){
$("input[type='checkbox']").click(function(){
var state;
if (this.checked) {
state="checked";
}
else {
state="unchecked";
}
$.post("/DiorhProfiler/Contact/check",
    {
      value:this.id,
      state:state
    },
     function(data) {    
    }
  );
});
    
});
  </script>
</head>

<body>
<g:if test="${!layout_nosecondarymenu}">
  <g:render template="submenubar"/>														
</g:if>
<section id="list-contact" class="first">
  <div class="row">
        <div class="col-sm-12">
          <div class="panel panel-danger">
            <div class="panel-heading">
              <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class="label label-danger">Recherche</span></h3>
            </div>
            <div class="panel-body">
      <g:form action="list_recherche">
        <g:render template="searchform"/>
      <h3 class="dashed"></h3>
      <div class="clearfix">
       <g:submitButton name="list_recherche" class="btn btn-danger" value="${message(code: 'default.button.recherchecontact.label', default: 'Rechercher contacts new')}" />
      </div>
      </g:form>
    </div>
  </div>
  </div>
  </div>
</section>
<g:javascript src="jquery.js" />
<g:javascript src="jquery-ui.min.js" />
<g:javascript src="chosen.jquery.js" />
<script type="text/javascript">
var config = {
'.chosen-select'           : {},
'.chosen-select-deselect'  : {allow_single_deselect:true},
'.chosen-select-no-single' : {disable_search_threshold:10},
'.chosen-select-no-results': {no_results_text:'Oops, nothing found!'},
'.chosen-select-width'     : {width:"95%"}
}
for (var selector in config) {
$(selector).chosen(config[selector]);
}
</script>
</body>

</html>
