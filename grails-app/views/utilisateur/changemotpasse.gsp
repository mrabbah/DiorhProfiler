<%@ page import="com.rabbahsoft.diorhprofiler.Utilisateur" %>
<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'utilisateur.label', default: 'Utilisateur')}" />
  <link href="${resource(dir:'css',file:'bootstrap-tagsinput.css')}" type="text/css" rel="stylesheet" />
  <link href="${resource(dir:'css',file:'app.css')}" type="text/css" rel="stylesheet" />
  <g:javascript src="changermotpasseutilisateur.js" />
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
</head>

<body>
<g:if test="${!layout_nosecondarymenu}">
  <g:render template="submenubar"/>														
</g:if>
<section id="edit-utilisateur" class="first">
  <div id="messageerreur"></div>
  <div class="row">
    <div class="col-sm-12">
      <div class="panel panel-danger">
        <div class="panel-heading">
          <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class="label label-danger">Modification d'un utilisateur</span></h3>
        </div>
        <div class="panel-body">
          <g:form method="post" class="form-horizontal" role="form" id="${utilisateurInstance.id}">
           <div class="row">
  <div class="col-sm-3"><label for="profil" class="control-label"><g:message code="utilisateur.ancienpassword.label" default="ancien mot passe" /></label></div>
  <div class="col-sm-3"><g:textField class="form-control" name="password" id="password" value="${password}"/></div>
  <div class="col-sm-3"><label for="fonctionDior" class="control-label"><g:message code="utilisateur.nouveaupassword.label" default="nouveau mot de passe" /></label></div>
  <div class="col-sm-3"><g:textField class="form-control" name="newpassword" id="newpassword" value=""/></div>
           </div>
           
            <g:if test="${session.droits.MODIFIER_UTILISATEUR != null}">
              <div class="clearfix">
                <g:actionSubmit class="btn btn-danger" action="updatemotPasse" onclick="changermotpasseutilisateur1(); return false;" value="${message(code: 'default.button.update.label', default: 'Update')}" />
              </div>
            </g:if>
          </g:form>
        </div>
      </div>
    </div>
  </div>
</section>
<g:javascript src="jquery.js" />
<g:javascript src="jquery-ui.min.js" />
<g:javascript src="angular.min.js" />
<g:javascript src="prettify.js" />
<g:javascript src="bootstrap-tagsinput.js" />
<g:javascript src="bootstrap-tagsinput-angular.js" />
<g:javascript src="app_bs2.js" />
<g:javascript src="app.js" />
</body>

</html>

