package com.rabbahsoft.diorhprofiler


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.orm.PagedResultList

/**
 * ContactController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class ContactController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
            
        if(session.contactsSelectedList == null) {
            session.contactsSelectedList= []
            session.contactsSelectedMap= [:]          
        }
        params.max = Math.min(max ?: 10, 100)
        if(params.offset) {
            session.list_contact_offset = params.offset
        } else if(session.list_contact_offset) {
            params.offset = session.list_contact_offset
        }
        if(params.sort) {
            session.list_contact_sort = params.sort
            session.list_contact_order = params.order
        } else if(session.list_contact_sort) {
            params.sort = session.list_contact_sort
            params.order = session.list_contact_order
        }
        respond Contact.list(params), model:[contactInstanceCount: Contact.count()]
    }
	
    def check() {
        println params.value
        println params.state
        if(params.state=="checked"){ 
            session.contactsSelectedList.add(params.value)
            session.contactsSelectedMap[params.value] = true 
        }
        else {
            session.contactsSelectedList.remove(params.value)
            session.contactsSelectedMap[params.value] = false
        }
        println session.contactsSelectedList
    }
    
    def sendmail(){ 
        println session.contactsSelectedList
        if(params.send=="true"){
            println 'send'
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
            session.contactsSelectedList=[]
            session.contactsSelectedMap=[:] 

        }
        else{ 
            println 'else'
            def emails
            def listemail=[]
            if(session.contactsSelectedList!=null){
                println 'nutnull'
                for(element in session.contactsSelectedList){
                    def contact=Contact.get(element)
                    for(el in contact.interlocuteurcontacts){
                        println el.email
                        listemail.add(el.email)
                    }
                }
                emails=listemail.join(",")
            }
            else{
                emails=""
            }
            println emails
            [emails:emails]
        }
    }

    def show(Contact contactInstance) {
         respond contactInstance        
    }

    def create() {
        respond new Contact(params)
    }

    @Transactional
    def save(Contact contactInstance) {
        def dateCreationEntrep
        def mapcontact
        if(params.dateCreationEntrep==null || params.dateCreationEntrep=='null' || params.dateCreationEntrep=='')
        {
          mapcontact=[dateCreation:new Date(),fax:params.fax, dateCreationEntrep:null, type:params.type,secteurActivite:params.secteurActivite,typeEntreprise:params.typeEntreprise, adresse1:params.adresse1, adresse2:params.adresse2, chiffreAffaire:params.chiffreAffaire,ville:params.ville,codePostal:params.codePostal, effectif:params.effectif, effectifCadre:params.effectifCadre, adresse3:params.adresse3, directeurGeneral:params.directeurGeneral, telephone:params.telephone, raisonSociale:params.raisonSociale]
        }
        else
        {
           mapcontact=[dateCreation:new Date(),fax:params.fax, dateCreationEntrep:Date.parse("dd/MM/yyyy",params.dateCreationEntrep), type:params.type,secteurActivite:params.secteurActivite,typeEntreprise:params.typeEntreprise, adresse1:params.adresse1, adresse2:params.adresse2, chiffreAffaire:params.chiffreAffaire,ville:params.ville,codePostal:params.codePostal, effectif:params.effectif, effectifCadre:params.effectifCadre, adresse3:params.adresse3, directeurGeneral:params.directeurGeneral, telephone:params.telephone, raisonSociale:params.raisonSociale]
        }
        def contact=new Contact(mapcontact)
        for(int i=0;i<params.int('addinterlocuteurcontact');i++)
        {
            if(params.get("interlocuteurcontacts["+i+"]")!=null)
            {
                contact.addToInterlocuteurcontacts(params.get("interlocuteurcontacts["+i+"]"))
            }
        }
        contact.save(failOnError:true,flush:true)
        flash.message = message(code: 'default.createdmessage.message',default: "L'objet a été crée")
        redirect(action: "show", id:contact.id)
    }

    def edit(Contact contactInstance) {
        respond contactInstance
    }

    @Transactional
    def update(Contact contactInstance) {
        def dateCreationEntrep=null
        if(params.dateCreationEntrep==''|| params.dateCreationEntrep=='null'|| params.dateCreationEntrep==null)
        {
          dateCreationEntrep=null  
        }
        else
        {
            dateCreationEntrep=Date.parse("dd/MM/yyyy",params.dateCreationEntrep)
        }
        def mapcontact=[id:params.id,fax:params.fax, dateCreationEntrep:dateCreationEntrep, type:params.type,secteurActivite:params.secteurActivite,typeEntreprise:params.typeEntreprise, adresse1:params.adresse1, adresse2:params.adresse2, chiffreAffaire:params.chiffreAffaire,ville:params.ville,codePostal:params.codePostal, effectif:params.effectif, effectifCadre:params.effectifCadre, adresse3:params.adresse3, directeurGeneral:params.directeurGeneral, telephone:params.telephone, raisonSociale:params.raisonSociale]
        def contact=Contact.get(mapcontact.id)
        contact.properties = mapcontact
        contact.interlocuteurcontacts.clear()
        for(int i=0;i<params.int('addinterlocuteurcontact');i++)
        {
            if(params.get("interlocuteurcontacts["+i+"]")!=null)
            {
                contact.addToInterlocuteurcontacts(params.get("interlocuteurcontacts["+i+"]"))
            }
        }
        contact.save(failOnError:true,flush:true)
        flash.message = message(code: 'default.updatedmessage.message',default: "L'objet a été modifié")
        redirect(action: "show", id:contact.id)
    }

    @Transactional
    def delete(Contact contactInstance) {

        if (contactInstance == null) {
            notFound()
            return
        }
try
{
    contactInstance.delete flush:true
  flash.message = message(code: 'default.deleteddmessage.message',default: "L'objet a été supprimé")     
                redirect action:"list", method:"GET"  
}
catch(Exception e)
{
    println("exception  ")
    flash.message = message(code: 'default.deleteddmessage.message',default: "L'objet ne peus pas etre supprimer puisqu'il est lie à une mission")     
                redirect action:"list", method:"GET"
}
//        contactInstance.delete flush:true
//
//        request.withFormat {
//            form {
//                flash.message = message(code: 'default.deleteddmessage.message',default: "L'objet a été supprimé")     
//                redirect action:"list", method:"GET"
//            }
//            '*'{ render status: NO_CONTENT }
//        }
        
        
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'contactInstance.label', default: 'Contact'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    
    def rechercher_contact(){         
    }
    
    def resultat_recherche(){
        if(params.offset==null)
        {
            params.offset=0
        }
        if(params.max==null)
        {
            params.max=10
        }
        def criteria = Contact.createCriteria()
        def result = criteria.list(max: params.max, offset: params.offset) {
            if(session.raisonSociale!="")
            ilike('raisonSociale',"%"+session.raisonSociale+"%")
            if(session.typeEntreprises.size()!=0)
            'in'('typeEntreprise.id',session.typeEntreprises)
            if(session.secteurActivites.size()!=0)
            'in'('secteurActivite.id',session.secteurActivites)
            if(session.types.size()!=0)
            'in'('type',session.types)
            if(params.offset instanceof String)
            {
                firstResult(Integer.parseInt(params.offset))
            }
            else
            {
                firstResult(params.offset)
            } 
            maxResults(10)
        }
        def criterCount = Contact.createCriteria()
        def count = criterCount.count {
            if(session.raisonSociale!="")
            ilike('raisonSociale',"%"+session.raisonSociale+"%")
            if(session.typeEntreprises.size()!=0)
            'in'('typeEntreprise.id',session.typeEntreprises)
            if(session.secteurActivites.size()!=0)
            'in'('secteurActivite.id',session.secteurActivites)
            if(session.types.size()!=0)
            'in'('type',session.types)
        } 
        [contactInstanceList:result,contactInstanceCount: count]        
    }
    
    def suivant(){  
        def contactminabsolut
        if(session.list_contact_sort==null)
        {
            contactminabsolut=Contact.executeQuery("select id from Contact ") 
        }
        else
        {
            contactminabsolut=Contact.executeQuery("select id from Contact a order by "+session.list_contact_sort+" "+session.list_contact_order) 
        }
        def listemail11=[]
        int i=0
        int suiv
        int idcourant
        for(tt1 in contactminabsolut)
        {
            if(tt1==Long.parseLong(params.id))
            {
                suiv=i+1
                idcourant=i
            }
            listemail11[i]=tt1
            i++
        }
        if(suiv==contactminabsolut.size())
        {
            flash.message = message(code: 'default.searchlastelement',default: "Vous avez atteint le dérnier element de la liste")
            redirect(action: "show", id: params.id, params: params)  
        }
        else
        {
            def suivant=listemail11[suiv]
            def c=Contact.get(suivant)
            redirect(action: "show", id: suivant, params: params)   
        }
    }
    
    def precedent()
    {  
        def contactminabsolut
        
        if(session.list_contact_sort==null)
        {
           
            contactminabsolut=Contact.executeQuery("select id from Contact ")          
        }
        else
        {          
            contactminabsolut=Contact.executeQuery("select id from Contact a order by "+session.list_contact_sort+" "+session.list_contact_order)
        }
                        
        def listemail11=[]

        int i=0
        int prec
        int idcourant
        for(tt1 in contactminabsolut)
        {
            if(tt1==Long.parseLong(params.id))
            {
                prec=i-1
                idcourant=i
            }
            listemail11[i]=tt1
            i++
        }
        if(idcourant==0)
        {
            flash.message = message(code: 'default.searchfirstelement',default: "Vous avez atteint le premier element de la liste")
            redirect(action: "show", id: params.id, params: params)  
        }
        else
        {
            def precedent=listemail11[prec]
            def c=Contact.get(precedent)
            redirect(action: "show", id: precedent, params: params)   
        }
    }
    
    @Transactional
    def list_recherche() {
        if(params.offset) {
            session.list_recherche_contact_offset = params.offset
        } else if(session.list_recherche_contact_offset) {
            params.offset = session.list_recherche_contact_offset
        }
        if(params.sort) {
            session.list_recherche_contact_sort = params.sort
            session.list_recherche_contact_order = params.order
        } else if(session.list_recherche_contact_sort) {
            params.sort = session.list_recherche_contact_sort
            params.order = session.list_recherche_contact_order
        }
           
        def secteurActivites=[]
        def typeEntreprises=[]
        def types=[]
        if(params.secteurActivite !=null){
            if(params.secteurActivite.id instanceof String){
                secteurActivites.add(new Long(params.secteurActivite.id))
            }
            else {
                for(sa in params.secteurActivite.id){
                    secteurActivites.add(new Long(sa))
                }
                
            }
        }
        if(params.typeEntreprise !=null){
            if(params.typeEntreprise.id instanceof String){
                typeEntreprises.add(new Long(params.typeEntreprise.id))
            }
            else {
                for(te in params.typeEntreprise.id){
                    typeEntreprises.add(new Long(te))
                }
                
            }
        }
        if(params.type!=null){
            if(params.type instanceof String){
                types.add(params.type)
            }
            else {
                for(te in params.type){
                    types.add(te)
                }
                
            }
        }
        session.raisonSociale=params.raisonSociale
        session.typeEntreprises=typeEntreprises
        session.secteurActivites=secteurActivites
        session.types=types
        redirect(controller:"contact", action:"resultat_recherche")
    }
}
