package com.rabbahsoft.diorhprofiler


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * InterlocuteurContactController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class InterlocuteurContactController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond InterlocuteurContact.list(params), model:[interlocuteurContactInstanceCount: InterlocuteurContact.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond InterlocuteurContact.list(params), model:[interlocuteurContactInstanceCount: InterlocuteurContact.count()]
    }

    def show(InterlocuteurContact interlocuteurContactInstance) {
        respond interlocuteurContactInstance
    }

    def create() {
        respond new InterlocuteurContact(params)
    }

    @Transactional
    def save(InterlocuteurContact interlocuteurContactInstance) {
        if (interlocuteurContactInstance == null) {
            notFound()
            return
        }

        if (interlocuteurContactInstance.hasErrors()) {
            respond interlocuteurContactInstance.errors, view:'create'
            return
        }

        interlocuteurContactInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'interlocuteurContactInstance.label', default: 'InterlocuteurContact'), interlocuteurContactInstance.id])
                redirect interlocuteurContactInstance
            }
            '*' { respond interlocuteurContactInstance, [status: CREATED] }
        }
    }

    def edit(InterlocuteurContact interlocuteurContactInstance) {
        respond interlocuteurContactInstance
    }

    @Transactional
    def update(InterlocuteurContact interlocuteurContactInstance) {
        if (interlocuteurContactInstance == null) {
            notFound()
            return
        }

        if (interlocuteurContactInstance.hasErrors()) {
            respond interlocuteurContactInstance.errors, view:'edit'
            return
        }

        interlocuteurContactInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'InterlocuteurContact.label', default: 'InterlocuteurContact'), interlocuteurContactInstance.id])
                redirect interlocuteurContactInstance
            }
            '*'{ respond interlocuteurContactInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(InterlocuteurContact interlocuteurContactInstance) {

        if (interlocuteurContactInstance == null) {
            notFound()
            return
        }

        interlocuteurContactInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'InterlocuteurContact.label', default: 'InterlocuteurContact'), interlocuteurContactInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'interlocuteurContactInstance.label', default: 'InterlocuteurContact'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
