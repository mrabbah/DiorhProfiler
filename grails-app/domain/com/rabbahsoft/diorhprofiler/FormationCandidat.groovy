package com.rabbahsoft.diorhprofiler

class FormationCandidat {

    String intituleDiplome
    String annee
    String optionFormation
    String etablissement
    Ville ville
    String description
    TypeEtablissement typeEtablissement
    Diplome diplome
    Candidat candidat
    boolean deleted
    static transients = []

    static belongsTo = [Candidat]

    static mapping = {
    }

    static constraints = {
        candidat nullable: true
        ville nullable: true
        intituleDiplome nullable: true, maxSize: 500
        annee nullable: true
        typeEtablissement nullable: true
        diplome nullable: true
        optionFormation nullable: true, maxSize: 500
        etablissement nullable: true, maxSize: 500
        description nullable: true, maxSize: 65535
    }
}
