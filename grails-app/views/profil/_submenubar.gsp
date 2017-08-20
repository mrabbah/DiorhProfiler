<div id="jCrumbs" class="breadCrumb nav-pills module">
  <ul>
    <g:if test="${session.droits.LISTE_PROFIL != null}">
    <li class="${ params.action == "list" ? 'actives' : '' }">
    <g:link action="list"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'copy-item.png')}"  width="18px" height="18px"/><g:message code="default.list.label" /></g:link>
    </li>
    </g:if>
    
    <g:if test="${session.droits.AJOUTER_PROFIL != null}">
    <li class="${ params.action == "create" ? 'actives' : '' }">
    <g:link action="create"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'add-item.png')}"  width="18px" height="18px"/><g:message code="default.new.label"  /></g:link>
    </li>
     </g:if>
    
    <g:if test="${ params.action == 'show' || params.action == 'edit' }">
      <g:if test="${session.droits.MODIFIER_PROFIL != null}">
      <li class="${ params.action == "edit" ? 'actives' : '' }">
      <g:link action="edit" id="${params.id}"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'edit.png')}"  width="18px" height="18px"/><g:message code="default.edit.label"  /></g:link>
      </li>
      </g:if>
      
      <g:if test="${session.droits.SUPPRIMER_PROFIL != null}">
      <li class="">
      <g:render template="/_common/modals/deleteTextLink"/>
      </li>
    </g:if>
    </g:if>
  </ul>
</div>