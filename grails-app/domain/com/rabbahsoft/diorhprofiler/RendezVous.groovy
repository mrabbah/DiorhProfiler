package com.rabbahsoft.diorhprofiler

class RendezVous {

    Date dateRdv
    String emplacement
    String commentaire
    Utilisateur utilisateur
    TypeRendezvous typage
    Contact contact
    Candidat candidat

    static belongsTo = [Candidat, Contact, Utilisateur]

    static mapping = {
    }

    static constraints = {
        emplacement nullable: true, maxSize: 400
        commentaire nullable: true, maxSize: 65535
        typage nullable: true
    }
}
