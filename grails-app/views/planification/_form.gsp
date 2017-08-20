<%@ page import="com.rabbahsoft.diorhprofiler.Planification" %>



                       
                         
                         <table class="widthtable">
                         <tr>
                        <div class="${hasErrors(bean: planificationInstance, field: 'dateDebut', 'error')} required">
                        <td width="250"><label for="dateDebut" class="control-label"><g:message code="planification.dateDebut.label" default="Date Debut" /><span class="required-indicator">* :</span></label></td>
			<div>
                        <td><bs:datePicker name="dateDebut" precision="day"  value="${planificationInstance?.dateDebut}"  /></td>
			<span class="help-inline">${hasErrors(bean: planificationInstance, field: 'dateDebut', 'error')}</span>			
                        </div>
			</div>
                        
                        
                                                 

                       
                         
                        
                        <div class="${hasErrors(bean: planificationInstance, field: 'dateFin', 'error')} required">
                        <td width="250"><label for="dateFin" class="control-label"><g:message code="planification.dateFin.label" default="Date Fin" /><span class="required-indicator">* :</span></label></td>
			<div>
                        <td><bs:datePicker name="dateFin" precision="day"  value="${planificationInstance?.dateFin}"  /></td>
			<span class="help-inline">${hasErrors(bean: planificationInstance, field: 'dateFin', 'error')}</span>			
                        </div>
			</div>
                        </tr>
                        </table>
                        
                                                 

                       
                         
                         <table class="widthtable">
                         <tr>
                        <div class="${hasErrors(bean: planificationInstance, field: 'etape', 'error')} required">
                        <td width="224"><label for="etape" class="control-label"><g:message code="planification.etape.label" default="Etape" /><span class="required-indicator">* :</span></label></td>
			<div>
                        <td><g:select class="form-control" id="etape" name="etape.id" from="${com.rabbahsoft.diorhprofiler.EtapePlanning.list()}" optionKey="id" required="" value="${planificationInstance?.etape?.id}" class="form-control"/></td>
			<span class="help-inline">${hasErrors(bean: planificationInstance, field: 'etape', 'error')}</span>			
                        </div>
			</div>
                        <td></td>
                        <td></td>
                        </tr>
                        </table>
                        
                                                 

