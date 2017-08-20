package com.rabbahsoft.diorhprofiler

/**
 * HistoriqueActionContact
 * A domain class describes the data object and it's mapping to the database
 */
class HistoriqueActionContact {

    String objet
    String action
    String suite
    Date date
    StatutActionContact statut
    
    static	belongsTo	= [utilisateur : Utilisateur, contact : Contact]
	
    static	mapping = {
    }
    
	static	constraints = {
    }
	
}
