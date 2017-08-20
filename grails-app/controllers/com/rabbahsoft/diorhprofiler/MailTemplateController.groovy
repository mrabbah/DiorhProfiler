package com.rabbahsoft.diorhprofiler


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * MailTemplateController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class MailTemplateController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        redirect(action: "list", params: params)
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MailTemplate.list(params), model:[mailTemplateInstanceCount: MailTemplate.count()]
    }

    def show(MailTemplate mailTemplateInstance) {
        respond mailTemplateInstance
    }

    def create() {
        respond new MailTemplate(params)
    }

    @Transactional
    def save(MailTemplate mailTemplateInstance) {
        if (mailTemplateInstance == null) {
            notFound()
            return
        }

        if (mailTemplateInstance.hasErrors()) {
            respond mailTemplateInstance.errors, view:'create'
            return
        }

        mailTemplateInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.createdmessage.message',default: "L'objet a été crée")
                redirect mailTemplateInstance
            }
            '*' { respond mailTemplateInstance, [status: CREATED] }
        }
    }

    def edit(MailTemplate mailTemplateInstance) {
        respond mailTemplateInstance
    }

    @Transactional
    def update(MailTemplate mailTemplateInstance) {
        if (mailTemplateInstance == null) {
            notFound()
            return
        }

        if (mailTemplateInstance.hasErrors()) {
            respond mailTemplateInstance.errors, view:'edit'
            return
        }

        mailTemplateInstance.save flush:true

        request.withFormat {
            form {
            flash.message = message(code: 'default.updatedmessage.message',default: "L'objet a été modifié")
//                flash.message = "L'objet a été modifié"
//                 flash.message = "modification d'objet avec succées"
                redirect mailTemplateInstance
            }
            '*'{ respond mailTemplateInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(MailTemplate mailTemplateInstance) {

        if (mailTemplateInstance == null) {
            notFound()
            return
        }

        mailTemplateInstance.delete flush:true

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
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'mailTemplateInstance.label', default: 'MailTemplate'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
