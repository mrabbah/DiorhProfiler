package com.rabbahsoft.diorhprofiler


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import java.util.List
/**
 * FormationCandidatController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class FormationCandidatController {
def LinkedList<FormationCandidat> li
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond FormationCandidat.list(params), model:[formationCandidatInstanceCount: FormationCandidat.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond FormationCandidat.list(params), model:[formationCandidatInstanceCount: FormationCandidat.count()]
    }

    def show(FormationCandidat formationCandidatInstance) {
        respond formationCandidatInstance
    }

    def create() {
        System.out.println("les parametre  "+params)
        respond new FormationCandidat(params)
    }

    @Transactional
    def save(FormationCandidat formationCandidatInstance) {
        
        System.out.println("ggggg   session"+session["formations"])
//        li=session["formations"]
        if(li==null)
        {
            System.out.println("bvvvv   nullll   ")
            li = new LinkedList<FormationCandidat>();
        }
        else
        {
        li=session["formations"]
        }
        if (formationCandidatInstance == null) {
            notFound()
            return
        }

        if (formationCandidatInstance.hasErrors()) {
            respond formationCandidatInstance.errors, view:'create'
            return
        }

        formationCandidatInstance.save flush:true   
        li.add(formationCandidatInstance)
        
        session["formations"]=li
System.out.println("bbbb "+session["formations"]+"    "+li.size())
        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'formationCandidatInstance.label', default: 'FormationCandidat'), formationCandidatInstance.id])
                redirect formationCandidatInstance
            }
            '*' { respond formationCandidatInstance, [status: CREATED] }
        }
    }
@Transactional
    def save1(FormationCandidat formationCandidatInstance) {
        
        System.out.println("ggggg   session save 1111111111"+session["formations"])
//        li=session["formations"]
        if(li==null)
        {
            System.out.println("bvvvv   nullll   ")
            li = new LinkedList<FormationCandidat>();
        }
        else
        {
        li=session["formations"]
        }
        if (formationCandidatInstance == null) {
            notFound()
            return
        }

        if (formationCandidatInstance.hasErrors()) {
            respond formationCandidatInstance.errors, view:'create'
            return
        }

        formationCandidatInstance.save flush:true  
        System.out.println("objet   "+formationCandidatInstance)
        li.add(formationCandidatInstance)
        
        session["formations"]=li
        redirect formationCandidatInstance
//System.out.println("bbbb "+session["formations"]+"    "+li.size())
//        request.withFormat {
//            form {
//                flash.message = message(code: 'default.created.message', args: [message(code: 'formationCandidatInstance.label', default: 'FormationCandidat'), formationCandidatInstance.id])
//                redirect formationCandidatInstance
//            }
//            '*' { respond formationCandidatInstance, [status: CREATED] }
//        }
    }

    def edit(FormationCandidat formationCandidatInstance) {
        respond formationCandidatInstance
    }

    @Transactional
    def update(FormationCandidat formationCandidatInstance) {
        if (formationCandidatInstance == null) {
            notFound()
            return
        }

        if (formationCandidatInstance.hasErrors()) {
            respond formationCandidatInstance.errors, view:'edit'
            return
        }

        formationCandidatInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'FormationCandidat.label', default: 'FormationCandidat'), formationCandidatInstance.id])
                redirect formationCandidatInstance
            }
            '*'{ respond formationCandidatInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(FormationCandidat formationCandidatInstance) {

        if (formationCandidatInstance == null) {
            notFound()
            return
        }

        formationCandidatInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'FormationCandidat.label', default: 'FormationCandidat'), formationCandidatInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'formationCandidatInstance.label', default: 'FormationCandidat'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
