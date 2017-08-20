<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.rabbahsoft.diorhprofiler.Candidat" 
<%@ page import="com.rabbahsoft.diorhprofiler.FormationCandidat" 
<%@page defaultCodec="none" %>

<!DOCTYPE html>
<html>

  <head>
<!--   <meta http-equiv="Content-Type" content="text/html; charset=windows-1252" /> 
<meta http-equiv="content-type" content="text/html; charset=ISO-8859-1" /> -->
    <meta name="layout" content="globallayout" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />!
  <g:set var="entityName" value="${message(code: 'candidat.label', default: 'Candidat')}" />
  <g:javascript src="jquery.js" />
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
  <script type="text/javascript">
    $(function() {
  $(".view").on("click", function() {
     var val1 = $(this).attr( 'href' );
       $.post("/DiorhProfiler/Candidat/testonglet",
          {
            value:val1
          },
           function(data) {
          }
        );
      
       
  });
});
      
   
  </script>
</head>

<body>
<g:if test="${session.user!=null}">
  <g:if test="${!layout_nosecondarymenu}">
    <g:render template="submenubar"/>              
  </g:if>
</g:if>
<section id="show-candidat" class="first">
  <div class="row">
    <div class="col-sm-12">
      <div class="panel panel-danger">
        <div>
        </div>
        <div class="panel-heading">
          <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" width="19px" height="19px"/><span class="label label-danger">Détail </span></h3>
        </div>
        <div class="panel-body">
          <g:if test="${session.user!=null}">
          <g:link action="precedent_listnormal" id="${candidatInstance.id} " params="[index:i ]" style="color:red">Precedent</g:link>
          <g:link action="suivant_listnormal" id="${candidatInstance.id}" style="color:red" params="[index:i ]">Suivant</g:link>
          </g:if>
          <div class="tabbable tabbable-bordered">
            <ul class="nav nav-tabs">
              <li class="${session.href==null || session.href=='#tab_br1' ? "active" : ""}"><a href="#tab_br1" data-toggle="tab" id="tab" value="tab1" class="view">informations personnelles.</a></li>
              <li class="${session.href!=null && session.href=='#tab_br2' ? "active" : ""}"><a href="#tab_br2" data-toggle="tab" id="tab" value="tab2" class="view">Formations et Compétences </a></li>
              <li class="${session.href!=null && session.href=='#tab_br3' ? "active" : ""}"><a href="#tab_br3" data-toggle="tab" id="tab" value="value3" class="view">Expériences Professionnelles</a></li>
              <g:if test="${session.droits!=null && session.droits.GERER_CANDIDAT!=null}">
              <li class="${session.href!=null && session.href=='#tab_br4' ? "active" : ""}"><a href="#tab_br4" data-toggle="tab" id="tab" value="value4" class="view">Suivi du candidat</a></li>
              </g:if>
              <li class="${session.href!=null && session.href=='#tab_br5' ? "active" : ""}"><a href="#tab_br5" data-toggle="tab">Candidatures</a></li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane ${session.href==null || session.href=='#tab_br1' ? "active" : ""}" id="tab_br1">
                <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Identité</span></h3>

                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="candidat.nomStockage.label" default="Nom Stockage" />:</div>
                  <g:if test="${candidatInstance?.nomStockage!=null && candidatInstance?.nomStockage!='null' && candidatInstance?.nomStockage!=''}">
                  <div class="col-sm-3 showvalue">${fieldValue(bean: candidatInstance, field: "nomStockage")}</div>
                  </g:if>
                  <div class="col-sm-3 showlabel"><g:message code="candidat.prenomStockage.label" default="Prenom Stockage" />:</div>
                   <g:if test="${candidatInstance?.prenomStockage!=null && candidatInstance?.prenomStockage!='null' && candidatInstance?.prenomStockage!=''}">
                  <div class="col-sm-3 showvalue">${fieldValue(bean: candidatInstance, field: "prenomStockage")}</div>
                  </g:if>
                </div>

                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="candidat.civilite.label" default="Civilite" />:</div>
                  <g:if test="${candidatInstance?.civilite!=null && candidatInstance?.civilite!='null' && candidatInstance?.civilite!=''}">
                  <div class="col-sm-3 showvalue">${candidatInstance?.civilite?.encodeAsHTML()}</div>
                  </g:if>
                  <div class="col-sm-3 showlabel"><g:message code="candidat.situationFamiliale.label" default="Situation Familiale" />:</div>
                  <g:if test="${candidatInstance?.situationFamiliale!=null && candidatInstance?.situationFamiliale!='null' && candidatInstance?.situationFamiliale!=''}">
                  <div class="col-sm-3 showvalue">${candidatInstance?.situationFamiliale?.encodeAsHTML()}</div>  
                  </g:if>
                </div>

                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="candidat.dateNaissance.label" default="Date Naissance" />:</div>
                  <g:if test="${candidatInstance?.dateNaissance!=null && candidatInstance?.dateNaissance!='null' && candidatInstance?.dateNaissance!=''}">
                  <div class="col-sm-3 showvalue"><g:formatDate date="${candidatInstance?.dateNaissance}" format="dd/MM/yyyy" /></div>
                  </g:if>
                  <div class="col-sm-3 showlabel"><g:message code="candidat.lieuNaissance.label" default="Lieu Naissance" />:</div>
                  <g:if test="${candidatInstance?.lieuNaissance!=null && candidatInstance?.lieuNaissance!='null' && candidatInstance?.lieuNaissance!=''}">
                  <div class="col-sm-3 showvalue">${candidatInstance?.lieuNaissance?.encodeAsHTML()}</div>
                  </g:if>
                </div>

                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="candidat.telPortable.label" default="Tel Portable" />:</div>
                  <g:if test="${candidatInstance?.telPortable!=null && candidatInstance?.telPortable!='null' && candidatInstance?.telPortable!=''}">
                  <div class="col-sm-3 showvalue">${fieldValue(bean: candidatInstance, field: "telPortable")}</div>
                  </g:if>
                  <div class="col-sm-3 showlabel"><g:message code="candidat.telFix.label" default="Tel Fix" />:</div>
                  <g:if test="${candidatInstance?.telPortable!=null && candidatInstance?.telFix!='null' && candidatInstance?.telFix!=''}">
                  <div class="col-sm-3 showvalue">${fieldValue(bean: candidatInstance, field: "telFix")}</div>
                  </g:if>
                </div>

                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="candidat.adresse.label" default="Adresse" />:</div>
                  <g:if test="${candidatInstance?.adresse!=null && candidatInstance?.adresse!='null' && candidatInstance?.adresse!=''}">
                  <div class="col-sm-3 showvalue">${fieldValue(bean: candidatInstance, field: "adresse")}</div>
                  </g:if>
                  <div class="col-sm-3 showlabel"><g:message code="candidat.ville.label" default="Ville" />:</div>
                  <g:if test="${candidatInstance?.villecandidat!=null && candidatInstance?.villecandidat!='null' && candidatInstance?.villecandidat!=''}">
                  <div class="col-sm-3 showvalue">${candidatInstance?.villecandidat?.encodeAsHTML()}</div>
                  </g:if>
                </div>

                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="candidat.nationalite.label" default="Nationalite" />:</div>
                  <g:if test="${candidatInstance?.nationalite!=null && candidatInstance?.nationalite!='null' && candidatInstance?.nationalite!=''}">
                  <div class="col-sm-3 showvalue">${candidatInstance?.nationalite?.encodeAsHTML()}</div>
                  </g:if>
                  <div class="col-sm-3 showlabel"><g:message code="candidat.sourceInscription.label" default="Source Inscription" />:</div>
                  <g:if test="${candidatInstance?.sourceInscription!=null && candidatInstance?.sourceInscription!='null' && candidatInstance?.sourceInscription!=''}">
                  <div class="col-sm-3 showvalue">${candidatInstance?.sourceInscription?.encodeAsHTML()}</div>
                  </g:if>
                </div>

                <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Fichiers joints</span></h3>
                <div class="row">
                  <div class="col-sm-3 showlabel">
                    <g:message code="candidat.cvshow.label" default="CV :" />
                  </div>
                  <div class="col-sm-9 showvalue">
                    <g:if test="${candidatInstance.getTotalAttachments('cv')!=0}">
                      <attachments:icon attachment="${candidatInstance.getAttachments('cv')[0]}"/>
                      <attachments:downloadLink attachment="${candidatInstance.getAttachments('cv')[0]}"/>
                    </g:if>
                    <g:else>
                      <g:message code="candidat.cv.label" default="Email" />
                    </g:else>
                  </div>
                </div>
                <div class="row">
                  <div class="col-sm-3 showlabel">
                    <g:message code="candidat.photoshow.label" default="Photo :" />
                  </div>
                  <div class="col-sm-9 showvalue">
                    <g:if test="${candidatInstance.getTotalAttachments('photo')!=0}">
                      <attachments:icon attachment="${candidatInstance.getAttachments('photo')[0]}"/>
                      <attachments:downloadLink attachment="${candidatInstance.getAttachments('photo')[0]}"/>
                    </g:if>
                    <g:else>
                      <g:message code="candidat.photo.label" default="Email" />
                    </g:else>
                  </div>
                </div>
                <div class="row">
                  <div class="col-sm-3 showlabel">
                    <g:message code="candidat.diplomeshow.label" default="Diplome :" />
                  </div>
                  <div class="col-sm-9 showvalue">
                    <g:if test="${candidatInstance.getTotalAttachments('diplome')!=0}">
                      <attachments:icon attachment="${candidatInstance.getAttachments('diplome')[0]}"/>
                      <attachments:downloadLink attachment="${candidatInstance.getAttachments('diplome')[0]}"/>
                    </g:if>
                    <g:else>
                      <g:message code="candidat.diplome.label" default="Email" />
                    </g:else>
                  </div>
                </div>
                <div class="row">
                  <div class="col-sm-3 showlabel">
                    <g:message code="candidat.bulletinpaieshow.label" default="Bulletin de paie :" />
                  </div>
                  <div class="col-sm-9 showvalue">
                    <g:if test="${candidatInstance.getTotalAttachments('bulletinpaie')!=0}">
                      <attachments:icon attachment="${candidatInstance.getAttachments('bulletinpaie')[0]}"/>
                      <attachments:downloadLink attachment="${candidatInstance.getAttachments('bulletinpaie')[0]}"/>
                    </g:if>
                    <g:else>
                      <g:message code="candidat.bulletinpaie.label" default="Email" />
                    </g:else>
                  </div>
                </div>
                <div class="row">
                  <div class="col-sm-3 showlabel">
                    <g:message code="candidat.attestationshow.label" default="Attestation :" />
                  </div>
                  <div class="col-sm-9 showvalue">
                    <g:if test="${candidatInstance.getTotalAttachments('attestation')!=0}">
                      <attachments:icon attachment="${candidatInstance.getAttachments('attestation')[0]}"/>
                      <attachments:downloadLink attachment="${candidatInstance.getAttachments('attestation')[0]}"/>
                    </g:if>
                    <g:else>
                      <g:message code="candidat.attestation.label" default="Email" />
                    </g:else>
                  </div>
                </div>
                </tbody>
                </table> 
                <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Authentification</span></h3>      

                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="candidat.email.label" default="Email" />:</div>
                  <div class="col-sm-3 showvalue"><a href="mailto:${fieldValue(bean: candidatInstance, field: "email")}">${fieldValue(bean: candidatInstance, field: "email")}</a></div>
                  <g:if test="${session.user!=null && session.user.profil.libelle=='candidat'}">
                    <div class="col-sm-3"><a href="${createLink(controller:"home",action: 'changementmotdepasse')}" class='label label-danger'>Modifier le mot de passe</a></div>
                  </g:if> 
                </div>

               <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="candidat.dateCreated.label" default="Date Created" />:</div>
                  <g:if test="${candidatInstance?.dateCreated!=null && candidatInstance?.dateCreated!='null' && candidatInstance?.dateCreated!=''}">
                  <div class="col-sm-3 showvalue"><g:formatDate date="${candidatInstance?.dateCreated}" format="dd/MM/yyyy"/></div>
                  </g:if>
                  
                  <div class="col-sm-3 showlabel"><g:message code="candidat.lastUpdated.label" default="Last Updated" />:</div>
                  <g:if test="${candidatInstance?.lastUpdated!=null && candidatInstance?.lastUpdated!='null' && candidatInstance?.lastUpdated!=''}">
                  <div class="col-sm-3 showvalue"><g:formatDate date="${candidatInstance?.lastUpdated}"  format="dd/MM/yyyy"/></div>
                  </g:if>
                </div>                      
              </div>
              <div class="tab-pane ${session.href!=null && session.href=='#tab_br2' ? "active" : ""}" id="tab_br2">
                <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Formations</span></h3>

                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="candidat.niveauEtude.label" default="Niveau Etude" />:</div>
                  <g:if test="${candidatInstance?.niveauEtude!=null && candidatInstance?.niveauEtude!='null' && candidatInstance?.niveauEtude!=''}">
                  <div class="col-sm-3 showvalue">${candidatInstance?.niveauEtude?.encodeAsHTML()}</div>	
                 </g:if>
                </div>

                <table class="table table-striped table-bordered table-condensed">
                  <tbody>
                    <tr>
                    </tr>
                  <g:each in="${candidatInstance.formationcandidats}" var="formationcandidat">
                    <tr class="prop">
                      <td valign="top" style="text-align: left;" class="value">${formationcandidat?.annee}</td>	
                      <td valign="top" style="text-align: left;" class="value">              
          <g:if test="${formationcandidat?.diplome!=null && formationcandidat?.diplome!='null' && formationcandidat?.diplome?.libelle!="null" && formationcandidat?.diplome?.libelle!=null}">
