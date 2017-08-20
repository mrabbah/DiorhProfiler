package diorhprofiler

import com.rabbahsoft.diorhprofiler.Utilisateur
import com.rabbahsoft.diorhprofiler.Mission

class RappelActionAnnonceJob {
    
    def mailService
    
    static triggers = {
        simple startDelay: 120000, repeatInterval: 10800000  //chaque 3 heures après la deuxième minute
    }

    def execute() {
         def c1 = Mission.createCriteria()        
        Calendar cal1 = Calendar.getInstance();
        cal1.setTime(new Date()); // sets calendar time/date
        def now1 = cal1.getTime();
        cal1.add(Calendar.HOUR_OF_DAY, 48); // adds one hour
        def nowplusthree = cal1.getTime();
        def actions = c1.list{
            //le("dateFinAnnonce",nowplusthree)
            between("dateFinAnnonce",now1,nowplusthree)
        }    
        Set setItems = new LinkedHashSet(actions); 
    actions.clear(); 
    actions.addAll(setItems); 
        for(action in actions) {
            def listemail=[]
            if(action.chargeRecherche.email!=null)
            {
            listemail.add(action.chargeRecherche.email)
            }
            if(action.chargeRecherche.email!=null)
            {
            listemail.add(action.consultant.email)
            }
            if(action.chargeRecherche.email!=null)
            {
            listemail.add(action.assistant.email)
            }
            println ("la list   rappel action "+listemail)
            def templatemail=MailTemplate.findByCode("finannonce")
            def template=templatemail.template
            template= template.replace("#reference",candidat);
            try {   
                mailService.sendMail {
                    to listemail.toArray()
                    from "info@diorh-recrutement.com"
                    replyTo "satisfactionclient@diorh.com" 
                    subject "Rappel sur la date fin annonce"
                    body bd
                }
            } catch(Exception ex) {
                println ex
            }   
        }
    }
}
