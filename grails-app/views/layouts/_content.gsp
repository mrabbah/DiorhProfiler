<div id="Content" class="container">
  <section id="list-mission" class="first">
    <g:if test="${ pageProperty(name:'page.header') }">
      <g:pageProperty name="page.header" />
    </g:if>
    <g:else>
      <g:render template="/layouts/header"/>														
    </g:else>
    
    <g:if test="${session.user!=null}">
		<g:render template="/_menu/menubar"/>
	</g:if>
    
    <!-- Secondary menu in one row (e.g., actions for current controller) -->
    <g:if test="${!layout_nosecondarymenu}">
      <g:render template="/_menu/submenubar"/>														
    </g:if>

    <!-- print system messages (infos, warnings, etc) - not validation errors -->
    <g:if test="${flash.message && !layout_noflashmessage}">
      <div class="alert alert-info">${flash.message}</div>
    </g:if>

    <!-- Show page's content -->
    <g:layoutBody />
    <g:pageProperty name="page.body" />
    <!-- Enable to overwrite Footer by individual page -->
    <g:if test="${ pageProperty(name:'page.footer') }">
      <g:pageProperty name="page.footer" />
    </g:if>
    <g:else>
      <g:render template="/layouts/footer"/>														
    </g:else>
  </section>
</div>
