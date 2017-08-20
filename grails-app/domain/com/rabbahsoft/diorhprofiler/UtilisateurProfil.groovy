package com.rabbahsoft.diorhprofiler

import org.apache.commons.lang.builder.HashCodeBuilder

class UtilisateurProfil implements Serializable {

	private static final long serialVersionUID = 1

	Utilisateur utilisateur
	Profil profil

	boolean equals(other) {
		if (!(other instanceof UtilisateurProfil)) {
			return false
		}

		other.utilisateur?.id == utilisateur?.id &&
			other.profil?.id == profil?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (utilisateur) builder.append(utilisateur.id)
		if (profil) builder.append(profil.id)
		builder.toHashCode()
	}

	static UtilisateurProfil get(long utilisateurId, long profilId) {
		UtilisateurProfil.where {
			utilisateur == Utilisateur.load(utilisateurId) &&
			profil == Profil.load(profilId)
		}.get()
	}

	static UtilisateurProfil create(Utilisateur utilisateur, Profil profil, boolean flush = false) {
		new UtilisateurProfil(utilisateur: utilisateur, profil: profil).save(flush: flush, insert: true)
	}

	static boolean remove(Utilisateur u, Profil r, boolean flush = false) {

		int rowCount = UtilisateurProfil.where {
			utilisateur == Utilisateur.load(u.id) &&
			profil == Profil.load(r.id)
		}.deleteAll()

		rowCount > 0
	}

	static void removeAll(Utilisateur u) {
		UtilisateurProfil.where {
			utilisateur == Utilisateur.load(u.id)
		}.deleteAll()
	}

	static void removeAll(Profil r) {
		UtilisateurProfil.where {
			profil == Profil.load(r.id)
		}.deleteAll()
	}

	static mapping = {
		id composite: ['profil', 'utilisateur']
		version false
	}
}
