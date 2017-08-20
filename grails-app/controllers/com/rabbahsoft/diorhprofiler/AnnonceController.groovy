package com.rabbahsoft.diorhprofiler
import java.text.SimpleDateFormat
/**
 * AnnonceController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class AnnonceController {

    //	static scaffold = true
	
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
       
        redirect(action: "list", params: params)
    }
    def list(Integer max)
 {
        Date dateactuel
        params.max = Math.min(max ?: 10, 100)
        if(params.offset==null)
        {
            params.offset=0
        }
        if(params.max==null)
        {
            params.max=10
        }
        
        def criteria = 'Archivée'
        def statutmission = StatutMission.findByLibelle(criteria)
        def criteria1 = 'Clôturée'
        def statutmission1 = StatutMission.findByLibelle(criteria1)
        def c = Mission.createCriteria()        
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date()); // sets calendar time/date
        def now = cal.getTime();
        def maint = new Date()
        def actions1 = c.list(max: params.max, offset: params.offset){
            ge("dateFinAnnonce", maint)
            statut 
            { or
                {
               eq("libelle",'En cours') 
               eq("libelle",'"Reprendre') 
                }
            }
            eq("publierAnnonce",true)
          
            def goffset
            if(params.offset instanceof String)
            {
                goffset=Integer.parseInt(params.offset)
            }
            else
            {
                goffset=params.offset
            }
            firstResult(goffset) 
            maxResults(params.max)
            if(params.order) {
                order(params.sort, params.order)
            }
        }
        def criterCount = Mission.createCriteria()
        def count = criterCount.count {
//            ne("statut.id",statutmission.id)
//            ne("statut.id",statutmission1.id)
           ge("dateFinAnnonce", maint)
            statut 
            { or
                {
               eq("libelle",'En cours') 
               eq("libelle",'"Reprendre') 
                }
            }
            eq("publierAnnonce",true)
        }
        if(actions1.size()==0)
        {
            [missionInstanceList:null,missionInstanceCount: 0]
        }
        else
        {
            [missionInstanceList:actions1,missionInstanceCount: count]
        } 
}
    def list1(Integer max) {
        println("laba")
        Date dateactuel
        params.max = Math.min(max ?: 10, 100)
        if(params.offset==null)
        {
            params.offset=0
        }
        if(params.max==null)
        {
            params.max=10
        }
        def criteria = 'Archivée'
        def statutmission = StatutMission.findByLibelle(criteria)
        def criteria1 = 'Clôturée'
        def statutmission1 = StatutMission.findByLibelle(criteria1)
        
//        def resultatdate= Mission.createCriteria()        
//        def actions12 = resultatdate.list(max: params.max, offset: params.offset){
//            le("dateFinAnnonce","07/10/2014")
//          
//        }
        
        def c = Mission.createCriteria()        
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date()); // sets calendar time/date
        def now = cal.getTime();
        def actions1 = c.list(max: params.max, offset: params.offset){
            ne("statut.id",statutmission.id)
            ne("statut.id",statutmission1.id)
            def goffset
            if(params.offset instanceof String)
            {
                goffset=Integer.parseInt(params.offset)
            }
            else
            {
                goffset=params.offset
            }
            firstResult(goffset) 
            maxResults(params.max)
            if(params.order) {
                order(params.sort, params.order)
            }
        }
        
        def criterCount = Mission.createCriteria()
        def count = criterCount.count {
            ne("statut.id",statutmission.id)
            ne("statut.id",statutmission1.id)
        }
        if(actions1.size()==0)
        {
            [missionInstanceList:null,missionInstanceCount: 0]
        }
        else
        {
            [missionInstanceList:actions1,missionInstanceCount: count]
        } 
    }
    def show(Mission missionInstance) {
        respond missionInstance
    }
    def archiver(Mission missionInstance) {
        
        respond missionInstance
    }
    
    def postulerannonce(Mission missionInstance) {
        if(params.retour!=null)
        {
            redirect(action:"list")
        }
        else if(params.Archiver!=null)
        {
            def criteria = 'Archivée'
            def statutmission = StatutMission.getId(684)
            missionInstance.statut=statutmission
            missionInstance.archiver=true
            missionInstance.save(failOnError:true,flush:true)
            flash.message="L'annonce a été archivé"
            redirect(action:"list")
        }
        else if(params.Postuler!=null)
        {
            def candidatcourant=session.user
            session.mission=missionInstance   
            if(checkpostuler(session.mission,candidatcourant))
            {
                println("1111")
                redirect(controller:"candidature",action:"create")
            }
            else
            {
                flash.message = message(code: 'default.dejapostuler.message',default: "Vous avez déjà Postulé à cette annonce")
                redirect(controller:"annonce",action:"show",id:missionInstance.id)
            }
          
        }
        
    }
    
    def static checkpostuler(Mission missionInstance,Candidat candidatInstance){
        def candidature = Candidature.createCriteria()
        def resultat = candidature.list{
            candidat
            {
                eq("id",candidatInstance.id)
            }
            mission
            {
                eq("id",missionInstance.id) 
            }
        }
        if(resultat.size()==0)
        return true
        else
        return false
    }
}
