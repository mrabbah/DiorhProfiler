<g:if test="${session.user!=null && session.user.profil.libelle!='candidat'}">
<div id="jCrumbs" class="breadCrumb nav-pills module">
                 <ul>
		<li class="${ params.action == "list" ? 'actives' : '' }">
	       <g:link action="list"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'copy-item.png')}" width="18px" height="18px"/><g:message code="default.list.label" /></g:link>
		</li>
                 </ul>
</div>
  </g:if>