package com.rabbahsoft.diorhprofiler

class InterlocuteurContact {

	String nom
	String prenom
	String fonction
	String telephonePortable
	String telephoneFixe
	String email
        boolean deleted
        static transients = []

	static belongsTo = [contact : Contact]

	static mapping = {
		
	}

	static constraints = {
		nom nullable:true,maxSize: 50
		prenom nullable:true,maxSize: 50
		fonction nullable:true,maxSize: 50
		telephonePortable nullable:true,maxSize: 30
		telephoneFixe nullable:true,maxSize: 30
		email nullable:true,maxSize: 100, email : true
                contact nullable:true
	}
        
    @Override	
    public String toString() {
        return "${nom} ${prenom}";
    }
}
