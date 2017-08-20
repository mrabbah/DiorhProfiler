package diorhprofiler

import com.rabbahsoft.diorhprofiler.Utilisateur
import com.rabbahsoft.diorhprofiler.Mission
import com.rabbahsoft.diorhprofiler.Planification
import java.util.*; 
import java.text.*; 
import java.sql.Timestamp; 

class RappelMissionFinEtapeJob 
{
    
    def mailService
    
    static triggers = {
        simple startDelay: 120000, repeatInterval: 10800000  //chaque 3 heures après la deuxième minute
    }

    def execute() 
    {
        def adresseweb="allaliyoussefemsi@gmail.com"
        for(id in Planification.list())
        {
            println("valeur   "+id.dateFin+"   class"+(id.dateFin).getClass())
        }
        
        def c1 = Mission.createCriteria()        
        Calendar cal1 = Calendar.getInstance();
        cal1.setTime(new Date()); // sets calendar time/date
        def now1 = cal1.getTime();
        cal1.add(Calendar.HOUR_OF_DAY, 24); // adds one hour
        def nowplusthree = cal1.getTime(); 
        println("la date generer    "+nowplusthree)
        //        SimpleDateFormat dateformatyyyyMMdd = new SimpleDateFormat("yyyy-MM-dd hh:HH:mm:ss");
        //String date_to_string = dateformatyyyyMMdd.format(nowplusthree);
        //System.out.println("date into yyyyMMdd format: " + date_to_string);
        //
        //SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:HH:mm:ss");
        //Date date45 = formatter.parse(date_to_string);
        //		System.out.println(date45);
        //		System.out.println(formatter.format(date45));
        // SimpleDateFormat dateformatyyyyMMdd1 = new SimpleDateFormat("yyyy-MM-dd hh:HH:mm:ss");
        //String date_to_string1 = dateformatyyyyMMdd.format(now1);
        //System.out.println("date into yyyyMMdd format: " + date_to_string1);
        //println("hhhh  "+now1+"   "+nowplusthree)


//    def userList = c1.list().unique{ it.id }
//    println("resultat unique  1111 "+userList)

    def actions = c1.list()
    {
        planifications
        {
          between("dateFin",now1,nowplusthree)    
        }    
        //eq(date("dateFin"),nowplusthree)
    }    
    Set setItems = new LinkedHashSet(actions); 
    actions.clear(); 
    actions.addAll(setItems); 
   
        
        
    for(action in actions) {
        def listemail=[]
            if(action.chargeRecherche!=null)
            {
            listemail.add(action.chargeRecherche.email)
            }
            if(action.consultant!=null)
            {
            listemail.add(action.consultant.email)
            }
            if(action.assistant!=null)
            {
            listemail.add(action.assistant.email)
            }
            
          println("la list    "+listemail.toArray())  
            
            
            
            
        
             println("chargeRecherche   ")
           def bd = "Bonjour ${action.chargeRecherche} , \n DIORH Profiler vous informe qu'il reste moins de 24 heures pour la date fin etape."
        try {   

            mailService.sendMail {
                to listemail.toArray()
                from "info@diorh-recrutement.com"
                replyTo "satisfactionclient@diorh.com" 
                subject "Rappel sur la date fin etape"
                body bd
            }
        } catch(Exception ex) {
            println ex
        }  
        
       
        println("y de resultat ")
       
    }
            
}
}
