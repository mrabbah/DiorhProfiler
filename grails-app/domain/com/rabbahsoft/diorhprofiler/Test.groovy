package com.rabbahsoft.diorhprofiler

class Test {

    Date dateTest = new Date()
    String commentaire
    boolean deleted
    static transients = []

    static belongsTo = [candidat:Candidat, titre:TitreTest]

    static constraints = {
        dateTest nullable: true
        commentaire nullable: true, maxSize: 65535
        titre nullable: true
    }
}
