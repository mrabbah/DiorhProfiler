package com.rabbahsoft.diorhprofiler

class EvenementCandidat {

	Date dateEvent
	String responsable
	TypeEvenementCandidat typeEvenement
	Contact contact
	Candidat candidat

	static belongsTo = [Candidat, Contact, TypeEvenementCandidat]

	static mapping = {
	}

	static constraints = {
		responsable nullable: true, maxSize: 50, unique : true
	}
}
