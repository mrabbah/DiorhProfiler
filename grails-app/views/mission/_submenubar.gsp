<div id="jCrumbs" class="breadCrumb nav-pills module">
  <ul>
    <g:if test="${session.droits.LISTE_MISSION != null}">
      <li class="${ params.action == "list" ? 'actives' : '' }">
      <g:link action="list"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'copy-item.png')}"  width="18px" height="18px"/><g:message code="default.list.label" /></g:link>
      </li>
    </g:if>
      <g:if test="${session.droits.AJOUTER_MISSION != null}">
        <li class="${ params.action == "create" ? 'actives' : '' }">
        <g:link action="create"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'add-item.png')}"  width="18px" height="18px"/><g:message code="default.new.label"  /></g:link>
        </li>
      </g:if>
      <g:if test="${ params.action == 'show' || params.action == 'edit' }">
        <g:if test="${session.droits.MODIFIER_MISSION != null}">
          <li class="${ params.action == "edit" ? 'actives' : '' }">
          <g:link action="edit" id="${params.id}"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'edit.png')}"  width="18px" height="18px"/><g:message code="default.edit.label"  /></g:link>
          </li>
        </g:if>
        
        <g:if test="${session.droits.CLOTURER_MISSION != null && missionInstance.statut.libelle !='Clôturée'}">
          <li>
          <g:link action="cloturer" id="${params.id}"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'close.png')}"  width="12px" height="12px"/>${message(code: 'cloturer.label', default: 'Cloturer')}</g:link>
          </li>
        </g:if>
        <g:if test="${session.droits.ARCHIVER_MISSION != null && missionInstance.statut.libelle !='Archivée'}">
          <li>
          <g:link action="archiver" id="${params.id}"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'archiver.png')}"  width="15px" height="15px"/>${message(code: 'archiver.label', default: 'Archiver cette mission')}</g:link>
          </li>
        </g:if>
        <g:if test="${session.droits.REPRENDRE_MISSION != null && missionInstance.statut.libelle !='reprendre'}">
          <li>
          <g:link action="reprendre" id="${params.id}"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'close.png')}"  width="12px" height="12px"/>${message(code: 'reprendre.label', default: 'Reprendre')}</g:link>
          </li>
        </g:if>
        <g:if test="${session.droits.SUSPENDRE_MISSION != null && missionInstance.statut.libelle !='suspendre'}">
          <li>
          <g:link action="suspendre" id="${params.id}"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'close.png')}"  width="12px" height="12px"/>${message(code: 'suspendre.label', default: 'Suspendre')}</g:link>
          </li>
        </g:if>
        <g:if test="${session.droits.SUPPRIMER_MISSION != null}">
          <li class="">
          <g:render template="/_common/modals/deleteTextLink"/>
          </li>
        </g:if>
      </g:if>
      <g:if test="${session.droits.RECHERCHER_MISSION != null}">
          <li>
          <g:link action="recherche" ><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'search.png')}"  width="18px" height="18px"/>${message(code: 'recherche.label', default: 'Rehercher')}</g:link>
          </li>
        </g:if>
  </ul>
</div>