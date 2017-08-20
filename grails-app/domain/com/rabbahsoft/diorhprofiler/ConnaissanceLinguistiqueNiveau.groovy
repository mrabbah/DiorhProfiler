package com.rabbahsoft.diorhprofiler

/**
 * ConnaissanceLinguistiqueNiveau
 * A domain class describes the data object and it's mapping to the database
 */
class ConnaissanceLinguistiqueNiveau {
    NiveauConnaissanceLinguistique niveau 
    ConnaissanceLinguistique langue
    
    boolean deleted
    static transients = []
    
    static belongsTo = [ candidat:Candidat ]
    
   
    
}
