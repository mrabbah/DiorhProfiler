<%@ page import="com.rabbahsoft.diorhprofiler.Experience" %>



                       
                        <table class="widthtable">
                        <tr>
                        <div class="${hasErrors(bean: experienceInstance, field: 'poste', 'error')} required">
                        <td width="250"><label for="poste" class="control-label"><g:message code="experience.poste.label" default="Poste" /><span class="required-indicator">* :</span></label></td>
			<div>
                        <td><g:select class="form-control" id="poste" name="poste.id" from="${com.rabbahsoft.diorhprofiler.Poste.list()}" optionKey="id" required="" value="${experienceInstance?.poste?.id}" class="form-control"/></td>
			<span class="help-inline">${hasErrors(bean: experienceInstance, field: 'poste', 'error')}</span>			
                        </div>
			</div>
                        <div class="${hasErrors(bean: experienceInstance, field: 'intitulePoste', 'error')} required">
                        <td width="250"><label for="intitulePoste" class="control-label"><g:message code="experience.intitulePoste.label" default="Intitule Poste" /><span class="required-indicator">* :</span></label></td>
			<div>
                        <td><g:textField class="form-control" name="intitulePoste" maxlength="100" required="" value="${experienceInstance?.intitulePoste}"/></td>
			<span class="help-inline">${hasErrors(bean: experienceInstance, field: 'intitulePoste', 'error')}</span>			
                        </div>
			</div>
                         </tr>
                        </table>

                        
                        <table class="widthtable">
                        <tr>
                        <div class="${hasErrors(bean: experienceInstance, field: 'entreprise', 'error')} required">
                        <td width="250"><label for="entreprise" class="control-label"><g:message code="experience.entreprise.label" default="Entreprise" /><span class="required-indicator">* :</span></label></td>
			<div>
                        <td width="200"><g:textField class="form-control" name="entreprise" maxlength="100" required="" value="${experienceInstance?.entreprise}"/></td>
			<span class="help-inline">${hasErrors(bean: experienceInstance, field: 'entreprise', 'error')}</span>			
                        </div>
			</div>
                        
                        <div class="${hasErrors(bean: experienceInstance, field: 'ville', 'error')} required">
                        <td width="250"><label for="ville" class="control-label"><g:message code="experience.ville.label" default="Ville" /><span class="required-indicator">* :</span></label></td>
			<div>
                        <td width="200"><g:select class="form-control" id="ville" name="ville.id" from="${com.rabbahsoft.diorhprofiler.Ville.list()}" optionKey="id" required="" value="${experienceInstance?.ville?.id}" class="form-control"/></td>
			<span class="help-inline">${hasErrors(bean: experienceInstance, field: 'ville', 'error')}</span>			
                        </div>
			</div>
                        </tr>
                        </table>
                        
                        <table class="widthtable">
                        <tr>
                        <div class="${hasErrors(bean: experienceInstance, field: 'dateDebut', 'error')} required">
                        <td width="250"><label for="dateDebut" class="control-label"><g:message code="experience.dateDebut.label" default="Date Debut" /><span class="required-indicator">* :</span></label></td>
			<div>
                        <td width="200"><bs:datePicker name="dateDebut" precision="day"  value="${experienceInstance?.dateDebut}"  /></td>
			<span class="help-inline">${hasErrors(bean: experienceInstance, field: 'dateDebut', 'error')}</span>			
                        </div>
			</div>

                        <div class="${hasErrors(bean: experienceInstance, field: 'dateFin', 'error')} ">
                        <td width="250"><label for="dateFin" class="control-label"><g:message code="experience.dateFin.label" default="Date Fin" /></label></td>
			<div>
                        <td width="200"><bs:datePicker name="dateFin" precision="day"  value="${experienceInstance?.dateFin}" default="none" noSelection="['': '']" /></td>
			<span class="help-inline">${hasErrors(bean: experienceInstance, field: 'dateFin', 'error')}</span>			
                        </div>
			</div>
                        </tr>
                        </table>
                        
                        <table class="widthtable">
                        <tr>
                        <div class="${hasErrors(bean: experienceInstance, field: 'typeEntreprise', 'error')} required">
                        <td width="250"><label for="typeEntreprise" class="control-label"><g:message code="experience.typeEntreprise.label" default="Type Entreprise" /><span class="required-indicator">* :</span></label></td>
			<div>
                        <td width="200"><g:select class="form-control" id="typeEntreprise" name="typeEntreprise.id" from="${com.rabbahsoft.diorhprofiler.TypeEntreprise.list()}" optionKey="id" required="" value="${experienceInstance?.typeEntreprise?.id}" class="form-control"/></td>
			<span class="help-inline">${hasErrors(bean: experienceInstance, field: 'typeEntreprise', 'error')}</span>			
                        </div>
			</div>
                        
                        <div class="${hasErrors(bean: experienceInstance, field: 'secteurActivite', 'error')} required">
                        <td width="250"><label for="secteurActivite" class="control-label"><g:message code="experience.secteurActivite.label" default="Secteur Activite" /><span class="required-indicator">* :</span></label></td>
			<div>
                        <td width="200"><g:select class="form-control" id="secteurActivite" name="secteurActivite.id" from="${com.rabbahsoft.diorhprofiler.SecteurActivite.list()}" optionKey="id" required="" value="${experienceInstance?.secteurActivite?.id}" class="form-control"/></td>
			<span class="help-inline">${hasErrors(bean: experienceInstance, field: 'secteurActivite', 'error')}</span>			
                        </div>
			</div>
                        </tr>
                        </table>
                        
                        
                        <table class="widthtable">
                        <tr>
                        <div class="${hasErrors(bean: experienceInstance, field: 'nbrPersonneEncadre', 'error')} required">
                        <td width="250"><label for="nbrPersonneEncadre" class="control-label"><g:message code="experience.nbrPersonneEncadre.label" default="Nbr Personne Encadre" /><span class="required-indicator">* :</span></label></td>
			<div>
                        <td width="200"><g:field class="form-control" name="nbrPersonneEncadre" type="number" value="${experienceInstance?.nbrPersonneEncadre}" required=""/></td> 
                        <span class="help-inline">${hasErrors(bean: experienceInstance, field: 'nbrPersonneEncadre', 'error')}</span>			
                        </div>
			</div>
                        
                        <div class="${hasErrors(bean: experienceInstance, field: 'rattachement', 'error')} ">
                        <td width="250"><label for="rattachement" class="control-label"><g:message code="experience.rattachement.label" default="Rattachement" /></label></td>
			<div>
                        <td width="200"><g:textField class="form-control" name="rattachement" maxlength="50" value="${experienceInstance?.rattachement}"/></td>
			<span class="help-inline">${hasErrors(bean: experienceInstance, field: 'rattachement', 'error')}</span>			
                        </div>
			</div>
                        </tr>
                        </table>

                         <table class="widthtable">
                         <tr>
                         <div class="${hasErrors(bean: experienceInstance, field: 'contact', 'error')} ">
                        <td width="250"><label for="contact" class="control-label"><g:message code="experience.contact.label" default="Contact" /></label></td>
			<div>
                        <td><g:textField class="form-control" name="contact" value="${experienceInstance?.contact}"/></td>
			<span class="help-inline">${hasErrors(bean: experienceInstance, field: 'contact', 'error')}</span>			
                        </div>
			</div>
                        
                        <div class="${hasErrors(bean: experienceInstance, field: 'telephoneContact', 'error')} ">
                        <td width="250"><label for="telephoneContact" class="control-label"><g:message code="experience.telephoneContact.label" default="Telephone Contact" /></label></td>
			<div>
                        <td><g:textField class="form-control" name="telephoneContact" value="${experienceInstance?.telephoneContact}"/></td>
			<span class="help-inline">${hasErrors(bean: experienceInstance, field: 'telephoneContact', 'error')}</span>			
                        </div>
			</div>
                        </tr>
                        </table>
                         
                        <table class="widthtable">
                        <tr>
                         <div class="${hasErrors(bean: experienceInstance, field: 'fonctionContact', 'error')} ">
                        <td width="203"><label for="fonctionContact" class="control-label"><g:message code="experience.fonctionContact.label" default="Fonction Contact" /></label></td>
			<div>
                        <td width="200"><g:textField class="form-control" name="fonctionContact" value="${experienceInstance?.fonctionContact}"/></td>
			<span class="help-inline">${hasErrors(bean: experienceInstance, field: 'fonctionContact', 'error')}</span>			
                        </div>
			</div
                        <td></td>
                        <td></td>	
                        </tr>
                        </table>

                        <table class="widthtable">
                        <tr>
                        <div class="${hasErrors(bean: experienceInstance, field: 'mission', 'error')} ">
                        <td width="180"><label for="mission" class="control-label"><g:message code="experience.mission.label" default="Mission" /></label></td>
			<div>
                        <td width="200"><g:textArea class="form-control" name="mission" cols="40" rows="5" maxlength="65535" value="${experienceInstance?.mission}"/></td>
			<span class="help-inline">${hasErrors(bean: experienceInstance, field: 'mission', 'error')}</span>			
                        </div>
			</div> 
                        <td></td>
                        <td></td>
                        </tr>
                        </table>
                        


                       
                         
                        
                                                  

