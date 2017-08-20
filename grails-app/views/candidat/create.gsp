<%@ page import="com.rabbahsoft.diorhprofiler.Candidat" %>
<!DOCTYPE html>
<html>

    <head>
    <meta name="layout" content="globallayout" />
    <g:set var="entityName" value="${message(code: 'candidat.label', default: 'Candidat')}" />
    <g:javascript src="validercandidat.js" />
    <g:javascript src="initcandidat.js" />
    <g:javascript src="test.js" />
    <g:javascript src="experience.js" />
<!--    <g:javascript src="bootstrap-datepicker.js" />-->
    <g:javascript src="jquery.js" />
<g:javascript src="jquery-ui.min.js" />
<script src="datepicker-fr.js"></script>
 <script type="text/javascript">

  $(function() {
$( "#dateNaissance" ).datepicker({
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
 
      function deletefile(idfile, id, type) {
    $.post("/DiorhProfiler/Candidat/deletefile",
    {
    id:id,
            idfile:idfile
    },
            function(data) {
                if (data === "true"){
                var selector = "#" + type;
                $(selector).empty();
                if(type=='cv'){
                $(selector).append("<td class='labelfile'><g:message code="candidat.telechargerphoto.label" default="Télécharger la photo" /></td>\n\
                                    <td><input type='file' name='cv' id='cvfile'/></td>");
                }
                if(type=='photo'){
                $(selector).append("<td class='labelfile'><g:message code='candidat.telechargerphoto.label' default='Télécharger la photo'/>:</td>\n\
                                    <td><input type='file' name='photo' id='photo'/></td>");
                }
                if(type=='diplome'){
                $(selector).append("<td class='labelfile'><g:message code='candidat.telechargerdiplome.label' default='Télécharger la photo'/>:</td>\n\
                                    <td><input type='file' name='diplome' id='diplem'/></td>");
                }
                if(type=='bulletinpaie'){
                $(selector).append("<td class='labelfile'><g:message code='candidat.telechargerbulletinpaie.label' default='Télécharger la photo'/>:</td>\n\
                                    <td><input type='file' name='bulletinpaie' id='bulletinpaie'/></td>");
                }
                if(type=='attestation'){
                $(selector).append("<td class='labelfile'><g:message code='candidat.telechargerattestation.label' default='Télécharger la photo'/>:</td>\n\
                                    <td><input type='file' name='attestation' id='attestation'/></td>");
                }
            }
            }
            );
        }
        
 
    </script>
   <script type="text/javascript" src="js/datepicker-fr.js"></script>
     <style type="text/css">

    #row showvalue {
       
        width: 10px;
    }
  </style>
</head>
<body>
  
    <g:if test="${session.user!=null}">
    <g:if test="${!layout_nosecondarymenu}">
        <g:render template="submenubar"/>														
    </g:if>
    </g:if>
    <section id="create-candidat" class="first">
        <div id="messageerreur"></div>
        <g:hasErrors bean="${candidatInstance}">
            <div class="alert alert-danger">
                <g:renderErrors bean="${candidatInstance}" as="list" />
            </div>
        </g:hasErrors>
     <div class="row">
        <div class="col-sm-12">
          <div class="panel panel-danger">
            <div class="panel-heading">
              <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}"  width="19px" height="19px"/><span class="label label-danger">Inscription</span></h3>
            </div>
            <div class="panel-body">
        <g:form name="candidat" action="save" class="form-horizontal" role="form" enctype="multipart/form-data" >
            <g:render template="form"/>
            <div>
                <h3 class="alert"><span>« Conformément à la loi 09-08, vous disposez d’un droit d’accès,de rectification et d’opposition au traitement de vos données personnelles. »</span></h3>
            </div>
              <div class="form-actions margin-top-medium">
                <g:submitButton name="create" class="btn btn-danger" onclick="validercandidat(); return false;" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
            </div>
            
        </g:form>
            </div>
            </div>
            </div>
            </div>
    </section>
    
<g:render template='experience' model="['experience':null,'i':'_add','hidden':true]"/>
<g:render template='experienceshow' model="['experience':null,'i':'_clone','hidden':true]"/>
<g:render template='formation' model="['formationcandidat':null,'i':'_add','hidden':true]"/>
<g:render template='formationshow' model="['formationcandidat':null,'i':'_clone','hidden':true]"/>
<g:render template='test' model="['test':null,'i':'_clone','hidden':true]"/>
<g:render template='langue' model="['langue':null,'i':'_clone','hidden':true]"/>
<g:javascript src="prettify.js" />

<g:javascript src="deleteonetomany.js" />
<!--<script src="datepicker-fr.js"></script>-->

<!--<g:javascript src="datepickerscript.js" />-->
<!--<g:javascript src="jquery.ui.datepicker-fr.js" />-->
</body>
</html>
