package com.rabbahsoft.diorhprofiler

class Profil {

    String libelle
    List droits
    static hasMany = [droits : Droit, utilisateurs : Utilisateur]
    
    static constraints = {
        libelle blank: false, unique: true
    }
    
    @Override	
    public String toString() {
        return "${libelle}";
    }
}
