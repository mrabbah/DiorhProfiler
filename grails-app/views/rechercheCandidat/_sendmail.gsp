<div id="send_mail"  title="Envoyer un mail">
<g:form name="recherchecandidarmail" action="">
<table class="widthtable">
        <tr>
            <td width="250"><g:textField class="form-control" name="prenomStockage" value="${rechercheCandidatInstance?.prenomStockage}"/></td>
        </tr>
        <tr>   
            <td><ckeditor:editor name="myeditor" height="100" width="500" >${initialValue}</ckeditor:editor></td>
        </tr>
 </table>
</g:form>
</div>
