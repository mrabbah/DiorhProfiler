package com.rabbahsoft.diorhprofiler

class Mission implements Comparable<Mission>{

    String code
    String reference
    Date dateDemarrage
    String poste
    String localisation
    Contact contact
    String contexte
    String approche
    InterlocuteurContact interlocuteur
    String rattachementHierarchique
    String rattachementFonctionnel
    String description
    Utilisateur chargeRecherche
    Utilisateur consultant
    Utilisateur assistant
    Date datePublication
    String entreprise
    String descriptifSociete
    String descriptifPoste
    String profilCandidat
    Boolean publierAnnonce
    Date dateFinAnnonce
    Integer dureeGarantie
    Date dateFinGarantie
    String typeFormation
    PlageExperience plageExperience
    Integer nbrAnneeExperience
    SecteurActivite secteurActivite
    String comportement
    Integer effectifEquipe
    String budget
    String profilEquipe
    String remunerationAvantages
    String deplacement
    String deplacementLocalisation
    Integer delaisRealisation
    Boolean replanifier
    Boolean archiver = false
    static	belongsTo	= [
        statut : StatutMission , typeFonction : Poste
        , niveauEtude : NiveauEtude, formation : Formation,
        etapeAvancement : EtapeAvancement
    ]
        
    static hasMany = [connaissanceLinguistiques: ConnaissanceLinguistique,
        planifications: Planification,
        connaissancesInfos : ConnaissanceInformatique,candidatures : Candidature]
    List<Planification> planifications

    static mapping = {
        planifications cascade:"all-delete-orphan"
    }

    static constraints = {
        code nullable: true
        reference nullable: true
//        poste nullable: true
        localisation nullable: true
        contexte inList : ['Création de poste','Remplacement'],nullable : true
//        approche inList : ['Mixte','Directe','Base de données'],nullable : true
        approche inList : ['Mixte','Directe','Base de données']
        //dureeGarantie inList : ['Mixte','Directe']
        dureeGarantie inList: [0,3,6]
        interlocuteur nullable: true
        dateDemarrage nullable: true
        datePublication nullable: true
        rattachementHierarchique nullable: true
        rattachementFonctionnel nullable: true
        description nullable: true, maxSize: 65535
        //description  maxSize: 65535
        descriptifSociete nullable: true, maxSize: 65535
        descriptifPoste nullable: true, maxSize: 65535
        profilCandidat nullable: true, maxSize: 65535
        typeFormation nullable: true
        comportement nullable: true, maxSize: 65535
        profilEquipe nullable: true, maxSize: 65535
        budget nullable: true
        remunerationAvantages nullable: true, maxSize: 65535
        deplacement inList : ['Aucun','Limite','Frequents'],nullable : true
        deplacementLocalisation nullable: true, maxSize: 60
        nbrAnneeExperience nullable: true
        effectifEquipe nullable: true
        publierAnnonce nullable: true
        dureeGarantie nullable: true
        delaisRealisation nullable: true
        replanifier nullable: true
        dateFinGarantie nullable: true
        entreprise nullable: true
        plageExperience nullable : true
        secteurActivite nullable : true
        chargeRecherche nullable : true
        consultant nullable : true
        assistant nullable : true
        typeFonction nullable : true
        statut nullable : true
        niveauEtude nullable : true
        formation nullable : true
        etapeAvancement nullable : true
        contact nullable : true
        dateFinAnnonce nullable : true
        
    }
     @Override	
    public String toString() {
        if(reference!=null)
        {
         return "${reference}";   
        }
        else
        {
           return "" 
        }   
    }
    public int compareTo(Mission compareCandidat) {
        Date dateCreated = ((Mission) compareCandidat).datePublication; 
//        return this.dateCreated > dateCreated;
        if (this.datePublication > datePublication)
        return 1;
        else if ( this.datePublication < datePublication)
        return -1;
        else 
        return 0;
        
        
//        int dateCmp = e2.hireDate().compareTo(e1.hireDate());
//        if (dateCmp != 0)
//            return dateCmp;
//
//        return (e1.number() < e2.number() ? -1 :
//               (e1.number() == e2.number() ? 0 : 1));
        
    }	
}
