<g:if test="${session.user!=null && session.user.profil.libelle!='candidat'}">
  <div id="jCrumbs" class="breadCrumb nav-pills module">
    <ul>
      <g:if test="${session.droits.LISTE_CANDIDATURE!=null}">
        <li>
        <g:link controller="candidature" action="list"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'copy-item.png')}"  width="18px" height="18px"/>${message(code: 'default.list.label', default: 'Liste')}</g:link>
        </li>
      </g:if>
      <g:if test="${params.action=="show"}">
        <li>
        <g:link action="edit" id="${params.id}"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'edit.png')}"  width="18px" height="18px"/><g:message code="default.edit.label"  /></g:link>
        </li>
      </g:if>
      <g:if test="${session.droits.RECHERCHER_CANDIDATURE!=null}">
        <li>
        <g:link controller="candidature" action="create_recherche"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'search.png')}"  width="18px" height="18px"/>${message(code: 'recherche.label', default: 'Rehercher')}</g:link>
        </li>
      </g:if>
      <g:if test="${params.action=="edit" || params.action=="show"}">
        <g:if test="${candidatureInstance.statut!=null && candidatureInstance?.statut.libelle=="Sélectionnée"}">
          <li>
          <g:link controller="candidature" action="changestatut" id="${candidatureInstance.id}"params="[statutlibelle:'Acceptée']" ><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'copy-item.png')}"  width="18px" height="18px"/>${message(code: 'default.accepter.label', default: 'Accepter')}</g:link>
          </li>
          <li>
          <g:link controller="candidature" action="changestatut" id="${candidatureInstance.id}" params="[statutlibelle:'Non retenue']" ><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'copy-item.png')}"  width="18px" height="18px"/>${message(code: 'default.rejeter.label', default: 'Rejeter')}</g:link>
          </li>
          <li>
          <g:link controller="candidature" action="changestatut" id="${candidatureInstance.id}" params="[statutlibelle:'En attente']"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'copy-item.png')}"  width="18px" height="18px"/>${message(code: 'default.suspendre.label', default: 'Suspendre')}</g:link>
          </li>
        </g:if>
        <g:if test="${candidatureInstance.statut!=null && candidatureInstance.statut.libelle=="En cours"}">
          <li>
          <g:link controller="candidature" action="changestatut" id="${candidatureInstance.id}" params="[statutlibelle:'Sélectionnée']"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'copy-item.png')}"  width="18px" height="18px"/>${message(code: 'default.accepter.label', default: 'Sélectionner')}</g:link>
          </li>
        </g:if>
        <g:if test="${candidatureInstance.statut!=null && (candidatureInstance.statut.libelle=="En attente" ||candidatureInstance.statut.libelle=="Acceptée" || candidatureInstance.statut.libelle=="En attente")}">
          <li>
          <g:link controller="candidature" action="changestatut" id="${candidatureInstance.id}" params="[statutlibelle:'Validée']"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'copy-item.png')}"  width="18px" height="18px"/>${message(code: 'default.accepter.label', default: 'Valider')}</g:link>
          </li>
        </g:if>
        <g:if test="${candidatureInstance.statut!=null && candidatureInstance.statut.libelle=="Validée"}">
          <li>
          <g:link controller="candidature" action="changestatut" id="${candidatureInstance.id}" params="[statutlibelle:'Recrutée']"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'copy-item.png')}"  width="18px" height="18px"/>${message(code: 'default.accepter.label', default: 'Recruter')}</g:link>
          </li>
        </g:if>       
      </g:if>
    </ul>
  </div>
</g:if>
