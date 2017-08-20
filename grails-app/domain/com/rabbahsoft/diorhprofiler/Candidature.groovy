package com.rabbahsoft.diorhprofiler

class Candidature {

    Boolean spontanee=false
    Date dateCandidature
    String lettreMotivation
    String evaluationCommentaire
    String oldStatut
    //String externe
    String sourceCandidature
    EtapeAvancementCandidature etapeAvancement
    StatutCandidature statut
    EvaluationCandidature evaluation
    Candidat candidat
    Mission mission
    static hasMany = [evenementCandidatures: EvenementCandidature]
    static belongsTo = [Candidat, Mission]
    List<EvenementCandidature> evenementCandidatures
    static mapping = {
    }

    static constraints = {
        spontanee nullable: true
        dateCandidature nullable: true
        lettreMotivation nullable: true, maxSize: 65535
        evaluationCommentaire nullable: true, maxSize: 65535
        oldStatut nullable: true
        etapeAvancement nullable: true
        statut nullable: true
        evaluation nullable: true
        sourceCandidature nullable: true, maxSize: 50
        //externe nullable: true
    }
}
