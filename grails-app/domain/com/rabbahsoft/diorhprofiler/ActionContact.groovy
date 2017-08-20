package com.rabbahsoft.diorhprofiler

/**
 * ActionContact
 * A domain class describes the data object and it's mapping to the database
 */
class ActionContact {

    Contact contact
    Date dateAction
    Utilisateur responsable
    String contenu
    String statutAction
    
	/* Default (injected) attributes of GORM */
//	Long	id
//	Long	version
	
	/* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated
	
	static	belongsTo	= [Contact, Utilisateur]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static	hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static	hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static	mappedBy	= []	// specifies which property should be used in a mapping 
	
    static	mapping = {
    }
    
	static	constraints = {
        contenu nullable: true, maxSize: 65535
        dateAction nullable: true
        statutAction inList : ['Mission','sans reponse','Fin']
    }
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
