<%@ page import="com.rabbahsoft.diorhprofiler.InterlocuteurContact" %>



                       
                         
                        <table class="widthtable">
                        <tr>
                        <div class="${hasErrors(bean: interlocuteurContactInstance, field: 'nom', 'error')} ">
                        <td width="250"><label for="nom" class="control-label"><g:message code="interlocuteurContact.nom.label" default="Nom" /></label></td>
			<div>
                        <td><g:textField class="form-control" name="nom" maxlength="50" value="${interlocuteurContactInstance?.nom}"/></td>
			<span class="help-inline">${hasErrors(bean: interlocuteurContactInstance, field: 'nom', 'error')}</span>			
                        </div>
			</div>
                        
                        <div class="${hasErrors(bean: interlocuteurContactInstance, field: 'prenom', 'error')} ">
                        <td width="250"><label for="prenom" class="control-label"><g:message code="interlocuteurContact.prenom.label" default="Prenom" /></label></td>
			<div>
                        <td><g:textField class="form-control" name="prenom" maxlength="50" value="${interlocuteurContactInstance?.prenom}"/></td>
			<span class="help-inline">${hasErrors(bean: interlocuteurContactInstance, field: 'prenom', 'error')}</span>			
                        </div>
			</div>
                        </tr>
                        </table>
                        
                                                 

                       
                         
                         <table class="widthtable">
                         <tr>
                        <div class="${hasErrors(bean: interlocuteurContactInstance, field: 'fonction', 'error')} ">
                        <td width="250"><label for="fonction" class="control-label"><g:message code="interlocuteurContact.fonction.label" default="Fonction" /></label></td>
			<div>
                        <td><g:textField class="form-control" name="fonction" maxlength="50" value="${interlocuteurContactInstance?.fonction}"/></td>
			<span class="help-inline">${hasErrors(bean: interlocuteurContactInstance, field: 'fonction', 'error')}</span>			
                        </div>
			</div>
                        
                        <div class="${hasErrors(bean: interlocuteurContactInstance, field: 'telephonePortable', 'error')} ">
                        <td width="250"><label for="telephonePortable" class="control-label"><g:message code="interlocuteurContact.telephonePortable.label" default="Telephone Portable" /></label></td>
			<div>
                        <td><g:textField class="form-control" name="telephonePortable" maxlength="30" value="${interlocuteurContactInstance?.telephonePortable}"/></td>
			<span class="help-inline">${hasErrors(bean: interlocuteurContactInstance, field: 'telephonePortable', 'error')}</span>			
                        </div>
			</div>
                        </tr>
                        </table>
                        
                                                 

                       
                         
                        <table class="widthtable">
                        <tr>
                        <div class="${hasErrors(bean: interlocuteurContactInstance, field: 'telephoneFixe', 'error')} ">
                        <td width="250"><label for="telephoneFixe" class="control-label"><g:message code="interlocuteurContact.telephoneFixe.label" default="Telephone Fixe" /></label></td>
			<div>
                        <td><g:textField class="form-control" name="telephoneFixe" maxlength="30" value="${interlocuteurContactInstance?.telephoneFixe}"/></td>
			<span class="help-inline">${hasErrors(bean: interlocuteurContactInstance, field: 'telephoneFixe', 'error')}</span>			
                        </div>
			</div>

                        <div class="${hasErrors(bean: interlocuteurContactInstance, field: 'email', 'error')} ">
                        <td width="250"><label for="email" class="control-label"><g:message code="interlocuteurContact.email.label" default="Email" /></label></td>
			<div>
                        <td><g:field class="form-control" type="email" name="email" maxlength="100" value="${interlocuteurContactInstance?.email}"/></td>
			<span class="help-inline">${hasErrors(bean: interlocuteurContactInstance, field: 'email', 'error')}</span>			
                        </div>
			</div>
                        </tr>
                        </table>
                                                  

