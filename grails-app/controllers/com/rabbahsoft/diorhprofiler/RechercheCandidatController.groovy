package com.rabbahsoft.diorhprofiler


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * RechercheCandidatController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class RechercheCandidatController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        redirect(action: "list", params: params)
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond RechercheCandidat.list(params), model:[rechercheCandidatInstanceCount: RechercheCandidat.count()]
    }

    def show(RechercheCandidat rechercheCandidatInstance) {
        respond rechercheCandidatInstance
    }

    def create() {
        respond new RechercheCandidat(params)
    }

    @Transactional
    def save(RechercheCandidat rechercheCandidatInstance) {
        if (rechercheCandidatInstance == null) {
            notFound()
            return
        }

        if (rechercheCandidatInstance.hasErrors()) {
            respond rechercheCandidatInstance.errors, view:'create'
            return
        }

        rechercheCandidatInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.createdmessage.message',default: "L'objet a été crée")
                redirect rechercheCandidatInstance
            }
            '*' { respond rechercheCandidatInstance, [status: CREATED] }
        }
    }

    def edit(RechercheCandidat rechercheCandidatInstance) {
        respond rechercheCandidatInstance
    }

    @Transactional
    def update(RechercheCandidat rechercheCandidatInstance) {
        if (rechercheCandidatInstance == null) {
            notFound()
            return
        }

        if (rechercheCandidatInstance.hasErrors()) {
            respond rechercheCandidatInstance.errors, view:'edit'
            return
        }

        rechercheCandidatInstance.save flush:true

        request.withFormat {
            form {
            flash.message = message(code: 'default.updatedmessage.message',default: "L'objet a été modifié")
//                flash.message = "L'objet a été modifié"
//                 flash.message = "modification d'objet avec succées"
                redirect rechercheCandidatInstance
            }
            '*'{ respond rechercheCandidatInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(RechercheCandidat rechercheCandidatInstance) {

        if (rechercheCandidatInstance == null) {
            notFound()
            return
        }

        rechercheCandidatInstance.delete flush:true

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
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'rechercheCandidatInstance.label', default: 'RechercheCandidat'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
