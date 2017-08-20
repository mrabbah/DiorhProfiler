package com.rabbahsoft.diorhprofiler


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * ProfilController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class ProfilController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        redirect(action: "list")
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def criteria = Profil.createCriteria()
        def result = criteria.list(max: params.max, offset: params.offset) {
            ne("libelle","candidat")
        }
        if(result.size()==0){
            render(view:"list", model:[profilInstanceList:null,profilInstanceCount:0]) 
        }
        else {
            render(view:"list", model:[profilInstanceList:result,profilInstanceCount:Profil.list().size()])
        }
    }

    def show(Profil profilInstance) {
        respond profilInstance
    }

    def create() {
        respond new Profil(params)
    }

    @Transactional
    def save(Profil profilInstance) {
        if (profilInstance == null) {
            notFound()
            return
        }

        if (profilInstance.hasErrors()) {
            respond profilInstance.errors, view:'create'
            return
        }
        
        //st<String> list = new ArrayList<String>((arams.enabled.values())
        println params.enabled
        if(params.enabled==null)
        {
            flash.message = message(code: 'default.droitprofil.message',default: "Veuillez séléctionner au minimum un seul droit à ce profil")
            render(view:"create",model:[profilInstance:profilInstance])
            return
        }
        else
        {
            if(params.enabled instanceof String)
            {
                profilInstance.addToDroits(Droit.findByCode(params.enabled)) 
            }
            else
            {
                ArrayList droitsId=params.enabled 
                for(int i=0;i<droitsId.size();i++)
                {
                    if(Droit.findByCode(droitsId.get(i))!=null){
                        profilInstance.addToDroits(Droit.findByCode(droitsId.get(i)))
                    }
                }
            }
            profilInstance.save flush:true
            flash.message = message(code: 'default.createdmessage.message',default: "L'objet a été crée")
            redirect(action: "edit", id :profilInstance.id)
        }
    }

    def edit() {
        def profilInstance=Profil.get(params.id)
        def droits=[:]
        for(droit in profilInstance.droits){
            droits[droit.code]=droit.code
        }
        respond profilInstance,model:[droits:droits]
    }

    @Transactional
    def update(Profil profilInstance) {
        def profilInstance1=Profil.get(params.id)
        if(params.enabled==null)
        {
            flash.message = message(code: 'default.droitprofil.message',default: "Vous devrez ou moins affecter des doits a ce profil")
            render(view:"edit")
            return
        }
        else
        {
            profilInstance1.droits.clear()
            profilInstance1=profilInstance1.save(flush:true)
            if(params.enabled instanceof String)
            {
                profilInstance1.addToDroits(Droit.findByCode(params.enabled)) 
            }
            else
            {
                ArrayList droitsId=params.enabled 
                for(int i=0;i<droitsId.size();i++)
                {
                    profilInstance1.addToDroits(Droit.findByCode(droitsId.get(i)))
            
                }
            }
            profilInstance1.save(flush:true)
            flash.message = message(code: 'default.createdmessage.message',default: "L'objet a été crée")
            redirect(action: "edit", id :profilInstance1.id)
        }
    }

    @Transactional
    def delete(Profil profilInstance) {

        if (profilInstance == null) {
            notFound()
            return
        }

        profilInstance.delete flush:true

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
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'profilInstance.label', default: 'Profil'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
