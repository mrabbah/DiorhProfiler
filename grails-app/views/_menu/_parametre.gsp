<li class="dropdown dropdown-btn">
  <a class="dropdown-toggle" data-toggle="dropdown" href="#">
    Paramètres<b class="caret"></b>
  </a>

  <ul class="dropdown-menu">
<%-- Note: Links to pages without controller are redirected in conf/UrlMappings.groovy --%>
    <li class="dropdown dropdown-btn">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">
        Candidat
      </a>
      <ul class="dropdown-menu">
        <li class="">
          <a href="${createLink(uri: '/annotationNote/index')}">
            Annotation de note
          </a>
        </li>
        <li class="">
          <a href="${createLink(uri: '/annotationProfil/index')}">
            Annotation du profil
          </a>
        </li>
        <li class="">
          <a href="${createLink(uri: '/civilite/index')}">
            Civilité
          </a>
        </li>
        <li class="">
          <a href="${createLink(uri: '/connaissanceInformatique/index')}">
            Connaissances informatiques
          </a>
        </li>
        <li class="">
          <a href="${createLink(uri: '/connaissanceLinguistique/index')}">
            Connaissances linguistiques
          </a>
        </li>
        <li class="">
          <a href="${createLink(uri: '/diplome/index')}">
            Diplômes
          </a>
        </li>
        <li class="">
          <a href="${createLink(uri: '/poste/index')}">
            Fonction
          </a>
        </li>
        <li class="">
          <a href="${createLink(uri: '/typeEtablissement/index')}">
            Liste des établissements
          </a>
        </li>
        <li class="">
          <a href="${createLink(uri: '/mobiliteGeographique/index')}">
            Mobilité géographique
          </a>
        </li>
        <li class="">
          <a href="${createLink(uri: '/nationalite/index')}">
            Nationalités
          </a>
        </li>
        <li class="">
          <a href="${createLink(uri: '/situationFamiliale/index')}">
            Situation familiale
          </a>
        </li>
        <li class="">
          <a href="${createLink(uri: '/titreTest/index')}">
            Titre du tes
          </a>
        </li>
        <li class="">
          <a href="${createLink(uri: '/typeEvenementCandidat/index')}">
            Type d'évènement de candidat
          </a>
        </li>

      </ul>
    </li>

    <li class="dropdown dropdown-btn">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">
        Formation
      </a>
      <ul class="dropdown-menu">
        <li class="">
          <a href="${createLink(uri: '/typeEtablissement/index')}">
            Liste des établissements
          </a>
        </li>
        <li class="">
          <a href="${createLink(uri: '/mobiliteGeographique/index')}">
            Mobilité géographique
          </a>
        </li>
        <li class="">
          <a href="${createLink(uri: '/nationalite/index')}">
            Nationalités
          </a>
        </li>
        <li class="">
          <a href="${createLink(uri: '/niveauEtude/index')}">
            Niveau d'études
          </a>
        </li>
        <li class="">
          <a href="${createLink(uri: '/niveauConnaissanceLinguistique/index')}">
            Niveau des connaissances linguistiques
          </a>
        </li>
        <li class="">
          <a href="${createLink(uri: '/plageExperience/index')}">
            Plages d'éxperiences
          </a>
        </li>
        <li class="">
          <a href="${createLink(uri: '/situationFamiliale/index')}">
            Situation familiale
          </a>
        </li>
        <li class="">
          <a href="${createLink(uri: '/titreTest/index')}">
            Titre du test
          </a>
        </li>
        <li class="">
          <a href="${createLink(uri: '/typeEvenementCandidat/index')}">
            Type d'évènement de candidat
          </a>
        </li>

      </ul>
    </li>

    <li class="dropdown dropdown-btn">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">
        Contact
      </a>
      <ul class="dropdown-menu">
        <li class="">
          <a href="${createLink(uri: '/statutActionContact/index')}">
            Statut d'action contact
          </a>
        </li>
      </ul>
    </li>

    <li class="dropdown dropdown-btn">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">
        Mission
      </a>
      <ul class="dropdown-menu">
        <li class="">
          <a href="${createLink(uri: '/etapePlanning/index')}">
            Étape planning
          </a>
        </li>
        <li class="">
          <a href="${createLink(uri: '/etapeAvancementCandidature/index')}">
            Étape d'avancement de candidature
          </a>
        </li>
        <li class="">
          <a href="${createLink(uri: '/evaluationCandidature/index')}">
            Évaluations de candidature
          </a>
        </li>
        <li class="">
          <a href="${createLink(uri: '/formation/index')}">
            Formations
          </a>
        </li>
        <li class="">
          <a href="${createLink(uri: '/statutCandidature/index')}">
            Statut de candidature
          </a>
        </li>
        <li class="">
          <a href="${createLink(uri: '/typeEvenementCandidature/index')}">
            Type d'évènement de candidature
          </a>
        </li>
        <li class="">
          <a href="${createLink(uri: '/typeRendezvous/index')}">
            Type de rendez-vous
          </a>
        </li>
      </ul>
    </li>

    <li class="dropdown dropdown-btn">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">
        Paramètres généraux
      </a>
      <ul class="dropdown-menu">
        <li class="">
          <a href="${createLink(uri: '/pays/index')}">
            Pays
          </a>
        </li>
        <li class="">
          <a href="${createLink(uri: '/secteurActivite/index')}">
            Secteur d'activité
          </a>
        </li>
        <li class="">
          <a href="${createLink(uri: '/typeEntreprise/index')}">
            Type d'entreprise
          </a>
        </li>
        <li class="">
          <a href="${createLink(uri: '/ville/index')}">
            Villes
          </a>
        </li>     
      </ul>
    </li>
  </ul>
</li>