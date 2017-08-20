<%@ page import="com.rabbahsoft.diorhprofiler.Test" %>



                       
                         
                         <table class="widthtable">
                         <tr>
                        <div class="${hasErrors(bean: testInstance, field: 'titre', 'error')} ">
                        <td width="250"><label for="titre" class="control-label"><g:message code="test.titre.label" default="Titre" /></label></td>
			<div>
                        <td><g:textField class="form-control" name="titre" maxlength="20" value="${testInstance?.titre}"/></td>
			<span class="help-inline">${hasErrors(bean: testInstance, field: 'titre', 'error')}</span>			
                        </div>
			</div>
                        
                        
                                                 

                       
                         
                        
                        <div class="${hasErrors(bean: testInstance, field: 'dateTest', 'error')} ">
                        <td width="250"><label for="dateTest" class="control-label"><g:message code="test.dateTest.label" default="Date Test" /></label></td>
			<div>
                        <td><bs:datePicker name="dateTest" precision="day"  value="${testInstance?.dateTest}" default="none" noSelection="['': '']" /></td>
			<span class="help-inline">${hasErrors(bean: testInstance, field: 'dateTest', 'error')}</span>			
                        </div>
			</div>
                        </tr>
                        </table>
                        
                                                 

                       
                         
                         <table class="widthtable">
                         <tr>
                        <div class="${hasErrors(bean: testInstance, field: 'commentaire', 'error')} ">
                        <td width="180"><label for="commentaire" class="control-label"><g:message code="test.commentaire.label" default="Commentaire" /></label></td>
			<div>
                        <td><g:textArea class="form-control" name="commentaire" cols="40" rows="5" maxlength="65535" value="${testInstance?.commentaire}"/></td>
			<span class="help-inline">${hasErrors(bean: testInstance, field: 'commentaire', 'error')}</span>			
                        </div>
			</div>
                         <td></td>
                         <td></td>
                        </tr>
                        </table>
                        
                                                 

