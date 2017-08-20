<%@ page import="com.rabbahsoft.diorhprofiler.Test" %>
<div id="test${i}" class="test-div" <g:if test="${hidden}">style="display:none;"</g:if>>
  <g:hiddenField name='tests[${i}].id' value='${test?.id}'/>
  <g:hiddenField name='tests[${i}].deleted' value='false'/>
  <g:hiddenField name='tests[${i}].new' value="${test?.id == null?'true':'false'}"/>
  <div class="row">
        <div class="col-sm-4">
    <g:select class="form-control" id="tests[${i}].titre" name="tests[${i}].titre.id" from="${com.rabbahsoft.diorhprofiler.TitreTest.list()}" optionKey="id" value="${test?.titre?.id}" class="form-control"/>
        </div>
     <div class="col-sm-4">
    <input type="text" class="datecss form-control" id="tests[${i}].dateTest" name="tests[${i}].dateTest" precision="day" value="${formatDate(format:'dd/MM/yyyy',date:test?.dateTest)}"  />
     </div>
     <div class="col-sm-3">
      <textarea class="form-controlarea" id="tests[${i}].commentaire" cols="48" rows="3" maxlength="65535" name="tests[${i}].commentaire" maxlength="100">${test?.commentaire}</textarea>
     </div>
     <div class="col-sm-1">
      <span class="del-test">
        <img src="${resource(dir:'images/icon', file:'delete-item.png')}" 
             style="vertical-align:middle;" width="18px" height="18px"/>
      </span>
     </div>
  </div>
</div>
