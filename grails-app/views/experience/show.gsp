
<%@ page import="com.rabbahsoft.diorhprofiler.Experience" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'experience.label', default: 'Experience')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-experience" class="first">

	<table class="table table-striped table-bordered table-condensed">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="experience.candidat.label" default="Candidat" /></td>
				
				<td valign="top" class="value"><g:link controller="candidat" action="show" id="${experienceInstance?.candidat?.id}">${experienceInstance?.candidat?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="experience.intitulePoste.label" default="Intitule Poste" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: experienceInstance, field: "intitulePoste")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="experience.entreprise.label" default="Entreprise" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: experienceInstance, field: "entreprise")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="experience.mission.label" default="Mission" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: experienceInstance, field: "mission")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="experience.rattachement.label" default="Rattachement" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: experienceInstance, field: "rattachement")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="experience.dateDebut.label" default="Date Debut" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${experienceInstance?.dateDebut}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="experience.dateFin.label" default="Date Fin" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${experienceInstance?.dateFin}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="experience.contact.label" default="Contact" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: experienceInstance, field: "contact")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="experience.fonctionContact.label" default="Fonction Contact" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: experienceInstance, field: "fonctionContact")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="experience.nbrPersonneEncadre.label" default="Nbr Personne Encadre" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: experienceInstance, field: "nbrPersonneEncadre")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="experience.poste.label" default="Poste" /></td>
				
				<td valign="top" class="value"><g:link controller="poste" action="show" id="${experienceInstance?.poste?.id}">${experienceInstance?.poste?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="experience.secteurActivite.label" default="Secteur Activite" /></td>
				
				<td valign="top" class="value"><g:link controller="secteurActivite" action="show" id="${experienceInstance?.secteurActivite?.id}">${experienceInstance?.secteurActivite?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="experience.telephoneContact.label" default="Telephone Contact" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: experienceInstance, field: "telephoneContact")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="experience.typeEntreprise.label" default="Type Entreprise" /></td>
				
				<td valign="top" class="value"><g:link controller="typeEntreprise" action="show" id="${experienceInstance?.typeEntreprise?.id}">${experienceInstance?.typeEntreprise?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="experience.ville.label" default="Ville" /></td>
				
				<td valign="top" class="value"><g:link controller="ville" action="show" id="${experienceInstance?.ville?.id}">${experienceInstance?.ville?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
