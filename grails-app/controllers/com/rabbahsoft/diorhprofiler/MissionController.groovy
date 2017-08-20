package com.rabbahsoft.diorhprofiler


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON
import java.text.DateFormat
import java.text.DateFormat
import java.text.DateFormat
import java.text.*

/**
 * MissionController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class MissionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        redirect(action: "list", params: params)
    }
    def list_recherche_candidats_mission() {
        if(params.offset==null)
        {
            params.offset=0
        }
        if(params.max==null)
        {
            params.max=10
        }
        if(params.sort==null)
        {
            params.sort="dateDemarrage"
        }
       
        if(params.order==null)
        {
            params.order="asc"
        }
        def listutilisateur = Utilisateur.createCriteria().list()
        {
            ilike("class",'%Utilisateur')
        }
        def c=Candidat.createCriteria()
        def connections1 = Mission.createCriteria().list(max: params.max, offset: params.offset)
        {
         
            if((params.reference!=null)&&(!(params.reference.equals(""))))
            {
                ilike("reference",params.reference + "%")
            }
            if(!params.contact.equals('null'))
            {               
                eq('contact.id', new Long(params.contact))
            }
            if(!params.typeFonction.equals('null'))
            {               
                eq('typeFonction.id', new Long(params.typeFonction))
            }
            if(!params.etapeAvancement.equals('null'))
            {               
               
                eq('etapeAvancement.id', new Long(params.etapeAvancement))
                   
                
            }
            if(!params.secteurActivite.equals('null'))
            { 
                eq('secteurActivite.id', new Long(params.secteurActivite))
                
            }
            if(!params.chargeRecherche.equals('null'))
            {               
                
                eq('chargeRecherche.id', new Long(params.chargeRecherche))  
                
            }
            if(!params.consultant.equals('null'))
            {               
                
                eq('consultant.id', new Long(params.consultant))       
                
            }
            if(!params.statut.equals('null'))
            {               
               
                eq('statut.id', new Long(params.statut))       
                
            }


            if(params.dateDemarrageDE != null && !params.dateDemarrageDE.equals("")) {
                DateFormat df = new SimpleDateFormat("MM/dd/yyyy"); 
                Date startDate;
                startDate = df.parse(params.dateDemarrageDE);
                String newDateString = df.format(startDate);
                ge('dateDemarrage',startDate)
                
            }
                
            if(params.dateDemarrageA != null && !params.dateDemarrageA.equals("")) {
                DateFormat df = new SimpleDateFormat("MM/dd/yyyy"); 
                Date startDate;
                startDate = df.parse(params.dateDemarrageA);
                String newDateString = df.format(startDate);
                le('dateDemarrage', startDate)
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
            def maxset
            if(params.max instanceof String)
            {
                maxset=Integer.parseInt(params.max)
             
            }
            else
            {
               
                maxset=params.max
            }
            firstResult(goffset) 
            maxResults(maxset)
            //            params.sort="dateDemarrage"
            //            params.order="asc"
            if(params.order) {
                order(params.sort, params.order)
            }  
        }   

        def connections2 = Mission.createCriteria().list()
        {
         
            if((params.reference!=null)&&(!(params.reference.equals(""))))
            {
                ilike("reference",params.reference + "%")
            }
            if(!params.contact.equals('null'))
            {               
                
                eq('contact.id', new Long(params.contact))
                      
                
            }
            if(!params.typeFonction.equals('null'))
            {               
               
                eq('typeFonction.id', new Long(params.typeFonction))
                    
                
            }
            if(!params.etapeAvancement.equals('null'))
            {               
               
                eq('etapeAvancement.id', new Long(params.etapeAvancement))
                   
                
            }
            if(!params.secteurActivite.equals('null'))
            { 
                eq('secteurActivite.id', new Long(params.secteurActivite))
                
            }
            if(!params.chargeRecherche.equals('null'))
            {               
                
                eq('chargeRecherche.id', new Long(params.chargeRecherche))  
                
            }
            if(!params.consultant.equals('null'))
            {               
                
                eq('consultant.id', new Long(params.consultant))       
                
            }
            if(!params.statut.equals('null'))
            {               
               
                eq('statut.id', new Long(params.statut))     
                
            }

            if(params.dateDemarrageDE != null && !params.dateDemarrageDE.equals("")) {
                DateFormat df = new SimpleDateFormat("MM/dd/yyyy"); 
                Date startDate;
                startDate = df.parse(params.dateDemarrageDE);
                String newDateString = df.format(startDate);
                ge('dateDemarrage',startDate)
                
            }
                
            if(params.dateDemarrageA != null && !params.dateDemarrageA.equals("")) {
                DateFormat df = new SimpleDateFormat("MM/dd/yyyy"); 
                Date startDate;
                startDate = df.parse(params.dateDemarrageA);
                String newDateString = df.format(startDate);
                le('dateDemarrage', startDate)
            }
            if(params.order) {
                order(params.sort, params.order)
            }
        }   
        session.connection2=connections2
        List<Mission> strings2 = session.connection2
        TreeSet<Mission> lSet1=new TreeSet<Mission>(strings2);
        int i1=0
        HashMap<Integer,Integer> yourMap1 = new HashMap<Integer,Integer>();
        Iterator<Candidat> it1 = lSet1.iterator();
        while (it1.hasNext()) {
            def can=(Mission)it1.next()
            int i23 = (int) can.id;
            yourMap1.put(new Integer(i23),new Integer(i1));
            i1++
        }
        session.max=i1
        session.maprecherche1=yourMap1
        def criterCount = Mission.createCriteria()
        def count = criterCount.count
        {
         
            if((params.reference!=null)&&(!(params.reference.equals(""))))
            {
                ilike("reference",params.reference + "%")
            }
            if(!params.contact.equals('null'))
            {               
                
                eq('contact.id', new Long(params.contact))
                      
                
            }
            if(!params.typeFonction.equals('null'))
            {               
               
                eq('typeFonction.id', new Long(params.typeFonction))
                    
                
            }
            if(!params.etapeAvancement.equals('null'))
            {               
               
                eq('etapeAvancement.id', new Long(params.etapeAvancement))
                   
                
            }
            if(!params.secteurActivite.equals('null'))
            { 
                eq('secteurActivite.id', new Long(params.secteurActivite))
                
            }
            if(!params.chargeRecherche.equals('null'))
            {               
                
                eq('chargeRecherche.id', new Long(params.chargeRecherche))  
                
            }
            if(!params.consultant.equals('null'))
            {               
                
                eq('consultant.id', new Long(params.consultant))       
                
            }
            if(!params.statut.equals('null'))
            {               
               
                eq('statut.id', new Long(params.statut))     
                
            }


            if(params.dateDemarrageDE != null && !params.dateDemarrageDE.equals("")) {
                DateFormat df = new SimpleDateFormat("MM/dd/yyyy"); 
                Date startDate;
                startDate = df.parse(params.dateDemarrageDE);
                String newDateString = df.format(startDate);
                ge('dateDemarrage',startDate)
                
            }
                
            if(params.dateDemarrageA != null && !params.dateDemarrageA.equals("")) {
                DateFormat df = new SimpleDateFormat("MM/dd/yyyy"); 
                Date startDate;
                startDate = df.parse(params.dateDemarrageA);
                String newDateString = df.format(startDate);
                le('dateDemarrage', startDate)
            }
         
        }
        if((params.statut.equals('null'))&&(params.consultant.equals('null'))&&(params.secteurActivite.equals('null'))&&(params.chargeRecherche.equals('null'))&&(params.typeFonction.equals('null'))&&(params.etapeAvancement.equals('null'))&&(params.contact.equals('null'))&&((params.dateDemarrageDE.equals('null')||(params.dateDemarrageDE==null)||(params.dateDemarrageDE.equals(''))))&&((params.dateDemarrageA.equals('null')||(params.dateDemarrageA==null)||(params.dateDemarrageA.equals(''))))&&((params.reference.equals('null'))||(params.reference==null)||(params.reference.equals(''))))
        {
           [missionInstanceList: null, missionInstanceCount: 0]
        }
        else
        {
          [missionInstanceList: connections1, missionInstanceCount: count]  
        }
        
    }
    def recherche() {
        if(session.candidat==null || params.id!=null){
            session.candidat=Candidat.get(params.id)
        }
        def fonctiondiorchargerrecrutement=FonctionDior.findByLibelle("Chargé(e) de recherche")
        def listchargerrecrutement=Utilisateur.createCriteria().list() { 
            eq("fonctionDior",fonctiondiorchargerrecrutement)
        }
        def fonctiondiorconsultant=FonctionDior.findByLibelle("Consultant(e)")
        def listconsultant=Utilisateur.createCriteria().list() { 
            eq("fonctionDior",fonctiondiorconsultant)
        }
        session.statut=null
        session.dateDemarrageA=null
        session.consultant=null
        session.dateDemarrageDE=null
        session.secteurActivite=null
        session.chargeRecherche=null
        session.typeFonction=null
        session.etapeAvancement=null
        session.contact=null
        session.reference=null
        render(view:"recherche",model:[listchargrech:listchargerrecrutement,listconsultant:listconsultant])
    }
    
    def recherchecandidatsmission() {
        def fonctiondiorchargerrecrutement=FonctionDior.findByLibelle("Chargé(e) de recherche")
        def listchargerrecrutement=Utilisateur.createCriteria().list() { 
            eq("fonctionDior",fonctiondiorchargerrecrutement)
        }
        def fonctiondiorconsultant=FonctionDior.findByLibelle("Consultant(e)")
        def listconsultant=Utilisateur.createCriteria().list() { 
            eq("fonctionDior",fonctiondiorconsultant)
        }
        render(view:"recherche_candidats_mission",model:[listchargrech:listchargerrecrutement,listconsultant:listconsultant])
    }
    def list_rechercheinit() {
       if(params.c!=null && params.c!='null'&& params.c!='')
       {
            session.statut=params.statut
        session.dateDemarrageA=params.dateDemarrageA
        session.consultant=params.consultant
        session.dateDemarrageDE=params.dateDemarrageDE
        session.secteurActivite=params.secteurActivite
        session.chargeRecherche=params.chargeRecherche
        session.typeFonction=params.typeFonction
        session.etapeAvancement=params.etapeAvancement
        session.contact=params.contact
        session.reference=params.reference
       }
        if(params.offset==null)
        {
            params.offset=0
        }
        if(params.max==null)
        {
            params.max=10
        }
        if(params.sort==null)
        {
            params.sort="dateDemarrage"
        }
        if(params.order==null)
        {
            params.order="asc"
        }
        def listutilisateur = Utilisateur.createCriteria().list()
        {
            ilike("class",'%Utilisateur')
        }
        def c=Candidat.createCriteria()
        def max1=params.max
        def offset1=params.offset
        def sort1=params.sort
        def order1=params.order
        if(max1 instanceof String)
        {
            params.max=Integer.parseInt(max1)
        }
        if(offset1 instanceof String)
        {
            params.offset=Integer.parseInt(offset1)
        }
       
        def connections1 = Mission.createCriteria().list(params)
        {

            if(!params.statut.equals('null'))
            {               
               
                eq('statut.id', new Long(params.statut))       
                
            }
            if((params.reference!=null)&&(!(params.reference.equals(""))))
            {
                ilike("reference",params.reference + "%")
            }
            if(!params.contact.equals('null'))
            { 
                eq('contact.id', new Long(params.contact))
            }
            if(!params.typeFonction.equals('null'))
            {               
                eq('typeFonction.id', new Long(params.typeFonction))
            }
            if(!params.etapeAvancement.equals('null'))
            {               
               
                eq('etapeAvancement.id', new Long(params.etapeAvancement))
                   
                
            }
            if(!params.secteurActivite.equals('null'))
            { 
                eq('secteurActivite.id', new Long(params.secteurActivite))
                
            }
            if(!params.chargeRecherche.equals('null'))
            {               
                
                eq('chargeRecherche.id', new Long(params.chargeRecherche))  
                
            }
            if(!params.consultant.equals('null'))
            {               
                
                eq('consultant.id', new Long(params.consultant))       
                
            }
             


            if(params.dateDemarrageDE != null && !params.dateDemarrageDE.equals("")) {
                DateFormat df = new SimpleDateFormat("MM/dd/yyyy"); 
                Date startDate;
                startDate = df.parse(params.dateDemarrageDE);
                String newDateString = df.format(startDate);
                ge('dateDemarrage',startDate)
                
            }
                
            if(params.dateDemarrageA != null && !params.dateDemarrageA.equals("")) {
                DateFormat df = new SimpleDateFormat("MM/dd/yyyy"); 
                Date startDate;
                startDate = df.parse(params.dateDemarrageA);
                String newDateString = df.format(startDate);
                le('dateDemarrage', startDate)
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
            def maxset
            if(params.max instanceof String)
            {
                maxset=Integer.parseInt(params.max)
             
            }
            else
            {
               
                maxset=params.max
            }
            firstResult(goffset) 
            maxResults(maxset)
            //            params.sort="dateDemarrage"
            //            params.order="asc"
            if(params.order) {
                order(params.sort, params.order)
            }  
        }   

        def connections2 = Mission.createCriteria().list()
        {
         
            if((params.reference!=null)&&(!(params.reference.equals(""))))
            {
                ilike("reference",params.reference + "%")
            }
            if(!params.contact.equals('null'))
            {               
                
                eq('contact.id', new Long(params.contact))
                      
                
            }
            if(!params.typeFonction.equals('null'))
            {               
               
                eq('typeFonction.id', new Long(params.typeFonction))
                    
                
            }
            if(!params.etapeAvancement.equals('null'))
            {               
               
                eq('etapeAvancement.id', new Long(params.etapeAvancement))
                   
                
            }
            if(!params.secteurActivite.equals('null'))
            { 
                eq('secteurActivite.id', new Long(params.secteurActivite))
                
            }
            if(!params.chargeRecherche.equals('null'))
            {               
                
                eq('chargeRecherche.id', new Long(params.chargeRecherche))  
                
            }
            if(!params.consultant.equals('null'))
            {               
                
                eq('consultant.id', new Long(params.consultant))       
                
            }
            if(!params.statut.equals('null'))
            {               
               
                eq('statut.id', new Long(params.statut))     
                
            }

            if(params.dateDemarrageDE != null && !params.dateDemarrageDE.equals("")) {
                DateFormat df = new SimpleDateFormat("MM/dd/yyyy"); 
                Date startDate;
                startDate = df.parse(params.dateDemarrageDE);
                String newDateString = df.format(startDate);
                ge('dateDemarrage',startDate)
                
            }
                
            if(params.dateDemarrageA != null && !params.dateDemarrageA.equals("")) {
                DateFormat df = new SimpleDateFormat("MM/dd/yyyy"); 
                Date startDate;
                startDate = df.parse(params.dateDemarrageA);
                String newDateString = df.format(startDate);
                le('dateDemarrage', startDate)
            }
            if(params.order) {
                order(params.sort, params.order)
            }
        }   
        session.connection2=connections2
        List<Mission> strings2 = session.connection2
        TreeSet<Mission> lSet1=new TreeSet<Mission>(strings2);
        int i1=0
        HashMap<Integer,Integer> yourMap1 = new HashMap<Integer,Integer>();
        Iterator<Candidat> it1 = lSet1.iterator();
        while (it1.hasNext()) {
            def can=(Mission)it1.next()
            int i23 = (int) can.id;
            yourMap1.put(new Integer(i23),new Integer(i1));
            i1++
        }
        session.max=i1
        session.maprecherche1=yourMap1
        def criterCount = Mission.createCriteria()
        def count = criterCount.count
        {
         
            if((params.reference!=null)&&(!(params.reference.equals(""))))
            {
                ilike("reference",params.reference + "%")
            }
            if(!params.contact.equals('null'))
            {               
                
                eq('contact.id', new Long(params.contact))
                      
                
            }
            if(!params.typeFonction.equals('null'))
            {               
               
                eq('typeFonction.id', new Long(params.typeFonction))
                    
                
            }
            if(!params.etapeAvancement.equals('null'))
            {               
               
                eq('etapeAvancement.id', new Long(params.etapeAvancement))
                   
                
            }
            if(!params.secteurActivite.equals('null'))
            { 
                eq('secteurActivite.id', new Long(params.secteurActivite))
                
            }
            if(!params.chargeRecherche.equals('null'))
            {               
                
                eq('chargeRecherche.id', new Long(params.chargeRecherche))  
                
            }
            if(!params.consultant.equals('null'))
            {               
                
                eq('consultant.id', new Long(params.consultant))       
                
            }
            if(!params.statut.equals('null'))
            {               
               
                eq('statut.id', new Long(params.statut))     
                
            }


            if(params.dateDemarrageDE != null && !params.dateDemarrageDE.equals("")) {
                DateFormat df = new SimpleDateFormat("MM/dd/yyyy"); 
                Date startDate;
                startDate = df.parse(params.dateDemarrageDE);
                String newDateString = df.format(startDate);
                ge('dateDemarrage',startDate)
                
            }
                
            if(params.dateDemarrageA != null && !params.dateDemarrageA.equals("")) {
                DateFormat df = new SimpleDateFormat("MM/dd/yyyy"); 
                Date startDate;
                startDate = df.parse(params.dateDemarrageA);
                String newDateString = df.format(startDate);
                le('dateDemarrage', startDate)
            }
         
        }
        if((params.statut.equals('null'))&&(params.consultant.equals('null'))&&(params.secteurActivite.equals('null'))&&(params.chargeRecherche.equals('null'))&&(params.typeFonction.equals('null'))&&(params.etapeAvancement.equals('null'))&&(params.contact.equals('null'))&&((params.dateDemarrageDE.equals('null')||(params.dateDemarrageDE==null)||(params.dateDemarrageDE.equals(''))))&&((params.dateDemarrageA.equals('null')||(params.dateDemarrageA==null)||(params.dateDemarrageA.equals(''))))&&((params.reference.equals('null'))||(params.reference==null)||(params.reference.equals(''))))
        {
           [missionInstanceList: null, missionInstanceCount: 0]
        }
        else
        {
          [missionInstanceList: connections1, missionInstanceCount: count]  
        }
        
    }

    @Transactional
    def cloturer() {
        def mission=Mission.get(params.id)    
        def statut=StatutMission.get(682)
        mission.statut=statut
        mission.save(failOnError:true,flush:true)
        flash.message = "La mission a été cloturée"
        redirect(action: "show", id:mission.id)
    }
    
    @Transactional
    def archiver() {
        def mission=Mission.get(params.id)    
        def statut=StatutMission.get(684)
        mission.statut=statut
        mission.save(failOnError:true,flush:true)
        flash.message = "La mission a été archivée"
        redirect(action: "show", id:mission.id)
    }
    
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Mission.list(params), model:[missionInstanceCount: Mission.count()]
    }

    def show(Mission missionInstance) {
        respond missionInstance        
    }

    def create() {
        respond new Mission(params)
    }

    @Transactional
    def save(Mission missionInstance) {  
        def map=params
        map.each {
            if(it?.key?.startsWith("planifications")) { 
                it.remove() 
            }
        }
        map.dateFinAnnonce=Date.parse("dd/MM/yyyy",map.dateFinAnnonce);
        bindingdate(map,params.dateDemarrage,"dateDemarrage")
        bindingdate(map,params.dateFinGarantie,"dateFinGarantie")
        bindingdate(map,params.datePublication,"datePublication")
        def mission=new Mission(map)
        for(int i=0;i<params.int('addplanification');i++)
        {
            if(params.get("planifications["+i+"]")!=null)
            {
                def mapplanification=params.get("planifications["+i+"]")
                mapplanification.dateDebut=Date.parse("dd/MM/yyyy",mapplanification.dateDebut)
                mapplanification.dateFin=Date.parse("dd/MM/yyyy",mapplanification.dateFin)
                mission.addToPlanifications(mapplanification)
            }
        }
        mission.save(failOnError:true,flush:true)
        flash.message = "L'objet a été crée"
        redirect(action: "show", id:mission.id)
        //redirect(controller:'home',action:'index')
    }
    
    def bindingdate(map,date,param){
        if(date==""){
            map."${param}"=null;
        }
        else{
            map."${param}"=Date.parse("dd/MM/yyyy","${date}")
        }
    }

    def edit(Mission missionInstance) {
        respond missionInstance
    }

    @Transactional
    def update(Mission missionInstance) {
        def mapmission=params
        mapmission.each { 
            if(it?.key?.startsWith("planifications")) { 
                it.remove() 
            }
        }
        mapmission.dateFinAnnonce=Date.parse("dd/MM/yyyy",mapmission.dateFinAnnonce);
        bindingdate(mapmission,params.dateDemarrage,"dateDemarrage")
        bindingdate(mapmission,params.dateFinGarantie,"dateFinGarantie")
        bindingdate(mapmission,params.datePublication,"datePublication")
        def mission=Mission.get(mapmission.id)
        mission.properties = mapmission
        mission.planifications.clear()
        for(int i=0;i<params.int('addplanification');i++)
        {
            if(params.get("planifications["+i+"]")!=null)
            {
                def mapplanification=params.get("planifications["+i+"]")
                mapplanification.dateDebut=Date.parse("dd/MM/yyyy",mapplanification.dateDebut)
                mapplanification.dateFin=Date.parse("dd/MM/yyyy",mapplanification.dateFin)
                mission.addToPlanifications(mapplanification)
            }
        }
        mission.save(failOnError:true,flush:true)
        flash.message = "L'objet a été modifié"
        redirect(action: "show", id:mission.id)
    }

    @Transactional
    def delete(Mission missionInstance) {

        if (missionInstance == null) {
            notFound()
            return
        }

        missionInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Mission.label', default: 'Mission'), missionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'missionInstance.label', default: 'Mission'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    
    def getinterlocuteurbycontact(){
        def contact=Contact.get(params.idcontact)
        def interlocuteurs = InterlocuteurContact.createCriteria()
        def result = interlocuteurs.list() {
            if(params.idcontact!="")
            eq('contact',contact)
        }      
        render result as JSON
       
    }
    
    def list_recherche() {
       if(params.c!=null && params.c!='null'&& params.c!='')
       {
            session.statut=params.statut
        session.dateDemarrageA=params.dateDemarrageA
        session.consultant=params.consultant
        session.dateDemarrageDE=params.dateDemarrageDE
        session.secteurActivite=params.secteurActivite
        session.chargeRecherche=params.chargeRecherche
        session.typeFonction=params.typeFonction
        session.etapeAvancement=params.etapeAvancement
        session.contact=params.contact
        session.reference=params.reference
       }
        if(params.offset==null)
        {
            params.offset=0
        }
        if(params.max==null)
        {
            params.max=10
        }
        if(params.sort==null)
        {
            params.sort="dateDemarrage"
        }
        if(params.order==null)
        {
            params.order="asc"
        }
        def listutilisateur = Utilisateur.createCriteria().list()
        {
            ilike("class",'%Utilisateur')
        }
        def c=Candidat.createCriteria()
        def max1=params.max
        def offset1=params.offset
        def sort1=params.sort
        def order1=params.order
        if(max1 instanceof String)
        {
            params.max=Integer.parseInt(max1)
        }
        if(offset1 instanceof String)
        {
            params.offset=Integer.parseInt(offset1)
        }
       
        def connections1 = Mission.createCriteria().list(params)
        {

            if(!session.statut.equals('null'))
            {               
               
                eq('statut.id', new Long(session.statut))       
                
            }
            if((session.reference!=null)&&(!(session.reference.equals(""))))
            {
                ilike("reference",session.reference + "%")
            }
            if(!session.contact.equals('null'))
            { 
                eq('contact.id', new Long(session.contact))
            }
            if(!session.typeFonction.equals('null'))
            {               
                eq('typeFonction.id', new Long(params.typeFonction))
            }
            if(!session.etapeAvancement.equals('null'))
            {               
               
                eq('etapeAvancement.id', new Long(session.etapeAvancement))
                   
                
            }
            if(!session.secteurActivite.equals('null'))
            { 
                eq('secteurActivite.id', new Long(session.secteurActivite))
                
            }
            if(!session.chargeRecherche.equals('null'))
            {               
                
                eq('chargeRecherche.id', new Long(session.chargeRecherche))  
                
            }
            if(!session.consultant.equals('null'))
            {               
                
                eq('consultant.id', new Long(session.consultant))       
                
            }
             


            if(session.dateDemarrageDE != null && !session.dateDemarrageDE.equals("")) {
                DateFormat df = new SimpleDateFormat("MM/dd/yyyy"); 
                Date startDate;
                startDate = df.parse(session.dateDemarrageDE);
                String newDateString = df.format(startDate);
                ge('dateDemarrage',startDate)
                
            }
                
            if(session.dateDemarrageA != null && !session.dateDemarrageA.equals("")) {
                DateFormat df = new SimpleDateFormat("MM/dd/yyyy"); 
                Date startDate;
                startDate = df.parse(session.dateDemarrageA);
                String newDateString = df.format(startDate);
                le('dateDemarrage', startDate)
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
            def maxset
            if(params.max instanceof String)
            {
                maxset=Integer.parseInt(params.max)
             
            }
            else
            {
               
                maxset=params.max
            }
            firstResult(goffset) 
            maxResults(maxset)
            //            params.sort="dateDemarrage"
            //            params.order="asc"
            if(params.order) {
                order(params.sort, params.order)
            }  
        }   

        def connections2 = Mission.createCriteria().list()
        {
         
            if((session.reference!=null)&&(!(session.reference.equals(""))))
            {
                ilike("reference",session.reference + "%")
            }
            if(!session.contact.equals('null'))
            {               
                
                eq('contact.id', new Long(session.contact))
                      
                
            }
            if(!session.typeFonction.equals('null'))
            {               
               
                eq('typeFonction.id', new Long(session.typeFonction))
                    
                
            }
            if(!session.etapeAvancement.equals('null'))
            {               
               
                eq('etapeAvancement.id', new Long(session.etapeAvancement))
                   
                
            }
            if(!session.secteurActivite.equals('null'))
            { 
                eq('secteurActivite.id', new Long(session.secteurActivite))
                
            }
            if(!session.chargeRecherche.equals('null'))
            {               
                
                eq('chargeRecherche.id', new Long(session.chargeRecherche))  
                
            }
            if(!session.consultant.equals('null'))
            {               
                
                eq('consultant.id', new Long(session.consultant))       
                
            }
            if(!session.statut.equals('null'))
            {               
               
                eq('statut.id', new Long(session.statut))     
                
            }

            if(session.dateDemarrageDE != null && !session.dateDemarrageDE.equals("")) {
                DateFormat df = new SimpleDateFormat("MM/dd/yyyy"); 
                Date startDate;
                startDate = df.parse(session.dateDemarrageDE);
                String newDateString = df.format(startDate);
                ge('dateDemarrage',startDate)
                
            }
                
            if(session.dateDemarrageA != null && !session.dateDemarrageA.equals("")) {
                DateFormat df = new SimpleDateFormat("MM/dd/yyyy"); 
                Date startDate;
                startDate = df.parse(session.dateDemarrageA);
                String newDateString = df.format(startDate);
                le('dateDemarrage', startDate)
            }
//            if(params.order) {
//                order(params.sort, params.order)
//            }
        }   
        
        def criterCount = Mission.createCriteria()
        def count = criterCount.count
        {
         
            if((session.reference!=null)&&(!(session.reference.equals(""))))
            {
                ilike("reference",session.reference + "%")
            }
            if(!session.contact.equals('null'))
            {               
                
                eq('contact.id', new Long(session.contact))
                      
                
            }
            if(!session.typeFonction.equals('null'))
            {               
               
                eq('typeFonction.id', new Long(session.typeFonction))
                    
                
            }
            if(!session.etapeAvancement.equals('null'))
            {               
               
                eq('etapeAvancement.id', new Long(session.etapeAvancement))
                   
                
            }
            if(!session.secteurActivite.equals('null'))
            { 
                eq('secteurActivite.id', new Long(session.secteurActivite))
                
            }
            if(!session.chargeRecherche.equals('null'))
            {               
                
                eq('chargeRecherche.id', new Long(session.chargeRecherche))  
                
            }
            if(!session.consultant.equals('null'))
            {               
                
                eq('consultant.id', new Long(session.consultant))       
                
            }
            if(!session.statut.equals('null'))
            {               
               
                eq('statut.id', new Long(session.statut))     
                
            }


            if(session.dateDemarrageDE != null && !session.dateDemarrageDE.equals("")) {
                DateFormat df = new SimpleDateFormat("MM/dd/yyyy"); 
                Date startDate;
                startDate = df.parse(session.dateDemarrageDE);
                String newDateString = df.format(startDate);
                ge('dateDemarrage',startDate)
                
            }
                
            if(session.dateDemarrageA != null && !session.dateDemarrageA.equals("")) {
                DateFormat df = new SimpleDateFormat("MM/dd/yyyy"); 
                Date startDate;
                startDate = df.parse(session.dateDemarrageA);
                String newDateString = df.format(startDate);
                le('dateDemarrage', startDate)
            }
         
        }
        if((params.statut.equals('null'))&&(params.consultant.equals('null'))&&(params.secteurActivite.equals('null'))&&(params.chargeRecherche.equals('null'))&&(params.typeFonction.equals('null'))&&(params.etapeAvancement.equals('null'))&&(params.contact.equals('null'))&&((params.dateDemarrageDE.equals('null')||(params.dateDemarrageDE==null)||(params.dateDemarrageDE.equals(''))))&&((params.dateDemarrageA.equals('null')||(params.dateDemarrageA==null)||(params.dateDemarrageA.equals(''))))&&((params.reference.equals('null'))||(params.reference==null)||(params.reference.equals(''))))
        {
           [missionInstanceList: null, missionInstanceCount: 0]
        }
        else
        {
          [missionInstanceList: connections1, missionInstanceCount: count]  
        }
        
    }
    
    
    @Transactional
    def reprendre(Mission missionInstance) {
        def mission=Mission.get(params.id)    
        def statut=StatutMission.getId('reprendre')
        mission.statut=statut
        mission.save(failOnError:true,flush:true)
        flash.message = "La mission a été repris"
        redirect(action: "show", id:mission.id)
    }
    @Transactional
    def suspendre(Mission missionInstance) {
         def mission=Mission.get(params.id)    
        def statut=StatutMission.findByLibelle('suspendre')
        mission.statut=statut
        mission.save(failOnError:true,flush:true)
        flash.message = "La mission a été suspendu"
        redirect(action: "show", id:mission.id)
    }
    
}
