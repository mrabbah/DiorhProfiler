<%@ page import="com.rabbahsoft.diorhprofiler.InterlocuteurContact" %>
<div id="interlocuteurcontact${i}" class="interlocuteurcontact-div" <g:if test="${hidden}">style="display:none;"</g:if>>
  <g:hiddenField name='interlocuteurcontacts[${i}].id' value='${interlocuteurcontact?.id}'/>
  <g:hiddenField name='interlocuteurcontacts[${i}].deleted' value='false'/>
  <g:hiddenField name='interlocuteurcontacts[${i}].new' value="${interlocuteurcontact?.id == null?'true':'false'}"/>
  <table width="">
    <tr>
    <td>
    <g:textField class="form-control-mini" id="interlocuteurcontacts[${i}].nom" name="interlocuteurcontacts[${i}].nom" value="${interlocuteurcontact?.nom}"/>
    </td>
    <td >
    <g:textField class="form-control-mini" id="interlocuteurcontacts[${i}].prenom" name="interlocuteurcontacts[${i}].prenom" value="${interlocuteurcontact?.prenom}"/>
    </td>
    <td >
    <g:textField class="form-control-mini" id="interlocuteurcontacts[${i}].fonction" name="interlocuteurcontacts[${i}].fonction" value="${interlocuteurcontact?.fonction}"/>
    </td>
    <td >
    <g:textField class="form-control-mini" id="interlocuteurcontacts[${i}].telephonePortable" name="interlocuteurcontacts[${i}].telephonePortable" value="${interlocuteurcontact?.telephonePortable}"/>
    </td>
    <td >
    <g:textField class="form-control-mini" id="interlocuteurcontacts[${i}].telephoneFixe" name="interlocuteurcontacts[${i}].telephoneFixe" value="${interlocuteurcontact?.telephoneFixe}"/>
    </td>
    <td >
    <g:textField class="form-control-mini" id="interlocuteurcontacts[${i}].email" name="interlocuteurcontacts[${i}].email" value="${interlocuteurcontact?.email}"/>
    </td>
    <td>
      <span class="del-interlocuteurcontact">
        <img src="${resource(dir:'images/icon', file:'delete-item.png')}" 
             style="vertical-align:middle;" width="18px" height="18px"/>
      </span>
    </td>
    <tr/>
  </table>
</div>
