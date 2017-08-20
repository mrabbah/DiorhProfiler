package com.rabbahsoft.diorhprofiler

class Planification {

	Date dateDebut
	Date dateFin

	static belongsTo = [mission : Mission, etape : EtapePlanning]

	static mapping = {
	}

	static constraints = {
        dateDebut nullable :true
        dateFin nullable :true
        etape nullable :true
        mission nullable :true
	}
}
