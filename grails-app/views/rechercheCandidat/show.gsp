
<%@ page import="com.rabbahsoft.diorhprofiler.RechercheCandidat" %>
<!DOCTYPE html>
<html>

  <head>
    <meta name="layout" content="globallayout" />
  <g:set var="entityName" value="${message(code: 'rechercheCandidat.label', default: 'RechercheCandidat')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>
<g:if test="${!layout_nosecondarymenu}">
  <g:render template="submenubar"/>														
</g:if>
<div class="tabbable tabbable-bordered">
  <ul class="nav nav-tabs">
    <li class="active"><a href="#tab_br1" data-toggle="tab">Informations personnelles.</a></li>
    <li><a href="#tab_br2" data-toggle="tab">Formations et Compétences </a></li>
    <li><a href="#tab_br3" data-toggle="tab">Expériences Professionnelles</a></li>
    <li><a href="#tab_br4" data-toggle="tab">Suivi du candidat</a></li>
    <li><a href="#tab_br5" data-toggle="tab">Mots clés</a></li>
  </ul>
  <div class="tab-content">
    <div class="tab-pane active" id="tab_br1">

      <section id="show-rechercheCandidat" class="first">

        <table border="0" class="showcnd">
          <tbody>
            <tr class="prop">
              <td class="colshowcnd"><g:message code="rechercheCandidat.libellerecherche.label" default="Libellerecherche" /></td>
          <td valign="top" class="value">${fieldValue(bean: rechercheCandidatInstance, field: "libellerecherche")}</td>	
          </tr>

          <tr class="prop">
            <td class="colshowcnd"><g:message code="rechercheCandidat.nomStockage.label" default="Nom Stockage" /></td>
          <td valign="top" class="value">${fieldValue(bean: rechercheCandidatInstance, field: "nomStockage")}</td>	
          <td class="colshowcnd"><g:message code="rechercheCandidat.prenomStockage.label" default="Prenom Stockage" /></td>
          <td valign="top" class="value">${fieldValue(bean: rechercheCandidatInstance, field: "prenomStockage")}</td>
          </tr>

          <tr class="prop">
            <td class="colshowcnd"><g:message code="rechercheCandidat.civilite.label" default="Civilite" /></td>
          <td valign="top" class="value"><g:link controller="civilite" action="show" id="${rechercheCandidatInstance?.civilite?.id}">${rechercheCandidatInstance?.civilite?.encodeAsHTML()}</g:link></td>

          </tr>

          <tr class="prop">
            <td class="colshowcnd"><g:message code="rechercheCandidat.ageMin.label" default="Age Min" /></td>
          <td valign="top" class="value">${fieldValue(bean: rechercheCandidatInstance, field: "ageMin")}</td>
          <td class="colshowcnd"><g:message code="rechercheCandidat.ageMax.label" default="Age Max" /></td>
          <td valign="top" class="value">${fieldValue(bean: rechercheCandidatInstance, field: "ageMax")}</td>
          </tr>


          <tr class="prop">
            <td class="colshowcnd"><g:message code="rechercheCandidat.villes.label" default="Villes" /></td>

          <td valign="top" style="text-align: left;" class="value">
            <ul>
              <g:each in="${rechercheCandidatInstance.villes}" var="v">
                <li><g:link controller="ville" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
              </g:each>
            </ul>
          </td>

          </tr>

          </tbody>
        </table>
    </div>
    <div class="tab-pane" id="tab_br2">
      <table border="0" class="showcnd">
        <tbody>
          <tr class="prop">
            <td class="colshowcnd"><g:message code="rechercheCandidat.niveauetudes.label" default="Niveauetudes" /></td>

        <td valign="top" style="text-align: left;" class="value">
          <ul>
            <g:each in="${rechercheCandidatInstance.niveauetudes}" var="n">
              <li><g:link controller="niveauEtude" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></li>
            </g:each>
          </ul>
        </td>

        <td class="colshowcnd"><g:message code="rechercheCandidat.diplomes.label" default="Diplomes" /></td>
        <td valign="top" style="text-align: left;" class="value">
          <ul>
            <g:each in="${rechercheCandidatInstance.diplomes}" var="d">
              <li><g:link controller="diplome" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
            </g:each>
          </ul>
        </td>

        </tr>
        </tbody>
      </table>
    </div>
    <div class="tab-pane" id="tab_br3">
      <table border="0" class="showcnd">
        <tbody>
          <tr class="prop">
            <td class="colshowcnd"><g:message code="rechercheCandidat.plageexperiences.label" default="Plageexperiences" /></td>

        <td valign="top" style="text-align: left;" class="value">
          <ul>
            <g:each in="${rechercheCandidatInstance.plageexperiences}" var="p">
              <li><g:link controller="plageExperience" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
            </g:each>
          </ul>
        </td>

        <td class="colshowcnd"><g:message code="rechercheCandidat.postes.label" default="Postes" /></td>
        <td valign="top" style="text-align: left;" class="value">
          <ul>
            <g:each in="${rechercheCandidatInstance.postes}" var="p">
              <li><g:link controller="poste" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
            </g:each>
          </ul>
        </td>

        </tr>

        <tr>
          <td class="colshowcnd control-label"><g:message code="rechercheCandidat.secteuractivites.label" default="Secteuractivites" /></td>
        <td valign="top" style="text-align: left;" class="value">
          <ul>
            <g:each in="${rechercheCandidatInstance.secteuractivites}" var="s">
              <li><g:link controller="secteurActivite" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
            </g:each>
          </ul>
        </td>

        <td class="colshowcnd control-label"><g:message code="rechercheCandidat.typeentreprises.label" default="Typeentreprises" /></td>

        <td valign="top" style="text-align: left;" class="value">
          <ul>
            <g:each in="${rechercheCandidatInstance.typeentreprises}" var="t">
              <li><g:link controller="typeEntreprise" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
            </g:each>
          </ul>
        </td>

        </tr>
        </tbody>
      </table>
    </div>
    <div class="tab-pane" id="tab_br4">
      <table border="0" class="showcnd">
        <tbody>


          <tr>
            <td class="colshowcnd"><g:message code="rechercheCandidat.annote.label" default="Annote" /></td>
        <td valign="top" class="value"><g:formatBoolean boolean="${rechercheCandidatInstance?.annote}" /></td>
        <td class="colshowcnd control-label"><g:message code="rechercheCandidat.sourceInscription.label" default="Source Inscription" /></td>
        <td class="colshowcnd"><g:link controller="sourceInscription" action="show" id="${rechercheCandidatInstance?.sourceInscription?.id}">${rechercheCandidatInstance?.sourceInscription?.encodeAsHTML()}</g:link></td>
        </tr>

        <tr class="prop">
          <td class="colshowcnd control-label"><g:message code="rechercheCandidat.profil1.label" default="Profil1" /></td>
        <td class="colshowcnd"><g:link controller="annotationProfil" action="show" id="${rechercheCandidatInstance?.profil1?.id}">${rechercheCandidatInstance?.profil1?.encodeAsHTML()}</g:link></td>
        <td class="colshowcnd control-label"><g:message code="rechercheCandidat.annotation1.label" default="Annotation1" /></td>
        <td class="colshowcnd"><g:link controller="annotationNote" action="show" id="${rechercheCandidatInstance?.annotation1?.id}">${rechercheCandidatInstance?.annotation1?.encodeAsHTML()}</g:link></td>	
        </tr>

        <tr class="prop">
          <td class="colshowcnd control-label"><g:message code="rechercheCandidat.profil2.label" default="Profil2" /></td>
        <td class="colshowcnd"><g:link controller="annotationProfil" action="show" id="${rechercheCandidatInstance?.profil2?.id}">${rechercheCandidatInstance?.profil2?.encodeAsHTML()}</g:link></td>      
        <td class="colshowcnd control-label"><g:message code="rechercheCandidat.annotation2.label" default="Annotation2" /></td>
        <td class="colshowcnd"><g:link controller="annotationNote" action="show" id="${rechercheCandidatInstance?.annotation2?.id}">${rechercheCandidatInstance?.annotation2?.encodeAsHTML()}</g:link></td>

        </tr>


        </tbody>
      </table>
    </div>
    <div class="tab-pane" id="tab_br5">
      <table border="0" class="showcnd">
        <tbody>
          <tr>	
            <td class="colshowcnd control-label"><g:message code="rechercheCandidat.motCle.label" default="Mot Cle" /></td>
        <td class="colshowcnd">${fieldValue(bean: rechercheCandidatInstance, field: "motCle")}</td>
        </tr>
        </tbody> 
      </table>
    </div>
  </div>
</div>
</section>

</body>

</html>
