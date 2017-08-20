<%@ page import="com.rabbahsoft.diorhprofiler.Contact" %>
<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'candidat.label', default: 'Sendmail')}" />
  <ckeditor:resources/>
  <link href="${resource(dir:'css',file:'prettify.css')}" type="text/css" rel="stylesheet" />
  <link href="${resource(dir:'css',file:'bootstrap-tagsinput.css')}" type="text/css" rel="stylesheet" />
  <link href="${resource(dir:'css',file:'app.css')}" type="text/css" rel="stylesheet" />
</head>
<body>
<g:if test="${!layout_nosecondarymenu}">
  <g:render template="submenubar"/>														
</g:if>

<section id="create-candidat" class="first">
  <div id="messageerreur"></div>
  <div class="row">
    <div class="col-sm-12">
      <div class="panel panel-danger">
        <div class="panel-heading">
          <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class="label label-danger">L'envoi de mail</span></h3>
        </div>
        <div class="panel-body">
          <g:form name="sendmail" action="sendmail">
              <div class="row">
                <div class="col-sm-2"><g:message code="mail.emails.label" default="Emails" />:</div>
                <div class="col-sm-10"><input type="text" id="emails" value="${emails}" data-role="tagsinput" placeholder="Ajouter email" /></div>
              </div>
              <div class="row">
                <div class="col-sm-2"><g:message code="mail.sujet.label" default="Sujet" />:</div>
                <div class="col-sm-10"><g:textField class="form-control" name="sujet" id="sujet" value="" style="width: 100%;"/></div>
                </div>
                
                <div class="row">
                  <div class="col-sm-2"><g:message code="mail.message.label" default="message" />:</div>
                  <div class="col-sm-10"><ckeditor:editor name="myeditor" id="myeditor" height="200px" width="100%">${initialValue}</ckeditor:editor></div>
                </div>
                <div class="dashed"></div>
                <div class="row">  
                  <div class="col-sm-2"></div>
                  <div class="col-sm-10">
                    <div class="form-actions margin-top-medium">
                      <g:submitButton name="sendmail" class="btn btn-danger" onclick="validersendmail('contact'); return false;" value="${message(code: 'default.button.envoyermail.label', default: 'Create')}" />
                    </div>
                  </div>
                </div>
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
              <g:javascript src="validersendmail.js" />
              </body>
              </html>
