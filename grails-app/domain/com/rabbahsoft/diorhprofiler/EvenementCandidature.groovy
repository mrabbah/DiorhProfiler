package com.rabbahsoft.diorhprofiler

class EvenementCandidature {

	Date dateEvtCandidature
	TypeEvenementCandidature typeEvenement
	Candidature candidature

	static belongsTo = [Candidature, TypeEvenementCandidature]

	static mapping = {
		
	}
}
