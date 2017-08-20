<g:if test="${session.droits.findAll{it.value.endsWith("CANDIDAT")}.size()>0}">
  <div id="jCrumbs" class="breadCrumb nav-pills module">
    <ul>
      <g:if test="${session.droits.LISTE_CANDIDAT != null}">
        <li class="${ params.action == "list" ? 'actives' : '' }">
        <g:link action="list"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'copy-item.png')}" alt="${meta(name:'app.name')}" width="18px" height="18px"/><g:message code="default.list.label" /></g:link>
        </li>
      </g:if>

      <g:if test="${session.droits.ENVOYERMAIL_CANDIDAT != null && params.action=="list_recherche"}">
        <li class="${ params.action == "sendmail" ? 'actives' : '' }">
        <g:link action="sendmail" id="${params.id}"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'edit.png')}" alt="${meta(name:'app.name')}" width="18px" height="18px"/><g:message code="default.sendmail.label"  /></g:link>
        </li>
      </g:if>
     <g:if test="${session.droits.AFFECTER_MISSION_CANDIDAT != null && params.action=="list_recherche"}">
          <li class="${ params.action == "affectermission" ? 'actives' : '' }">
          <g:link controller="mission" action="recherchecandidatsmission" id="${params.id}"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'edit.png')}" alt="${meta(name:'app.name')}" width="18px" height="18px"/><g:message code="default.affectermission.label"  default="Affecter plusieurs candidats à une mission"/></g:link>
          </li>
     </g:if>
       <g:if test="${session.droits.AFFECTER_MISSION_CANDIDAT != null && params.action=="list_recherche_combiner"}">
          <li class="${ params.action == "affectermission" ? 'actives' : '' }">
          <g:link controller="mission" action="recherchecandidatsmission" id="${params.id}"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'edit.png')}" alt="${meta(name:'app.name')}" width="18px" height="18px"/><g:message code="default.affectermission.label"  default="Affecter plusieurs candidats à une mission"/></g:link>
          </li>
     </g:if>
      <g:if test="${session.droits.AJOUTER_CANDIDAT != null}">
        <li class="${ params.action == "create" ? 'actives' : '' }">
        <g:link action="create"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'add-item.png')}" alt="${meta(name:'app.name')}" width="18px" height="18px"/><g:message code="default.new.label"  /></g:link>
        </li>
      </g:if>

        <g:if test="${ params.action == 'show' || params.action == 'edit' || params.action =='show_listnormal' || params.action =='show_motcle'}">
        <!-- the item is an object (not a list) -->
        <g:if test="${session.droits.MODIFIER_CANDIDAT != null}">
          <li class="${ params.action == "edit" ? 'actives' : '' }">
          <g:link action="edit" id="${params.id}"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'edit.png')}" alt="${meta(name:'app.name')}" width="18px" height="18px"/><g:message code="default.edit.label"  /></g:link>
          </li>
        </g:if>
        <g:if test="${session.droits.IMPRIMERFICHE_CANDIDAT != null}">
          <li class="printlink">
          <g:jasperReport format="PDF" jasper="report_candidat"  bodyBefore=" " delimiter=" " name="Fiche candidat">
            <input type="hidden" name="id" value="${params.id}" />
          </g:jasperReport>
          </li>
        </g:if>
        <g:if test="${session.droits.SUPPRIMER_CANDIDAT != null }">
          <li class="">
          <g:render template="/_common/modals/deleteTextLink"/>
          </li>
        </g:if>
        <g:if test="${session.droits.AFFECTER_MISSION_CANDIDAT != null}">
          <li class="${ params.action == "affectermission" ? 'actives' : '' }">
          <g:link controller="mission" action="recherche" id="${params.id}"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'edit.png')}" alt="${meta(name:'app.name')}" width="18px" height="18px"/><g:message code="default.affectermission.label"  default="Affecter à une mission"/></g:link>
          </li>
        </g:if>
      </g:if>

      <g:if test="${ params.action == 'show' && session.user!=null && session.user.profil.libelle!='candidat'}">
        <g:if test="${session.maprecherche1!=null && session.maprecherche1.size()>1}">
          <li class="navbar-right">
          <g:link action="suivant" id="${candidatInstance?.id}" title="Suivant"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'next.png')}" alt="${meta(name:'app.name')}" width="12px" height="13px"/></g:link>
          </li>
          <li class="navbar-right">
          <g:link action="precedent" id="${candidatInstance?.id}" title="Précédent"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'previous.png')}" alt="${meta(name:'app.name')}" width="12px" height="13px"/></g:link>
          </li>
        </g:if>
      </g:if>

      <g:if test="${session.RECHERCHER_CANDIDAT != null}">
        <li>
        <g:link action="create_recherche"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'search.png')}" alt="${meta(name:'app.name')}" width="18px" height="18px"/>${message(code: 'recherche.label', default: 'Rehercher')}</g:link>
        </li>
      </g:if>
    </ul>
  </div>
</g:if>
