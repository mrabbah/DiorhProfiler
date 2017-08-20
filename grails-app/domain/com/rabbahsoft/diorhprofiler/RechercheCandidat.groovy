package com.rabbahsoft.diorhprofiler

/**
 * RechercheCandidat
 * A domain class describes the data object and it's mapping to the database
 */
class RechercheCandidat {
    
        String libellerecherche
        String nomStockage
        String prenomStockage
        Civilite civilite
        Integer ageMin
        Integer ageMax
        Boolean annote
        SourceInscription sourceInscription
        String motCle
        AnnotationProfil profil1
        AnnotationNote annotation1
        AnnotationProfil profil2
        AnnotationNote annotation2
        String test

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
	
    static hasMany = [
        villes:Ville,
        diplomes:Diplome,
        postes:Poste,
        plageexperiences:PlageExperience,
        secteuractivites:SecteurActivite,
        typeentreprises:TypeEntreprise,
        niveauetudes:NiveauEtude
    ]
    
    static	mapping = {
    }
    
	static	constraints = {
        libellerecherche nullable: true
        nomStockage nullable: true
        prenomStockage nullable: true
        civilite nullable: true
        ageMin nullable: true
        ageMax nullable: true
        sourceInscription nullable: true
        motCle nullable: true
        profil1 nullable: true
        profil2 nullable: true
        annotation1 nullable: true
        annotation2 nullable: true
        annote nullable: true
        test nullable: true
    }
	 @Override	
    public String toString() {
        return "${libellerecherche}";
    }
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
