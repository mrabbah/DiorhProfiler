<div id="jCrumbs" class="breadCrumb nav-pills module">
  <ul>
    <g:if test="${session.droits.LISTE_CONTACT != null}">
      <li class="${ params.action == "list" ? 'actives' : '' }">
      <g:link action="list"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'copy-item.png')}"  width="18px" height="18px"/><g:message code="default.list.label" /></g:link>
      </li>
    </g:if>

    <g:if test="${session.droits.ENVOYERMAIL_CONTACT != null}">
      <g:if test="${ params.action == 'resultat_recherche'}">
        <li class="${ params.action == "sendmail" ? 'actives' : '' }">
        <g:link action="sendmail" id="${params.id}"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'edit.png')}"  width="18px" height="18px"/><g:message code="default.sendmail.label"  /></g:link>
        </li>
      </g:if>
    </g:if>

    <g:if test="${session.droits.AJOUTER_CONTACT != null}">
      <li class="${ params.action == "create" ? 'actives' : '' }">
      <g:link action="create"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'add-item.png')}"  width="18px" height="18px"/><g:message code="default.new.label"  /></g:link>
      </li>
    </g:if>

    <g:if test="${ params.action == 'show' || params.action == 'edit' }">
      <g:if test="${session.droits.MODIFIER_CONTACT != null}">
        <li class="${ params.action == "edit" ? 'actives' : '' }">
        <g:link action="edit" id="${params.id}"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'edit.png')}"  width="18px" height="18px"/><g:message code="default.edit.label"  /></g:link>
        </li>
      </g:if>

      <g:if test="${session.droits.SUPPRIMER_CONTACT != null}">
        <li class="">
        <g:render template="/_common/modals/deleteTextLink"/>
        </li>
      </g:if>

      <g:if test="${session.droits.LISTE_ACTIONCONTACT != null}">
        <li class="">
        <g:link controller="actionContact" action="create" id="${params.id}"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'copy-item.png')}"  width="18px" height="18px"/><g:message code="default.action.label"  default="Nouvelle action"/></g:link>
        </li>
      </g:if>

    </g:if>

    <li>
    <g:link action="rechercher_contact"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'search.png')}"  width="18px" height="18px"/>${message(code: 'recherche.label', default: 'Rehercher')}</g:link>
    </li>
  </ul>
</div>