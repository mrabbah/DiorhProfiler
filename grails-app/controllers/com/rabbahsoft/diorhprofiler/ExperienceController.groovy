package com.rabbahsoft.diorhprofiler


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * ExperienceController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class ExperienceController {
def LinkedList<Experience> li
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Experience.list(params), model:[experienceInstanceCount: Experience.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Experience.list(params), model:[experienceInstanceCount: Experience.count()]
    }

    def show(Experience experienceInstance) {
        respond experienceInstance
    }

    def create() {
        respond new Experience(params)
    }

    @Transactional
    def save(Experience experienceInstance) {
          if(li==null)
        {
            System.out.println("bvvvv   nullll   ")
            li = new LinkedList<Experience>();
        }
        else
        {
        li=session["experiences"]
        }
        
        if (experienceInstance == null) {
            notFound()
            return
        }

        if (experienceInstance.hasErrors()) {
            respond experienceInstance.errors, view:'create'
            return
        }

        experienceInstance.save flush:true
        li.add(experienceInstance)
        
        session["experiences"]=li
System.out.println("bbbb  la session  "+session["experiences"])
        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'experienceInstance.label', default: 'Experience'), experienceInstance.id])
                redirect experienceInstance
            }
            '*' { respond experienceInstance, [status: CREATED] }
        }
    }

    def edit(Experience experienceInstance) {
        respond experienceInstance
    }

    @Transactional
    def update(Experience experienceInstance) {
        if (experienceInstance == null) {
            notFound()
            return
        }

        if (experienceInstance.hasErrors()) {
            respond experienceInstance.errors, view:'edit'
            return
        }

        experienceInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Experience.label', default: 'Experience'), experienceInstance.id])
                redirect experienceInstance
            }
            '*'{ respond experienceInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Experience experienceInstance) {

        if (experienceInstance == null) {
            notFound()
            return
        }

        experienceInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Experience.label', default: 'Experience'), experienceInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'experienceInstance.label', default: 'Experience'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
