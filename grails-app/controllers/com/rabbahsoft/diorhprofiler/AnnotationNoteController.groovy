package com.rabbahsoft.diorhprofiler

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional 
/**
 * AnnotationNoteController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class AnnotationNoteController {

	static scaffold = true
//	def index = { }

    @Transactional
    def save(AnnotationNote aInstance) {  
        println params
        println System.getProperty("file.encoding")
        
        aInstance.save(failOnError:true,flush:true)
        flash.message = "L'objet a été crée"
        redirect(action: "show", id:aInstance.id)
    }
}
