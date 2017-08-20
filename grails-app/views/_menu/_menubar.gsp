<% def test=["home","candidat","contact","Candidature","mission","rendezVous","actionContact","annonce","candidature","utilisateur","profil"] %>


<div class="menubar-list">

  <div class="btn-group">
    <g:link controller="home" action="index" class="${params.controller == 'home' ? "linkmenubaractive btn btn-danger" : "linkmenubardesactive btn"}"><i class="glyphicon glyphicon-home"></i> ${message(code: 'menubar.home', default: 'Accueil')}</g:link>
  </div>

  <g:if test="${session.user !=null && session.user.profil.libelle=='candidat'}">
    <div class="btn-group">
     <g:link controller="candidat" action="show" id="${session.user.id}" class="${params.controller == 'candidat' ? "linkmenubaractive btn btn-danger" : "linkmenubardesactive btn"}">${message(code: 'menubar.moncvdrioh', default: 'Mon CV DIORH')}</g:link>
    </div>
  </g:if>
  <g:if test='${session.user ==null || (session.user!=null && session.user.profil.libelle=='candidat')}'>
    <div class="btn-group">
      <a href="${createLink(controller:"annonce",action: 'list')}" class="${params.controller == 'annonce' ? "linkmenubaractive btn btn-danger" : "linkmenubardesactive btn"}"><i class="glyphicon glyphicon-list"></i> ${message(code: 'menubar.annonces', default: 'Annonces')}</a></button>
    </div>
  </g:if>
  <g:else>
    <g:if test="${session.droits !=null && session.droits.findAll{it.value.endsWith("CANDIDAT")}.size()>0}">
      <div class="btn-group">
        <a href="${createLink(controller:"candidat",action: 'list')}" class="${params.controller == 'candidat' ? "linkmenubaractive btn btn-danger" : "linkmenubardesactive btn"}">${message(code: 'menubar.candidat', default: 'Candidats')}</a>
        <a href="#" class="${params.controller == 'candidat' ? "btn btn-danger dropdown-toggle" : "btn dropdown-toggle"}" data-toggle="dropdown">
          <span class="caret"></span>
        </a>
        <ul class="dropdown-menu" role="menu">
          <g:if test="${session.droits.AJOUTER_CANDIDAT != null}">
            <li class="${params.controller == 'candidat' && params.action=='create' ? 'active' : ''}" ><g:link action="create" controller="candidat"><i class="glyphicon glyphicon-star"></i> Ajouter candidat</g:link></li>
          </g:if>
          <g:if test="${session.droits.LISTE_CANDIDAT != null}">
            <li class="${params.controller == 'candidat' && params.action=='list' ? "active" : ""}"><g:link action="list" controller="candidat"><i class="glyphicon glyphicon-star"></i> Liste des candidats</g:link></li>
          </g:if>
          <g:if test="${session.droits.ENVOYERMAIL_CANDIDAT != null}">
            <li class="${params.controller == 'candidat' && params.action=='sendmail' ? "active" : ""}"><g:link action="sendmail" controller="candidat"><i class="glyphicon glyphicon-star"></i> Envoyer mail</g:link></li>
          </g:if>

          <g:if test="${session.droits.RECHERCHER_CANDIDAT != null}">
            <li class="${params.controller == 'candidat' && params.action=='create_recherche' ? "active" : ""}"><g:link action="create_recherche" controller="candidat"><i class="glyphicon glyphicon-star"></i> Rechercher candidats</g:link></li>
            <li class="${params.controller == 'candidat' && params.action=='historique_recherche' ? "active" : ""}"><g:link action="historique_recherche" controller="candidat"><i class="glyphicon glyphicon-star"></i> Historique de la recherche</g:link></li>
          </g:if>
        </ul>
      </div>
    </g:if>
    <g:if test="${session.droits.findAll{it.value.endsWith("CONTACT")}.size()>0}">
      <div class="btn-group">
        <a href="${createLink(controller:"contact",action: 'list')}" class="${params.controller == 'contact' || params.controller=='actionContact' ? "linkmenubaractive btn btn-danger" : "linkmenubardesactive btn"}">${message(code: 'menubar.contact', default: 'Contacts')}</a>
        <a href="#" type="button" class="${params.controller == 'contact' || params.controller=='actionContact' ? "btn btn-danger  dropdown-toggle" : "btn  dropdown-toggle"}" data-toggle="dropdown">
          <span class="caret"></span>
        </a>
        <ul class="dropdown-menu" role="menu">
          <g:if test="${session.droits.AJOUTER_CONTACT != null}">
            <li class="${params.controller == 'contact' && params.action=='create' ? 'active' : ''}"><a href="${createLink(controller:"contact",action: 'create')}"><i class="glyphicon glyphicon-star"></i> Ajouter Contacts</a></li>
          </g:if>
          <g:if test="${session.droits.LISTE_CONTACT != null}">
            <li class="${params.controller == 'contact' && params.action=='list' ? 'active' : ''}"><a href="${createLink(controller:"contact",action: 'list')}"><i class="glyphicon glyphicon-star"></i> Liste des contacts</a></li>
          </g:if>
          <g:if test="${session.droits.ENVOYERMAIL_CONTACT != null}">
            <li class="${params.controller == 'contact' && params.action=='sendmail' ? 'active' : ''}"><a href="${createLink(controller:"contact",action: 'sendmail')}"><i class="glyphicon glyphicon-star"></i> Envoyer mail</a></li>
          </g:if>

          <g:if test="${session.droits.LISTE_ACTIONCONTACT != null}">
            <li class="${params.controller == 'actionContact' && params.action=='list' ? 'active' : ''}"><a href="${createLink(controller:"actionContact",action: 'list')}"><i class="glyphicon glyphicon-star"></i> Historique</a></li>
          </g:if>
          <g:if test="${session.droits.RECHERCHER_CONTACT != null}">
            <li class="${params.controller == 'contact' && params.action=='rechercher_contact' ? 'active' : ''}"><a href="${createLink(controller:"contact",action: 'rechercher_contact')}"><i class="glyphicon glyphicon-star"></i> Rechercher contact</a></li>
          </g:if>
        </ul>
      </div>
    </g:if>
    <g:if test="${session.droits.findAll{it.value.endsWith("MISSION")}.size()>0}">
      <div class="btn-group">
        <a href="${createLink(controller:"mission",action: 'list')}" class="${params.controller == 'mission' ? "linkmenubaractive btn btn-danger" : "linkmenubardesactive  btn"}">${message(code: 'menubar.mission', default: 'Missions')}</a>
        <a href="#" class="${params.controller == 'mission' ? "btn btn-danger dropdown-toggle" : "btn  dropdown-toggle"}" data-toggle="dropdown">
          <span class="caret"></span>
        </a>
        <ul class="dropdown-menu" role="menu">
          <g:if test="${session.droits.AJOUTER_MISSION != null}">
            <li class='${params.controller == 'mission' && params.action=='create' ? 'active' : ''}'><a href="${createLink(controller:"mission",action: 'create')}"><i class="glyphicon glyphicon-star"></i> Ajouter mission</a></li>
          </g:if>
          <g:if test="${session.droits.LISTE_MISSION != null}">
            <li class='${params.controller == 'mission' && params.action=='list' ? 'active' : ''}'><a href="${createLink(controller:"mission",action: 'list')}"><i class="glyphicon glyphicon-star"></i> Liste des missions</a></li>
          </g:if>
          <g:if test="${session.droits.RECHERCHER_MISSION != null}">
            <li class='${params.controller == 'mission' && params.action=='recherche' ? 'active' : ''}'><a href="${createLink(controller:"mission",action: 'recherche')}"><i class="glyphicon glyphicon-star"></i> Rechercher missions</a></li>
          </g:if>     
          <g:if test="${session.droits.LISTE_ANNONCE != null}">
            <li class='${params.controller == 'annonce' && params.action=='list' ? 'active' : ''}'><a href="${createLink(controller:"annonce",action: 'list')}"><i class="glyphicon glyphicon-star"></i> Liste des Annonces</a></li>
          </g:if>
        </ul>
        </ul>
      </div>
    </g:if>

    <g:if test="${session.droits.findAll{it.value.endsWith('CANDIDATURE')}.size()>0 || session.droits.findAll{it.value.endsWith('RENDEZVOUS')}.size()>0}">
      <div class="btn-group">
        <a href="${createLink(controller:"candidature",action: 'list')}" class="${params.controller == 'candidature' || params.controller == 'rendezVous' ? "linkmenubaractive btn btn-danger" : "linkmenubardesactive btn"}">${message(code: 'menubar.candidature', default: 'Candidatures')}</a>
        <a href="#" class="${params.controller == 'candidature' || params.controller == 'rendezVous' ? "btn btn-danger dropdown-toggle" : "btn  dropdown-toggle"}" data-toggle="dropdown">
          <span class="caret"></span>
          <span class="sr-only">Toggle Dropdown</span>
        </a>
        <ul class="dropdown-menu" role="menu">
          <g:if test="${session.droits.LISTE_CANDIDATURE != null}">
            <li class='${params.controller == 'candidature' && params.action=='list' ? 'active' : ''}'><a href="${createLink(controller:"candidature",action: 'list')}"><i class="glyphicon glyphicon-star"></i> Liste des candidatures</a></li>
          </g:if>
          <g:if test="${session.droits.RECHERCHER_CANDIDATURE != null}">
            <li class='${params.controller == 'candidature' && params.action=='create_recherche' ? 'active' : ''}'><a href="${createLink(controller:"candidature",action: 'create_recherche')}"><i class="glyphicon glyphicon-star"></i> Rechercher candidatures</a></li>
          </g:if>
          <g:if test="${session.droits.LISTE_RENDEZVOUS != null}">
            <li class='${params.controller == 'rendezVous' && params.action=='list' ? 'active' : ''}'><a href="${createLink(controller:"rendezVous",action: 'list')}"><i class="glyphicon glyphicon-star"></i> Créer rendez-vous</a></li>
          </g:if>

        </ul>
      </div>
    </g:if>

    <g:if test="${session.droits!=null && session.droits.PARAMETRAGE != null}">
      <div class="btn-group">
        <a href="#" class="${!test.contains(params.controller) ? "linkmenubaractive btn btn-danger" : "linkmenubardesactive btn"}"><i class="glyphicon glyphicon-cog"></i> ${message(code: 'menubar.parametre', default: 'Paramètres')}</a>
        <a href="#" class="${!test.contains(params.controller) ? "btn btn-danger dropdown-toggle" : "btn  dropdown-toggle"}" data-toggle="dropdown">   <span class="caret"></span>
          <span class="sr-only">Toggle Dropdown</span>
        </a>
        <ul class="dropdown-menu" role="menu">
          <li class="dropdown-submenu">
            <a tabindex="-1" href="#"><i class="glyphicon glyphicon-star"></i> Candidat</a>
            <ul class="dropdown-menu">
              <li class="${params.controller == 'annotationNote' ? 'active' : ''}">
                <a href="${createLink(uri: '/annotationNote/index')}">
                <i class="glyphicon glyphicon-link"></i>  Annotation de note
                </a>
              </li>
              <li class="${params.controller == 'annotationProfil' ? 'active' : ''}">
                <a href="${createLink(uri: '/annotationProfil/index')}">
                <i class="glyphicon glyphicon-link"></i>  Annotation du profil
                </a>
              </li>
              <li class="${params.controller == 'civilite' ? 'active' : ''}">
                <a href="${createLink(uri: '/civilite/index')}">
                <i class="glyphicon glyphicon-link"></i>  Civilité
                </a>
              </li>
              <li class="${params.controller == 'connaissanceInformatique' ? 'active' : ''}">
                <a href="${createLink(uri: '/connaissanceInformatique/index')}">
                <i class="glyphicon glyphicon-link"></i>  Connaissances informatiques
                </a>
              </li>
              <li class="${params.controller == 'connaissanceLinguistique' ? 'active' : ''}">
                <a href="${createLink(uri: '/connaissanceLinguistique/index')}">
                <i class="glyphicon glyphicon-link"></i>  Connaissances linguistiques
                </a>
              </li>
              <li class="${params.controller == 'diplome' ? 'active' : ''}">
                <a href="${createLink(uri: '/diplome/index')}">
                <i class="glyphicon glyphicon-link"></i>  Diplômes
                </a>
              </li>
              <li class="${params.controller == 'poste' ? 'active' : ''}">
                <a href="${createLink(uri: '/poste/index')}">
                <i class="glyphicon glyphicon-link"></i>  Fonction
                </a>
              </li>
            </ul>
          </li>

          <li class="dropdown-submenu">
            <a tabindex="-1" href="#"><i class="glyphicon glyphicon-star"></i> Formation</a>
            <ul class="dropdown-menu">
              <li class="${params.controller == 'typeEtablissement' ? 'active' : ''}">
                <a href="${createLink(uri: '/typeEtablissement/index')}">
                <i class="glyphicon glyphicon-link"></i>  Liste des établissements
                </a>
              </li>
              <li class="${params.controller == 'mobiliteGeographique' ? 'active' : ''}">
                <a href="${createLink(uri: '/mobiliteGeographique/index')}">
                <i class="glyphicon glyphicon-link"></i>  Mobilité géographique
                </a>
              </li>
              <li class="${params.controller == 'nationalite' ? 'active' : ''}">
                <a href="${createLink(uri: '/nationalite/index')}">
                <i class="glyphicon glyphicon-link"></i>  Nationalités
                </a>
              </li>
              <li class="${params.controller == 'niveauEtude' ? 'active' : ''}">
                <a href="${createLink(uri: '/niveauEtude/index')}">
                <i class="glyphicon glyphicon-link"></i>  Niveau d'études
                </a>
              </li>
              <li class="${params.controller == 'niveauConnaissanceLinguistique' ? 'active' : ''}">
                <a href="${createLink(uri: '/niveauConnaissanceLinguistique/index')}">
                <i class="glyphicon glyphicon-link"></i>  Niveau des connaissances linguistiques
                </a>
              </li>
              <li class="${params.controller == 'plageExperience' ? 'active' : ''}">
                <a href="${createLink(uri: '/plageExperience/index')}">
                 <i class="glyphicon glyphicon-link"></i> Plages d'expériences
                </a>
              </li>
              <li class="${params.controller == 'situationFamiliale' ? 'active' : ''}">
                <a href="${createLink(uri: '/situationFamiliale/index')}">
                 <i class="glyphicon glyphicon-link"></i> Situation familiale
                </a>
              </li>
              <li class="${params.controller == 'titreTest' ? 'active' : ''}">
                <a href="${createLink(uri: '/titreTest/index')}">
                 <i class="glyphicon glyphicon-link"></i> Titre du test
                </a>
              </li>
              <li class="${params.controller == 'typeEvenementCandidat' ? 'active' : ''}">
                <a href="${createLink(uri: '/typeEvenementCandidat/index')}">
                <i class="glyphicon glyphicon-link"></i>  Type d'évènement de candidat
                </a>
              </li>
            </ul>
          </li>

          <li class="dropdown-submenu">
            <a tabindex="-1" href="#"><i class="glyphicon glyphicon-star"></i> Contact</a>
            <ul class="dropdown-menu">
              <li class="${params.controller == 'statutActionContact' ? 'active' : ''}">
                <a href="${createLink(uri: '/statutActionContact/index')}">
                <i class="glyphicon glyphicon-link"></i>  Statut d'action contact
                </a>
              </li>
            </ul>
          </li>

          <li class="dropdown-submenu">
            <a tabindex="-1" href="#"><i class="glyphicon glyphicon-star"></i> Mission</a>
            <ul class="dropdown-menu">
              <li class="${params.controller == 'etapeAvancement' ? 'active' : ''}">
                <a href="${createLink(uri: '/etapeAvancement/index')}">
                 <i class="glyphicon glyphicon-link"></i> Étape d'avancement
                </a>
              </li>
              <li class="${params.controller == 'statutMission' ? 'active' : ''}">
                <a href="${createLink(uri: '/statutMission/index')}">
                 <i class="glyphicon glyphicon-link"></i> Statut mission
                </a>
              </li>
              <li class="${params.controller == 'etapePlanning' ? 'active' : ''}">
                <a href="${createLink(uri: '/etapePlanning/index')}">
                 <i class="glyphicon glyphicon-link"></i> Étape planning
                </a>
              </li>
              <li class="${params.controller == 'etapeAvancementCandidature' ? 'active' : ''}">
                <a href="${createLink(uri: '/etapeAvancementCandidature/index')}">
                 <i class="glyphicon glyphicon-link"></i> Étape d'avancement de candidature
                </a>
              </li>
              <li class="${params.controller == 'evaluationCandidature' ? 'active' : ''}">
                <a href="${createLink(uri: '/evaluationCandidature/index')}">
                <i class="glyphicon glyphicon-link"></i>  Évaluations de candidature
                </a>
              </li>
              <li class="${params.controller == 'statutCandidature' ? 'active' : ''}">
                <a href="${createLink(uri: '/statutCandidature/index')}">
                 <i class="glyphicon glyphicon-link"></i> Statut de candidature
                </a>
              </li>
              <li class="${params.controller == 'typeEvenementCandidature' ? 'active' : ''}">
                <a href="${createLink(uri: '/typeEvenementCandidature/index')}">
                 <i class="glyphicon glyphicon-link"></i> Type d'évènement de candidature
                </a>
              </li>
              <li class="${params.controller == 'typeRendezvous' ? 'active' : ''}">
                <a href="${createLink(uri: '/typeRendezvous/index')}">
                 <i class="glyphicon glyphicon-link"></i> Type de rendez-vous
                </a>
              </li>
            </ul>
          </li>

          <li class="dropdown-submenu">
            <a tabindex="-1" href="#"><i class="glyphicon glyphicon-star"></i> Paramètres généraux</a>
            <ul class="dropdown-menu">
              <li class="${params.controller == 'formation' ? 'active' : ''}">
                <a href="${createLink(uri: '/formation/index')}">
                  <i class="glyphicon glyphicon-link"></i> Formations
                </a>
              </li>
              <li class="${params.controller == 'pays' ? 'active' : ''}">
                <a href="${createLink(uri: '/pays/index')}">
                  <i class="glyphicon glyphicon-link"></i> Pays
                </a>
              </li>
              <li class="${params.controller == 'secteurActivite' ? 'active' : ''}">
                <a href="${createLink(uri: '/secteurActivite/index')}">
                  <i class="glyphicon glyphicon-link"></i> Secteur d'activité
                </a>
              </li>
              <li class="${params.controller == 'sourceInscription' ? 'active' : ''}">
                <a href="${createLink(uri: '/sourceInscription/index')}">
                  <i class="glyphicon glyphicon-link"></i> Source d'inscription
                </a>
              </li>
              <li class="${params.controller == 'typeEntreprise' ? 'active' : ''}">
                <a href="${createLink(uri: '/typeEntreprise/index')}">
                   <i class="glyphicon glyphicon-link"></i>Type d'entreprise
                </a>
              </li>
              <li class="${params.controller == 'ville' ? 'active' : ''}">
                <a href="${createLink(uri: '/ville/index')}">
                  <i class="glyphicon glyphicon-link"></i> Villes
                </a>
              </li>
              <li class="${params.controller == 'fonctionDior' ? 'active' : ''}">
                <a href="${createLink(uri: '/fonctionDior/index')}">
                  <i class="glyphicon glyphicon-link"></i> Fonction Diorh
                </a>
              </li>
              <li class="${params.controller == 'mailTemplate' ? 'active' : ''}">
                <a href="${createLink(uri: '/mailTemplate/list')}">
                  <i class="glyphicon glyphicon-link"></i> Template
                </a>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </g:if>
    <g:if test="${session.droits!=null && (session.droits.findAll{it.value.endsWith("UTILISATEUR")}.size()>0 ||  session.droits.findAll{it.value.endsWith('PROFIL')}.size()>0)}">
      <div class="btn-group"> 
        <a href="${createLink(controller:"utilisateur",action: 'list')}" class="${params.controller == 'utilisateur' || params.controller == 'profil' ? "linkmenubaractive btn btn-danger" : "linkmenubardesactive btn"}"><i class="glyphicon glyphicon-user"></i> ${message(code: 'menubar.parametre', default: 'Utilisateur')}</a>
        <a href="#" class="${params.controller == 'utilisateur' || params.controller == 'profil' ? "btn btn-danger dropdown-toggle" : "btn  dropdown-toggle"}" data-toggle="dropdown">
          <span class="caret"></span>
          <span class="sr-only">Toggle Dropdown</span>
        </a>
        <ul class="dropdown-menu" role="menu">
          <g:if test="${session.droits.AJOUTER_UTILISATEUR != null}">
            <li class="${params.controller == 'utilisateur' && params.action=='create' ? "active" : ""}"><a href="${createLink(controller:"utilisateur",action: 'create')}"><i class="glyphicon glyphicon-star"></i> Ajouter utilisateur</a></li>
          </g:if>
          <g:if test="${session.droits.LISTE_UTILISATEUR != null}">
            <li class="${params.controller == 'utilisateur' && params.action=='list' ? "active" : ""}"><a href="${createLink(controller:"utilisateur",action: 'list')}"><i class="glyphicon glyphicon-star"></i> Liste des utlisateurs</a></li>
          </g:if>

          <g:if test="${session.droits.AJOUTER_PROFIL != null}">
            <li class="${params.controller == 'profil' && params.action=='create' ? "active" : ""}"><a href="${createLink(controller:"profil",action: 'create')}"><i class="glyphicon glyphicon-star"></i> Ajouter profil</a></li>
          </g:if>
          <g:if test="${session.droits.LISTE_PROFIL != null}">
            <li class="${params.controller == 'profil' && params.action=='list' ? "active" : ""}"><a href="${createLink(controller:"profil",action: 'list')}"><i class="glyphicon glyphicon-star"></i> Liste des profils</a></li>
          </g:if>
        </ul>
      </div>
    </g:if>
  </g:else>
  <g:if test="${session.user ==null}">
    <div class="btn-group">
      <a href="${createLink(controller:"candidat",action: 'create')}" class="${params.controller == 'candidat' ? "linkmenubaractive btn btn-danger" : "linkmenubardesactive btn"}"><i class="glyphicon glyphicon-log-in"></i> ${message(code: 'menubar.deconnecter', default: "Inscription")}</a>
    </div>
  </g:if>
  <g:else>
    <div class="btn-group pull-right">
     <a href="${createLink(controller:"securite",action: 'logout')}" class="linkmenubaractive btn btn-warning"><i class="glyphicon glyphicon-log-out"></i> ${message(code: 'menubar.deconnecter', default: 'Déconnecter')}</a>
    </div>
  </g:else>
</div>

