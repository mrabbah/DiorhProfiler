package com.rabbahsoft.diorhprofiler


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * PlanificationController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class PlanificationController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Planification.list(params), model:[planificationInstanceCount: Planification.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Planification.list(params), model:[planificationInstanceCount: Planification.count()]
    }

    def show(Planification planificationInstance) {
        respond planificationInstance
    }

    def create() {
        respond new Planification(params)
    }

    @Transactional
    def save(Planification planificationInstance) {
        if (planificationInstance == null) {
            notFound()
            return
        }

        if (planificationInstance.hasErrors()) {
            respond planificationInstance.errors, view:'create'
            return
        }

        planificationInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'planificationInstance.label', default: 'Planification'), planificationInstance.id])
                redirect planificationInstance
            }
            '*' { respond planificationInstance, [status: CREATED] }
        }
    }

    def edit(Planification planificationInstance) {
        respond planificationInstance
    }

    @Transactional
    def update(Planification planificationInstance) {
        if (planificationInstance == null) {
            notFound()
            return
        }

        if (planificationInstance.hasErrors()) {
            respond planificationInstance.errors, view:'edit'
            return
        }

        planificationInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Planification.label', default: 'Planification'), planificationInstance.id])
                redirect planificationInstance
            }
            '*'{ respond planificationInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Planification planificationInstance) {

        if (planificationInstance == null) {
            notFound()
            return
        }

        planificationInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Planification.label', default: 'Planification'), planificationInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'planificationInstance.label', default: 'Planification'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
