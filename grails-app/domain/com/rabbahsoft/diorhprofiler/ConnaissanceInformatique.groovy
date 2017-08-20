package com.rabbahsoft.diorhprofiler

/**
 * ConnaissanceInformatique
 * A domain class describes the data object and it's mapping to the database
 */
class ConnaissanceInformatique {

    String intituleConnaissance
    
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
static searchable = true
//    static searchable = {
//      candidats component: true
//      mapping {
//        root true
//      }
//   }
//   static belongsTo = Candidat
//    static hasMany = [candidats : Candidat]
    
    static	mapping = {
        sort "intituleConnaissance"
    }
    
    static	constraints = {
        intituleConnaissance blank : false, maxSize: 40, unique : true
    }
	
    /*
     * Methods of the Domain Class
     */
    @Override	
    public String toString() {
        return "${intituleConnaissance}";
    }
}
