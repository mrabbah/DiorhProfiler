<%@ page import="com.rabbahsoft.diorhprofiler.Planification" %>
<div id="planification${i}" class="planification-div" <g:if test="${hidden}">style="display:none;"</g:if>>
  <g:hiddenField name='planifications[${i}].id' value='${test?.id}'/>
  <div class="row">
     <div class="col-sm-4">
    <g:select class="form-control" id="planifications[${i}].etape" name="planifications[${i}].etape.id" from="${com.rabbahsoft.diorhprofiler.EtapePlanning.list()}" optionKey="id" value="${planification?.etape?.id}"/>
    </div>
    <div class="col-sm-4">
    <input type="text" class="datecss form-control" id="planifications[${i}].dateDebut" name="planifications[${i}].dateDebut" precision="day" value="${formatDate(format:'dd/MM/yyyy',date:planification?.dateDebut)}"/>
    </div>
    <div class="col-sm-3">
    <input type="text" class="datecss form-control" id="planifications[${i}].dateFin" name="planifications[${i}].dateFin" precision="day" value="${formatDate(format:'dd/MM/yyyy',date:planification?.dateFin)}"/>
    </div>
    <div class="col-sm-1">
      <span class="del-planification">
        <img src="${resource(dir:'images/icon', file:'delete-item.png')}" 
             style="vertical-align:middle;" width="18px" height="18px"/>
      </span>
    </div>
  </div>
</div>
