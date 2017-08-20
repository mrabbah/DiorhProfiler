package com.rabbahsoft.diorhprofiler

class Contact {

    String raisonSociale
    String type
    String directeurGeneral
    Integer effectif
    Integer effectifCadre
    String chiffreAffaire
    Long codePostal
    String adresse1
    String adresse2
    String adresse3
    Ville ville
    String telephone
    String fax
    Date dateCreation
    Date dateCreationEntrep
    TypeEntreprise typeEntreprise
    SecteurActivite secteurActivite

    static hasMany = [
        interlocuteurcontacts: InterlocuteurContact,
        actioncontacts: ActionContact,
    ]
    
    List<InterlocuteurContact> interlocuteurcontacts

    static	belongsTo	= [secteurActivite : SecteurActivite]
    static mapping = {
        version false
         interlocuteurcontacts cascade:"all-delete-orphan"
    }

    static constraints = {
        raisonSociale maxSize: 60, blank : false
        type inList : ['Prospect','Client']
        directeurGeneral nullable: true, maxSize: 50
        effectif nullable: true
        effectifCadre nullable: true
        chiffreAffaire nullable: true, maxSize: 20
        codePostal nullable: true
        adresse1 nullable: true, maxSize: 100
        adresse2 nullable: true, maxSize: 100
        adresse3 nullable: true, maxSize: 100
        ville nullable: true
        telephone nullable: true, maxSize: 30
        fax nullable: true, maxSize: 30
        dateCreation nullable: true
        dateCreationEntrep nullable: true
        typeEntreprise nullable : true                
    }
    
    @Override	
    public String toString() {
        return "${raisonSociale}";
    }
}
