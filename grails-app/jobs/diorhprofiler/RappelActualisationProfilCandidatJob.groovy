package diorhprofiler

import com.rabbahsoft.diorhprofiler.Candidat
import com.rabbahsoft.diorhprofiler.Utilisateur

class RappelActualisationProfilCandidatJob {
    
    def mailService
    
    static triggers = {
        simple startDelay: 60000, repeatInterval: 300000  //chaque 5 minute après la première minute
    }

    def execute() {
        Date oldTwoYears = new Date() - 730
        Utilisateur.executeUpdate("update com.rabbahsoft.diorhprofiler.Utilisateur set obsolute = true where last_updated < :dt ", [dt : oldTwoYears])
        def candidatsList = Candidat.findAllByObsolute(true)
        for(candidat in candidatsList) {
            def templatemail=MailTemplate.findByCode("actualisationProfil")
            def template=templatemail.template
            template= template.replace("#candidat",candidat);
            try {                
                mailService.sendMail {
                    to candidat.email
                    from "info@diorh-recrutement.com"
                    replyTo "satisfactionclient@diorh.com" 
                    subject "Rappel sur actualisation profil DIORH PROFILER"
                    html template
                }
            } catch(Exception ex) {
                println ex
            }
        }
    }
}
