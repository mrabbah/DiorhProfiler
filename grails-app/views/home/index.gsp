<html>

  <head>
    <meta name="layout" content="globallayout"/>
  <g:javascript src="authentification.js" />
</head>

<body>
  <div id="messageerreur"></div>
  <div class="row">
    <g:if test="${session.user==null}">
      <div class="col-sm-4">
        <div class="panel panel-danger">
          <div class="panel-heading">
            <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'loginicon.png')}" alt="Back to top" width="19px" height="19px" title="Viadeo" width="19px" height="19px"/>Authentification</h3>
          </div>
          <g:if test="${params.temp!=null}">
           <div>
             <strong  style="color:red;">${params.temp}</strong>
          </div>
                </g:if>
          <div class="panel-body">
            <form name="authentification" action="securite/login" method="post" id="login_form">
              <fieldset>
                <label class="control-label" for="">Adresse mail :</label>
                <p><input type="email" name="email" id="email" class="form-controllogin" value="" /></p>
                <label class="control-label" for="">Mot de passe:</label>	
                <p><input type="password" name="password" id="password" class="form-controllogin" value="" /></p>
                <p><input type="submit" class="btn btn-danger" onclick="authentifier(); return false;" value="Se connecter"><a href="${createLink(controller:"candidat",action: 'create', params: [inscription:'inscription'])}" style="margin-left: 20px;"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'inscription.png')}" width="16px" height="16px"/>S'inscrire</a></p>
                <p><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'motpasseoublie.gif')}" width="16px" height="16px"/><a href="${createLink(controller:"home",action: 'motdepasseoublie')}" class="">Mot de passe oublié ?</a></p>
              </fieldset>
            </form>
          </div>
        </div>
      </div>
    </g:if>
    <div class="col-sm-8">
      <div class="col-sm-1">
        </div>
      <div class="col-sm-11">
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
          <div class="item active">
            <img class="logo" src="${resource(plugin: 'kickstart', dir:'images', file:'first.jpg')}"/>
            <div class="container">
              <div class="carousel-caption">
                <h1></h1>
              </div>
            </div>
          </div>
          <div class="item">
            <img class="logo " src="${resource(plugin: 'kickstart', dir:'images', file:'second.jpg')}"/>
            <div class="container">
              <div class="carousel-caption">
                <h1></h1>
              </div>
            </div>
          </div>
          <div class="item">
            <img class="logo" src="${resource(plugin: 'kickstart', dir:'images', file:'third.jpg')}"/>
            <div class="container">
              <div class="carousel-caption">
                <h1></h1>
              </div>
            </div>
          </div>
        </div>
        <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
      </div>
      </div>
    </div>
  <div class="row">
    <div class="col-sm-12">
      <div class="panel panel-danger">
        <div class="panel-heading">
          <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'listeannonce.png')}" alt="Back to top" width="19px" height="19px" title="Viadeo" width="19px" height="19px"/>Liste des annonces</h3>
        </div>
        <div class="panel-body">
          <table class="table table-striped table-bordered table-condensed">
            <thead>
              <tr>

            <g:sortableColumn property="datePublication" title="${message(code: 'mission.datePublication.label', default: 'Date de Publication')}" />

            <g:sortableColumn property="poste" title="${message(code: 'mission.poste.label', default: 'Poste proposé')}" />

            <g:sortableColumn property="localisation" title="${message(code: 'mission.localisation.label', default: 'Localisation')}" />

            <g:sortableColumn property="descriptifPoste" title="${message(code: 'mission.descriptifPoste.label', default: 'Description du poste')}" />


            </tr>
            </thead>
            <tbody>
            <g:each in="${missionInstanceList}" status="i" var="missionInstance">
              <tr class="prop">

                <td width="130">${fieldValue(bean: missionInstance, field: "datePublication")}</td>

                <td width="140"><g:link controller="annonce" action="show" id="${missionInstance.id}">${fieldValue(bean: missionInstance, field: "poste")}</g:link></td>

              <td width="140">${fieldValue(bean: missionInstance, field: "localisation")}</td>

              <td id="des">
              <g:if test='${missionInstance?.descriptifPoste==null || missionInstance?.descriptifPoste.length()<100}'>
              ${raw(missionInstance?.descriptifPoste)}
              </g:if>
              <g:else>
                ${raw(missionInstance?.descriptifPoste.substring(0,100)+ "...")}
              </g:else>
              </td>
              </tr>
            </g:each>
            </tbody>
          </table>
          <div>
            <bs:paginate total="${missionInstanceCount}" />
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
