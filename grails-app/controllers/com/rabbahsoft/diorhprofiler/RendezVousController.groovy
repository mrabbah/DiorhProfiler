package com.rabbahsoft.diorhprofiler


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * RendezVousController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class RendezVousController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        redirect(action: "list", params: params)
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond RendezVous.list(params), model:[rendezVousInstanceCount: RendezVous.count()]
    }

    def show(RendezVous rendezVousInstance) {
        respond rendezVousInstance
    }

    def create() {
        respond new RendezVous(params)
    }

    @Transactional
    def save(RendezVous rendezVousInstance) {        
        Date ddp = new Date(params.dateRdv);
        bindData(rendezVousInstance, [dateRdv : ddp])
        rendezVousInstance.save(failOnError:true,flush:true)
        flash.message = "L'objet a été crée"
        redirect(action: "show", id:rendezVousInstance.id)
    }

    def edit(RendezVous rendezVousInstance) {
        respond rendezVousInstance
    }

    @Transactional
    def update(RendezVous rendezVousInstance) {
        Date ddp = new Date(params.dateRdv);
        bindData(rendezVousInstance, [dateRdv : ddp])
        rendezVousInstance.save(failOnError:true,flush:true)
        flash.message = "L'objet a été modifié"
        redirect(action: "show", id:rendezVousInstance.id)
    }

    @Transactional
    def delete(RendezVous rendezVousInstance) {

        if (rendezVousInstance == null) {
            notFound()
            return
        }

        rendezVousInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'RendezVous.label', default: 'RendezVous'), rendezVousInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'rendezVousInstance.label', default: 'RendezVous'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
