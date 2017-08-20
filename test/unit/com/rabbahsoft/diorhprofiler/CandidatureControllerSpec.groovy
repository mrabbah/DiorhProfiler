package com.rabbahsoft.diorhprofiler



import grails.test.mixin.*
import spock.lang.*

@TestFor(CandidatureController)
@Mock(Candidature)
class CandidatureControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.candidatureInstanceList
            model.candidatureInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.candidatureInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def candidature = new Candidature()
            candidature.validate()
            controller.save(candidature)

        then:"The create view is rendered again with the correct model"
            model.candidatureInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            candidature = new Candidature(params)

            controller.save(candidature)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/candidature/show/1'
            controller.flash.message != null
            Candidature.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def candidature = new Candidature(params)
            controller.show(candidature)

        then:"A model is populated containing the domain instance"
            model.candidatureInstance == candidature
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def candidature = new Candidature(params)
            controller.edit(candidature)

        then:"A model is populated containing the domain instance"
            model.candidatureInstance == candidature
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/candidature/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def candidature = new Candidature()
            candidature.validate()
            controller.update(candidature)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.candidatureInstance == candidature

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            candidature = new Candidature(params).save(flush: true)
            controller.update(candidature)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/candidature/show/$candidature.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/candidature/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def candidature = new Candidature(params).save(flush: true)

        then:"It exists"
            Candidature.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(candidature)

        then:"The instance is deleted"
            Candidature.count() == 0
            response.redirectedUrl == '/candidature/index'
            flash.message != null
    }
}
