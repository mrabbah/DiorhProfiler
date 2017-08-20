<%@ page import="com.rabbahsoft.diorhprofiler.Contact" %>
<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'contact.label', default: 'Contact')}" />
<!--  <g:javascript src="bootstrap-datepicker.js" />-->
  <g:javascript src="jquery.js" />
<g:javascript src="jquery-ui.min.js" />
<script src="datepicker-fr.js"></script>
  <g:javascript src="validercontact.js" />
  <link href="${resource(dir:'css',file:'chosen.css')}" type="text/css" rel="stylesheet" />
<script type="text/javascript">

  $(function() {
$( "#dateCreationEntrep" ).datepicker({
altField: "#dateNaissance",
closeText: 'Fermer',
prevText: 'Précédent',
nextText: 'Suivant',
currentText: 'Aujourd\'hui',
monthNames: ['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'],
monthNamesShort: ['Janv.', 'Févr.', 'Mars', 'Avril', 'Mai', 'Juin', 'Juil.', 'Août', 'Sept.', 'Oct.', 'Nov.', 'Déc.'],
dayNames: ['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'],
dayNamesShort: ['Dim.', 'Lun.', 'Mar.', 'Mer.', 'Jeu.', 'Ven.', 'Sam.'],
dayNamesMin: ['D', 'L', 'M', 'M', 'J', 'V', 'S'],
weekHeader: 'Sem.',
dateFormat: 'dd/mm/yy'
});
});
         

$(function() {
    $( "#datepicker" ).datepicker( $.datepicker.regional[ "fr" ] );
    $( "#locale" ).change(function() {
      $( "#datepicker" ).datepicker( "option",
        $.datepicker.regional[ $( this ).val() ] );
    });
  });
  </script>
   <script type="text/javascript" src="js/datepicker-fr.js"></script>
</head>

<body>
  <g:if test="${!layout_nosecondarymenu}">
  <g:render template="submenubar"/>														
</g:if>
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
              <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class="label label-danger">L'ajout d'un contact</span></h3>
            </div>
            <div class="panel-body">
  <g:form action="save" name="contact" class="form-horizontal" role="form" >
    <g:render template="form"/>

    <div class="form-actions margin-top-medium">
      <g:submitButton name="create" class="btn btn-danger" onclick="validercontact(); return false;" value="${message(code: 'default.button.create.label', default: 'Create')}" />
      <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
    </div>
  </g:form>
            </div>
            </div>
            </div>
            </div>
<g:render template='interlocuteurcontact' model="['interlocuteurcontact':null,'i':'_clone','hidden':true]"/>
<g:javascript src="prettify.js" />
<!--<g:javascript src="jquery.js" />
<g:javascript src="jquery-ui.min.js" />-->
<g:javascript src="chosen.jquery.js" />
<g:javascript src="deleteonetomany.js" />
<g:javascript src="jquery.ui.datepicker-fr.js" />
<!--<g:javascript src="datepickerscript.js" />-->
</body>
</html>
