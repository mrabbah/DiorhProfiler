package com.rabbahsoft.diorhprofiler

/**
 * MobiliteGeographique
 * A domain class describes the data object and it's mapping to the database
 */
class MobiliteGeographique {

    String libelle
    Integer ordre
    
    static	mapping = {
        sort "ordre"
    }
    
    static	constraints = {
        libelle maxSize: 200, blank : false
        ordre blank : false, unique : true
    }
	
    /*
     * Methods of the Domain Class
     */
    @Override	
    public String toString() {
        return "${libelle}";
    }
}