<strong>${formationcandidat?.diplome?.encodeAsHTML()}</strong> -
  </g:if>
                    <g:if test="${formationcandidat?.intituleDiplome!=null && formationcandidat?.intituleDiplome!='null' && formationcandidat?.intituleDiplome!="''null"}">
<strong>${formationcandidat?.intituleDiplome?.encodeAsHTML()}</strong>
  </g:if>
    </br>
     <g:if test="${formationcandidat?.etablissement!=null && formationcandidat?.etablissement!='null' && formationcandidat?.etablissement!='null'}">
${formationcandidat?.etablissement?.encodeAsHTML()} -
  </g:if>
     <g:if test="${formationcandidat?.typeEtablissement!=null && formationcandidat?.typeEtablissement!='null' && formationcandidat?.etablissement!='null'}">
${formationcandidat?.typeEtablissement?.encodeAsHTML()} -
  </g:if>
     <g:if test="${formationcandidat?.ville!=null && formationcandidat?.ville!='null'}">
${formationcandidat?.ville?.encodeAsHTML()}
  </g:if>
                      
                      
                      </td>
                    </tr>
    </g:each>
                  </tbody>
                </table>
<!--                <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Compétences informatiques</span></h3>

                <table class="table table-striped table-bordered table-condensed">
                  <tbody>
                    <tr>
                      <th>Intitulé de la compétence</th>
                    </tr>
                  <g:each in="${candidatInstance.connaissancesInfo}" var="c">
                    <tr class="prop">
                      <td valign="top" style="text-align: left;" class="value">${c?.encodeAsHTML()}</td>
                    </tr>
                  </g:each>
                  </tbody>
                </table>-->
                <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Compétences linguistiques</span></h3>

                <table class="table table-striped table-bordered table-condensed">
                  <tbody>
                    <tr>
                      <th>Intitulé de la Langue </th>
                      <th>Niveau de la Langue </th>
                    </tr>
                  <g:each in="${candidatInstance.connaissanceLinguistiques}" var="c">
                    <tr class="prop">
                      <td valign="top" style="text-align: left;" class="value">${c?.langue?.intituleLangue}</td>
                      <td valign="top" style="text-align: left;" class="value">${c?.niveau?.intituleNiveauLangue}</td>	
                    </tr>
                  </g:each>
                  </tbody>
                </table>
              </div>

              <div class="tab-pane ${session.href!=null && session.href=='#tab_br3' ? "active" : ""}" id="tab_br3">
                <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Formations</span></h3>

                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="candidat.candidat.plageExperience.label.label" default="Nombre d'années d'expérience" />:</div>
                  <g:if test="${candidatInstance?.plageExperience!=null && candidatInstance?.plageExperience!='null' && candidatInstance?.plageExperience!=''}">
                  <div class="col-sm-3 showvalue">${candidatInstance?.plageExperience?.encodeAsHTML()}</div>
                  </g:if>
                </div>
                </tbody>
                </table>

                <table class="table table-striped table-bordered table-condensed">
                  <tbody>
                  <g:each in="${candidatInstance.experiences}" var="experience">
                    <tr class="prop">
                      <td valign="top" style="text-align: left;" class="value"><g:formatDate date="${experience?.dateDebut}" format="dd/MM/yyyy"/> - <g:formatDate date="${experience?.dateFin}" format="dd/MM/yyyy"/></td>	
                    <td valign="top" style="text-align: left;" class="value">
                   
    
    <g:if test="${experience?.poste!=null && experience?.poste!='null'}">
