package com.rabbahsoft.diorhprofiler

import cr.co.arquetipos.crypto.Blowfish
import java.net.InetAddress;
import java.net.UnknownHostException;
import cr.co.arquetipos.password.PasswordTools
class SecuriteController {

    def index() { 
}
    
    def login() {
        def login = params.email     
       def pwd = Blowfish.encryptBase64(params.password, "#1Ab@.com")
        def user = Utilisateur.findByEmailAndPassword(login,pwd)
        def droits=[:]
        if(user && user.enabled) 
        {
            if(!user.profil.libelle.equals("candidat")) {
                if(!user.adresseIp.equals("*")) {
                    def ips = user.adresseIp.split(",")
                    def ipuser = request.getRemoteAddr()
                    if(!ips.contains(ipuser)) {
                        flash.message = "Vous n'avez pas le droit d'accéder au site depuis cet endroit"
                        redirect(controller :"home", action : "index")
                        return false
                    }
                }
            }
            println("vvvvv   "+user.profil)
            session.user = user
            def profil = user.profil
            session.profil=profil.libelle
            for(droit in profil.droits) {
                droits[droit.code] = droit.code
            }
            session.droits=droits
            redirect(controller : "home")            
        } else {
//            flash.message = "Login et/ou mot de passe incorrect(s)"
//            flash.message = "votre mot de passe est obsolète. Veuillez en générer un nouveau en cliquant sur 'mot de passe oublié"
            def saveParamshere= "votre mot de passe est obsolète. Veuillez en générer un nouveau en cliquant sur mot de passe oublié"
            redirect(controller :"home", action : "index",params: [temp: saveParamshere])
        }
    }
    
    def logout() {
        session.invalidate()
        redirect(controller :"home", action : "index")
    }
    
    def motdepasseoublie() {
        def candidat=Candidat.findByEmail(params.emailoublie)
        if(candidat!=null){
            //String pwd = Blowfish.decryptBase64(candidat.password,"#1Ab@.com")
            def pwd1 = PasswordTools.generateRandomPassword(10)
            candidat.password=pwd1
            candidat.save(failOnError:true,flush:true)
            mailrecuperationmotpasse(candidat,"mailrecuperationmotpasse",pwd1)
            flash.message="Votre mot de passe a été envoyé à votre boite mail."
            redirect(controller :"home", action : "motdepasseoublie")    
        }
        else{
            flash.message="L'adresse que vous avez saisie n'est associé à aucune personne."
            redirect(controller :"home", action : "motdepasseoublie")
        }
    }
    
    def changementmotdepasse() {
        def ancienmotpasse=Blowfish.encryptBase64(params.ancienmotpasse, "#1Ab@.com")
        if(ancienmotpasse!=session.user.password){
            flash.message="Le mot de passe saisi ne correspond pas a votre mot de passe actuel"
            redirect(controller :"home", action : "changementmotdepasse",model:[ancienmotpasse:params.ancienmotpasse,nouveaumotpasse:params.nouveaumotpasse,confirmation:params.confirmation])
        }
        else{
            def candidat=Candidat.get(session.user.id)
            bindData(candidat,[password:params.nouveaumotpasse])
            candidat.save(failOnError:true,flush:true)
            mailrecuperationmotpasse(candidat,"mailchangementmotpasse",params.nouveaumotpasse)
            flash.message="Votre mot de passe a été modifié."
            redirect(controller :"home", action : "changementmotdepasse")
        }
        
    }
    
    def mailrecuperationmotpasse(Candidat candidat,String mailtemplate,String pwd){
        def templatemail=MailTemplate.findByCode(mailtemplate)
        def template=templatemail.template
        template= template.replace("#email",candidat.email);
        template= template.replace("#civilite",candidat.civilite.libelle);
        template= template.replace("#nomcandidat",candidat.nomStockage);
        template= template.replace("#prenomcandidat",candidat.prenomStockage);
        template= template.replace("#motpassecandidat",pwd);
        try {
        sendMail {            
            to candidat.email
            from "info@diorh-recrutement.com"
            replyTo "satisfactionclient@diorh.com" 
            subject templatemail.description
            html template
        }
        } catch(Exception ex) {
            println ex
        }
    }
    
    
    
}
