
<%@ page import="com.rabbahsoft.diorhprofiler.Contact" %>
<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'contact.label', default: 'Contact')}" />
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
  </style>
</head>

<body>
<g:if test="${!layout_nosecondarymenu}">
  <g:render template="submenubar"/>														
</g:if>
<section id="show-contact" class="first">
  <div class="row">
    <div class="col-sm-12">
      <div class="panel panel-danger">
        <div class="panel-heading">
          <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class="label label-danger">Détail d'un contact</span></h3>
        </div>
        <div class="panel-body">
          <div class="tabbable tabbable-bordered">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#tab_br1" data-toggle="tab">Contact</a></li>
              <li><a href="#tab_br2" data-toggle="tab">Interlocuteurs</a></li>
              <li><a href="#tab_br3" data-toggle="tab">Historique contact</a></li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="tab_br1">
                <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Identification</span></h3>
                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="contact.raisonSociale.label" default="Raison Sociale" />:</div>
                  <div class="col-sm-3 showvalue">${fieldValue(bean: contactInstance, field: "raisonSociale")}</div>
                  <div class="col-sm-3 showlabel"><g:message code="contact.dateCreation.label" default="Date Creation" />:</div>
                  <div class="col-sm-3 showvalue"><g:formatDate date="${contactInstance?.dateCreation}" format="dd/MM/yyyy" /></div>
                </div>

                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="contact.type.label" default="Type" />:</div>
                  <div class="col-sm-3 showvalue">${fieldValue(bean: contactInstance, field: "type")}</div>
                  <div class="col-sm-3 showlabel"><g:message code="contact.directeurGeneral.label" default="Directeur General" />:</div>
                  <div class="col-sm-3 showvalue">${fieldValue(bean: contactInstance, field: "directeurGeneral")}</div>

                </div>
                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="contact.secteurActivite.label" default="Secteur Activite" />:</div>
                  <div class="col-sm-3 showvalue">${contactInstance?.secteurActivite?.encodeAsHTML()}</div>
                  <div class="col-sm-3 showlabel"><g:message code="contact.typeEntreprise.label" default="Type Entreprise" />:</div>
                  <div class="col-sm-3 showvalue">${contactInstance?.typeEntreprise?.encodeAsHTML()}</div>
                </div> 

                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="contact.effectif.label" default="Effectif" />:</div>
                  <div class="col-sm-3 showvalue">${fieldValue(bean: contactInstance, field: "effectif")}</div>
                  <div class="col-sm-3 showlabel"><g:message code="contact.effectifCadre.label" default="Effectif Cadre" />:</div>
                  <div class="col-sm-3 showvalue">${fieldValue(bean: contactInstance, field: "effectifCadre")}</div>

                </div>
                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="contact.chiffreAffaire.label" default="Chiffre Affaire" />:</div>
                  <div class="col-sm-3 showvalue">${fieldValue(bean: contactInstance, field: "chiffreAffaire")}</div>
                  <div class="col-sm-3 showlabel"><g:message code="contact.dateCreationEntrep.label" default="Date Creation Entrep" />:</div>
                  <div class="col-sm-3 showvalue"><g:formatDate date="${contactInstance?.dateCreationEntrep}" format="dd/MM/yyyy" /></div>
                </div>

                <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Coordonnées</span></h3>

                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="contact.adresse1.label" default="Adresse1" />:</div>
                  <div class="col-sm-3 showvalue">${fieldValue(bean: contactInstance, field: "adresse1")}</div>
                  <div class="col-sm-3 showlabel"><g:message code="contact.ville.label" default="Ville" />:</div>
                  <div class="col-sm-3 showvalue">${contactInstance?.ville?.encodeAsHTML()}</div>
                </div>

                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="contact.adresse2.label" default="Adresse2" /></div>
                  <div class="col-sm-3 showvalue">${fieldValue(bean: contactInstance, field: "adresse2")}</div>    
                </div>

                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="contact.adresse3.label" default="Adresse3" /></div>
                  <div class="col-sm-3 showvalue">${fieldValue(bean: contactInstance, field: "adresse3")}</div>
                  <div class="col-sm-3 showlabel"><g:message code="contact.codePostal.label" default="Code Postal" />:</div>
                  <div class="col-sm-3 showvalue">${fieldValue(bean: contactInstance, field: "codePostal")}</div>
                </div>

                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="contact.telephone.label" default="Telephone" />:</div>
                  <div class="col-sm-3 showvalue">${fieldValue(bean: contactInstance, field: "telephone")}</div>
                  <div class="col-sm-3 showlabel"><g:message code="contact.fax.label" default="Fax" />:</div>
                  <div class="col-sm-3 showvalue">${fieldValue(bean: contactInstance, field: "fax")}</div>
                </div>

              </div>
              <div class="tab-pane" id="tab_br2">
                <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Interlocuteurs</span></h3>
                <table class="table table-striped table-bordered table-condensed">
                  <tbody>
                    <tr>
                      <th>Nom</th>
                      <th>Prénom</th>
                      <th>Fonction</th>
                      <th>telephone Portable</th>
                      <th>telephone Fixe</th>
                      <th>Email</th>
                    </tr>
                  <g:each in="${contactInstance.interlocuteurcontacts}" var="c">
                    <tr class="prop">
                      <td valign="top" style="text-align: left;" class="value">${c?.nom}</td>	
                      <td valign="top" style="text-align: left;" class="value">${c?.prenom}</td>
                      <td valign="top" style="text-align: left;" class="value">${c?.fonction}</td>
                      <td valign="top" style="text-align: left;" class="value">${c?.telephonePortable}</td>	
                      <td valign="top" style="text-align: left;" class="value">${c?.telephoneFixe}</td>
                      <td valign="top" style="text-align: left;" class="value">${c?.email}</td>
                    </tr>
                  </g:each>
                  </tbody>
                </table>
              </div>
              <div class="tab-pane" id="tab_br3">
                <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Historique</span></h3>
                <table class="table table-striped table-bordered table-condensed">
                  <tbody>
                    <tr>
                      <th>Contact</th>
                      <th>Responsable</th>
                      <th>date de l'action</th>
                      <th>Statut</th>
                      <th>Contenu</th>
                    </tr>
                  <g:each in="${contactInstance.actioncontacts}" var="c">
                    <tr class="prop">
                      <td valign="top" style="text-align: left;" class="value"><g:link controller="ActionContact" action="show" id="${c?.id}">${c?.contact?.encodeAsHTML()}</g:link></td>	
                    <td valign="top" style="text-align: left;" class="value">${c?.responsable?.encodeAsHTML()}</td>	
                    <td valign="top" style="text-align: left;" class="value"><g:formatDate date="${c?.dateAction}" format="dd/MM/yyyy" /></td>	
                    <td valign="top" style="text-align: left;" class="value">${c?.statutAction}</td>	
                    <td valign="top" style="text-align: left;" class="value">${c?.contenu}</td>	
                    </tr>
                  </g:each>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
</section>

</body>

</html>
