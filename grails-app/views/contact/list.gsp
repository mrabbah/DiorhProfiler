
<%@ page import="com.rabbahsoft.diorhprofiler.Contact" %>
<%@ page import="com.rabbahsoft.diorhprofiler.InterlocuteurContact" %>
<%@ page import="com.rabbahsoft.diorhprofiler.ActionContact" %>
<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'contact.label', default: 'Contact')}" />
  <g:javascript src="bootstrap-datepicker.js" />
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
          <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class="label label-danger">Liste des contacts</span></h3>
        </div>
        <div class="panel-body">
          <table class="table table-striped table-bordered table-condensed">
            <thead>
              <tr>
            <g:sortableColumn property="raisonSociale" title="${message(code: 'contact.raisonSociale.label', default: 'Raison Sociale')}" />
            <g:sortableColumn property="secteurActivite" title="${message(code: 'contact.secteurActivite.label', default: "Secteur d'activité")}" />
            <g:sortableColumn property="typeEntreprise" title="${message(code: 'contact.typeEntreprise.label', default: "Type d'entreprise")}" />
            <g:sortableColumn property="type" title="${message(code: 'contact.type.label', default: 'Type de contact')}" />
            <th>1er interlocuteur</th>
            <th>Téléphone</th>
            <th>dernier contact</th>
            <th> Consultant</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${contactInstanceList}" status="i" var="contactInstance">

              <tr class="prop">
              <g:if test="${session.droits.CONSULTER_CONTACT!=null}">
                <td class="value"><g:link action="show" id="${contactInstance.id}">${fieldValue(bean: contactInstance, field: "raisonSociale")}</g:link></td>
              </g:if>
              <g:else>
                <td class="value">${fieldValue(bean: contactInstance, field: "raisonSociale")}</td>
              </g:else>
              <td class="value">${fieldValue(bean: contactInstance, field: "secteurActivite")}</td>
              <td class="value">${fieldValue(bean: contactInstance, field: "typeEntreprise")}</td>
              <td class="value">${fieldValue(bean: contactInstance, field: "type")}</td>
              <g:if test="${contactInstance.interlocuteurcontacts}">
                <g:set var="interlocuteur" value="${InterlocuteurContact.createCriteria().get{eq('contact',contactInstance) maxResults(1)}}"/>
                <g:if test="${interlocuteur}">
                  <td>${interlocuteur}</td>
                  <td>${interlocuteur.telephonePortable}</td>
                </g:if>
              </g:if>
              <g:else>
                <td></td>
                <td></td>
              </g:else>
              <g:if test="${contactInstance.actioncontacts}">
                <g:set var="actioncontact" value="${ActionContact.createCriteria().get{eq('contact',contactInstance) max('dateAction') maxResults(1)}}"/>
                <g:if test="${actioncontact}">
                  <td><g:formatDate date="${actioncontact.dateAction}" format="dd/MM/yyyy" /></td>
                  <td>${actioncontact.responsable}</td>
                </g:if>
              </g:if>
              <g:else>
                <td></td>
                <td></td>
              </g:else>
              </tr>
            </g:each>
            </tbody>
          </table>
          <div>
            <bs:paginate total="${contactInstanceCount}" />
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<g:javascript src="jquery.js" />
<g:javascript src="jquery-ui.min.js" />
</body>

</html>
