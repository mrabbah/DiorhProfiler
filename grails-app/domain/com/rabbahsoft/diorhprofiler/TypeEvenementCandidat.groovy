package com.rabbahsoft.diorhprofiler

/**
 * TypeEvenementCandidat
 * A domain class describes the data object and it's mapping to the database
 */
class TypeEvenementCandidat {
    String libelle
    Integer ordre
    
    static	mapping = {
        sort "libelle"
    }
    
    static	constraints = {
        libelle maxSize: 200, blank : false, unique : true
    }
    /*
     * Methods of the Domain Class
     */
    @Override	
    public String toString() {
        return "${libelle}";
    }
}
