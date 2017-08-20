<%@ page import="com.rabbahsoft.diorhprofiler.MailTemplate" %>





<div class="row">
  <div class="col-sm-2"><label for="code" class="control-label"><g:message code="mailTemplate.code.label" default="Code" /><span class="required-indicator">* :</span></label></div>
  <div class="col-sm-10"><g:textField class="form-control" name="code" required="" value="${mailTemplateInstance?.code}" disabled="true" /></div>		
</div>

<div class="row">
  <div class="col-sm-2"><label for="description" class="control-label"><g:message code="mailTemplate.description.label" default="Description" />:</label></div>
  <div class="col-sm-10"><g:textArea class="form-control" name="description" value="${mailTemplateInstance?.description}" rows="5" style="width: 100% !important;" /></div>						
</div>

<div class="row">
  <div class="col-sm-2"><label for="template" class="control-label"><g:message code="mailTemplate.template.label" default="Template" />:</label></div>
  <div class="col-sm-10">
    <ckeditor:editor name="template" id="template" height="200px" width="100%">${mailTemplateInstance?.template}</ckeditor:editor>		
  </div>
</div>


