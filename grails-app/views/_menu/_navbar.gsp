<g:if test="${session.user != null}">
<nav id="Navbar" class="navbar navbar-fixed-top navbar-inverse" role="navigation">
  <div class="container">

    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
        <span class="sr-only"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>

      <a class="navbar-brand" href="${createLink(uri: '/')}">
              <!--<img class="logo" src="${resource(plugin: 'kickstart', dir:'images', file:'brand_logo.png')}" alt="${meta(name:'app.name')}" width="16px" height="16px"/>--> 
        DIORH PROFILER
      </a>
    </div>

    <div class="collapse navbar-collapse navbar-ex1-collapse" role="navigation">



      <ul class="nav navbar-nav navbar-right">
                   <!--<g:render template="/_menu/search"/>--> 
        <g:render template="/_menu/parametre"/>														
        <g:render template="/_menu/administration"/>														
        <g:render template="/_menu/utilisateur"/><!-- NOTE: the renderDialog for the "Register" modal dialog MUST be placed outside the NavBar (at least for Bootstrap 2.1.1): see bottom of main.gsp -->
        <g:render template="/_menu/language"/>
        <li class="">
          <a href="${createLink(uri: '/securite/logout')}">
            Déconnecter
          </a>
        </li>
<!--                        <li><a class="dropdown-toggle" role="button" data-toggle="dropdown" data-target="#" href="javascript:;">
                        <img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'facebook.ico')}" title="Facebook" alt="${meta(name:'app.name')}"/>
                </a></li>
                <li><a class="dropdown-toggle" role="button" data-toggle="dropdown" data-target="#" href="javascript:;">
                        <img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'twitter.ico')}" title="Twitter" alt="${meta(name:'app.name')}"/>
                </a></li>
                <li><a class="dropdown-toggle" role="button" data-toggle="dropdown" data-target="#" href="javascript:;">
                        <img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'viadeo2.ico')}" alt="${meta(name:'app.name')}" title="Viadeo" width="19px" height="19px"/>
                </a></li>-->
      </ul>			

    </div>
  </div>
</nav>
</g:if>
