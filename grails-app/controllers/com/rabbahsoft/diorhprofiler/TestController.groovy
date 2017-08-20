package com.rabbahsoft.diorhprofiler


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * TestController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class TestController {
def LinkedList<Test> li
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Test.list(params), model:[testInstanceCount: Test.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Test.list(params), model:[testInstanceCount: Test.count()]
    }

    def show(Test testInstance) {
        respond testInstance
    }

    def create() {
        respond new Test(params)
    }

    @Transactional
    def save(Test testInstance) {
           if(li==null)
        {
            System.out.println("bvvvv   nullll   ")
            li = new LinkedList<Test>();
        }
        else
        {
        li=session["tests"]
        }
        if (testInstance == null) {
            notFound()
            return
        }

        if (testInstance.hasErrors()) {
            respond testInstance.errors, view:'create'
            return
        }

        testInstance.save flush:true
li.add(testInstance)
        
        session["tests"]=li
//        render(view: "display", model: testInstance)

//       redirect(controller: "Candidat", action: "create", model: [myparam: "myvalue"])
        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'testInstance.label', default: 'Test'), testInstance.id])
//                redirect testInstance
redirect(controller: "Candidat", action: "create")
            }
            '*' { respond testInstance, [status: CREATED] }
        }

    }

    def edit(Test testInstance) {
        respond testInstance
    }

    @Transactional
    def update(Test testInstance) {
        if (testInstance == null) {
            notFound()
            return
        }

        if (testInstance.hasErrors()) {
            respond testInstance.errors, view:'edit'
            return
        }

        testInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Test.label', default: 'Test'), testInstance.id])
                redirect testInstance
            }
            '*'{ respond testInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Test testInstance) {

        if (testInstance == null) {
            notFound()
            return
        }

        testInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Test.label', default: 'Test'), testInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'testInstance.label', default: 'Test'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
