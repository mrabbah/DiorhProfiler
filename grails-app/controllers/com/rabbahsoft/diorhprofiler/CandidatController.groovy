package com.rabbahsoft.diorhprofiler

import com.rabbahsoft.diorhprofiler.util.*
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import java.util.ArrayList
import org.codehaus.groovy.grails.plugins.jasper.JasperReportDef
import org.codehaus.groovy.grails.plugins.jasper.JasperExportFormat
import org.apache.commons.io.FileUtils
import grails.converters.JSON
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import java.util.*
import java.text.*
import java.lang.Object
import org.springframework.web.servlet.ModelAndView
import grails.converters.deep.JSON
import grails.converters.JSON
import java.text.SimpleDateFormat
import org.codehaus.groovy.grails.commons.ConfigurationHolder as CH
import com.macrobit.grails.plugins.attachmentable.domains.Attachment
import com.macrobit.grails.plugins.attachmentable.domains.AttachmentLink
import com.macrobit.grails.plugins.attachmentable.util.AttachmentableUtil
import grails.orm.PagedResultList

import javax.servlet.http.HttpServletResponse
import org.compass.core.engine.SearchEngineQueryParseException
import cr.co.arquetipos.password.PasswordTools
import org.hibernate.Criteria;



/**
 * CandidatController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class CandidatController 
{
    def jasperService
    def searchableService
    def attachmentableService
    def rechercheCandidatService
    Date dmi
    Date dma
    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

    def index(Integer max) {   
        redirect(action: "list", params: params)
    }
    @Transactional
    def retour(RechercheCandidat rechercheCandidatInstance)
    { 
        redirect(action: "create_recherche", params: [retour:'retour'])
             
        //        def f=true
        //        if(session.idrecherchecandidat!='')
        //        {
        //            def rech=RechercheCandidat.get(session.idrecherchecandidat)
        //            f=false
        //            //redirect(action: "create_recherche", params: [id1:rech.id,ff:f])
        //            if(rech!=null)
        //            {
        //               redirect(action: "create_recherche", params: [id1:rech.id,ff:f]) 
        //            }
        //            else
        //            {
        //              redirect(action: "create_recherche", params: [motCle:session.motCle])   
        //            }
        //            //render(view:"create_recherche",model:[rechercheCandidatInstance:rech],params:session.niveauetudes) 
        //        }
        //        else
        //        {
        //            def rr=new RechercheCandidat(params)
        //            redirect(action: "create_recherche",params:[etape:params.etape])
        //            //render(view:"create_recherche",model:[rechercheCandidatInstance:rechercheCandidatInstance],params:session.niveauetudes)
        //            
        //        }
       
    }
    
    
    @Transactional
    def retour1(RechercheCandidat rechercheCandidatInstance)
    { 
        def f=true
        if(session.idrecherchecandidat!='')
        {
            def rech=RechercheCandidat.get(session.idrecherchecandidat)
            f=false
            //redirect(action: "create_recherche", params: [id1:rech.id,ff:f])
            if(rech!=null)
            {
                redirect(action: "create_recherche", params: [id1:rech.id,ff:f]) 
            }
            else
            {
                redirect(action: "create_recherche", params: [motCle:session.motCle])   
            }
            //render(view:"create_recherche",model:[rechercheCandidatInstance:rech],params:session.niveauetudes) 
        }
        else
        {
            def rr=new RechercheCandidat(params)
            redirect(action: "create_recherche",params:[etape:params.etape])
            //render(view:"create_recherche",model:[rechercheCandidatInstance:rechercheCandidatInstance],params:session.niveauetudes)
            
        }
       
    }
    @Transactional
    def enregistrer_recherche(RechercheCandidat rechercheCandidatInstance)
    {        
        if(session.idrecherchecandidat==''){
            def recherchecandidat = new RechercheCandidat(id:"",annote:session.annote,ageMin:session.ageMin,ageMax:session.ageMax,libellerecherche:params.libellerecherche,sourceInscription: session.sourceInscription, nomStockage:session.nomStockage,prenomStockage:session.prenomStockage,civilite:session.civilite,profil1:session.profil1,annotation1:session.annotation1,annotation2:session.annotation2,profil2:session.profil2,villes:session.villes,postes:session.postes,typeentreprises:session.typeentreprises,diplomes:session.diplomes,secteuractivites:session.secteuractivites,niveauetudes:session.niveauetudes,plageexperiences:session.plageexperiences)   
            flash.message = message(code: 'default.createdmessage.message',default: "L'objet a été crée")  
            recherchecandidat.save(failOnError:true,flush:true)
        }
        else{
            def recherchecandidat = RechercheCandidat.get(session.idrecherchecandidat)
            recherchecandidat.libellerecherche=params.libellerecherche
            recherchecandidat.annote=session.annote
            recherchecandidat.nomStockage=session.nomStockage
            recherchecandidat.prenomStockage=session.prenomStockage
            session.sourceInscription
            if(session.sourceInscription=='' || session.sourceInscription=='null'){
                recherchecandidat.sourceInscription=null
            }else{
                recherchecandidat.sourceInscription=SourceInscription.get(session.sourceInscription)
            }
            if(session.civilite=='' || session.civilite=='null'){
                recherchecandidat.civilite=null
            }else{
                recherchecandidat.civilite=Civilite.get(session.civilite)
            }
            if(session.profil1=='' || session.profil1=='null'){
                recherchecandidat.profil1=null
            }else{
                recherchecandidat.profil1=AnnotationProfil.get(session.profil1) 
            }
            if(session.annotation1=='' || session.annotation1=='null'){
                recherchecandidat.annotation1=null
            }else{
                recherchecandidat.annotation1=AnnotationNote.get(session.annotation1)
            }
            if(session.profil2=='' || session.profil2=='null'){
                recherchecandidat.profil2=null
            }else{
                recherchecandidat.profil2=AnnotationProfil.get(session.profil2) 
            }
            if(session.annotation2=='' || session.annotation2=='null'){
                recherchecandidat.annotation2=null
            }else{
                recherchecandidat.annotation2=AnnotationNote.get(session.annotation2)
            }
            if(session.ageMin==''){
                recherchecandidat.ageMin=null
            }else{
                recherchecandidat.ageMin=Integer.parseInt(session.ageMin)
            }
            if(session.ageMax==''){
                recherchecandidat.ageMax=null
            }else{
                recherchecandidat.ageMax=Integer.parseInt(session.ageMax)
            }
            
            if(session.villes!=null)
            {               
                if(session.villes instanceof String) {
                    recherchecandidat.addToVilles(Ville.get(session.villes))
                }   
                else {
                    for(v in session.villes) {
                        recherchecandidat.addToVilles(Ville.get(v))
                    }
                }                    
            }
            else{
                recherchecandidat.villes=null
            }
            
            if(session.niveauetudes!=null)
            {               
                if(session.niveauetudes instanceof String) {
                    recherchecandidat.addToNiveauetudes(NiveauEtude.get(session.niveauetudes))
                }   
                else {
                    for(v in session.niveauetudes) {
                        recherchecandidat.addToNiveauetudes(NiveauEtude.get(v))
                    }
                }                    
            }
            else{
                recherchecandidat.niveauetudes=null
            }
            
            if(session.diplomes!=null)
            {               
                if(session.diplomes instanceof String) {
                    recherchecandidat.addToDiplomes(Diplome.get(session.diplomes))
                }   
                else {
                    for(v in session.diplomes) {
                        recherchecandidat.addToDiplomes(Diplome.get(v))
                    }
                }                    
            }
            else{
                recherchecandidat.diplomes=null
            }
            
            if(session.typeentreprises!=null)
            {               
                if(session.typeentreprises instanceof String) {
                    recherchecandidat.addToTypeentreprises(TypeEntreprise.get(session.typeentreprises))
                }   
                else {
                    for(v in session.typeentreprises) {
                        recherchecandidat.addToTypeentreprises(TypeEntreprise.get(v))
                    }
                }                    
            }
            else{
                recherchecandidat.typeentreprises=null
            }
            
            if(session.plageexperiences!=null)
            {               
                if(session.plageexperiences instanceof String) {
                    recherchecandidat.addToPlageexperiences(PlageExperience.get(session.plageexperiences))
                }   
                else {
                    for(v in session.plageexperiences) {
                        recherchecandidat.addToPlageexperiences(PlageExperience.get(v))
                    }
                }                    
            }
            else{
                recherchecandidat.plageexperiences=null
            }
            
            if(session.postes!=null)
            {               
                if(session.postes instanceof String) {
                    recherchecandidat.addToPostes(Poste.get(session.postes))
                }   
                else {
                    for(v in session.postes) {
                        recherchecandidat.addToPostes(Poste.get(v))
                    }
                }                    
            }
            else{
                recherchecandidat.postes=null
            }
            
            if(session.secteuractivites!=null)
            {               
                if(session.secteuractivites instanceof String) {
                    recherchecandidat.addToSecteuractivites(SecteurActivite.get(session.secteuractivites))
                }   
                else {
                    for(v in session.secteuractivites) {
                        recherchecandidat.addToSecteuractivites(SecteurActivite.get(v))
                    }
                }                    
            }
            else{
                recherchecandidat.secteuractivites=null
            }
            
            recherchecandidat.save(failOnError:true,flush:true)   
            flash.message = message(code: 'default.updatedmessage',default: "L'objet a été modifié")
        }
        redirect(action: "historique_recherche")  
    }

    def list_recherche_initial() { 
        if(params.offset==null)
        {
            params.offset=0
        }
        else
        {
            params.offset=params.offset 
        }
        if(params.max==null)
        {
            params.max=10
        }
        
        Date now = new Date();            
        if(session.ageMin!=null)
        {
            if(!session.ageMin.equals(""))
            {
                Calendar calmin = Calendar.getInstance();
                calmin.setTime(now);
                int year = calmin.get(Calendar.YEAR) - Integer.parseInt(session.ageMin);
                calmin.set(Calendar.YEAR, year)
                dmi=calmin.getTime();
            }
        }
        if(session.ageMax!=null)
        {
            if(!session.ageMax.equals(""))
            {
                Calendar calmax = Calendar.getInstance();
                calmax.setTime(now);
                int year = calmax.get(Calendar.YEAR) - Integer.parseInt(session.ageMax);
                calmax.set(Calendar.YEAR, year)
                dma=calmax.getTime();  
            }
        }
       
        if(params.offset==null)
        {
            params.offset=0
        }
        params.max=10
       
        def rechcand=RechercheCandidat.get(session.rechcan)
        session.rechcan=rechcand
        if(params.sort==null)
        {
            params.sort="dateCreated"
        }
        else
        {
            params.sort=params.sort
            
        }
        session.sort=params.sort
        if(params.order==null)
        {
            params.order="asc"
        }
        else
        {
            params.order=params.order
        }
        session.order=params.order
        def c=Candidat.createCriteria()
        def connections1 = Candidat.createCriteria().list
        {
         
            if((session.nomStockage!=null)&&(!(session.nomStockage.equals(""))))
            {
                ilike("nomStockage",session.nomStockage + "%")
            }
           
            if((session.prenomStockage!=null)&&(!(session.prenomStockage.equals(""))))
            {
                ilike("prenomStockage",session.prenomStockage + "%")
            }
            
            if(session.ageMin != null && !session.ageMin.equals("")) {
                ge('dateNaissance', dma)
            }
                
            if(session.ageMax != null && !session.ageMax.equals("")) {
                le('dateNaissance', dmi)
            }
            if(!session.civilite.equals('null')){
                long j=Long.parseLong(session.civilite)  
                
                eq("civilite.id",j)
            }
            
            if(session.villes!=null)
            {               
                if(session.villes instanceof String) {
                    eq('villecandidat.id', new Long(session.villes))
                }   else {
                    or {
                        for(v in session.villes) {
                            
                            eq('villecandidat.id', new Long(v))
                        }
                    }
                }             
                
            }
            if(session.niveauetudes!=null) {
                if(session.niveauetudes instanceof String) {  
                    eq('niveauEtude.id', new Long(session.niveauetudes))
                }
                else
                {
                    or {
                        for(v in session.niveauetudes) {
                            eq('niveauEtude.id', new Long(v))
                        }
                    }
                }
                
            }
            if(session.plageexperiences!=null)
            { 
                if(session.plageexperiences instanceof String) {  
                    eq('plageExperience.id', new Long(session.plageexperiences))
                }
                else
                {
                    or {
                        for(v in session.plageexperiences) {
                            eq('plageExperience.id', new Long(v))
                        }
                    }
                }
                
            }
         
            if(session.annote!=null)
            {
                eq("annote",true) 
                
            }
            if(!session.sourceInscription.equals('null'))            
            {
                eq('sourceInscription.id', new Long(session.sourceInscription))            
            }
            if(!session.annotation1.equals('null'))
            {           
                eq('annotation1.id', new Long(session.annotation1))
            }
            if(!session.annotation2.equals('null'))
            {                    
                eq('annotation2.id', new Long(session.annotation2))            
            }
            if(!session.profil1.equals('null'))
            {        
                eq('profil1.id', new Long(session.profil1))
            }
            if(!session.profil2.equals('null'))
            {
                eq('profil2.id', new Long(session.profil2))
            }
            if(session.secteuractivites!=null)
            {
                if(session.secteuractivites instanceof String) {
                    experiences {
                        eq('secteurActivite.id', new Long(session.secteuractivites))
                    }
                }
                else
                {
                    experiences {
                        or {
                            for(v in session.secteuractivites) {
                                eq('secteurActivite.id', new Long(v))
                            }
                        }   
                    }
                }
            }
            
            if(session.typeentreprises!=null)
            {
                if(session.typeentreprises instanceof String) {
                    experiences {
                        eq('typeEntreprise.id', new Long(session.typeentreprises))
                    }
                }
                else
                {
                    experiences {
                        or {
                            for(v in session.typeentreprises) {
                                eq('typeEntreprise.id', new Long(v))
                            }
                        }   
                    }
                }
                
            }
            
            if(session.postes!=null)
            {
                if(session.postes instanceof String) {
                    experiences {
                        eq('poste.id', new Long(session.postes))
                    }
                }
                else
                {
                    experiences {
                        or {
                            for(v in session.postes) {
                                eq('poste.id', new Long(v))
                            }
                        }   
                    }
                }                
            }
            
            if(session.diplomes!=null)
            {
                if(session.diplomes instanceof String) { 
                    formationcandidats {
                        eq('diplome.id', new Long(session.diplomes))
                    }
                }
                else
                {
                    formationcandidats {
                        or {
                            for(v in session.diplomes) {
                                eq('diplome.id', new Long(v))
                            }
                        }   
                    }
                }
                
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
            if(params.order) {
                order(params.sort, params.order)
            }
            resultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
           
        }    
         
        def connections2 = Candidat.createCriteria().list
        {
         
            if((session.nomStockage!=null)&&(!(session.nomStockage.equals(""))))
            {
                ilike("nomStockage",session.nomStockage + "%")
            }
           
            if((session.prenomStockage!=null)&&(!(session.prenomStockage.equals(""))))
            {
                ilike("prenomStockage",session.prenomStockage + "%")
            }
            
            if(session.ageMin != null && !session.ageMin.equals("")) {
                ge('dateNaissance', dma)
            }
                
            if(session.ageMax != null && !session.ageMax.equals("")) {
                le('dateNaissance', dmi)
            }
            if(!session.civilite.equals('null')){
                long j=Long.parseLong(session.civilite)  
                
                eq("civilite.id",j)
            }
            
            if(session.villes!=null)
            {               
                if(session.villes instanceof String) {
                    eq('villecandidat.id', new Long(session.villes))
                }   else {
                    or {
                        for(v in session.villes) {
                            
                            eq('villecandidat.id', new Long(v))
                        }
                    }
                }             
                
            }
            if(session.niveauetudes!=null) {
                if(session.niveauetudes instanceof String) {  
                    eq('niveauEtude.id', new Long(session.niveauetudes))
                }
                else
                {
                    or {
                        for(v in session.niveauetudes) {
                            eq('niveauEtude.id', new Long(v))
                        }
                    }
                }
                
            }
            if(session.plageexperiences!=null)
            { 
                if(session.plageexperiences instanceof String) {  
                    eq('plageExperience.id', new Long(session.plageexperiences))
                }
                else
                {
                    or {
                        for(v in session.plageexperiences) {
                            eq('plageExperience.id', new Long(v))
                        }
                    }
                }
                
            }
         
            if(session.annote!=null)
            {
                eq("annote",true) 
                
            }
            if(!session.sourceInscription.equals('null'))            
            {
                eq('sourceInscription.id', new Long(session.sourceInscription))            
            }
            if(!session.annotation1.equals('null'))
            {           
                eq('annotation1.id', new Long(session.annotation1))
            }
            if(!session.annotation2.equals('null'))
            {                    
                eq('annotation2.id', new Long(session.annotation2))            
            }
            if(!session.profil1.equals('null'))
            {        
                eq('profil1.id', new Long(session.profil1))
            }
            if(!session.profil2.equals('null'))
            {
                eq('profil2.id', new Long(session.profil2))
            }
            if(session.secteuractivites!=null)
            {
                if(session.secteuractivites instanceof String) {
                    experiences {
                        eq('secteurActivite.id', new Long(session.secteuractivites))
                    }
                }
                else
                {
                    experiences {
                        or {
                            for(v in session.secteuractivites) {
                                eq('secteurActivite.id', new Long(v))
                            }
                        }   
                    }
                }
            }
            
            if(session.typeentreprises!=null)
            {
                if(session.typeentreprises instanceof String) {
                    experiences {
                        eq('typeEntreprise.id', new Long(session.typeentreprises))
                    }
                }
                else
                {
                    experiences {
                        or {
                            for(v in session.typeentreprises) {
                                eq('typeEntreprise.id', new Long(v))
                            }
                        }   
                    }
                }
                
            }
            
            if(session.postes!=null)
            {
                if(session.postes instanceof String) {
                    experiences {
                        eq('poste.id', new Long(session.postes))
                    }
                }
                else
                {
                    experiences {
                        or {
                            for(v in session.postes) {
                                eq('poste.id', new Long(v))
                            }
                        }   
                    }
                }                
            }
            
            if(session.diplomes!=null)
            {
                if(session.diplomes instanceof String) { 
                    formationcandidats {
                        eq('diplome.id', new Long(session.diplomes))
                    }
                }
                else
                {
                    formationcandidats {
                        or {
                            for(v in session.diplomes) {
                                eq('diplome.id', new Long(v))
                            }
                        }   
                    }
                }
                
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
           
            if(params.order) {
                order(params.sort, params.order)
            }
            resultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
        }  
        session.connection2=connections2
        List<Candidat> strings2 = session.connection2
        TreeSet<Candidat> lSet1=new TreeSet<Candidat>(strings2);
        int i1=0
        HashMap<Integer,Integer> yourMap1 = new HashMap<Integer,Integer>();
        Iterator<Candidat> it1 = lSet1.iterator();
        while (it1.hasNext()) {
            def can=(Candidat)it1.next()
            int i23 = (int) can.id;
            yourMap1.put(new Integer(i23),new Integer(i1));
            i1++
        }
        session.max=i1
        session.maprecherche1=yourMap1
        
        
        [candidatInstanceList: connections1, candidatInstanceCount: connections2.size(),params:params]
        //[candidatInstanceList: lSet, candidatInstanceCount: count]

    }
    def list(Integer max) {
        if(params.sort==null && params.order==null)
        {
            params.sort="dateCreated"
            params.order="asc"
        }
        if(params.offset==null)
        {
            params.offset=0
        }
        if(params.max==null)
        {
            params.max=10
        }
        Candidat.list(params)
        def paramsini=[offset:0,max:1]
        def resultini = Candidat.list(paramsini)
        def canini=resultini[0]
        session.candidatinitial=resultini[0]
        def gg=canini.id
        def result = Candidat.list(params)
        session.offset1=params.offset
        if(params.offset==null)
        {
            session.mot=params.motCle
        }
        def listcombine=[]
        def listcombine1=[]
        ArrayList candidatids = []
          
        def  candidatattachment=[]
           
        for(can1 in result)
        {
            listcombine.add(can1)
            String strLong = Long.toString(can1.id)
            candidatids.add(strLong)
            listcombine1.add(can1)
        } 
            
        session.resultcombiner=listcombine
        session.resultcombiner1=listcombine1
        session.candidatids=candidatids
        session.order=params.order
        session.sort=params.sort
        params.max=10
        if(params.offset==null)
        {
            params.offset=0
            session.offset=params.offset
        }
        else
        {
            params.offset=params.offset
            session.offset=params.offset
        }
  
        if(params.offset instanceof String)
        {
            params.offset=Integer.parseInt(params.offset) 
            session.offset=params.offset
        }
        int firstresult=params.offset
        int lastresult=params.offset+9
        def tailleResultat = listcombine.size()
        session.order=params.order
        session.sort=params.sort
        if(tailleResultat==0)
        {
            respond Candidat.list(params), model:[candidatInstanceCount: Candidat.count()]
        }
        else
        {
            if(tailleResultat<lastresult )
            {
                lastresult= tailleResultat-1
            }
               
        }  
        respond Candidat.list(params), model:[candidatInstanceCount: Candidat.count()]
    }
    def list_in(Integer max) {
        
        params.max = Math.min(max ?: 10, 100)
        session.href=null
        if(params.offset) {
            session.list_candidat_offset = params.offset
        } else if(session.list_candidat_offset) {
            params.offset = session.list_candidat_offset
        }
        if(params.sort) {
            session.list_candidat_sort = params.sort
            session.list_candidat_order = params.order
        } else if(session.list_candidat_sort) {
            params.sort = session.list_candidat_sort
            params.order = session.list_candidat_order
        }
        if(params.sort==null && params.order==null)
        {
            params.sort="dateCreated"
            params.order="asc"
        }
        def candidatids=[]
        def listcandidats=Candidat.list(params)
        for(candidat in listcandidats)
        {
            String strLong = Long.toString(candidat.id)
            candidatids.add(strLong) 
        }
        session.candidatids=candidatids
        session.resultcombiner=Candidat.list(params)
        session.resultcombiner1=Candidat.list(params)
            
        def  candidatattachment=[]
        def  listcombine=[]
        def  listcombine1=[]
        for(can in Candidat.list())
        {
            listcombine.add(can)
            String strLong = Long.toString(can.id)
            candidatids.add(strLong)
            listcombine1.add(can)
        }
        session.resultcombiner=listcombine
        session.resultcombiner1=listcombine1    
        
        
        respond Candidat.list(params), model:[candidatInstanceCount: Candidat.count()]
    }
    def test(){
        if(params.action.equals("ajout")) {
            listeformationcandidat.add(params)
        } else if(params.action.equals("modification")) {
            listeformationcandidat.set(new Integer(params.index), params)
        } else {
            listeformationcandidat.remove(new Integer(index))
        }
        [c:listeformationcandidat]
    }
    
    def testcheck(){
        
        if(params.state=="checked"){ 
            session.candidatsSelectedList.add(params.value)
            session.candidatsSelectedMap[params.value] = true 
        }
        else {
            session.candidatsSelectedList.remove(params.value)
            session.candidatsSelectedMap[params.value] = false
        }
    }
    def testonglet(){
        session.href=params.value
    }
    def create() {
respond new Candidat(params)
        
    }
    def bindDonnees(candidatInstance, params) {
        try {            
            def dn = new Date(params.dateNaissance)
            bindData(candidatInstance, params, [exclude: 'dateNaissance'])
            bindData(candidatInstance, [dateNaissance : dn], [include: 'dateNaissance'])
        } catch(Exception ex) {println ex}
        bindData(candidatInstance, [firstName : params.nomStockage])
        bindData(candidatInstance, [lastName : params.prenomStockage])    
    }

    def sendmail(){
        if(params.send=="true"){
            try {
                sendMail {
                    bcc params.emails.split(",")
                    from "info@diorh-recrutement.com"
                    replyTo "satisfactionclient@diorh.com" 
                    subject params.sujet
                    html params.message
                }
            } catch(Exception ex) {
                println ex
            }
            session.candidatsSelectedList=[]
            session.candidatsSelectedMap=[:] 

        }
        else{ 
            def emails
            def listemail=[]
            if(session.candidatsSelectedList!=null){
                for(element in session.candidatsSelectedList){
                    def candidat=Candidat.get(element)
                    listemail.add(candidat.email)
                }
                emails=listemail.join(",")
            }
            else{
                emails=""
            }
            [emails:emails]
        }
    }

    @Transactional
    def save(Candidat candidatInstance) 
    {
        def profilcandidat=Profil.findByLibelle("candidat")
        def pwd = PasswordTools.generateRandomPassword(10)
        println("password   "+pwd)
        println("vvvv  "+params.dateNaissance1)
        def map=[:]
        if(params.dateNaissance1!=null && params.dateNaissance1!='null' && params.dateNaissance1!='')
        {
            map=[prenomStockage:params.prenomStockage,nomStockage:params.nomStockage,civilite:params.civilite,situationFamiliale:params.situationFamiliale,dateNaissance:Date.parse("dd/MM/yyyy",params.dateNaissance1),
                lieuNaissance:params.lieuNaissance,telPortable:params.telPortable,telFix:params.telFix,adresse:params.adresse,villecandidat:params.villecandidat,nationalite:params.nationalite,sourceInscription:params.sourceInscription,
                email:params.email,rapportPerformance:params.rapportPerformance,syntheseDiorh:params.syntheseDiorh,niveauEtude:params.niveauEtude,
                remunMontantNet:params.remunMontantNet,remunAvantages:params.remunAvantages,preavis:params.preavis,remunPretention:params.remunPretention,remunNbrMois:params.remunNbrMois,plageExperience:params.plageExperience,
                mobiliteGeographique:params.mobiliteGeographique,mobilite1:params.mobilite1,mobilite2:params.mobilite2,mobilite3:params.mobilite3,
                profil1:params.profil1,annotation1:params.annotation1,profil2:params.profil2,annotation2:params.annotation2,annotationCommentaire:params.annotationCommentaire,
                firstName:params.prenomStockage,lastName:params.nomStockage,username:params.email,password:pwd,obsolute:false,connaissancesInfo:params.connaissancesInfo,profil:profilcandidat,enabled: true,adresseIp:"*"]

        }
        else
        {
            map=[prenomStockage:params.prenomStockage,nomStockage:params.nomStockage,civilite:params.civilite,situationFamiliale:params.situationFamiliale,dateNaissance:null,
                lieuNaissance:params.lieuNaissance,telPortable:params.telPortable,telFix:params.telFix,adresse:params.adresse,villecandidat:params.villecandidat,nationalite:params.nationalite,sourceInscription:params.sourceInscription,
                email:params.email,rapportPerformance:params.rapportPerformance,syntheseDiorh:params.syntheseDiorh,niveauEtude:params.niveauEtude,
                remunMontantNet:params.remunMontantNet,remunAvantages:params.remunAvantages,preavis:params.preavis,remunPretention:params.remunPretention,remunNbrMois:params.remunNbrMois,plageExperience:params.plageExperience,
                mobiliteGeographique:params.mobiliteGeographique,mobilite1:params.mobilite1,mobilite2:params.mobilite2,mobilite3:params.mobilite3,
                profil1:params.profil1,annotation1:params.annotation1,profil2:params.profil2,annotation2:params.annotation2,annotationCommentaire:params.annotationCommentaire,
                firstName:params.prenomStockage,lastName:params.nomStockage,username:params.email,password:pwd,obsolute:false,connaissancesInfo:params.connaissancesInfo,profil:profilcandidat,enabled: true,adresseIp:"*"]
 
        }
        def candidat=new Candidat(map)
       
        for(int i=0;i<params.int('addlangue');i++)
        {
            if(params.get("connaissanceLinguistiques["+i+"]")!=null)
            {
                candidat.addToConnaissanceLinguistiques(params.get("connaissanceLinguistiques["+i+"]"))
            }
        }
        
        for(int i=0;i<params.int('addtest');i++)
        {
            if(params.get("tests["+i+"]")!=null)
            {
                def maptest=params.get("tests["+i+"]")
                maptest.dateTest=Date.parse("dd/MM/yyyy",maptest.dateTest)
                candidat.addToTests(maptest)
            }
        }
        
        for(int i=0;i<params.int('addformationcandidat');i++)
        {
            if(params.get("formationcandidats["+i+"]")!=null)
            {
                def mapformationcandidat=params.get("formationcandidats["+i+"]")
                candidat.addToFormationcandidats(mapformationcandidat)
            }
        }
        
        for(int i=0;i<params.int('addexperience');i++)
        {
            if(params.get("experiences["+i+"]")!=null)
            {
                def mapexperience=params.get("experiences["+i+"]")
                mapexperience.dateDebut=Date.parse("dd/MM/yyyy",mapexperience.dateDebut)
                if(!mapexperience.dateFin.equals(""))
                {
                    
                    mapexperience.dateFin=Date.parse("dd/MM/yyyy",mapexperience.dateFin) 
                }
              
                candidat.addToExperiences(mapexperience)
            }
        }
        candidat.save(failOnError:true,flush:true)
        attachUploadedFilesTo(candidat)
        if(session.user!=null){
            flash.message = message(code: 'default.createdmessage.message',default: "L'objet a été crée")   
        }
        else{
            flash.message = message(code: 'default.createdinscription.message',default: "Votre inscription a été faite; merci de vérifier votre boite pour récupérer votre mot de passe.")
        }
        mailinscription(candidat, pwd)
        redirect(action: "show", id:candidat.id)
      
    }

    def edit(Candidat candidatInstance) {
        respond candidatInstance
    }

    @Transactional
    def update() {
        def map=[:]
         if(params.dateNaissance1!=null && params.dateNaissance1!='null' && params.dateNaissance1!='')
        {
            map=[id:params.id,prenomStockage:params.prenomStockage,nomStockage:params.nomStockage,civilite:params.civilite,situationFamiliale:params.situationFamiliale,dateNaissance:Date.parse("dd/MM/yyyy",params.dateNaissance1),
            lieuNaissance:params.lieuNaissance,telPortable:params.telPortable,telFix:params.telFix,adresse:params.adresse,villecandidat:params.villecandidat,nationalite:params.nationalite,sourceInscription:params.sourceInscription,
            email:params.email,rapportPerformance:params.rapportPerformance,syntheseDiorh:params.syntheseDiorh,niveauEtude:params.niveauEtude,
            remunMontantNet:params.remunMontantNet,remunAvantages:params.remunAvantages,preavis:params.preavis,remunPretention:params.remunPretention,remunNbrMois:params.remunNbrMois,plageExperience:params.plageExperience,
            mobiliteGeographique:params.mobiliteGeographique,mobilite1:params.mobilite1,mobilite2:params.mobilite2,mobilite3:params.mobilite3,
            profil1:params.profil1,annotation1:params.annotation1,profil2:params.profil2,annotation2:params.annotation2,annotationCommentaire:params.annotationCommentaire,obsolute:false,connaissancesInfo:params.connaissancesInfo]

        }
        else
        {
            map=[id:params.id,prenomStockage:params.prenomStockage,nomStockage:params.nomStockage,civilite:params.civilite,situationFamiliale:params.situationFamiliale,dateNaissance:null,
            lieuNaissance:params.lieuNaissance,telPortable:params.telPortable,telFix:params.telFix,adresse:params.adresse,villecandidat:params.villecandidat,nationalite:params.nationalite,sourceInscription:params.sourceInscription,
            email:params.email,rapportPerformance:params.rapportPerformance,syntheseDiorh:params.syntheseDiorh,niveauEtude:params.niveauEtude,
            remunMontantNet:params.remunMontantNet,remunAvantages:params.remunAvantages,preavis:params.preavis,remunPretention:params.remunPretention,remunNbrMois:params.remunNbrMois,plageExperience:params.plageExperience,
            mobiliteGeographique:params.mobiliteGeographique,mobilite1:params.mobilite1,mobilite2:params.mobilite2,mobilite3:params.mobilite3,
            profil1:params.profil1,annotation1:params.annotation1,profil2:params.profil2,annotation2:params.annotation2,annotationCommentaire:params.annotationCommentaire,obsolute:false,connaissancesInfo:params.connaissancesInfo]

        }
        def candidat=Candidat.get(map.id)
        candidat.properties = map
        candidat.connaissanceLinguistiques.clear()
        candidat.tests.clear()
        candidat.formationcandidats.clear()
        candidat.experiences.clear()
        for(int i=0;i<params.int('addlangue');i++)
        {
            if(params.get("connaissanceLinguistiques["+i+"]")!=null)
            {
                if(params.get("connaissanceLinguistiques["+i+"]").deleted!="true")
                {
                    candidat.addToConnaissanceLinguistiques(params.get("connaissanceLinguistiques["+i+"]"))
                }               
            }
        }

        for(int i=0;i<params.int('addtest');i++)
        {
            if(params.get("tests["+i+"]")!=null)
            {
                if(params.get("tests["+i+"]").deleted!="true")
                {
                    def maptest=params.get("tests["+i+"]")
                    maptest.dateTest=Date.parse("dd/MM/yyyy",maptest.dateTest)
                    candidat.addToTests(maptest)
                }               
            }
        }
        
        for(int i=0;i<params.int('addformationcandidat');i++)
        {
            if(params.get("formationcandidats["+i+"]")!=null)
            {
                def mapformationcandidat=params.get("formationcandidats["+i+"]")
                candidat.addToFormationcandidats(mapformationcandidat)
            }
        }
        
        for(int i=0;i<params.int('addexperience');i++)
        {
            if(params.get("experiences["+i+"]")!=null)
            {
                def mapexperience=params.get("experiences["+i+"]")
                mapexperience.dateDebut=Date.parse("dd/MM/yyyy",mapexperience.dateDebut)
                if(!mapexperience.dateFin.equals(""))
                {
                    mapexperience.dateFin=Date.parse("dd/MM/yyyy",mapexperience.dateFin)
                }
                
                candidat.addToExperiences(mapexperience)
            }
        }
        
        candidat.save(failOnError:true,flush:true)
        attachUploadedFilesTo(candidat)
        flash.message = message(code: 'default.updatedmessage',default: "L'objet a été modifié")
        redirect(action: "show", id:params.id)
    }

    @Transactional
    def delete(Candidat candidatInstance) {

        if (candidatInstance == null) {
            notFound()
            return
        }

        candidatInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deletedmessage',default: "L'objet a été supprimé")
                redirect action:"list", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
   
    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'candidatInstance.label', default: 'Candidat'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    
    @Transactional
    def checkemail() {
        def candidat=Candidat.findByEmail(params.email)
        if(candidat!=null)
        {
            render "true"
        }
        else{
            render "false"
        }
    }
    
    @Transactional
    def list_recherche1(RechercheCandidat rechercheCandidatInstance) 
    { 
          
        /////////ajouter dernierement
        session.resultcombiner=null   
        /////////////fin ajouter
        def nomb=false
        if((params.nomStockage==null)||((params.nomStockage.equals(""))))
        {
             
            nomb=true
        }
        def prenomb=false
        if((params.prenomStockage==null)||((params.prenomStockage.equals(""))))
        {
                 
            prenomb=true
        }
        def ageminb=false
        if(params.ageMin == null || params.ageMin.equals("")) {
                 
            ageminb=true
        }
        def agemaxb=false  
        if(params.ageMax == null || params.ageMax.equals("")) {
               
                
            agemaxb=true
        }
        def civib=false
        if(!params.civilite.equals('null')){
            
                
            civib=true
        }
            
        def villeb=false
        if(params.villes==null)
        {  
                 
            villeb=true
        }
        def nivb=false
        if(params.niveauetudes==null) {
                
            nivb=true
        }
        def plab=false
        if(params.plageexperiences==null)
        {
                
            plab=true
        }
        def annoteb=false
        if(params.annote==null)
        {
                
            annoteb=true
        }
        def sourb=false
        if(params.sourceInscription.id.equals('null'))            
        {
                    
            sourb=true
        }
        def anno1b=false
        if(params.annotation1.id.equals('null'))
        {            
                 
            anno1b=true
        }
        def anno2b=false
        if(params.annotation2.id.equals('null'))
        {                    
                
            anno2b=true
        }
        def pro2b=false
        if(params.profil2.id.equals('null'))
        {           
            pro2b=true
        }
        def pro1b=false
        if(params.profil1.id.equals('null'))
        {
                
            pro1b=true
        }
            
        def secb=false
        if(params.secteuractivites==null)
        {
                 
            secb=true
        }
        def typeb=false
        if(params.typeentreprises==null)
        {
                
            typeb=true
        }
        def posteb=false
        if(params.postes==null)
        {
                
            posteb=true
        }
        def diplomeb=false
        if(params.diplomes==null)
        {
                
            diplomeb=true
        }
        
        //        if(((session.nomStockage=null)||(session.nomStockage.equals(""))) && ((session.prenomStockage==null)||(session.prenomStockage.equals(""))) && (session.ageMin == null || session.ageMin.equals("")) && (session.ageMax == null || session.ageMax.equals(""))&&(session.civilite.equals('null')) && (session.villes==null) && (session.niveauetudes==null) && (session.plageexperiences==null)&& (session._annote==null) &&(session.sourceInscription.equals('null')) && (session.annotation1.equals('null')) && (session.annotation2.equals('null')) && (session.profil1.equals('null')) && (session.profil2.equals('null')) && (session.secteuractivites==null) && (session.typeentreprises==null) && (session.postes==null) && (session.diplomes==null))
        //           
        //            
        //        {
        //                
        //        }
        //           
        //        
        //        if(((params.nomStockage=null)||(params.nomStockage.equals(""))) && ((params.prenomStockage==null)||(params.prenomStockage.equals(""))) && (params.ageMin == null || params.ageMin.equals("")))
        //        {
        //                
        //        }
        if(session.candidatsshow== null) {
            session.candidatsshow= []          
        }
        if(session.candidatsSelectedList == null) {
            session.candidatsSelectedList= []
            session.candidatsSelectedMap= [:]          
        }
        if(params.offset) {
            session.list_recherche_offset = params.offset
        } else if(session.list_recherche_offset) {
            params.offset = session.list_recherche_offset
        }
        if(params.sort) {
            session.list_recherche_sort = params.sort
            session.list_recherche_order = params.order
        } else if(session.list_recherche_sort) {
            params.sort = session.list_recherche_sort
            params.order = session.list_recherche_order
        }
        if(params.motCle == null || params.motCle.trim().equals("")) 
        {          
            if(params.offset==null)
            {
                params.offset=0
            }
            params.max=10
            session.typeentreprises=params.typeentreprises
            session.libellerecherche=params.libellerecherche
            session.civilite=params.civilite.id
            session.profil1=params.profil1.id
            session.profil2=params.profil2.id
            session.annotation1=params.annotation1.id
            session.annotation2=params.annotation2.id
            session.annote=params.annote
            session.sourceInscription=params.sourceInscription.id
            session.villes=params.villes
            session.niveauetudes=params.niveauetudes
            session.diplomes=params.diplomes
            session.postes=params.postes
            session.secteuractivites=params.secteuractivites
            session.plageexperiences=params.plageexperiences
            session.nomStockage=params.nomStockage
            session.prenomStockage=params.prenomStockage
            session.ageMin=params.ageMin
            session.ageMax=params.ageMax
            session.idrecherchecandidat=params.id
            if(params.motCle==null)
            {
                session.motCle=''  
            }
            else
            {
                session.motCle=params.motCle 
            }
            session.type="n"
            redirect(controller:"candidat", action:"list_recherche",params:params) 
            
        } 
        else if((params.motCle != null || !params.motCle.trim().equals("")) && nomb==true && prenomb==true && ageminb==true && agemaxb==true && civib==true && villeb==true && nivb==true && plab==true && annoteb==true && sourb==true && anno1b==true && anno2b==true && pro2b==true && pro1b==true && secb==true && typeb==true && posteb==true && diplomeb==true)
        {
            if(session.candidatsSelectedList == null) {
                session.candidatsSelectedList= []
                session.candidatsSelectedMap= [:]          
            }
            if(params.motCle==null)
            {
                session.motCle=''  
            }
            else
            {
                session.motCle=params.motCle 
            }
            session.type="mc"
            redirect(controller:"candidat", action:"result_recherche_motcle",params: [motCle: params.motCle,mot:true]) 
            //return new ModelAndView("/candidat/result_recherche_motcle", [searchResult : result])
             
        }
        else
        {
            
            session.typeentreprises=params.typeentreprises
            session.libellerecherche=params.libellerecherche
            session.civilite=params.civilite.id
            session.profil1=params.profil1.id
            session.profil2=params.profil2.id
            session.annotation1=params.annotation1.id
            session.annotation2=params.annotation2.id
            session.annote=params.annote
            session.sourceInscription=params.sourceInscription.id
            session.villes=params.villes
            session.niveauetudes=params.niveauetudes
            session.diplomes=params.diplomes
            session.postes=params.postes
            session.secteuractivites=params.secteuractivites
            session.plageexperiences=params.plageexperiences
            session.nomStockage=params.nomStockage
            session.prenomStockage=params.prenomStockage
            session.ageMin=params.ageMin
            session.ageMax=params.ageMax
            if(params.motCle==null)
            {
                session.motCle=''  
            }
            else
            {
                session.motCle=params.motCle 
            }
            session.idrecherchecandidat=params.id
            session.type="c"
            redirect(controller:"candidat", action:"list_recherche_combiner",params:params) 
             
        }
        
    }

    def download = {
        
        if (!params.containsKey('inline')) {
            params.inline = ''
        }
        if (!params.containsKey('withContentType')) {
            params.withContentType = ''
        }
        
        Attachment attachment = Attachment.get(params.id as Long)

        if (attachment) {
            File file = AttachmentableUtil.getFile(CH.config, attachment)

            if (file.exists()) {
                String filename = attachment.filename /*.replaceAll(/\s/, '_')*/

                ['Content-disposition': "${params.containsKey('inline') ? 'inline' : 'attachment'};filename=\"$filename\"",
                'Cache-Control': 'private',
                'Pragma': ''].each {k, v ->
                    response.setHeader(k, v)
                }

                if (params.containsKey('withContentType')) {
                    response.contentType = attachment.contentType                    
                } else {
                    response.contentType = 'application/octet-stream'
                }
                file.withInputStream{fis->
                    response.outputStream << fis
                }
                return
            }
        }

        response.status = HttpServletResponse.SC_NOT_FOUND
    }
    
    def create_recherche() {
        if(params.id!=null)
        {
            respond RechercheCandidat.get(params.id)
        }
        else
        { 
            if(params.retour=='retour')
            {
                if(session.type=='n')
                {
                    def map=[typeentreprises:session.typeentreprises,libellerecherche:session.libellerecherche,civilite:session.civilite,profil1:session.profil1,
                        profil2:session.profil2,annotation1:session.annotation1,annotation2:session.annotation2,annote:session.annote,sourceInscription:session.sourceInscription,
                        villes:session.villes,niveauetudes:session.niveauetudes,diplomes:session.diplomes,postes:session.postes,secteuractivites:session.secteuractivites,
                        plageexperiences:session.plageexperiences,nomStockage:session.nomStockage,prenomStockage:session.prenomStockage,ageMin:session.ageMin,ageMax:session.ageMax]
                    def vv=new RechercheCandidat(map)
                    render(view:"create_recherche",model:[rechercheCandidatInstance:new RechercheCandidat(map)])  
                }
                else if(session.type=='c')
                { 
                    def map=[typeentreprises:session.typeentreprises,libellerecherche:session.libellerecherche,civilite:session.civilite,profil1:session.profil1,
                        profil2:session.profil2,annotation1:session.annotation1,annotation2:session.annotation2,annote:session.annote,sourceInscription:session.sourceInscription,
                        villes:session.villes,niveauetudes:session.niveauetudes,diplomes:session.diplomes,postes:session.postes,secteuractivites:session.secteuractivites,
                        plageexperiences:session.plageexperiences,nomStockage:session.nomStockage,prenomStockage:session.prenomStockage,ageMin:session.ageMin,ageMax:session.ageMax,motCle:session.motCle]
                    def vv=new RechercheCandidat(map)
                    render(view:"create_recherche",model:[rechercheCandidatInstance:new RechercheCandidat(map)]) 
                }
                else if(session.type=='mc')
                {
                    def map=[motCle:session.motCle]
                    def vv=new RechercheCandidat(map)
                    render(view:"create_recherche",model:[rechercheCandidatInstance:new RechercheCandidat(map)])
                }

           
            
           
            }
            else
            {
                respond new RechercheCandidat(params)
            }
        }
    }
    
    def create_recherche1() {
        def candidat=Candidat.get(716)
        session.candidatsaffecter=[]
        if((params.ff=='false') && (params.id1!='null'))
        {
            def rechcan=RechercheCandidat.get(params.id1)
            render(view:"create_recherche",model:[rechercheCandidatInstance:rechcan])
        }
        else if((params.ff=='true') && (params.id1=='null'))
        {
            if(session.motcles!=null)
            {
                def params=[:]
                params.motCle=session.motCle
                respond new RechercheCandidat(params)
                
            }
            else
            {
                if(session.type=='n')
                {
                    def map=[typeentreprises:session.typeentreprises,libellerecherche:session.libellerecherche,civilite:session.civilite,profil1:session.profil1,
                        profil2:session.profil2,annotation1:session.annotation1,annotation2:session.annotation2,annote:session.annote,sourceInscription:session.sourceInscription,
                        villes:session.villes,niveauetudes:session.niveauetudes,diplomes:session.diplomes,postes:session.postes,secteuractivites:session.secteuractivites,
                        plageexperiences:session.plageexperiences,nomStockage:session.nomStockage,prenomStockage:session.prenomStockage,ageMin:session.ageMin,ageMax:session.ageMax]
                    def vv=new RechercheCandidat(map)
                    render(view:"create_recherche",model:[rechercheCandidatInstance:new RechercheCandidat(map)])  
                }
                else if(session.type=='c')
                { 
                    def map=[typeentreprises:session.typeentreprises,libellerecherche:session.libellerecherche,civilite:session.civilite,profil1:session.profil1,
                        profil2:session.profil2,annotation1:session.annotation1,annotation2:session.annotation2,annote:session.annote,sourceInscription:session.sourceInscription,
                        villes:session.villes,niveauetudes:session.niveauetudes,diplomes:session.diplomes,postes:session.postes,secteuractivites:session.secteuractivites,
                        plageexperiences:session.plageexperiences,nomStockage:session.nomStockage,prenomStockage:session.prenomStockage,ageMin:session.ageMin,ageMax:session.ageMax,motCle:session.motCle]
                    def vv=new RechercheCandidat(map)
                    render(view:"create_recherche",model:[rechercheCandidatInstance:new RechercheCandidat(map)]) 
                }
                else if(session.type=='mc')
                {
                    def map=[motCle:session.motCle]
                    def vv=new RechercheCandidat(map)
                    render(view:"create_recherche",model:[rechercheCandidatInstance:new RechercheCandidat(map)])
                }

           
            }
           
        }
        else if((params.id1!=null)&&(params.ff==null)){
            def rechercheCandidatInstance=RechercheCandidat.get(params.id)
            [rechercheCandidatInstance:rechercheCandidatInstance]
        }
        else if(params.id==null && params.ff==null && params.etape!=null)
        {

            if(session.type=='n')
            {
                def map=[typeentreprises:session.typeentreprises,libellerecherche:session.libellerecherche,civilite:session.civilite,profil1:session.profil1,
                    profil2:session.profil2,annotation1:session.annotation1,annotation2:session.annotation2,annote:session.annote,sourceInscription:session.sourceInscription,
                    villes:session.villes,niveauetudes:session.niveauetudes,diplomes:session.diplomes,postes:session.postes,secteuractivites:session.secteuractivites,
                    plageexperiences:session.plageexperiences,nomStockage:session.nomStockage,prenomStockage:session.prenomStockage,ageMin:session.ageMin,ageMax:session.ageMax]
                def vv=new RechercheCandidat(map)
                render(view:"create_recherche",model:[rechercheCandidatInstance:new RechercheCandidat(map)])  
            }
            else if(session.type=='c')
            {
                def map=[typeentreprises:session.typeentreprises,libellerecherche:session.libellerecherche,civilite:session.civilite,profil1:session.profil1,
                    profil2:session.profil2,annotation1:session.annotation1,annotation2:session.annotation2,annote:session.annote,sourceInscription:session.sourceInscription,
                    villes:session.villes,niveauetudes:session.niveauetudes,diplomes:session.diplomes,postes:session.postes,secteuractivites:session.secteuractivites,
                    plageexperiences:session.plageexperiences,nomStockage:session.nomStockage,prenomStockage:session.prenomStockage,ageMin:session.ageMin,ageMax:session.ageMax,motCle:session.motCle]
                def vv=new RechercheCandidat(map)
                render(view:"create_recherche",model:[rechercheCandidatInstance:new RechercheCandidat(map)]) 
            }
            else if(session.type=='mc')
            {
                def map=[motCle:session.motCle]
                def vv=new RechercheCandidat(map)
                render(view:"create_recherche",model:[rechercheCandidatInstance:new RechercheCandidat(map)])
            }

        }
        else
        {
            respond new RechercheCandidat(params)
        }
    }
    
    @Transactional
    def deletefile() {
        def c = Candidat.get(Integer.parseInt(params.id))
        c.removeAttachment(Integer.parseInt(params.idfile))
        render true
    }
    
    @Transactional
    def list_recherche2(RechercheCandidat rechercheCandidatInstance) {
        
        
        if(params.offset) {
            session.list_recherche_offset = params.offset
        } else if(session.list_recherche_offset) {
            params.offset = session.list_recherche_offset
        }
        if(params.sort) {
            session.list_recherche_sort = params.sort
            session.list_recherche_order = params.order
        } else if(session.list_recherche_sort) {
            params.sort = session.list_recherche_sort
            params.order = session.list_recherche_order
        }
        
        if(params.motCle == null || params.motCle.trim().equals("")) 
        {
            if (rechercheCandidatInstance == null) {
                notFound()
                return
            }

            if (rechercheCandidatInstance.hasErrors()) {
                respond rechercheCandidatInstance.errors, view:'create_recherche_visualiser'
                return
            }
           
          
            if(params.offset==null)
            {
                params.offset=0
            }
            params.max=10
            
            session.typeentreprises=params.typeentreprises
            session.libellerecherche=params.libellerecherche
            session.civilite=params.civilite.id
            session.profil1=params.profil1.id
            session.profil2=params.profil2.id
            session.annotation1=params.annotation1.id
            session.annotation2=params.annotation2.id
            if(params.annote==null)
            {
                session.annote="off"
            }
            else
            {
                session.annote="on"
            }
            session.sourceInscription=params.sourceInscription.id
            session.villes=params.villes
            session.niveauetudes=params.niveauetudes
            session.diplomes=params.diplomes
            session.postes=params.postes
            session.secteuractivites=params.secteuractivites
            session.plageexperiences=params.plageexperiences
            session.nomStockage=params.nomStockage
            session.prenomStockage=params.prenomStockage
            session.ageMin=params.ageMin
            session.ageMax=params.ageMax
            
            redirect(action:"list_recherche_candidat",params:[rechercheCandidatInstance:rechercheCandidatInstance],id:rechercheCandidatInstance.id)
            //                   params:[author:"Stephen King"]
        } else {
            def result = searchableService.search(params.motCle, params)   
            return new ModelAndView("/candidat/result_recherche_motcle", [searchResult : result])   
        }
    }
    
    def list_recherche_candidat() { 
        if(params.offset==null)
        {
            params.offset=0
        }
        if(params.max==null)
        {
            params.max=10
        }
        
        Date now = new Date();            
        if(session.ageMin!=null)
        {
            if(!session.ageMin.equals(""))
            {
                Calendar calmin = Calendar.getInstance();
                calmin.setTime(now);
                int year = calmin.get(Calendar.YEAR) - Integer.parseInt(session.ageMin);
                calmin.set(Calendar.YEAR, year)
                dmi=calmin.getTime();
               
            }
        }
        if(session.ageMax!=null)
        {
            if(!session.ageMax.equals(""))
            {
                Calendar calmax = Calendar.getInstance();
                calmax.setTime(now);
                int year = calmax.get(Calendar.YEAR) - Integer.parseInt(session.ageMax);
                calmax.set(Calendar.YEAR, year)
                dma=calmax.getTime();  
            }
        }
       
        if(params.offset==null)
        {
            params.offset=0
        }
        params.max=10
       
        def rechcand=RechercheCandidat.get(session.rechcan)
        session.rechcan=rechcand
        if(params.sort==null)
        {
            params.sort="dateCreated"
           
        }
        if(params.order==null)
        {
            params.order="asc"
             
        }
        def c=Candidat.createCriteria()
        def connections1 = Candidat.createCriteria().list(max: params.max, offset: params.offset)
        {
         
            if((session.nomStockage!=null)&&(!(session.nomStockage.equals(""))))
            {
                ilike("nomStockage",session.nomStockage + "%")
            }
           
            if((session.prenomStockage!=null)&&(!(session.prenomStockage.equals(""))))
            {
                ilike("prenomStockage",session.prenomStockage + "%")
               
            }
            
            if(session.ageMin != null && !session.ageMin.equals("")) {
                ge('dateNaissance', dma)
            }
                
            if(session.ageMax != null && !session.ageMax.equals("")) {
                le('dateNaissance', dmi)
               
            }
            if(!session.civilite.equals('null')){
            
                long j=Long.parseLong(session.civilite)  
                
                eq("civilite.id",j)
            }
            
            if(session.villes!=null)
            {                
                if(session.villes instanceof String) {
                    eq('villecandidat.id', new Long(session.villes))
                }   else {
                    or {
                        for(v in session.villes) {
                            
                            eq('villecandidat.id', new Long(v))
                        }
                    }
                }             
                
            }
            if(session.niveauetudes!=null) {
                if(session.niveauetudes instanceof String) {  
                    eq('niveauEtude.id', new Long(session.niveauetudes))
                }
                else
                {
                    or {
                        for(v in session.niveauetudes) {
                            eq('niveauEtude.id', new Long(v))
                        }
                    }
                }
                
            }
            if(session.plageexperiences!=null)
            {
                if(session.plageexperiences instanceof String) {  
                    eq('plageExperience.id', new Long(session.plageexperiences)) 
                }
                else
                {
                    or {
                        for(v in session.plageexperiences) {
                            eq('plageExperience.id', new Long(v))
                        }
                    }
                }
                
            }
            if(session.annote!=null)
            {
                eq("annote",true) 
                
            }
            //            if(session.annote==null)
            //            {
            //                eq("annote",false) 
            //            }
            //            else
            //            {
            //                eq("annote",true)
            //            }
            if(!session.sourceInscription.equals('null'))            
            {
                eq('sourceInscription.id', new Long(session.sourceInscription))            
            }
            if(!session.annotation1.equals('null'))
            {            
                eq('annotation1.id', new Long(session.annotation1))
            }
            if(!session.annotation2.equals('null'))
            {                    
                eq('annotation2.id', new Long(session.annotation2))            
            }
            if(!session.profil1.equals('null'))
            {           
                eq('profil1.id', new Long(session.profil1))
            }
            if(!session.profil2.equals('null'))
            {
                eq('profil2.id', new Long(session.profil2))
            }
            if(session.secteuractivites!=null)
            {
                if(session.secteuractivites instanceof String) {
                    experiences {
                        eq('secteurActivite.id', new Long(session.secteuractivites))
                    }
                }
                else
                {
                    experiences {
                        or {
                            for(v in session.secteuractivites) {
                                eq('secteurActivite.id', new Long(v))
                            }
                        }   
                    }
                }
            }
            
            if(session.typeentreprises!=null)
            {
                if(session.typeentreprises instanceof String) {
                    experiences {
                        eq('typeEntreprise.id', new Long(session.typeentreprises))
                    }
                }
                else
                {
                    experiences {
                        or {
                            for(v in session.typeentreprises) {
                                eq('typeEntreprise.id', new Long(v))
                            }
                        }   
                    }
                }
                
            }
            
            if(session.postes!=null)
            {
                if(session.postes instanceof String) {
                    experiences {
                        eq('poste.id', new Long(session.postes))
                    }
                }
                else
                {
                    experiences {
                        or {
                            for(v in session.postes) {
                                eq('poste.id', new Long(v))
                            }
                        }   
                    }
                }                
            }
            
            if(session.diplomes!=null)
            {
                if(session.diplomes instanceof String) { 
                    formationcandidats {
                       
                        eq('diplome.id', new Long(session.diplomes))
                    }
                }
                else
                {
                    formationcandidats {
                        or {
                            for(v in session.diplomes) {
                                eq('diplome.id', new Long(v))
                            }
                        }   
                    }
                }
                
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
            //            params.sort="dateCreated"
            //            params.order="asc"
            if(params.order) {
                order(params.sort, params.order)
            }
            //            projections {
            //        distinct "id"
            //    }
         
        }  
        session.connection1=connections1
        List<Candidat> strings1 = session.connection1
        TreeSet<Candidat> lSet=new TreeSet<Candidat>(strings1);
        def connections2 = Candidat.createCriteria().list()
        {
         
            if((session.nomStockage!=null)&&(!(session.nomStockage.equals(""))))
            {
                ilike("nomStockage",session.nomStockage + "%")
            }
           
            if((session.prenomStockage!=null)&&(!(session.prenomStockage.equals(""))))
            {
                ilike("prenomStockage",session.prenomStockage + "%")
            }
            
            if(session.ageMin != null && !session.ageMin.equals("")) {
                ge('dateNaissance', dma)
            }
                
            if(session.ageMax != null && !session.ageMax.equals("")) {
                le('dateNaissance', dmi)
            }
            if(!session.civilite.equals('null')){
                long j=Long.parseLong(session.civilite)  
                
                eq("civilite.id",j)
            }
            
            if(session.villes!=null)
            {               
                if(session.villes instanceof String) {
                    eq('villecandidat.id', new Long(session.villes))
                }   else {
                    or {
                        for(v in session.villes) {
                            
                            eq('villecandidat.id', new Long(v))
                        }
                    }
                }             
                
            }
            if(session.niveauetudes!=null) {
                if(session.niveauetudes instanceof String) {  
                    eq('niveauEtude.id', new Long(session.niveauetudes))
                }
                else
                {
                    or {
                        for(v in session.niveauetudes) {
                            eq('niveauEtude.id', new Long(v))
                        }
                    }
                }
                
            }
            if(session.plageexperiences!=null)
            { 
                if(session.plageexperiences instanceof String) {  
                    eq('plageExperience.id', new Long(session.plageexperiences))
                  
                }
                else
                {
                    or {
                        for(v in session.plageexperiences) {
                            eq('plageExperience.id', new Long(v))
                        }
                    }
                }
                
            }
         
            if(session.annote!=null)
            {
                eq("annote",true) 
                
            }
   
            if(!session.sourceInscription.equals('null'))            
            {
                eq('sourceInscription.id', new Long(session.sourceInscription))            
            }
            if(!session.annotation1.equals('null'))
            {           
                eq('annotation1.id', new Long(session.annotation1))
            }
            if(!session.annotation2.equals('null'))
            {                    
                eq('annotation2.id', new Long(session.annotation2))            
            }
            if(!session.profil1.equals('null'))
            {        
                eq('profil1.id', new Long(session.profil1))
            }
            if(!session.profil2.equals('null'))
            {
                eq('profil2.id', new Long(session.profil2))
            }
            if(session.secteuractivites!=null)
            {
                if(session.secteuractivites instanceof String) {
                    experiences {
                        eq('secteurActivite.id', new Long(session.secteuractivites))
                    }
                }
                else
                {
                    experiences {
                        or {
                            for(v in session.secteuractivites) {
                                eq('secteurActivite.id', new Long(v))
                            }
                        }   
                    }
                }
            }
            
            if(session.typeentreprises!=null)
            {
                if(session.typeentreprises instanceof String) {
                    experiences {
                        eq('typeEntreprise.id', new Long(session.typeentreprises))
                    }
                }
                else
                {
                    experiences {
                        or {
                            for(v in session.typeentreprises) {
                                eq('typeEntreprise.id', new Long(v))
                            }
                        }   
                    }
                }
                
            }
            
            if(session.postes!=null)
            {
                if(session.postes instanceof String) {
                    experiences {
                        eq('poste.id', new Long(session.postes))
                    }
                }
                else
                {
                    experiences {
                        or {
                            for(v in session.postes) {
                                eq('poste.id', new Long(v))
                            }
                        }   
                    }
                }                
            }
            
            if(session.diplomes!=null)
            {
                
                if(session.diplomes instanceof String) { 
                    formationcandidats {
                       
                        eq('diplome.id', new Long(session.diplomes))
                    }
                }
                else
                {
                    formationcandidats {
                        or {
                            for(v in session.diplomes) {
                                eq('diplome.id', new Long(v))
                            }
                        }   
                    }
                }
                
            }
            
            //            params.sort="dateCreated"
            //            params.order="asc"
            if(params.order) {
                order(params.sort, params.order)
            }
            //         projections 
            //            {
            //        distinct "id"
            //             }
        }    
        
        session.connection2=connections2
        
        List<Candidat> strings2 = session.connection2
        TreeSet<Candidat> lSet1=new TreeSet<Candidat>(strings2);
        int i1=0
        HashMap<Integer,Integer> yourMap1 = new HashMap<Integer,Integer>();
        
        session.maprecherche1=yourMap1
        
        def criterCount = Candidat.createCriteria()
        def count = criterCount.count {
            if((session.nomStockage!=null)&&(!(session.nomStockage.equals(""))))
            {
                ilike("nomStockage",session.nomStockage + "%")
            }
           
            if((session.prenomStockage!=null)&&(!(session.prenomStockage.equals(""))))
            {
                ilike("prenomStockage",session.prenomStockage + "%")
                
            }
            
            if(session.ageMin != null && !session.ageMin.equals("")) {
                ge('dateNaissance', dma)
                
            }
                
            if(session.ageMax != null && !session.ageMax.equals("")) {
                le('dateNaissance', dmi)
               
            }
            if(!session.civilite.equals('null')){
                
                long j=Long.parseLong(session.civilite)  
                eq("civilite.id",j)
            }
            
            if(session.villes!=null)
            {                
                if(session.villes instanceof String) {
                    eq('villecandidat.id', new Long(session.villes))
                }   else {
                    or {
                        for(v in session.villes) {
                            eq('villecandidat.id', new Long(v))
                        }
                    }
                }             
                
            }
            if(session.niveauetudes!=null) {
                if(session.niveauetudes instanceof String) {  
                    eq('niveauEtude.id', new Long(session.niveauetudes))
                }
                else
                {
                    or {
                        for(v in session.niveauetudes) {
                            eq('niveauEtude.id', new Long(v))
                        }
                    }
                }
                
            }
            if(session.plageexperiences!=null)
            {
                if(session.plageexperiences instanceof String) {  
                    eq('plageExperience.id', new Long(session.plageexperiences)) 
                }
                else
                {
                    or {
                        for(v in session.plageexperiences) {
                            eq('plageExperience.id', new Long(v))
                        }
                    }
                }
                
            }
            if(session.annote!=null)
            {
                eq("annote",true) 
                
            }
            //            if(session.annote==null)
            //            {
            //                eq("annote",false) 
            //            }
            //            else
            //            {
            //                eq("annote",true)
            //            }
            if(!session.sourceInscription.equals('null'))            
            {
                eq('sourceInscription.id', new Long(session.sourceInscription))            
            }
            if(!session.annotation1.equals('null'))
            {            
                eq('annotation1.id', new Long(session.annotation1))
            }
            if(!session.annotation2.equals('null'))
            {                    
                eq('annotation2.id', new Long(session.annotation2))            
            }
            if(!session.profil1.equals('null'))
            {           
                eq('profil1.id', new Long(session.profil1))
            }
            if(!session.profil2.equals('null'))
            {
                eq('profil2.id', new Long(session.profil2))
            }
            if(session.secteuractivites!=null)
            {
                if(session.secteuractivites instanceof String) {
                    experiences {
                        eq('secteurActivite.id', new Long(session.secteuractivites))
                    }
                }
                else
                {
                    experiences {
                        or {
                            for(v in session.secteuractivites) {
                                eq('secteurActivite.id', new Long(v))
                            }
                        }   
                    }
                }
            }
            
            if(session.typeentreprises!=null)
            {
                if(session.typeentreprises instanceof String) {
                    experiences {
                        eq('typeEntreprise.id', new Long(session.typeentreprises))
                    }
                }
                else
                {
                    experiences {
                        or {
                            for(v in session.typeentreprises) {
                                eq('typeEntreprise.id', new Long(v))
                            }
                        }   
                    }
                }
                
            }
            
            if(session.postes!=null)
            {
                if(session.postes instanceof String) {
                    experiences {
                        eq('poste.id', new Long(session.postes))
                    }
                }
                else
                {
                    experiences {
                        or {
                            for(v in session.postes) {
                                eq('poste.id', new Long(v))
                            }
                        }   
                    }
                }                
            }
            
            if(session.diplomes!=null)
            {
                if(session.diplomes instanceof String) { 
                    formationcandidats {
                        eq('diplome.id', new Long(session.diplomes))
                    }
                }
                else
                {
                    formationcandidats {
                        
                        or {
                            for(v in session.diplomes) {
                                eq('diplome.id', new Long(v))
                            }
                        }   
                    }
                }
                
            }
            //           projections 
            //            {
            //        countDistinct "id"
            //             }
                
        }        
     
        def rech=RechercheCandidat.get(params.id)
        session.rec=params.id
        session.ob=rech
        
        [candidatInstanceList: connections1, candidatInstanceCount: count,rechercheCandidatInstance:rech,id:params.id]
    }
    
    def mailinscription(Candidat candidat, String pwd){
        def templatemail=MailTemplate.findByCode("mailinscription")
        def template=templatemail.template
        
        template= template.replace("#civilite",candidat.civilite.libelle);
        template= template.replace("#prenomcandidat",candidat.prenomStockage);
        template= template.replace("#nomcandidat",candidat.nomStockage);
        template= template.replace("#emailcandidat",candidat.email);
        template= template.replace("#motpassecandidat",pwd);
        try {
            sendMail {
                to candidat.email
                from "info@diorh-recrutement.com"
                replyTo "satisfactionclient@diorh.com" 
                subject templatemail.description
                html template
            }
        } catch(Exception ex) {
            println ex
        }
    }
    
    def historique_recherche(Integer max){
        params.max = Math.min(max ?: 10, 100)
        respond RechercheCandidat.list(params), model:[rechercheCandidatInstanceCount: RechercheCandidat.count()]
    }
    
    def list_recherche_combiner1() {
        Date now = new Date();            
        if(session.ageMin!=null)
        {
            if(!session.ageMin.equals(""))
            {
                Calendar calmin = Calendar.getInstance();
                calmin.setTime(now);
                int year = calmin.get(Calendar.YEAR) - Integer.parseInt(session.ageMin);
                calmin.set(Calendar.YEAR, year)
                dmi=calmin.getTime();
            }
        }
        if(session.ageMax!=null)
        {
            if(!session.ageMax.equals(""))
            {
                Calendar calmax = Calendar.getInstance();
                calmax.setTime(now);
                int year = calmax.get(Calendar.YEAR) - Integer.parseInt(session.ageMax);
                calmax.set(Calendar.YEAR, year)
                dma=calmax.getTime();  
            }
        }
       
        
       
        def rechcand=RechercheCandidat.get(session.rechcan)
        session.rechcan=rechcand
        if(params.sort==null)
        {
            params.sort="dateCreated"
        }
        else
        {
            params.sort=params.sort
        }
        if(params.order==null)
        {
            params.order="asc"
        }
        else
        {
            params.order=params.order
        }
        def c=Candidat.createCriteria()
        def connections1 = Candidat.createCriteria().list
        {
         
            if((session.nomStockage!=null)&&(!(session.nomStockage.equals(""))))
            {
                ilike("nomStockage",session.nomStockage + "%")
            }
           
            if((session.prenomStockage!=null)&&(!(session.prenomStockage.equals(""))))
            {
                ilike("prenomStockage",session.prenomStockage + "%")
            }
            
            if(session.ageMin != null && !session.ageMin.equals("")) {
                ge('dateNaissance', dma)
            }
                
            if(session.ageMax != null && !session.ageMax.equals("")) {
                le('dateNaissance', dmi)
            }
            if(!session.civilite.equals('null')){
                long j=Long.parseLong(session.civilite)  
                
                eq("civilite.id",j)
            }
            
            if(session.villes!=null)
            {               
                if(session.villes instanceof String) {
                    eq('villecandidat.id', new Long(session.villes))
                }   else {
                    or {
                        for(v in session.villes) {
                            
                            eq('villecandidat.id', new Long(v))
                        }
                    }
                }             
                
            }
            if(session.niveauetudes!=null) {
                if(session.niveauetudes instanceof String) {  
                    eq('niveauEtude.id', new Long(session.niveauetudes))
                }
                else
                {
                    or {
                        for(v in session.niveauetudes) {
                            eq('niveauEtude.id', new Long(v))
                        }
                    }
                }
                
            }
            if(session.plageexperiences!=null)
            { 
                if(session.plageexperiences instanceof String) {  
                    eq('plageExperience.id', new Long(session.plageexperiences))
                }
                else
                {
                    or {
                        for(v in session.plageexperiences) {
                            eq('plageExperience.id', new Long(v))
                        }
                    }
                }
                
            }
         
            if(session.annote!=null)
            {
                eq("annote",true) 
                
            }
            if(!session.sourceInscription.equals('null'))            
            {
                eq('sourceInscription.id', new Long(session.sourceInscription))            
            }
            if(!session.annotation1.equals('null'))
            {           
                eq('annotation1.id', new Long(session.annotation1))
            }
            if(!session.annotation2.equals('null'))
            {                    
                eq('annotation2.id', new Long(session.annotation2))            
            }
            if(!session.profil1.equals('null'))
            {        
                eq('profil1.id', new Long(session.profil1))
            }
            if(!session.profil2.equals('null'))
            {
                eq('profil2.id', new Long(session.profil2))
            }
            if(session.secteuractivites!=null)
            {
                if(session.secteuractivites instanceof String) {
                    experiences {
                        eq('secteurActivite.id', new Long(session.secteuractivites))
                    }
                }
                else
                {
                    experiences {
                        or {
                            for(v in session.secteuractivites) {
                                eq('secteurActivite.id', new Long(v))
                            }
                        }   
                    }
                }
            }
            
            if(session.typeentreprises!=null)
            {
                if(session.typeentreprises instanceof String) {
                    experiences {
                        eq('typeEntreprise.id', new Long(session.typeentreprises))
                    }
                }
                else
                {
                    experiences {
                        or {
                            for(v in session.typeentreprises) {
                                eq('typeEntreprise.id', new Long(v))
                            }
                        }   
                    }
                }
                
            }
            
            if(session.postes!=null)
            {
                if(session.postes instanceof String) {
                    experiences {
                        eq('poste.id', new Long(session.postes))
                    }
                }
                else
                {
                    experiences {
                        or {
                            for(v in session.postes) {
                                eq('poste.id', new Long(v))
                            }
                        }   
                    }
                }                
            }
            
            if(session.diplomes!=null)
            {
                if(session.diplomes instanceof String) { 
                    formationcandidats {
                        eq('diplome.id', new Long(session.diplomes))
                    }
                }
                else
                {
                    formationcandidats {
                        or {
                            for(v in session.diplomes) {
                                eq('diplome.id', new Long(v))
                            }
                        }   
                    }
                }
                
            }
            
          
            if(params.order) {
                order(params.sort, params.order)
            }
            resultTransformer(Criteria.DISTINCT_ROOT_ENTITY)

        }    
            
        if(session.candidatsSelectedList == null) {
            session.candidatsSelectedList= []
            session.candidatsSelectedMap= [:]          
        }
        def off
        def max=10
        if(params.offset==null)
        {
            off=0
        }
        else
        {
            off=params.offset
        }
        if(params.max==null)
        {
            max=10 
        }
        if(params.motCle!=null)
        {
            session.motCle=params.motCle  
        }
        else
        {
            session.motCle=''
        }
        def listcombine=[]
        def searchResult
        if(params.offset==null)
        {
           
            searchResult = searchableService.search(session.motCle,[offset:0,max: 100000])  
            
        }
        else
        {
           
            searchResult=null
            searchResult = searchableService.search(session.motCle,[offset:0,max: 100000])  
        }
           
        def  candidatattachment=[]
        for(can in connections1)
        {
            for(can1 in searchResult.results)
            {
                if(can1 instanceof Attachment)
                {
                        
                    def candidatattachmentable=Candidat.get(Attachment.get(can1.id).lnk.referenceId)  
                    if(can.id==candidatattachmentable.id)
                    {
                        listcombine.add(can1)
                    }   
                 
                }
                else if(can1 instanceof Candidat)
                {
                    
                   
                    if(can.id==can1.id)
                    {
                            
                        listcombine.add(can1)
                    }
                     
                }
             
              
            } 
        }
            
        List<Candidat> strings2=[]
        for(element in listcombine)
        {
            if(element instanceof Candidat)
            {
                strings2.add(element)  
            }
            else
            {
                def candidatattachmentable=Candidat.get(Attachment.get(element.id).lnk.referenceId)
                strings2.add(candidatattachmentable)  
            }
        }
        TreeSet<Candidat> lSet1=new TreeSet<Candidat>(strings2);
        int i1=0
        HashMap<Integer,Integer> yourMap1 = new HashMap<Integer,Integer>();
        Iterator<Candidat> it1 = lSet1.iterator();
        while (it1.hasNext()) {
            def can=(Candidat)it1.next()
            int i23 = (int) can.id;
            yourMap1.put(new Integer(i23),new Integer(i1));
            i1++
        }
        session.max=i1
        session.maprecherche1=yourMap1
        
        params.max=10
        if(params.offset==null)
        {
            params.offset=0
        }
        else
        {
            params.offset=params.offset
        }
  
        if(params.offset instanceof String)
        {
            params.offset=Integer.parseInt(params.offset) 
        }
        int firstresult=params.offset
        int lastresult=params.offset+9
        def tailleResultat = listcombine.size()
        if(tailleResultat==0)
        {
            render(view:"list_recherche_combiner",model:[candidatInstanceList:null,candidatInstanceCount:0])   
        }
        else
        {
            if(tailleResultat<lastresult )
            {
                lastresult= tailleResultat-1
            }
        
            def sliceList = listcombine[firstresult..lastresult]
            render(view:"list_recherche_combiner",model:[candidatInstanceList:sliceList,candidatInstanceCount:tailleResultat]) 
        }
    }
    def result_recherche_motcle()
    {
//        Nationalite.index() 
//         ConnaissanceInformatique.index() 
//        def resultsss = Nationalite.search(params.motCle)
//        def resultconn = searchableService.search(params.motCle)
//        println("vvvv   result  conn  "+resultconn)
//        for(conn in resultconn.results)
//        {
//            println("vvv   "+conn.getClass()+" val   "+conn+"  "+conn.id)
//        }
//        def ll=searchableService.search(params.motCle)
        //def results11 = Candidat.search(params.motCle, params)
        def resultini
        if(params.sort!=null)
        {  
            resultini = Candidat.search(params.motCle,sort:params.sort,offset:0,max:1)
        }
        else
        {
            resultini = searchableService.search(params.motCle,offset:0,max:1)
        }
        
        def canini=resultini.results
        def gg=canini.id
        if(resultini!=null)
        {
            session.candidatinitial=canini[0]
        }
        def result
        if(params.sort!=null)
        {
            result = Candidat.search(params.motCle,sort:params.sort, params)
        }
        else
        {
            result = searchableService.search(params.motCle, params)
        }
        session.resultcombiner=result
        session.resultcombiner1=result
        
        session.offset1=params.offset
        if(params.offset==null)
        {
            session.mot=params.motCle
        }
        def listcombine=[]
        def listcombine1=[]
        ArrayList candidatids = []
          
        def  candidatattachment=[]
        def map1=[:]
        for(can1 in result.results)
        {
            if(can1 instanceof Attachment)
            {
                def candidatattachmentable=Candidat.get(Attachment.get(can1.id).lnk.referenceId)      
                String strLong = Long.toString(candidatattachmentable.id)
                candidatids.add(strLong)  
                listcombine1.add(candidatattachmentable) 
                listcombine.add(can1)    
            }
            else if(can1 instanceof Candidat)
            { 
                listcombine.add(can1)
                String strLong = Long.toString(can1.id)
                candidatids.add(strLong)
                listcombine1.add(can1)
            }
            else if(can1 instanceof Nationalite)
            {
def author = Nationalite.findByLibelle("${params.motCle}")   
         def books11 = Candidat.findAll("from Candidat as book where nationalite_id = :author",[author: author.id])
//          def cr=Candidat.createCriteria()
//          
//                def test120 = cr.list () {
//                    
//                ilike("nationaliteLibelle","%"+params.motCle + "%")
//    nationalite
//    {
//        eq("id",author.id)
//    }
//}
//println("test1  "+test120.size())
       map1=[results:books11]         
          
                listcombine.addAll(books11)
                     for(can11 in books11)
                     {
                         String strLong = Long.toString(can11.id)
                candidatids.add(strLong)
                     }
                
                listcombine1.addAll(books11)
            }
          else if(can1 instanceof ConnaissanceInformatique)
            {
//def author = ConnaissanceInformatique.findByIntituleConnaissance("${params.motCle}")               
                //def books11 = Candidat.findAll("from Candidat as book where nationalite_id = :author",[author: author.id])
                def c = ConnaissanceInformatique.createCriteria()
def resultsconn = c.list () {
    like("intituleConnaissance", "%${params.motCle}%")
}

                def listcom=[]
            for(con in resultsconn)
            {
              listcom.add(con.intituleConnaissance)  
            }
       def offset=0
       if(params.offset==null)
       {
         offset=0  
       }
       else
       {
           offset=params.offset
       }
       def max=0
       if(params.max==null)
       {
          max=10 
       }
       else
       {
           max=params.max
       }
                
                def criteria = Candidat.createCriteria()
def connectionsconn = criteria.list {
  connaissancesInfo {
     inList("intituleConnaissance", listcom)
  }

            firstResult(offset) 
            maxResults(max)
            if(params.order) {
                order(params.sort, params.order)
            }
            resultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
}
      
                            
map1=[results:connectionsconn]
//long idconn=589544
//                def criteria1 = Candidat.createCriteria()
//def connectionsconn11 = Candidat.createCriteria().list {connaissancesInfo {eq("id", idconn)}}


                     listcombine.addAll(connectionsconn)
                     for(can11 in connectionsconn)
                     {
                         String strLong = Long.toString(can11.id)
                candidatids.add(strLong)
                     }
                
                listcombine1.addAll(connectionsconn)
            } 
              
        } 
        session.resultcombiner=listcombine
        session.resultcombiner1=listcombine1
        session.candidatids=candidatids
        session.order=params.order
        session.sort=params.sort
        params.max=10
        if(params.offset==null)
        {
            params.offset=0
            session.offset=params.offset
        }
        else
        {
            params.offset=params.offset
            session.offset=params.offset
        }
  
        if(params.offset instanceof String)
        {
            params.offset=Integer.parseInt(params.offset) 
            session.offset=params.offset
        }
        int firstresult=params.offset
        int lastresult=params.offset+9
        def tailleResultat = listcombine.size()
        session.order=params.order
        session.sort=params.sort
        if(params.motCle!=null)
        {
            session.motCle=params.motCle
        }
        else
        {
            session.motCle='' 
        }
        if(params.mot!=null)
        {
            session.motcles=params.mot
        }
        else
        {
            session.motcles=null
        }
        if(tailleResultat==0)
        {
            //render(view:"list_recherche_combiner",model:[candidatInstanceList:null,candidatInstanceCount:0,mot:params.mot])   
            return new ModelAndView("/candidat/result_recherche_motcle", [searchResult : result])
        }
        else
        {
            if(tailleResultat<lastresult )
            {
                lastresult= tailleResultat-1
            }
            //def sliceList = listcombine[firstresult..lastresult]
            //render(view:"list_recherche_combiner",model:[candidatInstanceList:sliceList,candidatInstanceCount:tailleResultat,mot:params.mot]) 
        }  
        if(map1.results!=null)
        {
             return new ModelAndView("/candidat/result_recherche_motcle", [searchResult1 : map1])
        }
        else
        {
            return new ModelAndView("/candidat/result_recherche_motcle", [searchResult : result]) 
        }
       

    }
    def list_recherche_combiner() 
    {
        def list=[]
        list=session.resultcombiner
        if(session.resultcombiner==null || (session.resultcombiner).size()==0)
        {
            Date now = new Date();            
            if(session.ageMin!=null)
            {
                if(!session.ageMin.equals(""))
                {
                    Calendar calmin = Calendar.getInstance();
                    calmin.setTime(now);
                    int year = calmin.get(Calendar.YEAR) - Integer.parseInt(session.ageMin);
                    calmin.set(Calendar.YEAR, year)
                    dmi=calmin.getTime();
                }
            }
            if(session.ageMax!=null)
            {
                if(!session.ageMax.equals(""))
                {
                    Calendar calmax = Calendar.getInstance();
                    calmax.setTime(now);
                    int year = calmax.get(Calendar.YEAR) - Integer.parseInt(session.ageMax);
                    calmax.set(Calendar.YEAR, year)
                    dma=calmax.getTime();  
                }
            }
       
        
       
            def rechcand=RechercheCandidat.get(session.rechcan)
            session.rechcan=rechcand
            if(params.sort==null)
            {
                params.sort="dateCreated"
            }
            else
            {
                params.sort=params.sort
            }
            if(params.order==null)
            {
                params.order="asc"
            }
            else
            {
                params.order=params.order
            }
            def c=Candidat.createCriteria()
            def connections1 = Candidat.createCriteria().list
            {
                if((session.nomStockage!=null)&&(!(session.nomStockage.equals(""))))
                {
                    ilike("nomStockage",session.nomStockage + "%")
                }
           
                if((session.prenomStockage!=null)&&(!(session.prenomStockage.equals(""))))
                {
                    ilike("prenomStockage",session.prenomStockage + "%")
                }
            
                if(session.ageMin != null && !session.ageMin.equals("")) {
                    ge('dateNaissance', dma)
                }
                
                if(session.ageMax != null && !session.ageMax.equals("")) {
                    le('dateNaissance', dmi)
                }
                if(!session.civilite.equals('null')){
                    long j=Long.parseLong(session.civilite)  
                
                    eq("civilite.id",j)
                }
            
                if(session.villes!=null)
                {               
                    if(session.villes instanceof String) {
                        eq('villecandidat.id', new Long(session.villes))
                    }   else {
                        or {
                            for(v in session.villes) {
                            
                                eq('villecandidat.id', new Long(v))
                            }
                        }
                    }             
                
                }
                if(session.niveauetudes!=null) {
                    if(session.niveauetudes instanceof String) {  
                        eq('niveauEtude.id', new Long(session.niveauetudes))
                    }
                    else
                    {
                        or {
                            for(v in session.niveauetudes) {
                                eq('niveauEtude.id', new Long(v))
                            }
                        }
                    }
                
                }
                if(session.plageexperiences!=null)
                { 
                    if(session.plageexperiences instanceof String) {  
                        eq('plageExperience.id', new Long(session.plageexperiences))
                    }
                    else
                    {
                        or {
                            for(v in session.plageexperiences) {
                                eq('plageExperience.id', new Long(v))
                            }
                        }
                    }
                
                }
         
                if(session.annote!=null)
                {
                    eq("annote",true) 
                
                }
                if(!session.sourceInscription.equals('null'))            
                {
                    eq('sourceInscription.id', new Long(session.sourceInscription))            
                }
                if(!session.annotation1.equals('null'))
                {           
                    eq('annotation1.id', new Long(session.annotation1))
                }
                if(!session.annotation2.equals('null'))
                {                    
                    eq('annotation2.id', new Long(session.annotation2))            
                }
                if(!session.profil1.equals('null'))
                {        
                    eq('profil1.id', new Long(session.profil1))
                }
                if(!session.profil2.equals('null'))
                {
                    eq('profil2.id', new Long(session.profil2))
                }
                if(session.secteuractivites!=null)
                {
                    if(session.secteuractivites instanceof String) {
                        experiences {
                            eq('secteurActivite.id', new Long(session.secteuractivites))
                        }
                    }
                    else
                    {
                        experiences {
                            or {
                                for(v in session.secteuractivites) {
                                    eq('secteurActivite.id', new Long(v))
                                }
                            }   
                        }
                    }
                }
            
                if(session.typeentreprises!=null)
                {
                    if(session.typeentreprises instanceof String) {
                        experiences {
                            eq('typeEntreprise.id', new Long(session.typeentreprises))
                        }
                    }
                    else
                    {
                        experiences {
                            or {
                                for(v in session.typeentreprises) {
                                    eq('typeEntreprise.id', new Long(v))
                                }
                            }   
                        }
                    }
                
                }
            
                if(session.postes!=null)
                {
                    if(session.postes instanceof String) {
                        experiences {
                            eq('poste.id', new Long(session.postes))
                        }
                    }
                    else
                    {
                        experiences {
                            or {
                                for(v in session.postes) {
                                    eq('poste.id', new Long(v))
                                }
                            }   
                        }
                    }                
                }
            
                if(session.diplomes!=null)
                {
                    if(session.diplomes instanceof String) { 
                        formationcandidats {
                            eq('diplome.id', new Long(session.diplomes))
                        }
                    }
                    else
                    {
                        formationcandidats {
                            or {
                                for(v in session.diplomes) {
                                    eq('diplome.id', new Long(v))
                                }
                            }   
                        }
                    }
                
                }
            
          
                if(params.order) {
                    order(params.sort, params.order)
                }
                resultTransformer(Criteria.DISTINCT_ROOT_ENTITY)

            }  
            if(session.candidatsSelectedList == null) {
                session.candidatsSelectedList= []
                session.candidatsSelectedMap= [:]          
            }
            def off
            def max=10
            if(params.offset==null)
            {
                off=0
                session.offset=0
            }
            else
            {
                off=params.offset
                session.offset=params.offset
            }
            if(params.max==null)
            {
                max=10 
            }
            if(params.motCle!=null)
            {
                session.motCle=params.motCle  
            }
            else
            {
                session.motCle=''  
            }
            def listcombine=[]
            def listcombine1=[]
            ArrayList candidatids = []
            def searchResult
            if(params.offset==null)
            {
                searchResult = searchableService.search(session.motCle,[offset:0,max: 100000])  
            }
            else
            {
                searchResult=null
                searchResult = searchableService.search(session.motCle,[offset:0,max: 100000]) 
            }
            def  candidatattachment=[]
            for(can in connections1)
            {
                for(can1 in searchResult.results)
                {
                    if(can1 instanceof Attachment)
                    {
                        def candidatattachmentable=Candidat.get(Attachment.get(can1.id).lnk.referenceId) 
                        if(can.id==candidatattachmentable.id)
                        {
                            String strLong = Long.toString(can.id)
                            if(!candidatids.contains(strLong))
                            {
                                candidatids.add(strLong)  
                            }
                            if(!listcombine1.contains(can))
                            {
                                listcombine1.add(can) 
                            }
                            if(!listcombine.contains(can1))
                            {
                                listcombine.add(can1)  
                            }
                            
                            
                        }   
                 
                    }
                    else if(can1 instanceof Candidat)
                    {
                      
                   
                        if(can.id==can1.id)
                        {
                            
                            listcombine.add(can)
                            String strLong = Long.toString(can.id)
                            candidatids.add(strLong)
                            listcombine1.add(can)
                        }
                     
                    }
             
              
                } 
            }
           
            session.resultcombiner=listcombine
            session.resultcombiner1=listcombine1
            session.candidatids=candidatids
            session.order=params.order
            session.sort=params.sort
            params.max=10
            if(params.offset==null)
            {
                params.offset=0
                session.offset=params.offset
            }
            else
            {
                params.offset=params.offset
                session.offset=params.offset
            }
  
            if(params.offset instanceof String)
            {
                params.offset=Integer.parseInt(params.offset) 
                session.offset=params.offset
            }
            int firstresult=params.offset
            int lastresult=params.offset+9
            def tailleResultat = listcombine.size()
            session.order=params.order
            session.sort=params.sort
            if(tailleResultat==0)
            {
                render(view:"list_recherche_combiner",model:[candidatInstanceList:null,candidatInstanceCount:0])   
            }
            else
            {
                if(tailleResultat<lastresult )
                {
                    lastresult= tailleResultat-1
                }
                def sliceList = listcombine[firstresult..lastresult]
                render(view:"list_recherche_combiner",model:[candidatInstanceList:sliceList,candidatInstanceCount:tailleResultat]) 
            }
        }
        else
        {
            if(session.order!=params.order ||session.sort!=params.sort)
            {
                Date now = new Date();            
                if(session.ageMin!=null)
                {
                    if(!session.ageMin.equals(""))
                    {
                        Calendar calmin = Calendar.getInstance();
                        calmin.setTime(now);
                        int year = calmin.get(Calendar.YEAR) - Integer.parseInt(session.ageMin);
                        calmin.set(Calendar.YEAR, year)
                        dmi=calmin.getTime();
                    }
                }
                if(session.ageMax!=null)
                {
                    if(!session.ageMax.equals(""))
                    {
                        Calendar calmax = Calendar.getInstance();
                        calmax.setTime(now);
                        int year = calmax.get(Calendar.YEAR) - Integer.parseInt(session.ageMax);
                        calmax.set(Calendar.YEAR, year)
                        dma=calmax.getTime();  
                    }
                }
       
        
       
                def rechcand=RechercheCandidat.get(session.rechcan)
                session.rechcan=rechcand
                if(params.sort==null)
                {
                    params.sort="dateCreated"
                }
                else
                {
                    params.sort=params.sort
                }
                if(params.order==null)
                {
                    params.order="asc"
                }
                else
                {
                    params.order=params.order
                }
                def c=Candidat.createCriteria()
                def connections1 = Candidat.createCriteria().list
                {
         
                    if((session.nomStockage!=null)&&(!(session.nomStockage.equals(""))))
                    {
                        ilike("nomStockage",session.nomStockage + "%")
                    }
           
                    if((session.prenomStockage!=null)&&(!(session.prenomStockage.equals(""))))
                    {
                        ilike("prenomStockage",session.prenomStockage + "%")
                    }
            
                    if(session.ageMin != null && !session.ageMin.equals("")) {
                        ge('dateNaissance', dma)
                    }
                
                    if(session.ageMax != null && !session.ageMax.equals("")) {
                        le('dateNaissance', dmi)
                    }
                    if(!session.civilite.equals('null')){
                        long j=Long.parseLong(session.civilite)  
                
                        eq("civilite.id",j)
                    }
            
                    if(session.villes!=null)
                    {               
                        if(session.villes instanceof String) {
                            eq('villecandidat.id', new Long(session.villes))
                        }   else {
                            or {
                                for(v in session.villes) {
                            
                                    eq('villecandidat.id', new Long(v))
                                }
                            }
                        }             
                
                    }
                    if(session.niveauetudes!=null) {
                        if(session.niveauetudes instanceof String) {  
                            eq('niveauEtude.id', new Long(session.niveauetudes))
                        }
                        else
                        {
                            or {
                                for(v in session.niveauetudes) {
                                    eq('niveauEtude.id', new Long(v))
                                }
                            }
                        }
                
                    }
                    if(session.plageexperiences!=null)
                    { 
                        if(session.plageexperiences instanceof String) { 
                            eq('plageExperience.id', new Long(session.plageexperiences))
                        }
                        else
                        {
                            or {
                                for(v in session.plageexperiences) {
                                    
                                    eq('plageExperience.id', new Long(v))
                                }
                            }
                        }
                
                    }
         
                    if(session.annote!=null)
                    {
                        eq("annote",true) 
                
                    }
                    if(!session.sourceInscription.equals('null'))            
                    {
                        eq('sourceInscription.id', new Long(session.sourceInscription))            
                    }
                    if(!session.annotation1.equals('null'))
                    {           
                        eq('annotation1.id', new Long(session.annotation1))
                    }
                    if(!session.annotation2.equals('null'))
                    {                    
                        eq('annotation2.id', new Long(session.annotation2))            
                    }
                    if(!session.profil1.equals('null'))
                    {        
                        eq('profil1.id', new Long(session.profil1))
                    }
                    if(!session.profil2.equals('null'))
                    {
                        eq('profil2.id', new Long(session.profil2))
                    }
                    if(session.secteuractivites!=null)
                    {
                        if(session.secteuractivites instanceof String) {
                            experiences {
                                eq('secteurActivite.id', new Long(session.secteuractivites))
                            }
                        }
                        else
                        {
                            experiences {
                                or {
                                    for(v in session.secteuractivites) {
                                        eq('secteurActivite.id', new Long(v))
                                    }
                                }   
                            }
                        }
                    }
            
                    if(session.typeentreprises!=null)
                    {
                        if(session.typeentreprises instanceof String) {
                            experiences {
                                eq('typeEntreprise.id', new Long(session.typeentreprises))
                            }
                        }
                        else
                        {
                            experiences {
                                or {
                                    for(v in session.typeentreprises) {
                                        eq('typeEntreprise.id', new Long(v))
                                    }
                                }   
                            }
                        }
                
                    }
            
                    if(session.postes!=null)
                    {
                        if(session.postes instanceof String) {
                            experiences {
                                eq('poste.id', new Long(session.postes))
                            }
                        }
                        else
                        {
                            experiences {
                                or {
                                    for(v in session.postes) {
                                        eq('poste.id', new Long(v))
                                    }
                                }   
                            }
                        }                
                    }
            
                    if(session.diplomes!=null)
                    {
                        if(session.diplomes instanceof String) { 
                            formationcandidats {
                                eq('diplome.id', new Long(session.diplomes))
                            }
                        }
                        else
                        {
                            formationcandidats {
                                or {
                                    for(v in session.diplomes) {
                                        eq('diplome.id', new Long(v))
                                    }
                                }   
                            }
                        }
                
                    }
            
          
                    if(params.order) {
                        order(params.sort, params.order)
                    }
                    resultTransformer(Criteria.DISTINCT_ROOT_ENTITY)

                }  
                if(session.candidatsSelectedList == null) {
                    session.candidatsSelectedList= []
                    session.candidatsSelectedMap= [:]          
                }
                def off
                def max=10
                if(params.offset==null)
                {
                    off=0
                    session.offset=0
                }
                else
                {
                    off=params.offset
                    session.offset=params.offset
                }
                if(params.max==null)
                {
                    max=10 
                }
                if(params.motCle!=null)
                {
                    session.motCle=params.motCle  
                }
                else
                {
                    session.motCle=''  
                }
                def listcombine=[]
                def listcombine1=[]
                ArrayList candidatids = []
                 
                def searchResult
                if(params.offset==null)
                {
           
                    searchResult = searchableService.search(session.motCle,[offset:0,max: 100000])  
                }
                else
                {
           
                    searchResult=null
                    searchResult = searchableService.search(session.motCle,[offset:0,max: 100000])
                }
           
                def  candidatattachment=[]
               
                for(can in connections1)
                {
                    for(can1 in searchResult.results)
                    {
                        if(can1 instanceof Attachment)
                        {
                        
                            def candidatattachmentable=Candidat.get(Attachment.get(can1.id).lnk.referenceId)  
                            if(can.id==candidatattachmentable.id)
                            {
                                String strLong = Long.toString(can.id)
                                if(!candidatids.contains(strLong))
                                {
                                    candidatids.add(strLong)  
                                }
                                if(!listcombine1.contains(can))
                                {
                                    listcombine1.add(can) 
                                }
                                if(!listcombine.contains(can1))
                                {
                                    listcombine.add(can1)  
                                }
                                
                            }   
                 
                        }
                        else if(can1 instanceof Candidat)
                        {
                    
                   
                            if(can.id==can1.id)
                            {
                            
                                listcombine.add(can)
                                String strLong = Long.toString(can.id)
                                candidatids.add(strLong)
                                listcombine1.add(can)
                            }
                     
                        }
             
              
                    } 
                }
                session.resultcombiner=listcombine
                session.resultcombiner1=listcombine1
                session.candidatids=candidatids
                session.order=params.order
                session.sort=params.sort
            
                params.max=10
                if(params.offset==null)
                {
                    params.offset=0
                    session.offset=0
                }
                else
                {
                    params.offset=params.offset
                    session.offset=params.offset
                }
  
                if(params.offset instanceof String)
                {
                    params.offset=Integer.parseInt(params.offset) 
                    session.offset=params.offset
                }
                int firstresult=params.offset
                int lastresult=params.offset+9
                int tailleResultat = listcombine.size()
                if(tailleResultat==0)
                {
                    render(view:"list_recherche_combiner",model:[candidatInstanceList:null,candidatInstanceCount:0])   
                }
                else
                {
                    if(tailleResultat<=lastresult )
                    {
                        
                        lastresult= tailleResultat-1
                    }
                    def sliceList = listcombine[firstresult..lastresult]
                    // render(view:"list_recherche_combiner",model:[candidatInstanceList:sliceList,candidatInstanceCount:tailleResultat]) 
                    render(view:"list_recherche_combiner",model:[candidatInstanceList:sliceList,candidatInstanceCount:tailleResultat]) 
                }
                
                
            }
            else
            {
                /////////////////debut partie    
                
                
                params.max=10
                if(params.offset==null)
                {
                    params.offset=0
                    session.offset=0
                }
                else
                {
                    params.offset=params.offset
                    session.offset=params.offset
                }
  
                if(params.offset instanceof String)
                {
                    params.offset=Integer.parseInt(params.offset) 
                    session.offset=params.offset
                }
                int firstresult=params.offset
                int lastresult=params.offset+9
                def listcombine=session.resultcombiner
                def listcombine1=session.resultcombiner1
                def candidatids=session.candidatids
                def tailleResultat = listcombine.size()
                session.order=params.order
                session.sort=params.sort
                if(tailleResultat==0)
                {
                    render(view:"list_recherche_combiner",model:[candidatInstanceList:null,candidatInstanceCount:0])   
                }
                else
                {
                    if(tailleResultat<lastresult )
                    {
                        lastresult= tailleResultat-1
                    }
                    def sliceList = listcombine[firstresult..lastresult]
                    render(view:"list_recherche_combiner",model:[candidatInstanceList:sliceList,candidatInstanceCount:tailleResultat]) 
                }
                
                
            }
            
            
        }    

    }
    
    def show(Candidat candidatInstance) 
    {
        if(params.list!=null)
        {
            if(params.recherchenormale!=null)
            {
                session.numero=Integer.parseInt(params.index)+session.offset
            }
            else
            {
                ArrayList hh=session.candidatids
                String strLong = Long.toString(candidatInstance.id)
                def indexcandidat=hh.indexOf(strLong)
                session.numero=indexcandidat
            }
        }
        else if(params.index!=null && !(params.index).equals('null')&& !(params.index).equals(""))
        {
            session.numero=Integer.parseInt(params.index) 
        }
        else if(session.candidatids!=null)
        {
            ArrayList hh=session.candidatids
            String strLong = Long.toString(candidatInstance.id)
            def indexcandidat=hh.indexOf(strLong)
            session.numero=indexcandidat
        }
        if(session.candidatsshow== null) {
            session.candidatsshow= []          
        }
        if(!session.candidatsshow.contains(candidatInstance.id)){
            session.candidatsshow.add(candidatInstance.id)  
        }
        render(view:"show",model:[candidatInstance:candidatInstance,i:session.numero])
    }
    
    
    def show_motcle(Candidat candidatInstance) 
    {      
        if(params.list!=null)
        {
            if(params.recherchenormale!=null)
            {
                session.numero=Integer.parseInt(params.index)+session.offset
            }
            else
            {
                ArrayList hh=session.candidatids
                String strLong = Long.toString(candidatInstance.id)
                def indexcandidat=hh.indexOf(strLong)
                session.numero=indexcandidat
            }
        }
        else if(params.index!=null && !(params.index).equals('null')&& !(params.index).equals(""))
        {
            session.numero=Integer.parseInt(params.index) 
        }
        else if(session.candidatids!=null)
        {
            ArrayList hh=session.candidatids
            String strLong = Long.toString(candidatInstance.id)
            def indexcandidat=hh.indexOf(strLong)
            session.numero=indexcandidat
        }
        if(session.candidatsshow== null) {
            session.candidatsshow= []          
        }
        if(!session.candidatsshow.contains(candidatInstance.id)){
            session.candidatsshow.add(candidatInstance.id)  
        }
        render(view:"show_motcle",model:[candidatInstance:candidatInstance,i:session.numero])
    }
    def show_listnormal(Candidat candidatInstance) 
    {      
        if(params.list!=null)
        {
            if(params.recherchenormale!=null)
            {
                session.numero=Integer.parseInt(params.index)+session.offset
            }
            else
            {
                ArrayList hh=session.candidatids
                String strLong = Long.toString(candidatInstance.id)
                def indexcandidat=hh.indexOf(strLong)
                session.numero=indexcandidat
            }
        }
        else if(params.index!=null && !(params.index).equals('null')&& !(params.index).equals(""))
        {
            session.numero=Integer.parseInt(params.index) 
        }
        else if(session.candidatids!=null)
        {
            ArrayList hh=session.candidatids
            String strLong = Long.toString(candidatInstance.id)
            def indexcandidat=hh.indexOf(strLong)
            session.numero=indexcandidat
        }
        if(session.candidatsshow== null) {
            session.candidatsshow= []          
        }
        if(!session.candidatsshow.contains(candidatInstance.id)){
            session.candidatsshow.add(candidatInstance.id)  
        }
        render(view:"show_listnormal",model:[candidatInstance:candidatInstance,i:session.numero])
    }
    def suivant(Candidat candidatInstance)
    { 
        List resultats=(List)session.resultcombiner
        List resultats1=(List)session.resultcombiner1
        int suiv=Integer.parseInt(params.index)+1
        if(suiv==resultats1.size())
        {
            flash.message = message(code: 'default.searchlastelement',default: "Vous avez atteint le dernier element de la liste")
                 
            redirect(action: "show", id:candidatInstance.id , params: params)
        }
        else
        {
            def can=resultats1.get(suiv)
            redirect(action: "show", id:can.id, params: [index: "${suiv}"])
        }
    }
    def precedent(Candidat candidatInstance)
    {  
        List resultats=(List)session.resultcombiner
        List resultats1=(List)session.resultcombiner1

        
        int numero=Integer.parseInt(params.index)
        if(numero==0)
        {
            flash.message = message(code: 'default.searchfirstelement',default: "Vous avez atteint le premier element de la liste")
                 
            redirect(action: "show", id:candidatInstance.id , params: params)
        }
        else
        {
            int precedent=Integer.parseInt(params.index)-1
            def can=resultats1.get(precedent)
            redirect(action: "show", id:can.id, params: [index: "${precedent}"])
        }
                  
    }
    def suivant_motcle(Candidat candidatInstance)
    {
        if(session.motcles!=null)
        {
            session.motcless=session.motcles
        }
        
        List resultats=(List)session.resultcombiner
        List resultats1=(List)session.resultcombiner1
        int suiv=Integer.parseInt(params.index)+1
        if(suiv==resultats1.size())
        {
            def dd

            if(session.offset1==null)
            {
                dd=10 
                session.offset1=dd
            }
            else
            {
                session.offset1
                if(session.offset1 instanceof Integer)
                {
                    dd=session.offset1+10
                    session.offset1=dd
                }
                else
                {
                    dd=Integer.parseInt(session.offset1)+10  
                    session.offset1=dd
                }
                   
            }
            params.offset=dd
            def result = searchableService.search(session.mot, params)
            if(result.size()!=0)
            {
                def listcombine=[]
                def listcombine1=[]
                ArrayList candidatids = []
          
                def  candidatattachment=[]
           
                for(can1 in result.results)
                {
                    if(can1 instanceof Attachment)
                    {
                        def candidatattachmentable=Candidat.get(Attachment.get(can1.id).lnk.referenceId)  
                        
                        String strLong = Long.toString(candidatattachmentable.id)
                        //                        if(!candidatids.contains(strLong))
                        //                        {
                        candidatids.add(strLong)  
                        //                        }
                        //                        if(!listcombine1.contains(candidatattachmentable))
                        //                        {
                        listcombine1.add(candidatattachmentable) 
                        //                        }
                        //                        if(!listcombine.contains(can1))
                        //                        {
                        listcombine.add(can1)  
                        //                        }
                    }
                    else if(can1 instanceof Candidat)
                    {  
                        listcombine.add(can1)
                        String strLong = Long.toString(can1.id)
                        candidatids.add(strLong)
                        listcombine1.add(can1)
                    }
             
              
                } 
                session.resultcombiner=listcombine
                session.resultcombiner1=listcombine1
                session.candidatids=candidatids 
                def cans=(List)session.resultcombiner1
                def can1=cans[0]
                def suiv1=0
                if(can1==null)
                {
                    
                    flash.message = message(code: 'default.searchlastelement',default: "Vous avez atteint le dernier element de la liste")
                 
                    redirect(action: "show_motcle", id:candidatInstance.id , params: params)
                }
                else
                {
                    redirect(action: "show_motcle", id:can1.id, params: [index: "${suiv1}"])   
                }
                
            }
            else
            {
                flash.message = message(code: 'default.searchlastelement',default: "Vous avez atteint le dernier element de la liste")
                 
                redirect(action: "show_motcle", id:candidatInstance.id , params: params)   
            }
            
        }
        else
        {
            def can=resultats1.get(suiv)
            redirect(action: "show_motcle", id:can.id, params: [index: "${suiv}"])
        }
    }
    def precedent_motcle(Candidat candidatInstance)
    {  
        if(session.motcles!=null)
        {
            session.motcless=session.motcles
        }
        
        List resultats=(List)session.resultcombiner
        List resultats1=(List)session.resultcombiner1
        int precedent=Integer.parseInt(params.index)-1
        if(Integer.parseInt(params.index)==0)
        {
            def dd
            if(session.offset1==null)
            {
                dd=0
                session.offset1=dd
            }
            else
            {
                  
                if(session.offset1 instanceof Integer)
                {
                    dd=session.offset1-10
                    session.offset1=dd
                }
                else
                {
                    dd=Integer.parseInt(session.offset1)-10  
                    session.offset1=dd
                    //session.offset1=Integer.parseInt(session.offset1)-10
                }
                   
            } 
            params.offset=dd
            def result
            int preced=Integer.parseInt(params.index)
            def can12=resultats1.get(preced)
            def canv=session.candidatinitial
            if(session.candidatinitial==can12)
            {
                result=null
            }
            else if(params.offset==-10)
            {
                result=null  
            }
            else
            {
                result = searchableService.search(session.mot, params)
            }
            if(result!=null)
            {
                def listcombine=[]
                def listcombine1=[]
                ArrayList candidatids = []
          
                def  candidatattachment=[]
           
                for(can1 in result.results)
                {
                    if(can1 instanceof Attachment)
                    {
                        def candidatattachmentable=Candidat.get(Attachment.get(can1.id).lnk.referenceId)  
                        
                        String strLong = Long.toString(candidatattachmentable.id)
                        if(!candidatids.contains(strLong))
                        {
                            candidatids.add(strLong)  
                        }
                        if(!listcombine1.contains(candidatattachmentable))
                        {
                            listcombine1.add(candidatattachmentable) 
                        }
                        if(!listcombine.contains(can1))
                        {
                            listcombine.add(can1)  
                        }
                    }
                    else if(can1 instanceof Candidat)
                    {  
                        listcombine.add(can1)
                        String strLong = Long.toString(can1.id)
                        candidatids.add(strLong)
                        listcombine1.add(can1)
                    }
             
              
                } 
                session.resultcombiner=listcombine
                session.resultcombiner1=listcombine1
                session.candidatids=candidatids 
                def cans=(List)session.resultcombiner1
                def taille=cans.size()-1
                def can1=cans[taille]
                def prece1=taille
                redirect(action: "show_motcle", id:can1.id, params: [index: "${prece1}"])
            }
            else
            {
                flash.message = message(code: 'default.searchfirstelement',default: "Vous avez atteint le premier element de la liste")     
                redirect(action: "show_motcle", id:candidatInstance.id , params: params) 
            }
            
        }  
        else
        {
            int preced=Integer.parseInt(params.index)-1
            def can=resultats1.get(preced)
            redirect(action: "show_motcle", id:can.id, params: [index: "${preced}"])
        }
                  
    }
    def suivant_listnormal(Candidat candidatInstance)
    {
        if(params.sort==null && params.order==null)
        {
            params.sort="dateCreated"
            params.order="asc"
        }
        List resultats=(List)session.resultcombiner
        List resultats1=(List)session.resultcombiner1
        int suiv=Integer.parseInt(params.index)+1
        if(suiv==resultats1.size())
        {
            def dd
            if(session.offset1==null)
            {
                dd=10 
                session.offset1=dd
            }
            else
            {
                session.offset1
                if(session.offset1 instanceof Integer)
                {
                    dd=session.offset1+10
                    session.offset1=dd
                }
                else
                {
                    dd=Integer.parseInt(session.offset1)+10  
                    session.offset1=dd
                }
                   
            }
            params.offset=dd
            params.max=10
            params.order=session.order
            params.sort=session.sort
            def result = Candidat.list(params)
            if(result!=null)
            {
                def listcombine=[]
                def listcombine1=[]
                ArrayList candidatids = []
          
                def  candidatattachment=[]
           
                for(can1 in result)
                {
                    listcombine.add(can1)
                    String strLong = Long.toString(can1.id)
                    candidatids.add(strLong)
                    listcombine1.add(can1)
                } 
                session.resultcombiner=listcombine
                session.resultcombiner1=listcombine1
                session.candidatids=candidatids 
                def cans=(List)session.resultcombiner1
                def can1=cans[0]
                def suiv1=0
            
                redirect(action: "show_listnormal", id:can1.id, params: [index: "${suiv1}"])
            }
            else
            {
                flash.message = message(code: 'default.searchlastelement',default: "Vous avez atteint le dernier element de la liste")
                 
                redirect(action: "show_motcle", id:candidatInstance.id , params: params)   
            }
            
        }
        else
        {
            def can=resultats1.get(suiv)
            redirect(action: "show_listnormal", id:can.id, params: [index: "${suiv}"])
        }
    }
    def precedent_listnormal(Candidat candidatInstance)
    {  
        if(params.sort==null && params.order==null)
        {
            params.sort="dateCreated"
            params.order="asc"
        }
        List resultats=(List)session.resultcombiner
        List resultats1=(List)session.resultcombiner1
        int precedent=Integer.parseInt(params.index)-1
        if(Integer.parseInt(params.index)==0)
        {
            def dd
            if(session.offset1==null)
            {
                dd=0
                session.offset1=dd
            }
            else
            {
                  
                if(session.offset1 instanceof Integer)
                {
                    dd=session.offset1-10
                    session.offset1=dd
                }
                else
                {
                    dd=Integer.parseInt(session.offset1)-10  
                    session.offset1=dd
                    //session.offset1=Integer.parseInt(session.offset1)-10
                }
                   
            } 
            params.offset=dd
            params.max=10
            params.order=session.order
            params.sort=session.sort
            def result
            int preced=Integer.parseInt(params.index)
            def can12=resultats1.get(preced)
            def canv=session.candidatinitial
            if(session.candidatinitial==can12)
            {
                result=null
            }
            else
            {
                result = Candidat.list(params) 
            }
            if(result!=null)
            {
                def listcombine=[]
                def listcombine1=[]
                ArrayList candidatids = []
          
                def  candidatattachment=[]
           
                for(can1 in result)
                {
                    listcombine.add(can1)
                    String strLong = Long.toString(can1.id)
                    candidatids.add(strLong)
                    listcombine1.add(can1)
              
                } 
                session.resultcombiner=listcombine
                session.resultcombiner1=listcombine1
                session.candidatids=candidatids 
                def cans=(List)session.resultcombiner1
                def taille=cans.size()-1
                def can1=cans[taille]
                def prece1=taille
                redirect(action: "show_listnormal", id:can1.id, params: [index: "${prece1}"])
            }
            else
            {
                flash.message = message(code: 'default.searchfirstelement',default: "Vous avez atteint le premier element de la liste")     
                redirect(action: "show_listnormal", id:candidatInstance.id , params: params) 
            }
            
        }  
        else
        {
            int preced=Integer.parseInt(params.index)-1
            def can=resultats1.get(preced)
            redirect(action: "show_listnormal", id:can.id, params: [index: "${preced}"])
        }
                  
    }
    @Transactional
    def enregistrer_recherche_combiner(RechercheCandidat rechercheCandidatInstance)
    {      
        if(session.idrecherchecandidat==''){
            def recherchecandidat = new RechercheCandidat(id:"",annote:session.annote,ageMin:session.ageMin,ageMax:session.ageMax,libellerecherche:params.libellerecherche,sourceInscription: session.sourceInscription, nomStockage:session.nomStockage,prenomStockage:session.prenomStockage,civilite:session.civilite,profil1:session.profil1,annotation1:session.annotation1,annotation2:session.annotation2,profil2:session.profil2,villes:session.villes,postes:session.postes,typeentreprises:session.typeentreprises,diplomes:session.diplomes,secteuractivites:session.secteuractivites,niveauetudes:session.niveauetudes,plageexperiences:session.plageexperiences,motCle:session.motCle)   
            flash.message = message(code: 'default.createdmessage.message',default: "L'objet a été crée")  
            recherchecandidat.save(failOnError:true,flush:true)
        }
        else{
            def recherchecandidat = RechercheCandidat.get(session.idrecherchecandidat)
            recherchecandidat.libellerecherche=params.libellerecherche
            recherchecandidat.annote=session.annote
            recherchecandidat.motCle=session.motCle
            recherchecandidat.nomStockage=session.nomStockage
            recherchecandidat.prenomStockage=session.prenomStockage
            session.sourceInscription
            if(session.sourceInscription=='' || session.sourceInscription=='null'){
                recherchecandidat.sourceInscription=null
            }else{
                recherchecandidat.sourceInscription=SourceInscription.get(session.sourceInscription)
            }
            if(session.civilite=='' || session.civilite=='null'){
                recherchecandidat.civilite=null
            }else{
                recherchecandidat.civilite=Civilite.get(session.civilite)
            }
            if(session.profil1=='' || session.profil1=='null'){
                recherchecandidat.profil1=null
            }else{
                recherchecandidat.profil1=AnnotationProfil.get(session.profil1) 
            }
            if(session.annotation1=='' || session.annotation1=='null'){
                recherchecandidat.annotation1=null
            }else{
                recherchecandidat.annotation1=AnnotationNote.get(session.annotation1)
            }
            if(session.profil2=='' || session.profil2=='null'){
                recherchecandidat.profil2=null
            }else{
                recherchecandidat.profil2=AnnotationProfil.get(session.profil2) 
            }
            if(session.annotation2=='' || session.annotation2=='null'){
                recherchecandidat.annotation2=null
            }else{
                recherchecandidat.annotation2=AnnotationNote.get(session.annotation2)
            }
            if(session.ageMin==''){
                recherchecandidat.ageMin=null
            }else{
                recherchecandidat.ageMin=Integer.parseInt(session.ageMin)
            }
            if(session.ageMax==''){
                recherchecandidat.ageMax=null
            }else{
                recherchecandidat.ageMax=Integer.parseInt(session.ageMax)
            }
            
            if(session.villes!=null)
            {               
                if(session.villes instanceof String) {
                    recherchecandidat.addToVilles(Ville.get(session.villes))
                }   
                else {
                    for(v in session.villes) {
                        recherchecandidat.addToVilles(Ville.get(v))
                    }
                }                    
            }
            else{
                recherchecandidat.villes=null
            }
            
            if(session.niveauetudes!=null)
            {               
                if(session.niveauetudes instanceof String) {
                    recherchecandidat.addToNiveauetudes(NiveauEtude.get(session.niveauetudes))
                }   
                else {
                    for(v in session.niveauetudes) {
                        recherchecandidat.addToNiveauetudes(NiveauEtude.get(v))
                    }
                }                    
            }
            else{
                recherchecandidat.niveauetudes=null
            }
            
            if(session.diplomes!=null)
            {               
                if(session.diplomes instanceof String) {
                    recherchecandidat.addToDiplomes(Diplome.get(session.diplomes))
                }   
                else {
                    for(v in session.diplomes) {
                        recherchecandidat.addToDiplomes(Diplome.get(v))
                    }
                }                    
            }
            else{
                recherchecandidat.diplomes=null
            }
            
            if(session.typeentreprises!=null)
            {               
                if(session.typeentreprises instanceof String) {
                    recherchecandidat.addToTypeentreprises(TypeEntreprise.get(session.typeentreprises))
                }   
                else {
                    for(v in session.typeentreprises) {
                        recherchecandidat.addToTypeentreprises(TypeEntreprise.get(v))
                    }
                }                    
            }
            else{
                recherchecandidat.typeentreprises=null
            }
            
            if(session.plageexperiences!=null)
            {               
                if(session.plageexperiences instanceof String) {
                    recherchecandidat.addToPlageexperiences(PlageExperience.get(session.plageexperiences))
                }   
                else {
                    for(v in session.plageexperiences) {
                        recherchecandidat.addToPlageexperiences(PlageExperience.get(v))
                    }
                }                    
            }
            else{
                recherchecandidat.plageexperiences=null
            }
            
            if(session.postes!=null)
            {               
                if(session.postes instanceof String) {
                    recherchecandidat.addToPostes(Poste.get(session.postes))
                }   
                else {
                    for(v in session.postes) {
                        recherchecandidat.addToPostes(Poste.get(v))
                    }
                }                    
            }
            else{
                recherchecandidat.postes=null
            }
            
            if(session.secteuractivites!=null)
            {               
                if(session.secteuractivites instanceof String) {
                    recherchecandidat.addToSecteuractivites(SecteurActivite.get(session.secteuractivites))
                }   
                else {
                    for(v in session.secteuractivites) {
                        recherchecandidat.addToSecteuractivites(SecteurActivite.get(v))
                    }
                }                    
            }
            else{
                recherchecandidat.secteuractivites=null
            }
            
            recherchecandidat.save(failOnError:true,flush:true)   
            flash.message = message(code: 'default.updatedmessage',default: "L'objet a été modifié")
        }
        redirect(action: "historique_recherche")  
    }
    def list_recherche() 
    { 
        if(session.resultcombiner==null)
        { 
            Date now = new Date();            
            if(session.ageMin!=null)
            {
                if(!session.ageMin.equals(""))
                {
                    Calendar calmin = Calendar.getInstance();
                    calmin.setTime(now);
                    int year = calmin.get(Calendar.YEAR) - Integer.parseInt(session.ageMin);
                    calmin.set(Calendar.YEAR, year)
                    dmi=calmin.getTime();
                }
            }
            if(session.ageMax!=null)
            {
                if(!session.ageMax.equals(""))
                {
                    Calendar calmax = Calendar.getInstance();
                    calmax.setTime(now);
                    int year = calmax.get(Calendar.YEAR) - Integer.parseInt(session.ageMax);
                    calmax.set(Calendar.YEAR, year)
                    dma=calmax.getTime();  
                }
            }
       
        
       
            def rechcand=RechercheCandidat.get(session.rechcan)
            session.rechcan=rechcand
            if(params.sort==null)
            {
                params.sort="dateCreated"
            }
            else
            {
                params.sort=params.sort
            }
            if(params.order==null)
            {
                params.order="asc"
            }
            else
            {
                params.order=params.order
            }
            def c=Candidat.createCriteria()
            def connections1 = Candidat.createCriteria().list
            {
         
                if((session.nomStockage!=null)&&(!(session.nomStockage.equals(""))))
                {
                    ilike("nomStockage",session.nomStockage + "%")
                }
           
                if((session.prenomStockage!=null)&&(!(session.prenomStockage.equals(""))))
                {
                    ilike("prenomStockage",session.prenomStockage + "%")
                }
            
                if(session.ageMin != null && !session.ageMin.equals("")) {
                    ge('dateNaissance', dma)
                }
                
                if(session.ageMax != null && !session.ageMax.equals("")) {
                    le('dateNaissance', dmi)
                }
                if(!session.civilite.equals('null')){
                    long j=Long.parseLong(session.civilite)  
                
                    eq("civilite.id",j)
                }
            
                if(session.villes!=null)
                {               
                    if(session.villes instanceof String) {
                        eq('villecandidat.id', new Long(session.villes))
                    }   else {
                        or {
                            for(v in session.villes) {
                            
                                eq('villecandidat.id', new Long(v))
                            }
                        }
                    }             
                
                }
                if(session.niveauetudes!=null) {
                    if(session.niveauetudes instanceof String) {  
                        eq('niveauEtude.id', new Long(session.niveauetudes))
                    }
                    else
                    {
                        or {
                            for(v in session.niveauetudes) {
                                eq('niveauEtude.id', new Long(v))
                            }
                        }
                    }
                
                }
                if(session.plageexperiences!=null)
                { 
                    if(session.plageexperiences instanceof String) {  
                        eq('plageExperience.id', new Long(session.plageexperiences))
                    }
                    else
                    {
                        or {
                            for(v in session.plageexperiences) {
                                eq('plageExperience.id', new Long(v))
                            }
                        }
                    }
                
                }
         
                if(session.annote!=null)
                {
                    eq("annote",true) 
                
                }
                if(!session.sourceInscription.equals('null'))            
                {
                    eq('sourceInscription.id', new Long(session.sourceInscription))            
                }
                if(!session.annotation1.equals('null'))
                {           
                    eq('annotation1.id', new Long(session.annotation1))
                }
                if(!session.annotation2.equals('null'))
                {                    
                    eq('annotation2.id', new Long(session.annotation2))            
                }
                if(!session.profil1.equals('null'))
                {        
                    eq('profil1.id', new Long(session.profil1))
                }
                if(!session.profil2.equals('null'))
                {
                    eq('profil2.id', new Long(session.profil2))
                }
                if(session.secteuractivites!=null)
                {
                    if(session.secteuractivites instanceof String) {
                        experiences {
                            eq('secteurActivite.id', new Long(session.secteuractivites))
                        }
                    }
                    else
                    {
                        experiences {
                            or {
                                for(v in session.secteuractivites) {
                                    eq('secteurActivite.id', new Long(v))
                                }
                            }   
                        }
                    }
                }
            
                if(session.typeentreprises!=null)
                {
                    if(session.typeentreprises instanceof String) {
                        experiences {
                            eq('typeEntreprise.id', new Long(session.typeentreprises))
                        }
                    }
                    else
                    {
                        experiences {
                            or {
                                for(v in session.typeentreprises) {
                                    eq('typeEntreprise.id', new Long(v))
                                }
                            }   
                        }
                    }
                
                }
            
                if(session.postes!=null)
                {
                    if(session.postes instanceof String) {
                        experiences {
                            eq('poste.id', new Long(session.postes))
                        }
                    }
                    else
                    {
                        experiences {
                            or {
                                for(v in session.postes) {
                                    eq('poste.id', new Long(v))
                                }
                            }   
                        }
                    }                
                }
            
                if(session.diplomes!=null)
                {
                    if(session.diplomes instanceof String) { 
                        formationcandidats {
                            eq('diplome.id', new Long(session.diplomes))
                        }
                    }
                    else
                    {
                        formationcandidats {
                            or {
                                for(v in session.diplomes) {
                                    eq('diplome.id', new Long(v))
                                }
                            }   
                        }
                    }
                
                }
            
          
                if(params.order) {
                    order(params.sort, params.order)
                }
                resultTransformer(Criteria.DISTINCT_ROOT_ENTITY)

            }  
            if(session.candidatsSelectedList == null) {
                session.candidatsSelectedList= []
                session.candidatsSelectedMap= [:]          
            }
            def off
            def max=10
            if(params.offset==null)
            {
                off=0
                session.offset=0
            }
            else
            {
                off=params.offset
                session.offset=params.offset
            }
            if(params.max==null)
            {
                max=10 
            }
            if(params.motCle!=null)
            {
                session.motCle=params.motCle  
            }
            else
            {
                session.motCle='' 
            }
            def listcombine=[]
            def listcombine1=[]
            
            session.resultcombiner=connections1
            session.resultcombiner1=connections1
            session.order=params.order
            session.sort=params.sort
            params.max=10
            if(params.offset==null)
            {
                params.offset=0
                session.offset=params.offset
            }
            else
            {
                params.offset=params.offset
                session.offset=params.offset
            }
  
            if(params.offset instanceof String)
            {
                params.offset=Integer.parseInt(params.offset) 
                session.offset=params.offset
            }
            int firstresult=params.offset
            int lastresult=params.offset+9
            def tailleResultat = connections1.size()
            session.order=params.order
            session.sort=params.sort
            if(tailleResultat==0)
            {
                render(view:"list_recherche",model:[candidatInstanceList:null,candidatInstanceCount:0])   
            }
            else
            {
                if(tailleResultat<lastresult )
                {
                    lastresult= tailleResultat-1
                }
                def sliceList = connections1[firstresult..lastresult]
                render(view:"list_recherche",model:[candidatInstanceList:sliceList,candidatInstanceCount:tailleResultat]) 
            }
        }
        else
        {
            if(session.order!=params.order ||session.sort!=params.sort)
            {
                Date now = new Date();            
                if(session.ageMin!=null)
                {
                    if(!session.ageMin.equals(""))
                    {
                        Calendar calmin = Calendar.getInstance();
                        calmin.setTime(now);
                        int year = calmin.get(Calendar.YEAR) - Integer.parseInt(session.ageMin);
                        calmin.set(Calendar.YEAR, year)
                        dmi=calmin.getTime();
                    }
                }
                if(session.ageMax!=null)
                {
                    if(!session.ageMax.equals(""))
                    {
                        Calendar calmax = Calendar.getInstance();
                        calmax.setTime(now);
                        int year = calmax.get(Calendar.YEAR) - Integer.parseInt(session.ageMax);
                        calmax.set(Calendar.YEAR, year)
                        dma=calmax.getTime();  
                    }
                }
       
        
       
                def rechcand=RechercheCandidat.get(session.rechcan)
                session.rechcan=rechcand
                if(params.sort==null)
                {
                    params.sort="dateCreated"
                }
                else
                {
                    params.sort=params.sort
                }
                if(params.order==null)
                {
                    params.order="asc"
                }
                else
                {
                    params.order=params.order
                }
                def c=Candidat.createCriteria()
                def connections1 = Candidat.createCriteria().list
                {
         
                    if((session.nomStockage!=null)&&(!(session.nomStockage.equals(""))))
                    {
                        ilike("nomStockage",session.nomStockage + "%")
                    }
           
                    if((session.prenomStockage!=null)&&(!(session.prenomStockage.equals(""))))
                    {
                        ilike("prenomStockage",session.prenomStockage + "%")
                    }
            
                    if(session.ageMin != null && !session.ageMin.equals("")) {
                        ge('dateNaissance', dma)
                    }
                
                    if(session.ageMax != null && !session.ageMax.equals("")) {
                        le('dateNaissance', dmi)
                    }
                    if(!session.civilite.equals('null')){
                        long j=Long.parseLong(session.civilite)  
                
                        eq("civilite.id",j)
                    }
            
                    if(session.villes!=null)
                    {               
                        if(session.villes instanceof String) {
                            eq('villecandidat.id', new Long(session.villes))
                        }   else {
                            or {
                                for(v in session.villes) {
                            
                                    eq('villecandidat.id', new Long(v))
                                }
                            }
                        }             
                
                    }
                    if(session.niveauetudes!=null) {
                        if(session.niveauetudes instanceof String) {  
                            eq('niveauEtude.id', new Long(session.niveauetudes))
                        }
                        else
                        {
                            or {
                                for(v in session.niveauetudes) {
                                    eq('niveauEtude.id', new Long(v))
                                }
                            }
                        }
                
                    }
                    if(session.plageexperiences!=null)
                    { 
                        if(session.plageexperiences instanceof String) {  
                            eq('plageExperience.id', new Long(session.plageexperiences))
                        }
                        else
                        {
                            or {
                                for(v in session.plageexperiences) {
                                    eq('plageExperience.id', new Long(v))
                                }
                            }
                        }
                
                    }
         
                    if(session.annote!=null)
                    {
                        eq("annote",true) 
                
                    }
                    if(!session.sourceInscription.equals('null'))            
                    {
                        eq('sourceInscription.id', new Long(session.sourceInscription))            
                    }
                    if(!session.annotation1.equals('null'))
                    {           
                        eq('annotation1.id', new Long(session.annotation1))
                    }
                    if(!session.annotation2.equals('null'))
                    {                    
                        eq('annotation2.id', new Long(session.annotation2))            
                    }
                    if(!session.profil1.equals('null'))
                    {        
                        eq('profil1.id', new Long(session.profil1))
                    }
                    if(!session.profil2.equals('null'))
                    {
                        eq('profil2.id', new Long(session.profil2))
                    }
                    if(session.secteuractivites!=null)
                    {
                        if(session.secteuractivites instanceof String) {
                            experiences {
                                eq('secteurActivite.id', new Long(session.secteuractivites))
                            }
                        }
                        else
                        {
                            experiences {
                                or {
                                    for(v in session.secteuractivites) {
                                        eq('secteurActivite.id', new Long(v))
                                    }
                                }   
                            }
                        }
                    }
            
                    if(session.typeentreprises!=null)
                    {
                        if(session.typeentreprises instanceof String) {
                            experiences {
                                eq('typeEntreprise.id', new Long(session.typeentreprises))
                            }
                        }
                        else
                        {
                            experiences {
                                or {
                                    for(v in session.typeentreprises) {
                                        eq('typeEntreprise.id', new Long(v))
                                    }
                                }   
                            }
                        }
                
                    }
            
                    if(session.postes!=null)
                    {
                        if(session.postes instanceof String) {
                            experiences {
                                eq('poste.id', new Long(session.postes))
                            }
                        }
                        else
                        {
                            experiences {
                                or {
                                    for(v in session.postes) {
                                        eq('poste.id', new Long(v))
                                    }
                                }   
                            }
                        }                
                    }
            
                    if(session.diplomes!=null)
                    {
                        if(session.diplomes instanceof String) { 
                            formationcandidats {
                                eq('diplome.id', new Long(session.diplomes))
                            }
                        }
                        else
                        {
                            formationcandidats {
                                or {
                                    for(v in session.diplomes) {
                                        eq('diplome.id', new Long(v))
                                    }
                                }   
                            }
                        }
                
                    }
            
          
                    if(params.order) {
                        order(params.sort, params.order)
                    }
                    resultTransformer(Criteria.DISTINCT_ROOT_ENTITY)

                }  
                if(session.candidatsSelectedList == null) {
                    session.candidatsSelectedList= []
                    session.candidatsSelectedMap= [:]          
                }
                def off
                def max=10
                if(params.offset==null)
                {
                    off=0
                    session.offset=0
                }
                else
                {
                    off=params.offset
                    session.offset=params.offset
                }
                if(params.max==null)
                {
                    max=10 
                }
                if(params.motCle!=null)
                {
                    session.motCle=params.motCle  
                }
                else
                {
                    session.motCle='' 
                }
                def listcombine=[]
                def listcombine1=[]
               
                session.resultcombiner=connections1
                session.resultcombiner1=connections1
                session.order=params.order
                session.sort=params.sort
            
                params.max=10
                if(params.offset==null)
                {
                    params.offset=0
                    session.offset=0
                }
                else
                {
                    params.offset=params.offset
                    session.offset=params.offset
                }
  
                if(params.offset instanceof String)
                {
                    params.offset=Integer.parseInt(params.offset) 
                    session.offset=params.offset
                }
                int firstresult=params.offset
                int lastresult=params.offset+9
                def tailleResultat = connections1.size()
                if(tailleResultat==0)
                {
                    render(view:"list_recherche",model:[candidatInstanceList:null,candidatInstanceCount:0])   
                }
                else
                {
                    if(tailleResultat<lastresult )
                    {
                        lastresult= tailleResultat-1
                    }
                    if(connections1.size()==9)
                    {
                        render(view:"list_recherche",model:[candidatInstanceList:connections1,candidatInstanceCount:connections1.size()]) 
                    }
                    else
                    {
                        def sliceList = connections1[firstresult..lastresult]
                        render(view:"list_recherche",model:[candidatInstanceList:sliceList,candidatInstanceCount:tailleResultat])
                    }
                     
                }
                
                
            }
            else
            {
                /////////////////////////    
                
                
                Date now = new Date();            
                if(session.ageMin!=null)
                {
                    if(!session.ageMin.equals(""))
                    {
                        Calendar calmin = Calendar.getInstance();
                        calmin.setTime(now);
                        int year = calmin.get(Calendar.YEAR) - Integer.parseInt(session.ageMin);
                        calmin.set(Calendar.YEAR, year)
                        dmi=calmin.getTime();
                    }
                }
                if(session.ageMax!=null)
                {
                    if(!session.ageMax.equals(""))
                    {
                        Calendar calmax = Calendar.getInstance();
                        calmax.setTime(now);
                        int year = calmax.get(Calendar.YEAR) - Integer.parseInt(session.ageMax);
                        calmax.set(Calendar.YEAR, year)
                        dma=calmax.getTime();  
                    }
                }
       
        
       
                def rechcand=RechercheCandidat.get(session.rechcan)
                session.rechcan=rechcand
                if(params.sort==null)
                {
                    params.sort="dateCreated"
                }
                else
                {
                    params.sort=params.sort
                }
                if(params.order==null)
                {
                    params.order="asc"
                }
                else
                {
                    params.order=params.order
                }
                def c=Candidat.createCriteria()
                def connections1 = Candidat.createCriteria().list
                {
         
                    if((session.nomStockage!=null)&&(!(session.nomStockage.equals(""))))
                    {
                        ilike("nomStockage",session.nomStockage + "%")
                    }
           
                    if((session.prenomStockage!=null)&&(!(session.prenomStockage.equals(""))))
                    {
                        ilike("prenomStockage",session.prenomStockage + "%")
                    }
            
                    if(session.ageMin != null && !session.ageMin.equals("")) {
                        ge('dateNaissance', dma)
                    }
                
                    if(session.ageMax != null && !session.ageMax.equals("")) {
                        le('dateNaissance', dmi)
                    }
                    if(!session.civilite.equals('null')){
                        long j=Long.parseLong(session.civilite)  
                
                        eq("civilite.id",j)
                    }
            
                    if(session.villes!=null)
                    {               
                        if(session.villes instanceof String) {
                            eq('villecandidat.id', new Long(session.villes))
                        }   else {
                            or {
                                for(v in session.villes) {
                            
                                    eq('villecandidat.id', new Long(v))
                                }
                            }
                        }             
                
                    }
                    if(session.niveauetudes!=null) {
                        if(session.niveauetudes instanceof String) {  
                            eq('niveauEtude.id', new Long(session.niveauetudes))
                        }
                        else
                        {
                            or {
                                for(v in session.niveauetudes) {
                                    eq('niveauEtude.id', new Long(v))
                                }
                            }
                        }
                
                    }
                    if(session.plageexperiences!=null)
                    { 
                        if(session.plageexperiences instanceof String) {  
                            eq('plageExperience.id', new Long(session.plageexperiences))
                        }
                        else
                        {
                            or {
                                for(v in session.plageexperiences) {
                                    eq('plageExperience.id', new Long(v))
                                }
                            }
                        }
                
                    }
         
                    if(session.annote!=null)
                    {
                        eq("annote",true) 
                
                    }
                    if(!session.sourceInscription.equals('null'))            
                    {
                        eq('sourceInscription.id', new Long(session.sourceInscription))            
                    }
                    if(!session.annotation1.equals('null'))
                    {           
                        eq('annotation1.id', new Long(session.annotation1))
                    }
                    if(!session.annotation2.equals('null'))
                    {                    
                        eq('annotation2.id', new Long(session.annotation2))            
                    }
                    if(!session.profil1.equals('null'))
                    {        
                        eq('profil1.id', new Long(session.profil1))
                    }
                    if(!session.profil2.equals('null'))
                    {
                        eq('profil2.id', new Long(session.profil2))
                    }
                    if(session.secteuractivites!=null)
                    {
                        if(session.secteuractivites instanceof String) {
                            experiences {
                                eq('secteurActivite.id', new Long(session.secteuractivites))
                            }
                        }
                        else
                        {
                            experiences {
                                or {
                                    for(v in session.secteuractivites) {
                                        eq('secteurActivite.id', new Long(v))
                                    }
                                }   
                            }
                        }
                    }
            
                    if(session.typeentreprises!=null)
                    {
                        if(session.typeentreprises instanceof String) {
                            experiences {
                                eq('typeEntreprise.id', new Long(session.typeentreprises))
                            }
                        }
                        else
                        {
                            experiences {
                                or {
                                    for(v in session.typeentreprises) {
                                        eq('typeEntreprise.id', new Long(v))
                                    }
                                }   
                            }
                        }
                
                    }
            
                    if(session.postes!=null)
                    {
                        if(session.postes instanceof String) {
                            experiences {
                                eq('poste.id', new Long(session.postes))
                            }
                        }
                        else
                        {
                            experiences {
                                or {
                                    for(v in session.postes) {
                                        eq('poste.id', new Long(v))
                                    }
                                }   
                            }
                        }                
                    }
            
                    if(session.diplomes!=null)
                    {
                        if(session.diplomes instanceof String) { 
                            formationcandidats {
                                eq('diplome.id', new Long(session.diplomes))
                            }
                        }
                        else
                        {
                            formationcandidats {
                                or {
                                    for(v in session.diplomes) {
                                        eq('diplome.id', new Long(v))
                                    }
                                }   
                            }
                        }
                
                    }
            
          
                    if(params.order) {
                        order(params.sort, params.order)
                    }
                    resultTransformer(Criteria.DISTINCT_ROOT_ENTITY)

                }  
                if(session.candidatsSelectedList == null) {
                    session.candidatsSelectedList= []
                    session.candidatsSelectedMap= [:]          
                }
                def off
                def max=10
                if(params.offset==null)
                {
                    off=0
                    session.offset=0
                }
                else
                {
                    off=params.offset
                    session.offset=params.offset
                }
                if(params.max==null)
                {
                    max=10 
                }
                if(params.motCle!=null)
                {
                    session.motCle=params.motCle  
                }
                else
                {
                    session.motCle='' 
                }
                //                def listcombine2=[]
                //            def listcombine11=[]
            
                session.resultcombiner=connections1
                session.resultcombiner1=connections1
                session.order=params.order
                session.sort=params.sort
                params.max=10
                if(params.offset==null)
                {
                    params.offset=0
                    session.offset=params.offset
                }
                else
                {
                    params.offset=params.offset
                    session.offset=params.offset
                }
  
                if(params.offset instanceof String)
                {
                    params.offset=Integer.parseInt(params.offset) 
                    session.offset=params.offset
                }
                
                params.max=10
                if(params.offset==null)
                {
                    params.offset=0
                    session.offset=0
                }
                else
                {
                    params.offset=params.offset
                    session.offset=params.offset
                }
  
                if(params.offset instanceof String)
                {
                    params.offset=Integer.parseInt(params.offset) 
                    session.offset=params.offset
                }
                int firstresult=params.offset
                int lastresult=params.offset+9
                def listcombine2=session.resultcombiner1
                def listcombine11=session.resultcombiner1
                def tailleResultat = listcombine11.size()
                session.order=params.order
                session.sort=params.sort
                if(tailleResultat==0)
                {
                    render(view:"list_recherche",model:[candidatInstanceList:null,candidatInstanceCount:0])   
                }
                else
                {
                    if(tailleResultat<lastresult )
                    {
                        lastresult= tailleResultat-1
                        def sliceList = listcombine11[firstresult..lastresult]
                        render(view:"list_recherche",model:[candidatInstanceList:sliceList,candidatInstanceCount:tailleResultat])
                    }
                    else if(tailleResultat==lastresult)
                    {
                    
                        def sliceList = listcombine11[params.offset..tailleResultat-1]
                        render(view:"list_recherche",model:[candidatInstanceList:sliceList,candidatInstanceCount:tailleResultat])
                    }
                    else
                    {
                        def sliceList = listcombine11[firstresult..lastresult]
                        render(view:"list_recherche",model:[candidatInstanceList:sliceList,candidatInstanceCount:tailleResultat]) 
                    }
                }
                
            }
            
            
        }    

    }
    
    
    def testcheck1(){
        if(params.state=="checked"){ 
            session.candidatsSelectedList.add(params.value)
            session.candidatsSelectedMap[params.value] = true 
        }
        else {
            session.candidatsSelectedList.remove(params.value)
            session.candidatsSelectedMap[params.value] = false
        }
    }
    def testcheckoriginal(){
        if(params.state=="checked"){ 
            session.candidatsaffecter.add(params.value)
            //            session.candidatsSelectedMap[params.value] = true 
        }
        else {
          
            session.candidatsaffecter.remove(params.value)
        }
    }
    
    
    

    
}
