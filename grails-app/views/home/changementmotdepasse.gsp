<html>

  <head>
    <title><g:message code="default.welcome.title" args="[meta(name:'app.name')]"/> </title>
    <meta name="layout" content="globallayout"/>
  <g:javascript src="authentification.js" />
    <g:javascript src="jquery.js" />
  <script type="text/javascript">
    function changermotpasse() {
    $("#messageerreur").empty();
    var messageerreur = [];
    if ($("#ancienmotpasse").val() =="" || $("#nouveaumotpasse").val() =="" || $("#confirmation").val() =="") {
      messageerreur.push('Veuillez remplir les trois champs');}
    else if($("#nouveaumotpasse").val()!=$("#confirmation").val()){
       messageerreur.push('les deux mot de passe ne sont pas identiques');
    }
    if(messageerreur.length>0){
    var lang = '';
    lang+='<div class="alert alert-danger">';
    lang += '<a class="close" data-dismiss="alert">Fermer</a>';
    lang+='<ul>';
    for ( var i = 0; i <messageerreur.length; i = i + 1 ) {
    lang+='<li>'+messageerreur[i]+'</li>';
    }
    lang+='</ul>';
    lang+='</div>';
    $('#messageerreur').html(lang);
    $("html, body").animate({scrollTop: 0}, 1000);
    }
    else{
     document.changementmotdepasse.submit();
    }
    }
  </script>
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
          <div class="panel-body">
            <g:form name="motdepasseoublie" controller='securite' action="login" method="post">
              <fieldset>
                <label class="control-label" for="">Adresse mail :</label>
                <p><input type="email" name="email" id="email" class="form-controllogin" value="" /></p>
                <label class="control-label" for="">Mot de passe :</label>	
                <p><input type="password" name="password" id="password" class="form-controllogin" value="" /></p>
                <p><input type="submit" class="btn btn-danger" onclick="authentifier(); return false;" value="Se connecter"> <input type="submit" class="btn btn-danger" value="S'inscrir"></p>
                <p><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'motpasseoublie.gif')}" width="16px" height="16px"/><a href="" class="">Mot de passe oublié ?</a></p>
              </fieldset>
            </g:form>
          </div>
        </div>
      </div>
    </g:if>
    <div class="col-sm-8">
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
            <img class="logo" src="${resource(plugin: 'kickstart', dir:'images', file:'second.jpg')}"/>
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
    <g:if test="${session.user!=null}">
      <div class="col-sm-4">
        <div class="panel panel-danger">
          <div class="panel-heading">
            <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'loginicon.png')}" alt="Back to top" width="19px" height="19px" title="Viadeo" width="19px" height="19px"/>Nouveautés</h3>
          </div>
          <div class="panel-body">
          </div>
        </div>
      </div>
    </g:if>
  </div>
  <div class="row">
    <div class="col-sm-12">
      <div class="panel panel-danger">
        <div class="panel-heading">
          <h3 class="panel-title"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'motpasseoublie.gif')}" width="16px" height="16px"/>Changement du mot de passe</h3>
        </div>
        <div class="panel-body">
        </br>
          <g:form name="changementmotdepasse" controller='securite' action="changementmotdepasse" method="post">
          <div class="row">
          <div class="col-sm-3">
            Ancien mot de passe :
          </div>
          <div class="col-sm-3">
            <input type="text" name="ancienmotpasse" id="ancienmotpasse" class="form-controllogin" value="${ancienmotpasse}" />
          </div>
          </div>
          <div class="row">
          <div class="col-sm-3">
            Nouveau mot de passe :
          </div>
          <div class="col-sm-3">
            <input type="text" name="nouveaumotpasse" id="nouveaumotpasse" class="form-controllogin" value="${nouveaumotpasse}" />
          </div>
          </div>
          <div class="row">
          <div class="col-sm-3">
            Confirmation du mot de passe  :
          </div>
          <div class="col-sm-3">
            <input type="text" name="confirmation" id="confirmation" class="form-controllogin" value="${confirmation}" />
          </div>
          </div>
          </br>
          <div class="row">
          <div class="col-sm-3">
          </div>
          <div class="col-sm-3">
            <input type="submit" class="btn btn-danger" onclick="changermotpasse(); return false;" value="OK">
          </div>
          </div>
           </g:form>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
