package com.rabbahsoft.diorhprofiler

class Experience {
    
    String intitulePoste
    String entreprise
    Date dateDebut
    Date dateFin
    String mission
    Integer nbrPersonneEncadre
    String rattachement
    Ville ville
    SecteurActivite secteurActivite
    Poste poste
    TypeEntreprise typeEntreprise
    String contact  //le contact temoin sur le travail au sein de l entreprise
    String telephoneContact
    String fonctionContact
    boolean deleted
    static transients = []

    static belongsTo = [candidat : Candidat]

    static mapping = {
    }

    static constraints = {
        candidat nullable: true
        intitulePoste nullable : true, maxSize: 100
        entreprise nullable : true, maxSize: 100
        mission nullable: true, maxSize: 65535
        rattachement nullable: true, maxSize: 50
        dateDebut nullable : false
        dateFin nullable : true
        secteurActivite nullable : true
        nbrPersonneEncadre nullable : true
        contact nullable : true
        telephoneContact nullable : true
        fonctionContact nullable : true
        ville nullable : true
        poste nullable : true
        typeEntreprise nullable : true
    }
}
