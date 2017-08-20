<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.rabbahsoft.diorhprofiler.Mission" %>
<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'mission.label', default: 'Mission')}" />
  <g:javascript src="jquery-ui.min.js" />
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
    .row showvalue {
       
        width: 10px;
    }
    .descsociete
    {
      position:fixed;
    }
  </style>
  <script>
    var te= ${missionInstance?.descriptifSociete};  
  </script>
</head>

<body>
<g:if test="${!layout_nosecondarymenu}">
  <g:render template="submenubar"/>														
</g:if>
<section id="show-annonce" class="first">
  <div class="row">
    <div class="col-sm-12">
      <div class="panel panel-danger">
        <div class="panel-heading">       
          <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class="label label-danger" style="">Détail de l'annonce</span></h3>
        </div>
    <center>
    <div class="panel-heading">       
          <h3 class="panel-title" width="100px" height="100px"/><span   width="100px" height="50px">${missionInstance?.poste?.encodeAsHTML()}</span></h3>
    </div>
    </center>
        <div class="panel-body" style="padding-left: 30px; padding-right: 30px;"> 
          <g:if test="${session.user==null}">
          <h3 class="alert"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'loginicon.png')}" alt="${meta(name:'app.name')}" width="10px" height="20px"/></span><g:message code="postulerconx.label" default="" /></h3>
          </g:if>
          <div class="panel panel-danger">
            <div class="panel-body">
              <div class="col-sm-3 showlabel"><g:message code="mission.referenceannonce.label" default="Reference :" /></div>
              <div class="col-sm-3 showvalue">${missionInstance?.reference?.encodeAsHTML()}</div>
              <div class="col-sm-3 showlabel"><g:message code="mission.datePublication.label" default="Date Publication :" /> :</div>
              <div class="col-sm-3 showvalue"><g:formatDate date="${missionInstance?.datePublication}" format="dd/MM/yyyy"/></div>
            </div>
          </div>
    </br>
        </br>

   <div>
    </div>
          <h3 class="heading"><center><b>Description de la societé</b></center></h3>
          <div class="row showvalue">
          <span> 
    <g:if test='${missionInstance?.descriptifSociete==null}'>
     </g:if>
    <g:else>
    <textarea disabled cols="140" rows="10" style="overflow:auto;resize:none">
    ${raw(missionInstance?.descriptifSociete)}
    </textarea>
</g:else>
          </span>
          </div>
    
          <h3 class="heading"><center><b>Descriptif de poste</b></center></h3>
          <div class="row showvalue">
          <span>
    <g:if test='${missionInstance?.descriptifPoste==null}'>
     </g:if>
    <g:else>
    <textarea disabled cols="140" rows="10" style="overflow:auto;resize:none">
    ${raw(missionInstance?.descriptifPoste)}
    </textarea>
</g:else>
          </span>
          </div>
    
          <h3 class="heading"><center><b>Profil du candidat</b></center></h3>
          <div class="row showvalue">
          <span>
    <g:if test='${missionInstance?.profilCandidat==null}'>
     </g:if>
              <g:else>
    <textarea disabled cols="140" rows="10" style="overflow:auto;resize:none">
    ${raw(missionInstance?.profilCandidat)}
    </textarea>
    </g:else>
          </span>
          </div>
    
          <h3 class="dashed"></h3>
          <g:form action="postulerannonce" class="form-horizontal" role="form" id="${missionInstance.id}" params="${missionInstance.id}">
            <div class="form-actions margin-top-medium">
              <g:submitButton name="retour" class="btn btn-danger" value="${message(code: 'default.button.retourannonce.label', default: 'Retour')}" />
              <g:if test="${session.user!=null && session.droits.ARCHIVER_MISSION != null}">
                <g:submitButton name="Archiver" class="btn btn-danger" value="${message(code: 'default.button.archiverannonce.label', default: "Archiver l'annonce")}" />
              </g:if>
              <g:if test="${session.user!=null && session.user.profil.libelle=="candidat"}">
                <g:submitButton name="Postuler" class="btn btn-danger" value="${message(code: 'default.button.postuler.label', default: 'Postuler')}" />
              </g:if>
            </div>
          </g:form>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>