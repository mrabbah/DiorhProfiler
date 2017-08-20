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
  <g:javascript src="bootstrap-datepicker.js" />
  <script>
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
                $(selector).append("<div class='col-sm-4 labelfile'>Télécharger le CV</div>\n\
                                    <div class='col-sm-4'><input type='file' name='cv' id='cvfile'/></div>");
                }
                if(type=='photo'){
                $(selector).append("<div class='col-sm-4 labelfile'>Télécharger la photo :</div>\n\
                                    <div class='col-sm-4 labelfile'><input type='file' name='photo' id='photo'/></div>");
                }
                if(type=='diplome'){
                $(selector).append("<div class='col-sm-4 labelfile'>Télécharger les derniers diplômes :</div>\n\
                                    <div class='col-sm-4'><input type='file' name='diplome' id='diplem'/></div>");
                }
                if(type=='bulletinpaie'){
                $(selector).append("<div class='col-sm-4 labelfile'>Télécharger le dernier bulletin de paie :</div>\n\
                                    <div class='col-sm-4'><input type='file' name='bulletinpaie' id='bulletinpaie'/></div>");
                }
                if(type=='attestation'){
                $(selector).append("<div class='col-sm-4 labelfile'>Télécharger les attestations de l'employeur :</div>\n\
                                    <div class='col-sm-4'><input type='file' name='attestation' id='attestation'/></div>");
                }
                if(type=='rapportPerformance'){
                $(selector).append("<div class='col-sm-3 labelfile'>Rapport de performance :</div>\n\
                                    <div class='col-sm-4'><input type='file' name='rapportPerformance' id='rapportPerformance'/></div>");
                }
            }
            }
            );
        }
  </script>
</head>

<body>
<g:if test="${!layout_nosecondarymenu}">
  <g:render template="submenubar"/>														
</g:if>
<section id="edit-candidat" class="first">
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
          <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class="label label-danger">Modification</span></h3>
        </div>
        <div class="panel-body">
          <g:form name="candidat1" action="update" class="form-horizontal" role="form" enctype="multipart/form-data">
            <g:hiddenField name="id" value="${candidatInstance?.id}" />
            <g:hiddenField name="version" value="${candidatInstance?.version}" />
            <g:hiddenField name="_method" value="PUT" />
            <g:render template="form"/>
            <div class="form-actions margin-top-medium">
              <g:actionSubmit class="btn btn-danger" action="update" onclick="validercandidat1(); return false;" value="${message(code: 'default.button.update.label', default: 'Update')}" />
            </div>
          </g:form>
        </div>
      </div>
    </div>
  </div>
</section>

<g:render template='experience' model="['experience':null,'i':'_add','hidden':true]"/>
<g:render template='experienceshow' model="['experience':null,'i':'_clone','hidden':true]"/>
<g:render template='formation' model="['formation':null,'i':'_add','hidden':true]"/>
<g:render template='formationshow' model="['formation':null,'i':'_clone','hidden':true]"/>
<g:render template='test' model="['test':null,'i':'_clone','hidden':true]"/>
<g:render template='langue' model="['langue':null,'i':'_clone','hidden':true]"/>
<g:javascript src="prettify.js" />
<g:javascript src="jquery.js" />
<g:javascript src="jquery-ui.min.js" />
<g:javascript src="datepickerscript.js" />
</body>
</html>
