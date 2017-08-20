package com.rabbahsoft.diorhprofiler
import cr.co.arquetipos.crypto.Blowfish
class Utilisateur {

    //	transient springSecurityService

    //String id
    String username
    String email
    String firstName
    String lastName
    String password
    boolean enabled
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired
    Profil  profil
    FonctionDior fonctionDior
    String adresseIp

    //	static transients = ['springSecurityService']

    static belongsTo = [Profil]
        
         
    static constraints = {
        firstName nullable: true
        lastName nullable: true
        username nullable: true, unique: true
        password blank: false
        email email: true, blank: false, unique: true
        firstName nullable: true
        lastName nullable: true
        profil nullable:true
        fonctionDior nullable:true
        adresseIp nullable:true
    }

    static mapping = {
        password column: '`password`'
        //id generator: 'uuid'
    }

    Set<Profil> getAuthorities() {
        UtilisateurProfil.findAllByUtilisateur(this).collect { it.profil } as Set
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = Blowfish.encryptBase64(password, "#1Ab@.com")
    }
        
    @Override	
    public String toString() {
        return "${firstName} ${lastName}";
    }
} 
