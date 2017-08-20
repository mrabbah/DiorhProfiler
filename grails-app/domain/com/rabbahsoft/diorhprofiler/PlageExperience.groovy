package com.rabbahsoft.diorhprofiler

/**
 * PlageExperience
 * A domain class describes the data object and it's mapping to the database
 */
class PlageExperience {

    String libelle
    Integer ordre
    /* Default (injected) attributes of GORM */
    //	Long	id
    //	Long	version
	
    /* Automatic timestamping of GORM */
    //	Date	dateCreated
    //	Date	lastUpdated
	
    //	static	belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
    //	static	hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
    //	static	hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
    //	static	mappedBy	= []	// specifies which property should be used in a mapping 
	
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
