package com.rabbahsoft.diorhprofiler



import grails.test.mixin.*
import spock.lang.*

@TestFor(ActionContactController)
@Mock(ActionContact)
class ActionContactControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.actionContactInstanceList
            model.actionContactInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.actionContactInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def actionContact = new ActionContact()
            actionContact.validate()
            controller.save(actionContact)

        then:"The create view is rendered again with the correct model"
            model.actionContactInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            actionContact = new ActionContact(params)

            controller.save(actionContact)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/actionContact/show/1'
            controller.flash.message != null
            ActionContact.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def actionContact = new ActionContact(params)
            controller.show(actionContact)

        then:"A model is populated containing the domain instance"
            model.actionContactInstance == actionContact
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def actionContact = new ActionContact(params)
            controller.edit(actionContact)

        then:"A model is populated containing the domain instance"
            model.actionContactInstance == actionContact
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/actionContact/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def actionContact = new ActionContact()
            actionContact.validate()
            controller.update(actionContact)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.actionContactInstance == actionContact

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            actionContact = new ActionContact(params).save(flush: true)
            controller.update(actionContact)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/actionContact/show/$actionContact.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/actionContact/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def actionContact = new ActionContact(params).save(flush: true)

        then:"It exists"
            ActionContact.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(actionContact)

        then:"The instance is deleted"
            ActionContact.count() == 0
            response.redirectedUrl == '/actionContact/index'
            flash.message != null
    }
}
