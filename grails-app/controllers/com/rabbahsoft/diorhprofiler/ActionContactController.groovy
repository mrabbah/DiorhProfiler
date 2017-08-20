package com.rabbahsoft.diorhprofiler


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import java.text.SimpleDateFormat

/**
 * ActionContactController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class ActionContactController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ActionContact.list(params), model:[actionContactInstanceCount: ActionContact.count()]
    }

    def show(ActionContact actionContactInstance) {
        respond actionContactInstance
    }

    def create() {
        if(params.id!=null){
        def contact=Contact.get(params.id)
        respond new ActionContact(params),model:[contactinstance:contact]   
        }
        else{
        respond new ActionContact(params)  
        }
        
    }

    @Transactional
    def save(ActionContact actionContactInstance) {
        
        bindData(actionContactInstance, [dateAction : new Date(params.dateAction)])
        actionContactInstance.save(failOnError:true,flush:true)
        flash.message = "L'objet a été modifié"
        redirect(action: "show", id:actionContactInstance.id)
    }

    def edit(ActionContact actionContactInstance) {
        respond actionContactInstance
    }

    @Transactional
    def update(ActionContact actionContactInstance) {
        bindData(actionContactInstance, [dateAction : new Date(params.dateAction)])
        actionContactInstance.save(failOnError:true,flush:true)
        flash.message = "L'objet a été modifié"
        redirect(action: "show", id:actionContactInstance.id)
    }

    @Transactional
    def delete(ActionContact actionContactInstance) {

        if (actionContactInstance == null) {
            notFound()
            return
        }

        actionContactInstance.delete flush:true

        request.withFormat {
            form {
                //                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ActionContact.label', default: 'ActionContact'), actionContactInstance.id])
                flash.message = "L'objet a été supprimé"
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'actionContactInstance.label', default: 'ActionContact'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
