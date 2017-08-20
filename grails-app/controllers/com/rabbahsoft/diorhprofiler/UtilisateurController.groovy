package com.rabbahsoft.diorhprofiler


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import cr.co.arquetipos.password.PasswordTools
import cr.co.arquetipos.crypto.Blowfish

/**
 * UtilisateurController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class UtilisateurController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Utilisateur.list(params), model:[utilisateurInstanceCount: Utilisateur.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def criteria = Utilisateur.createCriteria()
        def result = criteria.list(max: params.max, offset: params.offset) {
            isNotNull("fonctionDior")
        }
        def criterCount = Utilisateur.createCriteria()
        def count = criterCount.count()
        {
            isNotNull("fonctionDior")
        }
        if(result.size()==0){
         render(view:"list", model:[utilisateurInstanceList:null,utilisateurInstanceCount:0]) 
        }
        else {
         render(view:"list", model:[utilisateurInstanceList:result,utilisateurInstanceCount:count])
        }
    }
   
    
    def show(Utilisateur utilisateurInstance) {
        respond utilisateurInstance
    }

    def create() {
        respond new Utilisateur(params)
    }

    @Transactional
    def save() {
        def enabled=true
        if(params.enabled==null){
            enabled=false
        }
        def pwd_claire = PasswordTools.generateRandomPassword(10)        
        def map=[username:params.email,password:pwd_claire,email:params.email,fonctionDior:params.fonctionDior,profil:params.profil,firstName:params.firstName,lastName:params.lastName,enabled:enabled,adresseIp:params.adresseIp]
        def utilisateur=new Utilisateur(map)
        utilisateur.save(failOnError:true,flush:true)
        //Envoyer le mail pour le mot de passe de l utilisateur
        mailinscription(utilisateur, pwd_claire)
        flash.message = message(code: 'default.createdmessage.message',default: "L'objet a été crée")
        redirect(action: "show", id:utilisateur.id)
    }

    def edit(Utilisateur utilisateurInstance) {
        respond utilisateurInstance
    }
    def changemotPasse(Utilisateur utilisateurInstance) {
        def pwdutilisateur = Blowfish.decryptBase64(utilisateurInstance.password, "#1Ab@.com")
        respond utilisateurInstance,model:[password: pwdutilisateur]
    }
    @Transactional
   def updatemotPasse(Utilisateur utilisateurInstance) {
       def pwd1=params.newpassword
       def utilisateur=Utilisateur.get(params.id)
       utilisateur.password=pwd1
       utilisateur.save(failOnError:true,flush:true)
       mailinscriptionutilisateur(utilisateur, pwd1)
       flash.message = message(code: 'default.modifiermotpasse.message',default: "le mot de passe a ete modifier pour ce utilisateur")  
       redirect(action:"show",id:params.id)
    }
    def mailinscriptionutilisateur(Utilisateur utilisateur, String pwd){
        def templatemail=MailTemplate.findByCode("mailmodificationattribututilisateur")
        def template=templatemail.template
        println("dans la fucntion  "+utilisateur+"   ggff b"+pwd)
        template= template.replace("#prenomcandidat",utilisateur.firstName);
        template= template.replace("#nomcandidat",utilisateur.lastName);
        template= template.replace("#emailcandidat",utilisateur.email);
        template= template.replace("#motpassecandidat",pwd);
        try {
        sendMail {
            to utilisateur.email
            from "info@diorh-recrutement.com"
            replyTo "satisfactionclient@diorh.com"            
            subject templatemail.description
            html template
        }
        } catch(Exception ex) {
            println ex
        }
    }
    @Transactional
    def update(Utilisateur utilisateurInstance) {
        def enabled=true
        if(params.enabled==null){
            enabled=false
        }
        bindData(utilisateurInstance, [email:params.email])
        bindData(utilisateurInstance, [enabled:enabled])
        bindData(utilisateurInstance, [adresseIp:params.adresseIp])
        println params.adresseIp.split(",")
        utilisateurInstance.save flush:true
        flash.message = message(code: 'default.updatedmessage.message',default: "L'objet a été modifié")
        redirect(action: "show", id:utilisateurInstance.id)
    }
    
    def listUserByFunction(String function){
        def utilisateur = Utilisateur.createCriteria()
        def result = utilisateur.list() {
            eq('fonctionDior',function)
        }
        return result
    }

    @Transactional
    def delete(Utilisateur utilisateurInstance) {

        if (utilisateurInstance == null) {
            notFound()
            return
        }

        utilisateurInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deletedmessage.message',default: "L'objet a été supprimé")
//                flash.message = "L'objet a été supprimé"
                 //flash.message = "suppression d'objet avec succées"
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'utilisateurInstance.label', default: 'Utilisateur'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    def mailinscription(Utilisateur utilisateur, String pwd){
        def templatemail=MailTemplate.findByCode("mailinscription")
        def template=templatemail.template
//        template= template.replace("#civilitecandidat",candidat.civilite.libelle);
        template= template.replace("#prenomcandidat",utilisateur.firstName);
        template= template.replace("#nomcandidat",utilisateur.lastName);
        template= template.replace("#emailcandidat",utilisateur.email);
        template= template.replace("#motpassecandidat",pwd);
        try {
        sendMail {
            to utilisateur.email
            from "info@diorh-recrutement.com"
            replyTo "satisfactionclient@diorh.com" 
            subject templatemail.description
            html template
        }
        } catch(Exception ex) {
            println ex
        }
        println("mail utilisateur")
    }
}
