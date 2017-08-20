package diorhprofiler


import com.rabbahsoft.diorhprofiler.Candidat

class CalculNbAnneeExperienceCandidatJob {
    static triggers = {
      simple startDelay: 60000, repeatInterval: 86400000  //chaque 1 heure après la première minute
    }

    def execute() {
        //TODO
        //println "CalculNbAnneeExperienceCandidatJob" + new Date()
    }
}
