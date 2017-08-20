package com.rabbahsoft.diorhprofiler

import cr.co.arquetipos.crypto.Blowfish

/**
 * HomeController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class HomeController {

    def index(Integer max) {
        //        params.max = Math.min(max ?: 10, 100)
        //        respond Mission.list(params), model:[missionInstanceCount: Mission.count()]
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
    
    def motdepasseoublie(){
        
    }
    
    def changementmotdepasse(){
        
    }
}
