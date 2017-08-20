package com.rabbahsoft.diorhprofiler

/**
 * NiveauConnaissanceLinguistique
 * A domain class describes the data object and it's mapping to the database
 */
class NiveauConnaissanceLinguistique {

String intituleNiveauLangue
    static constraints = {
        intituleNiveauLangue blank : false, maxSize: 40, unique : true
    }
        
    @Override	
    public String toString() {
        return "${intituleNiveauLangue}";
    }
}