<strong>${experience?.poste}</strong>-
  </g:if>
                    <g:if test="${experience?.intitulePoste!=null && experience?.intitulePoste!='null'}">
<strong>${experience?.intitulePoste}</strong></br>
  </g:if>
     <g:if test="${experience?.entreprise!=null && experience?.entreprise!='null'}">
${experience?.entreprise}</br>
  </g:if>
     <g:if test="${experience?.mission!=null && experience?.mission!='null'}">
${experience?.mission}
  </g:if>
                    </td>
                    <td valign="top" style="text-align: left;" class="value"></td>
                    </tr>
                  </g:each>
                  </tbody>
                </table>


                <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Informations complémentaires</span></h3> 

                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="candidat.remunMontantNet.label" default="Remun Montant Net" />:</div>
                  <div class="col-sm-3 showvalue">${fieldValue(bean: candidatInstance, field: "remunMontantNet")}</div>
                  <div class="col-sm-3 showlabel"><g:message code="candidat.remunNbrMois.label" default="Remun Nbr Mois" />:</div>
                  <div class="col-sm-3 showvalue">${fieldValue(bean: candidatInstance, field: "remunNbrMois")}</div> 
                </div>

                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="candidat.remunAvantages.label" default="Remun Avantages" />:</div>
                  <div class="col-sm-3 showvalue">${fieldValue(bean: candidatInstance, field: "remunAvantages")}</div>
                  <div class="col-sm-3 showlabel"><g:message code="candidat.preavis.label" default="Preavis" />:</div>
                  <div class="col-sm-3 showvalue">${fieldValue(bean: candidatInstance, field: "preavis")}</div> 
                </div>

                <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="candidat.remunPretention.label" default="Remun Pretention" />:</div>
                  <div class="col-sm-3 showvalue">${fieldValue(bean: candidatInstance, field: "remunPretention")}</div>
                </div>

                <h3 class="heading"></h3>

                 <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="candidat.mobiliteGeographique.label" default="Mobilite Geographique" />:</div>
                  <g:if test="${candidatInstance?.mobiliteGeographique!=null && candidatInstance?.mobiliteGeographique!='null' && candidatInstance?.mobiliteGeographique!=''}">
                  <div class="col-sm-3 showvalue">${candidatInstance?.mobiliteGeographique?.encodeAsHTML()}</div>
                  </g:if>
                  <div class="col-sm-3 showlabel"><g:message code="candidat.mobilite1.label" default="Mobilite1" />:</div>
                  <g:if test="${candidatInstance?.mobilite1!=null && candidatInstance?.mobilite1!='null' && candidatInstance?.mobilite1!=''}">
                  <div class="col-sm-3 showvalue">${candidatInstance?.mobilite1?.encodeAsHTML()}</div>
                  </g:if>
                </div>

                 <div class="row">
                  <div class="col-sm-3 showlabel"><g:message code="candidat.mobilite2.label" default="Mobilite2" />:</div>
                  <g:if test="${candidatInstance?.mobilite2!=null && candidatInstance?.mobilite2!='null' && candidatInstance?.mobilite2!=''}">
                  <div class="col-sm-3 showvalue">${candidatInstance?.mobilite2?.encodeAsHTML()}</div>	
                  </g:if>
                  <div class="col-sm-3 showlabel"><g:message code="candidat.mobilite3.label" default="Mobilite3" />:</div>
                  <g:if test="${candidatInstance?.mobilite3!=null && candidatInstance?.mobilite3!='null' && candidatInstance?.mobilite3!=''}">
                  <div class="col-sm-3 showvalue">${candidatInstance?.mobilite3?.encodeAsHTML()}</div>	
                  </g:if>		
                </div>
              </div>

              <g:if test="${session.droits!=null && session.droits.GERER_CANDIDAT!=null}">
                <div class="tab-pane ${session.href!=null && session.href=='#tab_br4' ? "active" : ""}" id="tab_br4">
                  <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Annotation par profil</span></h3>
                  <table border="0" class="showcnd">
                    <tbody>
                    <div class="row">
                      <div class="col-sm-3 showlabel"><g:message code="candidat.profil1.label" default="Profil1" />:</div>
                      <div class="col-sm-3 showvalue">${candidatInstance?.profil1?.encodeAsHTML()}</div>
                      <div class="col-sm-3 showlabel"><g:message code="candidat.annotation1.label" default="Annotation1" />:</div>
                      <div class="col-sm-3 showvalue">${candidatInstance?.annotation1?.encodeAsHTML()}</div>	
                    </div>

                    <div class="row">
                      <div class="col-sm-3 showlabel"><g:message code="candidat.profil2.label" default="Profil2" />:</div>
                      <g:if test="${candidatInstance?.profil2!=null && candidatInstance?.profil2!='null' && candidatInstance?.profil2!=''}">
                      <div class="col-sm-3 showvalue">${candidatInstance?.profil2?.encodeAsHTML()}</div>
                      </g:if>
                      <div class="col-sm-3 showlabel"><g:message code="candidat.annotation2.label" default="Annotation2" />:</div>
                      <g:if test="${candidatInstance?.annotation2!=null && candidatInstance?.annotation2!='null' && candidatInstance?.annotation2!=''}">
                      <div class="col-sm-3 showvalue">${candidatInstance?.annotation2?.encodeAsHTML()}</div>
                      </g:if>
                    </div>

                    <div class="row">
                      <div class="col-sm-3 showlabel"><g:message code="candidat.annotationCommentaire.label" default="Annotation Commentaire" />:</div>
                      <g:if test="${candidatInstance?.annotationCommentaire!=null && candidatInstance?.annotationCommentaire!='null' && candidatInstance?.annotationCommentaire!=''}">
                      <div class="col-sm-3 showvalue">${fieldValue(bean: candidatInstance, field: "annotationCommentaire")}</div>   
                      </g:if>
                    </div>
                    <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Synthèse et rapport de performance</span></h3>


                    <div class="row">
                       <div class="row">
                      <div class="col-sm-3 showlabel"><g:message code="candidat.syntheseDiorh.label" default="Synthese Diorh" />:</div>
                      <g:if test="${candidatInstance?.syntheseDiorh!=null && candidatInstance?.syntheseDiorh!='null' && candidatInstance?.syntheseDiorh!=''}">
                      <div class="col-sm-9 showvalue">${fieldValue(bean: candidatInstance, field: "syntheseDiorh")}</div>
                      </g:if>
                    </div>
                    <div class="row">
                      <div class="col-sm-3 showlabel">
                        <g:message code="candidat.rapportPerformance.label" default="Rapport de performance :" />
                      </div>
                      <div class="col-sm-9 showvalue">
                        <g:if test="${candidatInstance.getTotalAttachments('rapportPerformance')!=0}">
                          <attachments:icon attachment="${candidatInstance.getAttachments('rapportPerformance')[0]}"/>
                          <attachments:downloadLink attachment="${candidatInstance.getAttachments('rapportPerformance')[0]}"/>
                        </g:if>
                        <g:else>
                          <g:message code="candidat.rapportPerformance.label" default="Rapport de performance :" />
                        </g:else>
                      </div>
                    </div>

                    <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Récaputilatif des tests</span></h3>
                    <table class="table table-striped table-bordered table-condensed">
                      <tbody>
                        <tr>
                          <th>Titre de test</th>
                          <th>Date de test</th>
                          <th>Commentaire</th>
                        </tr>
                      <g:each in="${candidatInstance.tests}" var="c">
                        <tr class="prop">
                          <td valign="top" style="text-align: left;" class="value">${c?.titre?.libelle}</td>	
                          <td valign="top" style="text-align: left;" class="value"><g:formatDate date="${c?.dateTest}" format="dd/MM/yyyy"/></td>
                        <td valign="top" style="text-align: left;" class="value">${c?.commentaire}</td>
                        </tr>
                      </g:each>
                      </tbody>
                    </table>
                </div>
              </g:if>
              <div class="tab-pane ${session.href!=null && session.href=='#tab_br5' ? "active" : ""}" id="tab_br5">
                <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">liste des candidatures</span></h3>
                <table class="table table-striped table-bordered table-condensed">
                  <tbody>
                    <tr>
                      <th>Date de dépôt de candidature</th>
                      <th>Réf. mission</th>
                      <th>Poste</th>
                      <th>Société</th>
                      <th>Lieu</th>
                      <th>Source de candidature</th>
                    </tr>
                  <g:each in="${candidatInstance.candidatures}" var="c">
                    <tr class="prop">
                      <td valign="top" style="text-align: left;" class="value"><g:link controller="candidature" action="show" id="${c.id}"><g:formatDate date="${c?.dateCandidature}" format="dd/MM/yyyy" /></g:link></td>
                    <td valign="top" style="text-align: left;" class="value">${c?.mission?.reference}</td>
                    <td valign="top" style="text-align: left;" class="value">${c?.mission?.poste}</td>
                    <td valign="top" style="text-align: left;" class="value">${c?.mission?.entreprise}</td>
                    <td valign="top" style="text-align: left;" class="value">${c?.mission?.localisation}</td>
                    <td valign="top" style="text-align: left;" class="value">${c?.sourceCandidature}</td>
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
  </div> 
</section>
</body>
</html>