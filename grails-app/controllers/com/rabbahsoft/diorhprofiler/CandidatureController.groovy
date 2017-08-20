package com.rabbahsoft.diorhprofiler


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * CandidatureController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class CandidatureController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        render(view:"create_recherche",model:[missionInstance:session.mission])
    
        //        params.max = Math.min(max ?: 10, 100)
        //        respond Candidature.list(params), model:[candidatureInstanceCount: Candidature.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Candidature.list(params), model:[candidatureInstanceCount: Candidature.count()]
    }

    def enregistrerpostuler(Candidature candidatureInstance)
    {
        respond candidatureInstance
    }
    def show(Candidature candidatureInstance) {
        respond candidatureInstance
    }
    def create_recherche() {
        respond new Candidature(params)
    }
    def list_candidature() {
        if(params.offset==null)
        {
            params.offset=0
        }
        if(params.max==null)
        {
            params.max=10
        }
        String startDateStringde
        String startDateStringa
        Date candde
        Date canda
        if(!(session.dateCandidaturede.equals('')) && !(session.dateCandidaturea.equals('')))
        {
            DateFormat df = new SimpleDateFormat("MM/dd/yyyy")
            Date startDatede = df.parse(params.dateCandidaturede)
            Date startDatea = df.parse(params.dateCandidaturea)
            DateFormat df2 = new SimpleDateFormat("dd/MM/yyyy")
            startDateStringde = df2.format(startDatede);
            startDateStringa = df2.format(startDatea);
            candde=df.parse(startDateStringde)
            canda=df.parse(startDateStringa)
        }
//        def c=Candidat.createCriteria()
        def connections1 = Candidature.createCriteria().list(max: params.max, offset: params.offset)
        {
            if((session.nomCandidat!=null)&&(!(session.nomCandidat.equals(""))))
            {
                candidat
                {
                    ilike("nomStockage",session.nomCandidat + "%")
                }
                
               
            }
           
            if((session.prenomCandidat!=null)&&(!(session.prenomCandidat.equals(""))))
            {
                candidat
                {
                    ilike("prenomStockage",session.prenomCandidat + "%")
                }
            }
            if((session.referenceMission!=null)&&(!(session.referenceMission.equals(""))))
            {
                mission
                {
                    eq("reference",session.referenceMission)
                }
               
            }
            if(!(session.statut.equals('null')))
            {
                long j=Long.parseLong(session.statut)
                eq("statut.id",j)
            }
            if(!(session.evaluation.equals('null')))
            {
                long j=Long.parseLong(session.evaluation)
                eq("evaluation.id",j)
            }
            if(!(session.etapeAvancement.equals('null')))
            {
                
                long j=Long.parseLong(session.etapeAvancement)
                eq("etapeAvancement.id",j)
            }
            if(!(session.dateCandidaturede.equals('')) && !(session.dateCandidaturea.equals('')))
            {
                between("dateCandidature", candde, canda)
            }
            def goffset
            if(params.offset instanceof String)
            {
                goffset=Integer.parseInt(params.offset)
            }
            else
            {
                goffset=params.offset
            }
            def gmax
            if(params.offset instanceof String)
            {
                gmax=Integer.parseInt(params.offset)
            }
            else
            {
                gmax=params.offset
            }
            firstResult(goffset) 
            maxResults(gmax)
            if(params.order) {
                order(params.sort, params.order)
            }
            
        }
        def criterCount = Candidature.createCriteria()
        def count = criterCount.count 
        {
            if((session.nomCandidat!=null)&&(!(session.nomCandidat.equals(""))))
            {
                candidat
                {
                    ilike("nomStockage",session.nomCandidat + "%")
                }
                
               
            }
           
            if((session.prenomCandidat!=null)&&(!(session.prenomCandidat.equals(""))))
            {
                candidat
                {
                    ilike("prenomStockage",session.prenomCandidat + "%")
                }
            }
            if((session.referenceMission!=null)&&(!(session.referenceMission.equals(""))))
            {
                mission
                {
                    eq("reference",session.referenceMission)
                }
               
            }
            if(!(session.statut.equals('null')))
            {
                long j=Long.parseLong(session.statut)
                eq("statut.id",j)
            }
            if(!(session.evaluation.equals('null')))
            {
                long j=Long.parseLong(session.evaluation)
                eq("evaluation.id",j)
            }
            if(!(session.etapeAvancement.equals('null')))
            {
                long j=Long.parseLong(session.etapeAvancement)
                eq("etapeAvancement.id",j)
            }
            if(!(session.dateCandidaturede.equals('')) && !(session.dateCandidaturea.equals('')))
            {
                between("dateCandidature", candde, canda)
            }
        
        }
        if((session.nomCandidat==null)||((session.nomCandidat.equals("")))&&(session.prenomCandidat==null)||((session.prenomCandidat.equals("")))&&(session.referenceMission==null)||((session.referenceMission.equals("")))&&(session.statut.equals('null'))&&(session.evaluation.equals('null'))&&(session.etapeAvancement.equals('null'))&&(session.dateCandidaturede.equals('')) && (session.dateCandidaturea.equals('')))
        {
            [candidatureInstanceList: null, candidatureInstanceCount: 0]
        }
        else
        {
            for(candidatureInstance1 in connections1)
            {
                
            }
            
            
            [candidatureInstanceList: connections1, candidatureInstanceCount: count]
        }
    }
    
    def recherche_candidat() {
        session.nomCandidat=params.nomCandidat
        session.prenomCandidat=params.prenomCandidat
        session.referenceMission=params.referenceMission
        session.statut=params.statut.id
        session.evaluation=params.evaluation.id
        session.etapeAvancement=params.etapeAvancement.id
        session.dateCandidaturede=params.dateCandidaturede
        session.dateCandidaturea=params.dateCandidaturea
        redirect(action:"list_candidature")
    }
    
    def create() {
        if(session.user.profil.libelle=="candidat"){
            println("je suis icii")
            render(view:"create",model:[externe:"externe"])
        }
        else{
            if(session.candidat!=null){
                if(params.missionid){
                    session.mission=Mission.get(params.missionid)
                    if(!checkpostuler(session.mission,session.candidat)){
                        println("bvvvvvv")
                        flash.message="Vous avez déja affecté ce candidat à cette mission"
                        redirect(action:"recherche",controller:"mission")    
                    }
                    println("222233333")
                    render(view:"create",model:[missionInstance:session.mission])    
                }
                else{
                    println("33333")
                    redirect(action:"recherhe",controller:"mission")      
                }
            }
            else{
                println("v vvvvvvv")
                flash.message="Veuillez sélectionner le candidat premièrement"
                redirect(action:"recherche",controller:"mission")   
            }    
        }
    }
    def create_candidats_mission() {
        def list_candidats=[]
        if(session.user.profil.libelle=="candidat"){
             flash.message = "Vous n'avez pas le droit d'accéder au site depuis cet endroit"
                        redirect(controller :"home", action : "index")
                        return false
        }
        else{
            if(session.candidatsSelectedList!=null){
                if(params.missionid){
                    session.mission=Mission.get(params.missionid)
                    def post=false
                    for(l in session.candidatsSelectedList)
                    {
                        def cand=Candidat.get(l)
                        session.listcandidats=list_candidats
                        if(checkpostuler(session.mission,cand)==true)
                        {
                            session.listcandidats.add(cand) 
                            post=true
                        }
                    }
                    if(session.listcandidats.size()==0)
                    {
                        flash.message="Vous avez déja affecté ces candidats à cette mission"
//                        redirect(action:"recherche_candidats_mission",controller:"mission")
                        //render(view:"recherche_candidats_mission",controller:"mission")
                        redirect(action:"recherchecandidatsmission",controller:"mission") 
                    }
                    else
                    {
                    render(view:"create_candidats_mission",model:[missionInstance:session.mission])   
                    }
                        
                }
                else{
                    flash.message="Veuillez sélectionner une mission"
                    redirect(action:"recherche_candidats_mission",controller:"mission")      
                }
            }
            else{
                flash.message="Veuillez sélectionner le candidat premièrement"
                redirect(action:"recherche_candidats_mission",controller:"mission")   
            } 
        
        }
    }


    @Transactional
    def save(Candidature candidatureInstance) {
        def sourcecand
        if(params.autre!=null)
        {
            sourcecand=params.autre
        }
        else
        {
            sourcecand=params.sourceCandidature 
        }
        if(session.user){
            candidatcourant=session.user   
        }
        else if(session.candidat){
            candidatcourant=session.candidat      
        }

        Date b=new Date()
        //        def lettreMotivation=params.lettreMotivation
        //        def evaluation=params.
        //            def etapeavancment=EtapeAvancementCandidature.get(634)
        //        def stautcan=StatutCandidature.get(627)
        //        def map1=[dateCandidature:b,sourceCandidature:sourcecand,etapeAvancement:etapeavancment,evaluation:evaluation,mission:session.mission,statut:stautcan,candidat:candidatcourant,lettreMotivation:lettreMotivation]
        //        candidatureInstance.properties=map1
        //        
        //        
        //        candidatureInstance.save flush:true
        //        flash.message = message(code: 'default.createdmessage.message',default: "L'objet a été crée")
        //        redirect(action: "show", id:candidatureInstance.id)
    }

    def edit(Candidature candidatureInstance) {
        respond candidatureInstance
    }

    @Transactional
    def update(Candidature candidatureInstance) {
        def sourcecanddidature
        def candidat
        if(params.autre!=null && params.sourceCandidature=="autre")
        {
            sourcecanddidature=params.autre
        }
        else
        {
            sourcecanddidature=params.sourceCandidature 
        }
        candidatureInstance.lettreMotivation=params.lettreMotivation
        candidatureInstance.sourceCandidature=sourcecanddidature
        candidatureInstance.evaluationCommentaire=params.evaluationCommentaire
        if(params.statut!="null")
        { 
           
         candidatureInstance.statut=StatutCandidature.get(params.statut.id)
         }
        else{
            candidatureInstance.statut=null 
        }
        if(params.evaluation.id!="null"){
            candidatureInstance.evaluation=EvaluationCandidature.get(params.evaluation.id)}
        else{
            candidatureInstance.evaluation=null 
        }
        candidatureInstance.evenementCandidatures.clear()
        for(int i=0;i<params.int('addEvenementCandidature');i++)
        {
            if(params.get("evenementCandidatures["+i+"]")!=null)
            {
                if(params.get("evenementCandidatures["+i+"]").deleted!="true")
                {
                    def map=params.get("evenementCandidatures["+i+"]")
                    map.dateEvtCandidature=new Date(map.dateEvtCandidature)
                    candidatureInstance.addToEvenementCandidatures(map)
                }               
            }
        }
        candidatureInstance.save(failOnError:true,flush:true)
        flash.message = message(code: 'default.candidiatureupdate.message',default: "La candidature a été modifié")
        redirect(controller :"candidature", action : "show",id:candidatureInstance.id)
    }

    @Transactional
    def delete(Candidature candidatureInstance) {

        if (candidatureInstance == null) {
            notFound()
            return
        }

        candidatureInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deletedmessage.message',default: "L'objet a été supprimé")
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'candidatureInstance.label', default: 'Candidature'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    
    @Transactional
    def postuler() {
        println("params.externe "+params.externe)
        def spontanee=false
        if(params.externe!=null && params.externe!='null' && params.externe!="")
        {
            println("je suis la")
           spontanee= true
        }
        def sourcecanddidature
        def candidat
        def map1
        if(params.autre!=null)
        {
            sourcecanddidature=params.autre
        }
        else
        {
            sourcecanddidature=params.sourceCandidature 
        }
        Date datecandidature=new Date()
        def lettreMotivation=params.lettreMotivation
        def mission=session.mission
        if(session.candidat){
            println("gvvvv if")
            candidat=session.candidat
            def evaluationCommentaire=params.evaluationCommentaire
            def evaluation=params.evaluation.id
//            def statut=StatutCandidature.findByLibelle("En cours")
            def statut=StatutCandidature.findByLibelle("Sélectionnée")
            map1=[statut:statut,dateCandidature:datecandidature,sourceCandidature:sourcecanddidature,mission:mission,candidat:candidat,lettreMotivation:lettreMotivation,evaluationCommentaire:evaluationCommentaire,evaluation:evaluation,spontanee:spontanee]
        }
        else{
            println('11111 else')
            candidat=session.user
            def statut=StatutCandidature.findByLibelle("En cours")
            map1=[statut:statut,dateCandidature:datecandidature,sourceCandidature:sourcecanddidature,mission:mission,candidat:candidat,lettreMotivation:lettreMotivation,spontanee:spontanee]  
        }
        session.mission=null
        def candidatureInstance =new Candidature(map1)
        candidatureInstance.save(failOnError:true,flush:true)
        //mailcandidature(candidatureInstance,candidat.email,candidat)
        flash.message = message(code: 'default.postuler.message',default: "La candidature a été effectuée")
        redirect(controller :"candidature", action : "show",id:candidatureInstance.id)
  
    }
    
    def mailcandidature(Candidature candidature,email,Candidat candidat){
        def templatemail=MailTemplate.findByCode("mailcandidature")
        def template=templatemail.template
        template= template.replace("#civilite",candidat.civilite.libelle);
        template= template.replace("#prenomcandidat",candidat.prenomStockage);
        template= template.replace("#nomcandidat",candidat.nomStockage);
        template= template.replace("#reference",String.valueOf(candidature.mission.reference));
        template= template.replace("#poste",String.valueOf(candidature.mission.poste));
        template= template.replace("#localisation",String.valueOf(candidature.mission.localisation));
        try {
        sendMail {
            to email
            from "info@diorh-recrutement.com"
            replyTo "satisfactionclient@diorh.com" 
            subject templatemail.description
            html template
        }
        } catch(Exception ex) {
            println ex
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
    
    @Transactional
    def changestatut() {
        def statut=StatutCandidature.findByLibelle(params.statutlibelle)
        def candidature=Candidature.get(params.id)
        candidature.statut=statut
        redirect(controller :"candidature", action : "show",id:params.id)
    }
    
    @Transactional
    def postulercandidatsmission() {
        def sourcecanddidature
        def candidat
        def map1
        if(params.autre!=null)
        {
            sourcecanddidature=params.autre
        }
        else
        {
            sourcecanddidature=params.sourceCandidature 
        }
        Date datecandidature=new Date()
        def lettreMotivation=params.lettreMotivation
        def mission=session.mission
        def mapcandidat=[]
        if(session.listcandidats){
            for(candidat1 in session.listcandidats)
            {
                candidat=candidat1
                def evaluationCommentaire=params.evaluationCommentaire
                def evaluation=params.evaluation.id
                def statut=StatutCandidature.findByLibelle("En cours")
                map1=[statut:statut,dateCandidature:datecandidature,sourceCandidature:sourcecanddidature,mission:mission,candidat:candidat,lettreMotivation:lettreMotivation,evaluationCommentaire:evaluationCommentaire,evaluation:evaluation]
                mapcandidat.add(map1)
                session.mission=null
                def candidatureInstance =new Candidature(map1)
                candidatureInstance.save(failOnError:true,flush:true)
                //mailcandidature(candidatureInstance,candidat.email)
            }
            flash.message = message(code: 'default.postuler.message',default: "La candidature a été effectuée")
            redirect(controller :"candidat", action : "create_recherche")
        }
        else{
            candidat=session.user
            def statut=StatutCandidature.findByLibelle("En cours")
            map1=[statut:statut,dateCandidature:datecandidature,sourceCandidature:sourcecanddidature,mission:mission,candidat:candidat,lettreMotivation:lettreMotivation]  
            session.mission=null
            def candidatureInstance =new Candidature(map1)
            candidatureInstance.save(failOnError:true,flush:true)
            mailcandidature(candidatureInstance,candidat.email)
            flash.message = message(code: 'default.postuler.message',default: "La candidature a été effectuée")
            redirect(controller :"candidature", action : "show",id:candidatureInstance.id)
        }
  
    }
    
    
    @Transactional
    def statutcandidature() {
        def candidature=Candidature.get(params.id)
        if(candidature.spontanee!=null && candidature.spontanee!='' && candidature.spontanee!='null' && candidature.spontanee==true)
        {
           def statut=StatutCandidature.findById(params.profil)
        if(statut!=null)
        {
            render statut.libelle
        }
        else{
            render ""
        } 
        }
        else
        {
            render ""
        }
        
    }
    
    def envoimail()
    {
        def candidature=Candidature.get(params.id)
        def candidat=candidature.candidat
        def mission=candidature.mission
        
         def templatemail=MailTemplate.findByCode("mail regret")
        def template=templatemail.template
        //template= template.replace("#email",candidat.email);
        template= template.replace("#civilite",candidat.civilite.libelle);
        template= template.replace("#nom",candidat.nomStockage);
        template= template.replace("#prenom",candidat.prenomStockage);
        template= template.replace("#poste",mission.poste);
        template= template.replace("#reference",mission.reference);
        try {
        sendMail {            
            to candidat.email
            from "info@diorh-recrutement.com"
            //replyTo "satisfactionclient@diorh.com" 
            subject templatemail.description
            html template
        }
        } catch(Exception ex) {
            println ex
        }
        
            
        
//        sendMail {
//            to candidat.email
//            from "info@diorh-recrutement.com"
//            //replyTo "satisfactionclient@diorh.com" 
//            subject "regret de candidature"
//            html "nous avons le regret de vous annoncer que votre candidature n' a pas été retenue"
//        }
        render "hhhh"
    }
}
