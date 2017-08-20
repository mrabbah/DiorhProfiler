package com.rabbahsoft.profiler
import org.apache.commons.logging.Log 
import org.apache.commons.logging.LogFactory
import java.util.Scanner
import java.io.File;
import java.io.ByteArrayOutputStream
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.*;
import java.text.*;
import java.text.SimpleDateFormat;
import org.springframework.web.multipart.commons.CommonsMultipartFile
import com.macrobit.grails.plugins.attachmentable.services.AttachmentableService
import org.springframework.web.multipart.MultipartFile
import org.apache.commons.fileupload.disk.DiskFileItem
import org.apache.commons.fileupload.disk.DiskFileItemFactory
import org.apache.commons.fileupload.FileItem
import java.io.*
import com.macrobit.grails.plugins.attachmentable.domains.Attachment
import com.macrobit.grails.plugins.attachmentable.domains.AttachmentLink
import org.apache.commons.io.FilenameUtils
import com.macrobit.grails.plugins.attachmentable.core.exceptions.EmptyFileException
import java.lang.reflect.UndeclaredThrowableException
//import javax.activation.MimetypesFileTypeMap

import com.rabbahsoft.diorhprofiler.*;
import org.springframework.transaction.annotation.Transactional

import com.diorh.dto.FichierDto
import cr.co.arquetipos.password.PasswordTools
import cr.co.arquetipos.crypto.Blowfish
//import org.hibernate.*

/**
 * ExcelImporterService
 * A service class encapsulates the core business logic of a Grails application
 */
@Transactional
//static transactional = false
 class ExcelImporterService {

    private Log logger = LogFactory.getLog(ExcelImporterService.class) 
    
    static SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd-hh-mm");
    
    static String  baseDir1="/usr/share/tomcat7/dossiers_prod";
    
    static String fs = System.getProperty('file.separator');
    static String ls = System.getProperty('line.separator');
    def attachmentableService
    //static String  baseDir1="/usr/share/tomcat7/dossiers_prod";
    //SessionFactory sessionFactory
	
    def creerFichierLogImport(String nomFichier) {
        File filelog = new File(System.getProperty('user.home')+fs+nomFichier+dateFormat.format(new Date()))
        filelog.createNewFile();
        loggerInformations(filelog, System.getProperty('os.name'))
        loggerInformations(filelog, System.getProperty('os.arch'))
        loggerInformations(filelog, System.getProperty('user.dir'))
        loggerInformations(filelog, System.getProperty('user.home'))
        loggerInformations(filelog, System.getProperty('user.language'))
        loggerInformations(filelog, System.getProperty('java.version'))
        loggerInformations(filelog, System.getProperty('java.vendor'))
        return filelog;
    }
    
    
    def loggerInformations(File filelog, Object info) {
        filelog << info
        filelog << ls
    }
    
    def importerCandidats(File fichier) {
	/*assert sessionFactory != null

        // loop and save your books here

        def hibSession = sessionFactory.getCurrentSession()
        assert hibSession != null*/
    
        File fileLog = creerFichierLogImport("log_import_candidats")
        def compteur = 0;
        def nbImport = 0;
        def nbEchec = 0;
        def profilcandidat=Profil.findByLibelle("candidat")
        def reponse = "Import candidats " + new Date() + " <br/>"
        def var
        def  nationalitemax
        nationalitemax=Nationalite.executeQuery("select max(ordre) from Nationalite ") 
        int nationalitesuiv=nationalitemax[0]+100
   
       
        //   DiskFileItem fileItem = new DiskFileItem("file", "application/pdf", false, file.getName(), (int) file.length() , file.getParentFile());
        //    fileItem.getOutputStream();
        //    MultipartFile multipartFile = new CommonsMultipartFile(fileItem);
        //     println("multipartFile    "+multipartFile)
        //attachmentableService.addAttachment(evaluator, candidat.id, file)
                         
        fichier.toCsvReader(['separatorChar':';','charset':'Windows-1252']).eachLine { tokens ->
            if(compteur == 0) {
                compteur++ 
            } else 
            {
                try { 
                                       
                    //   ////println tokens[0] + " ------ " +  tokens[1]+ " ------ " +  tokens[2]+ " ------ " +  tokens[3]+ " ------ " +  tokens[4]+ " ------ " +  tokens[5]+ " ------ " +  tokens[6]+ " ------ " +  tokens[7]+ " ------ " +  tokens[8]+ " ------ " +  tokens[9]+ " ------ " +  tokens[10]+ " ------ " +  tokens[11]+ " ------ " +  tokens[12]+ " ------ " +  tokens[13]+ " ------ " +  tokens[14]+ " ------ " +  tokens[15]+ " ------ " +  tokens[16]+ " ------ " +  tokens[17]+ " ------ " +  tokens[18]+ " ------ " +  tokens[19]+ " ------ " +  tokens[20]+ " ------ " +  tokens[21]+ " ------ " +  tokens[22]+ " ------ " +  tokens[23]+ " ------ " +  tokens[24]+ " ------ " +  tokens[25]+ " ------ " +  tokens[26]+ " ------ " +  tokens[27]+ " ------ " +  tokens[28]+ " ------ " +  tokens[29]+ " ------ " +  tokens[30]+ " ------ " +  tokens[31]               
                    def dateCreation = tokens[0]
                    def dateModification = tokens[1]
                    def dateNaissance = tokens[2]
                    def renumAvantages = tokens[12]
                    def annotationCommentaire = tokens[18]
                    def annotationProfil1 = AnnotationProfil.findByLibelle(tokens[30])
                    def annotationProfil2 = null
                    def annotationNote1 = AnnotationNote.findByLibelle(tokens[29])
                    def annotationNote2 = null
                    def sourceInfo = SourceInscription.findByLibelle(tokens[31])
                    def nomStockage = tokens[21]
                    def prenomStockage = tokens[22]
                    def email = tokens[23]
                    def password = tokens[24]
                    def civilite = Civilite.findByLibelle(tokens[25]) 
                    def situationFamiliale = SituationFamiliale.findByLibelle(tokens[26])
                    def niveauEtude = NiveauEtude.findByLibelle(tokens[27])
                    def plageExperience = PlageExperience.findByLibelle(tokens[28])
                    def telPortable = tokens[4]
                    def telFix = tokens[5]
                    def adresse = tokens[6]
                    def annote = tokens[16]    
                    def na81
                    def lieuNaissance=null 
                    def villeautre=Ville.findByNom("AUTRE")
                    
                    if(tokens[3]!="" && !tokens[3].startsWith("*")){
                        if(tokens[3].length()>4){
                            lieuNaissance = Ville.findByNomIlike(tokens[3].substring(0,3)+"%")}
                        else {
                            if(tokens[3].toUpperCase().equals("FES") || tokens[3].toUpperCase().equals("FÉS")) {
                                tokens[3] = "FÈS"
                                lieuNaissance = Ville.findByNomIlike(tokens[3])
                            }
                            
                        }
                        if(lieuNaissance==null){
                            //throw new Exception('lieuNaissance : '+ tokens[3]+' --- n existe pas dans la base de données')  
                            
                            loggerInformations(fileLog, " nom " + nomStockage + " prenom" + prenomStockage+"  email "+email+" lieuNaissance et  valeur "+tokens[3] )
                            lieuNaissance=villeautre
                            //créer une ville avec le nom passée en arguement et dont le pays autre
                            //puis sauveguarder
                        }
                    }                  
                    def villecandidat =null
                    if(tokens[7]!="" && !tokens[7].startsWith("*")){
                        if(tokens[7].length()>4){
                            villecandidat = Ville.findByNomIlike(tokens[7].substring(0,3)+"%")}
                        else{
                            if(tokens[3].toUpperCase().equals("FES") || tokens[3].toUpperCase().equals("FÉS")) {
                                tokens[3] = "FÈS"
                                villecandidat = Ville.findByNomIlike(tokens[7])
                            }
                            
                        }
                        if(villecandidat==null){
                            // throw new Exception('Villecandidat : '+ tokens[7]+' --- n existe pas dans la base de données')    
                            loggerInformations(fileLog, " nom " + nomStockage + " prenom" + prenomStockage+"  email "+email+" villecandidat et  valeur "+tokens[7] )
                            villecandidat=villeautre
                           
                        }
                    }
                                        
                    def nationalite =null
                    if(tokens[8]!=""){
                        if(tokens[8].length()>3){
                            nationalite = Nationalite.findByLibelleIlike(tokens[8].substring(0,2)+"%")}
                        else{
                            nationalite = Nationalite.findByLibelleIlike(tokens[8])}
                        if(nationalite==null){
                            loggerInformations(fileLog, " nom " + nomStockage + " prenom" + prenomStockage+"  email "+email+" nationalite et  valeur "+tokens[8] )
                            na81=new Nationalite(libelle:tokens[8],ordre:nationalitesuiv).save(failOnError:true,flush:true)
                            nationalite=na81
                            nationalitesuiv=nationalitesuiv+100
                            //throw new Exception('nationalite : '+ tokens[8]+' --- n existe pas dans la base de données')  
                            
                            
                        }
                    }
                    def preavis =null
                    if(tokens[9]!="" && tokens[9]!="null"){
                        if (tokens[9].replaceAll("[^\\0123456789]","")!="")
                        {
                            def pr=tokens[9].replaceAll("[^\\0123456789]","")
                            def ggg=isInt(pr.replaceAll("[^\\0123456789]",""))
                            if(ggg==true)
                            {
                                preavis=Double.parseDouble(pr)
                            }
                            else
                            {
                                preavis=1   
                            }
                           
                           
                        }
                        else{
                            preavis=1
                            //throw new Exception('preavis : '+ tokens[9]+' --- Variable de type String ')    
                            //donner la valeur 1
                        }
                    }    
                                        
                    def renumMontantNet =null
                    if(tokens[10]!="" && tokens[10]!="null"){
                        if (tokens[10].replaceAll("[^\\0123456789]","")!="")
                        {
                            def pr=tokens[10].replaceAll("[^\\0123456789]","")
                             
                            def ggg=isInt(pr.replaceAll("[^\\0123456789]",""))
                            if(ggg==true)
                            {
                                renumMontantNet=Double.parseDouble(pr)
                            }
                            else
                            {
                                renumMontantNet=1   
                            }
                            
                           
                        }
                        else{
                            renumMontantNet=1
                            //throw new Exception('renumMontantNet : '+ tokens[10]+' --- Variable de type String ')    
                            //idem
                        }
                    }          
                    def renumNbMois =null
                    if(tokens[11]!="" && tokens[11]!="null"){
                        if (tokens[11].replaceAll("[^\\0123456789]","")!="")
                        {
                            def pr=tokens[11].replaceAll("[^\\0123456789]","")
                            
                            def ggg=isInt(pr.replaceAll("[^\\0123456789]",""))
                            if(ggg==true)
                            {
                                renumNbMois=Double.parseDouble(pr)
                            }
                            else
                            {
                                renumNbMois=1   
                            }
                            
                        }
                        else{
                            renumNbMois=1
                            //throw new Exception('renumNbMois : '+ tokens[11]+' --- Variable de type String ')    
                            //idem
                        }
                        
                    }               
                    def renumPretention =null
                    if(tokens[13]!="" && tokens[13]!="null"){
                        if (tokens[13].replaceAll("[^\\0123456789]","")!="")
                        {
                            def pr=tokens[13].replaceAll("[^\\0123456789]","")
                            
                            def ggg=isInt(pr.replaceAll("[^\\0123456789]",""))
                            if(ggg==true)
                            {
                                renumPretention=Double.parseDouble(pr)
                            }
                            else
                            {
                                renumPretention=1   
                            }
                            
                        }
                        else{
                            renumPretention=1
                            // throw new Exception('renumPretention : '+ tokens[13]+' --- Variable de type String ')    
                            //idem
                        }
                    }
                    def mobilite1                  
                    if(tokens[14]!="" && tokens[14]!="null")
                    {
                        if(tokens[14].length()>3)
                        {
                            mobilite1 = Ville.findByNomIlike(tokens[14].substring(0,3)+"%")   
                        }   
                    }
                    def mobiliteLocalisation = tokens[15]
                    def connaissanceInfo = tokens[17]
                    def fichierCv = tokens[19]
                    def fichierPhoto = tokens[20]
                                                 
                
                    def map=[prenomStockage:prenomStockage,nomStockage:nomStockage,civilite:civilite,situationFamiliale:situationFamiliale,dateNaissance:Date.parse("dd/MM/yyyy",dateNaissance),dateCreated:Date.parse("dd/MM/yyyy",dateCreation),lastUpdated:Date.parse("dd/MM/yyyy",dateModification),
                        lieuNaissance:lieuNaissance,telPortable:telPortable,telFix:telFix,adresse:adresse,villecandidat:villecandidat,nationalite:nationalite,sourceInscription:sourceInfo,
                        email:email,rapportPerformance:"test",syntheseDiorh:"test",niveauEtude:niveauEtude,
                        remunMontantNet:renumMontantNet,remunAvantages:renumAvantages,preavis:preavis,remunPretention:renumPretention,remunNbrMois:renumNbMois,plageExperience:plageExperience,
                        mobiliteGeographique:null,mobilite1:null,mobilite2:null,mobilite3:null,
                        profil1:annotationProfil1,annotation1:annotationNote1,profil2:annotationProfil2,annotation2:annotationNote2,annotationCommentaire:annotationCommentaire,
                        firstName:prenomStockage,lastName:nomStockage,username:email,password:password,obsolute:false,connaissancesInfo:null,profil:profilcandidat,enabled: true,adresseIp:"*",annote:annote]

                    
                    def candidat=new Candidat(map)
                    candidat.save(failOnError:true,flush:true)
                        
                    nbImport++;
                    //hibSession.flush()
                } catch(Exception ex) {
                    
                    loggerInformations(fileLog, "Echec import ligne " + compteur + " " + ex)
                    //                    reponse += "Echec import ligne " + compteur + " " + ex + "<br/>"
                    nbEchec++;
            
                } finally {
                    compteur++;
                }
            }            
        }
        
        loggerInformations(fileLog, "Fin import Candidats : " + new Date())
        reponse += "Fin import Candidats : " + new Date() + "<br/>"
        loggerInformations(fileLog, "Nombre de lignes importées : " + nbImport + " sur " + (compteur - 2) + " lignes")
        reponse += "Nombre de lignes importées : " + nbImport + " sur " + compteur + " lignes" + "<br/>"
        loggerInformations(fileLog, "Nombre de lignes échouées : " + nbEchec)
        reponse += "Nombre de lignes échouées : " + nbEchec + "<br/>"
        return reponse
    }
    
    def importerContacts(File fichier) {
        File fileLog = creerFichierLogImport("log_import_cantacts")
        def compteur = 0;
        def nbImport = 0;
        def nbEchec = 0;
        def na8
        def na81
        def  SecteurActivitemax
        SecteurActivitemax=SecteurActivite.executeQuery("select max(ordre) from SecteurActivite ") 
        int SecteurActivitesuiv=SecteurActivitemax[0]+100
        def  typeentreprisemax
        typeentreprisemax=TypeEntreprise.executeQuery("select max(ordre) from TypeEntreprise ") 
        int typeentreprisemaxsuiv=typeentreprisemax[0]+100
        //////println("   typeentreprisemaxsuiv ini  "+typeentreprisemaxsuiv+" type  "+typeentreprisemaxsuiv.getClass())
        def reponse = "Import Contacts " + new Date() + "<br/>"
        fichier.toCsvReader(['separatorChar':';','charset':'Windows-1252']).eachLine { tokens ->
            if(compteur == 0) {
                compteur++               
            } else {
                try {
                    def id = tokens[0]
                    def raisonSociale = tokens[1]
                    def type = tokens[2]
                    def directeurGeneral = tokens[3]
                    def effectif
                    def villeautre=Ville.findByNom("AUTRE")
                   
                    if(!tokens[4].equals('null'))
                    {
                        tokens[4]=tokens[4].replaceAll("[^\\.0123456789]","");
                        effectif = Integer.parseInt(tokens[4])
                    }
                    else
                    {
                        effectif=null   
                    }
                    def effectifCadre
                    if(!tokens[5].equals('null'))
                    {
                        tokens[5]=tokens[5].replaceAll("[^\\.0123456789]","");
                        effectifCadre = Integer.parseInt(tokens[4])
                    }
                    else
                    {
                        effectifCadre=null   
                    }
                    //throw new Exception("dsljfdslkjf")
                    def chiffreAffaire = tokens[6]
                    def codePostal
                    if(!tokens[7].equals('null'))
                    {
                        tokens[7]=tokens[7].replaceAll("[^\\.0123456789]","");
                        codePostal=tokens[7]
                    }
                    else
                    {
                        codePostal=null   
                    }
                    def adresse1 = tokens[8]
                    def adresse2 = tokens[9]
                    def adresse3 = tokens[10]
                    def ville=null
                    if(tokens[11]!="" && tokens[11]!="null")
                    {
                        ville=Ville.findByNomIlike(tokens[11].substring(0,3)+"%")
                        if(ville==null)
                        {
                            loggerInformations(fileLog, " raisonSociale " + raisonSociale + " type" + type+"  adresse1 "+adresse1+" adresse2 "+adresse2+"   champ ville et valeur   "+tokens[11] )
                            ville=villeautre
                            //throw new Exception("la ville "+tokens[11]+" est innexitante dans la base de donnee")
                        }
                    }
                    def telephone = tokens[12]
                    def fax = tokens[14]
                    def dateCreation = tokens[15]
                    def dateCreationEntrep = tokens[16]
                    
                    
                    def secteurActivite=null
                    if(tokens[17]!="" && tokens[17]!="null")
                    {
                        secteurActivite=SecteurActivite.findByLibelleIlike(tokens[17]) 
                        if(secteurActivite==null)
                        {
                            //                            int secsuiv=SecteurActivitesuiv+100
                            ////println("   SecteurActivitesuiv avant  "+SecteurActivitesuiv)
                            loggerInformations(fileLog, " raisonSociale: " + raisonSociale + ", type: " + type+"  adresse1: "+adresse1+" adresse2: "+adresse2+"   champ secteurActivite et valeur:   "+tokens[17] +" ligne:  "+nbImport)
                            na8=new SecteurActivite(libelle:tokens[17],ordre:SecteurActivitesuiv).save(failOnError:true,flush:true)
                            secteurActivite=na8
                            SecteurActivitesuiv=SecteurActivitesuiv+100
                            ////println("   SecteurActivitesuiv apres  "+SecteurActivitesuiv)
                            //throw new Exception("ce secteur d\'activite "+tokens[17]+" est innexitant dans la base de donnee")
                        }
                    }
                    def typeEntreprise=null
                    if(tokens[18]!="" && tokens[18]!="null")
                    {
                        typeEntreprise=TypeEntreprise.findByLibelleIlike(tokens[18])
                        if(typeEntreprise==null)
                        {
                            loggerInformations(fileLog, " raisonSociale " + raisonSociale + " type" + type+"  adresse1 "+adresse1+" adresse2 "+adresse2+"   champ typeEntreprise et valeur   "+tokens[18] +" ligne:  "+nbImport)
                            na81=new TypeEntreprise(libelle:tokens[18],ordre:typeentreprisemaxsuiv).save(failOnError:true,flush:true)
                            typeEntreprise=na81
                            typeentreprisemaxsuiv=typeentreprisemaxsuiv+100
                            
                            //throw new Exception("ce typeEntreprise "+tokens[18]+" est innexitant dans la base de donnee")
                        }
                    }
                    
                
                    def map=[id:id,raisonSociale:raisonSociale,type:type,directeurGeneral:directeurGeneral,
                        chiffreAffaire:chiffreAffaire,adresse1:adresse1,effectif:effectif,effectifCadre:effectifCadre,codePostal:codePostal,
                        adresse2:adresse2,adresse3:adresse3,ville:ville,telephone:telephone,fax:fax,secteurActivite:secteurActivite,typeEntreprise:typeEntreprise]
                    
                    map.dateCreation=null
                    if(tokens[15]!="" && tokens[15]!="null")
                    {
                        map.dateCreation=Date.parse("dd/MM/yyyy",dateCreation)
                    }
                    map.dateCreationEntrep=null
                    if(tokens[16]!="" && tokens[16]!="null")
                    {
                        map.dateCreationEntrep=Date.parse("dd/MM/yyyy",dateCreationEntrep)
                    }
                    def contact=new Contact(map)
                    contact.save(failOnError:true,flush:true)
                    //TODO
                    nbImport++;
                } catch(Exception ex) {
                    loggerInformations(fileLog, "Echec import ligne " + compteur + " " + ex)
                    reponse += "Echec import ligne " + compteur + " " + ex + "<br/>"
                    nbEchec++;
            
                } finally {
                    compteur++;
                }
            }            
        }
        
        loggerInformations(fileLog, "Fin import Contacts : " + new Date())
        reponse += "Fin import Candidats : " + new Date() + "<br/>"
        loggerInformations(fileLog, "Nombre de lignes importées : " + nbImport + " sur " + (compteur - 1 ) + " lignes")
        reponse += "Nombre de lignes importées : " + nbImport + " sur " + compteur + " lignes" + "<br/>"
        loggerInformations(fileLog, "Nombre de lignes échouées : " + nbEchec)
        reponse += "Nombre de lignes échouées : " + nbEchec + "<br/>"
        return reponse
    }
    
    def importerExperiences(File fichier) {
        File fileLog = creerFichierLogImport("log_import_experiences")
        def compteur = 0;
        def nbImport = 0;
        def nbEchec = 0;
        def  Postemax
        Postemax=Poste.executeQuery("select max(ordre) from Poste ") 
        int Postesuiv=Postemax[0]+100
                     
        def  TypeEntreprisemax
        TypeEntreprisemax=TypeEntreprise.executeQuery("select max(ordre) from TypeEntreprise ") 
        int TypeEntreprisesuiv=TypeEntreprisemax[0]+100
        def  SecteurActivitemax
        SecteurActivitemax=SecteurActivite.executeQuery("select max(ordre) from SecteurActivite ") 
        int SecteurActivitesuiv=SecteurActivitemax[0]+100
        def reponse = "Import Expreriencs " + new Date() + "<br/>"
        fichier.toCsvReader(['separatorChar':';','charset':'Windows-1252']).eachLine { tokens ->
            if(compteur == 0) {
                compteur++               
            } else {
                try {
                    
                    def candidat = Candidat.findByNomStockageIlikeAndPrenomStockageIlike(tokens[12],tokens[13])
                    def na81
                    def villeautre=Ville.findByNom("AUTRE")
                    
                    if(candidat!=null)
                    {
                     
                        
                        def intitulePoste=tokens[1]
                        
                        def entreprise=tokens[2]
                        
                        def dateDebut=tokens[3]
                        def dateFin=null
                        if(tokens[4]!="" && tokens[4]!="null" && tokens[4]!=null)
                        {
                            dateFin=tokens[4] 
                        }
                        def mission=null
                        if(tokens[5]!="" && tokens[5]!="null"){
                            mission=tokens[5]  
                        }
                        
                        def nbrPersonneEncadre=0
                        if(tokens[6]!="" && tokens[6]!="null"){
                            def tok5=tokens[6].replaceAll("[^\\.0123456789]","")
                            if(!tok5.equals(""))
                            nbrPersonneEncadre=Integer.parseInt(tok5)
                            else
                            nbrPersonneEncadre = 0
                        }
                        def rattachement=tokens[7]
                     
                        def ville=null
                        if(tokens[8]!="" && tokens[8]!="null"){
                           
                            if(tokens[8].length()>=4)
                            {
                                ville = Ville.findByNomIlike(tokens[8].substring(0,3)+"%")
                                if(ville==null){
                                    loggerInformations(fileLog, " intitulePoste " + intitulePoste + " dateDebut" + dateDebut+"  dateFin "+dateFin+" ville et  valeur "+tokens[7] )
                                    ville=villeautre   
                                    //throw new Exception('Ville : '+ tokens[7]+' --- n existe pas dans la base de données')    
                                }
                            }
                            else
                            {
                                loggerInformations(fileLog, " caractere special    intitulePoste " + intitulePoste + " dateDebut" + dateDebut+"  dateFin "+dateFin+" ville et  valeur "+tokens[7] )
                                ville=villeautre 
                            }
                        }
                        
                        def poste=null
                        if(tokens[9]!="" && tokens[9]!="null"){
                            poste = Poste.findByLibelle(tokens[9])
                            if(poste==null){
                                loggerInformations(fileLog, " intitulePoste " + intitulePoste + " dateDebut" + dateDebut+"  dateFin "+dateFin+" poste et  valeur "+tokens[8] )
                                poste=new Poste(libelle:tokens[9],ordre:Postesuiv).save(failOnError:true,flush:true)
                                Postesuiv += 100    
                                  
                            }
                        }
                       
                        def typeEntreprise=null
                        if(tokens[10]!="" && tokens[10]!="null"){
                            typeEntreprise = TypeEntreprise.findByLibelle(tokens[10])
                            if(typeEntreprise==null){
                                
                                loggerInformations(fileLog, " intitulePoste " + intitulePoste + " dateDebut" + dateDebut+"  dateFin "+dateFin+" typeentreprise et  valeur "+tokens[9] )
                                typeEntreprise = new TypeEntreprise(libelle:tokens[10],ordre:TypeEntreprisesuiv).save(failOnError:true,flush:true)
                                TypeEntreprisesuiv += 100
           
                            }
                        }
                        
                        def secteurActivite=null
                        if(tokens[11]!="" && tokens[11]!="null"){
                            secteurActivite = SecteurActivite.findByLibelle(tokens[11])
                            if(secteurActivite==null){
                                
                                loggerInformations(fileLog, " intitulePoste " + intitulePoste + " dateDebut" + dateDebut+"  dateFin "+dateFin+" typeentreprise et  valeur "+tokens[9] )
                                secteurActivite = new SecteurActivite(libelle:tokens[11],ordre:SecteurActivitesuiv).save(failOnError:true,flush:true)
                                SecteurActivitesuiv += 100  
                                   
                            }
                        }
                        
                        if(dateFin!=null)
                        {
                            def mapexperience=[intitulePoste:intitulePoste,mission:mission,entreprise:entreprise,dateDebut:Date.parse("dd/MM/yyyy",dateDebut),dateFin:Date.parse("dd/MM/yyyy",dateFin),mission:"",ville:ville,nbrPersonneEncadre:nbrPersonneEncadre,rattachement:rattachement,secteurActivite:secteurActivite,poste:poste,typeEntreprise:typeEntreprise,contact:"",telephoneContact:"",fonctionContact:""]
                            candidat.addToExperiences(mapexperience)
                            candidat.save(failOnError:true,flush:true)  
                            //def experience=new Experience(mapexperience)
                            //experience.save(failOnError:true)  
                        }
                        else
                        {
                            def mapexperience=[intitulePoste:intitulePoste,mission:mission,entreprise:entreprise,dateDebut:Date.parse("dd/MM/yyyy",dateDebut),dateFin:null,mission:"",ville:ville,nbrPersonneEncadre:nbrPersonneEncadre,rattachement:rattachement,secteurActivite:secteurActivite,poste:poste,typeEntreprise:typeEntreprise,contact:"",telephoneContact:"",fonctionContact:""]
                            candidat.addToExperiences(mapexperience)
                            candidat.save(failOnError:true,flush:true)  
                            //def experience=new Experience(mapexperience)
                            //experience.save(failOnError:true)
                        }
                       
                      
                     
                    }
                    else{
                        throw new Exception('Candidat : '+ tokens[12]+'---'+tokens[13]+' --- n existe pas dans la base de données')    
                    }
                    nbImport++;
                } catch(Exception ex) {
                    loggerInformations(fileLog, "Echec import ligne " + compteur + " " + ex)
                    reponse += "Echec import ligne " + compteur + " " + ex + "<br/>"
                    nbEchec++;
            
                } finally {
                    compteur++;
                }
            }            
        }
        
        loggerInformations(fileLog, "Fin import Experiences : " + new Date())
        reponse += "Fin import Candidats : " + new Date() + "<br/>"
        loggerInformations(fileLog, "Nombre de lignes importées : " + nbImport + " sur " + (compteur - 1 ) + " lignes")
        reponse += "Nombre de lignes importées : " + nbImport + " sur " + compteur + " lignes" + "<br/>"
        loggerInformations(fileLog, "Nombre de lignes échouées : " + nbEchec)
        reponse += "Nombre de lignes échouées : " + nbEchec + "<br/>"
        return reponse
    }
    
    def importerFormations(File fichier) {
        File fileLog = creerFichierLogImport("log_import_formations")
        File fileLogreste = creerFichierLogImport("log_import_formations_reste")
        def compteur = 0;
        def nbImport = 0;
        def nbEchec = 0;
        def ligne
        def reponse = "Import Formations " + new Date() + "<br/>"
        fichier.toCsvReader(['separatorChar':';','charset':'Windows-1252']).eachLine { tokens ->
            if(compteur == 0) {
                compteur++               
            } else {
                try {
                    //ligne=tokens[0]+";"+tokens[1]+";"+tokens[2]+";"+tokens[3]+";"+tokens[4]+";"+tokens[5]+";"+tokens[6]+";"+tokens[7]+";"+tokens[8]+";"+tokens[9]+";"+tokens[10]
                    
                    def candidat = Candidat.findByNomStockageIlikeAndPrenomStockageIlike(tokens[10],tokens[11])
                    def na81
                    def villeautre=Ville.findByNom("AUTRE")
                    def  Diplomemax
                    Diplomemax=Diplome.executeQuery("select max(ordre) from Diplome ") 
                  
                    int Diplomesuiv=Diplomemax[0]+100
                    def  TypeEtablissementmax
                    TypeEtablissementmax=Diplome.executeQuery("select max(ordre) from TypeEtablissement ") 
                    
                    int TypeEtablissementsuiv=TypeEtablissementmax[0]+100

                    if(candidat!=null)
                    {
                        def intitulediplome=tokens[1]
                        def annee=tokens[2]
                        def option=tokens[3]
                        def etablissement=tokens[4]
                        def description=tokens[7]
                        def diplome=null
                        if(tokens[8]!="" && tokens[8]!="null"){
                            diplome = Diplome.findByLibelle(tokens[8])
                            if(diplome==null){
                                loggerInformations(fileLog, " intitulediplome " + intitulediplome + " annee" + annee+"  option "+option+" diplome et  valeur "+tokens[8] )
                                na81=new Diplome(libelle:tokens[8],ordre:Diplomesuiv).save(failOnError:true,flush:true)
                                diplome=na81
                                Diplomesuiv += 100
                                //                                Diplomesuiv=Diplomesuiv+100   
                                // throw new Exception('Diplome : '+ tokens[7]+' --- n existe pas dans la base de données')    
                            }
                        }
                 
                        def ville=null
                        if(tokens[5]!=""&& tokens[5]!="null")
                        {
                            
                            if(tokens[5].length()>=4)
                            {
                                
                                ville = Ville.findByNomIlike(tokens[5].substring(0,3)+"%")
                                
                                if(ville==null){
                                    loggerInformations(fileLog, " intitulediplome " + intitulediplome + " annee" + annee+"  option "+option+" ville et  valeur "+tokens[5]+" ligne  "+compteur )
                                    ville=villeautre
                                
                                    //throw new Exception('Ville : '+ tokens[5]+' --- n existe pas dans la base de données')    
                                } 
                            }
                            else
                            {
                                loggerInformations(fileLog, "des caracteres specifiques   intitulediplome " + intitulediplome + " annee" + annee+"  option "+option+" ville et  valeur "+tokens[5]+" ligne  "+compteur )
                                ville=villeautre 
                            }
                           
                           
                        }
                        def typeetablissment=null
                        if(tokens[9]!="" && tokens[9]!="null"){
                            typeetablissment = TypeEtablissement.findByLibelle(tokens[9])
                            if(typeetablissment==null){
                                loggerInformations(fileLog, " intitulediplome " + intitulediplome + " annee" + annee+"  option "+option+" typeetablissment et  valeur "+tokens[9] )
                                na81=new TypeEtablissement(libelle:tokens[9],ordre:TypeEtablissementsuiv).save(failOnError:true,flush:true)
                                typeetablissment=na81
                                TypeEtablissementsuiv += 100
                                //                                TypeEtablissementsuiv=TypeEtablissementsuiv+100
                                //throw new Exception('Type Etablissment : '+ tokens[8]+' --- n existe pas dans la base de données')    
                            }
                        }
                    
                    
                        def mapformations=[intituleDiplome:intitulediplome,annee:annee,optionFormation:option,etablissement:etablissement,ville:ville,description:description,typeEtablissement:typeetablissment,diplome:diplome]
                        // def formacandi=new FormationCandidat(mapformations)
                        //formacandi.save(failOnError:true,flush:true)
                        candidat.addToFormationcandidats(mapformations)
                        candidat.save(failOnError:true,flush:true)
                        //loggerInformations(fileLogreste,ligne)
                    }
                    else {
                        throw new Exception('Candidat : '+ tokens[10]+'---'+tokens[11]+' --- n existe pas dans la base de données')    
                    }
                    nbImport++;
                } catch(Exception ex) {
                    loggerInformations(fileLog, "Echec import ligne " + compteur + " " + ex)
                    //loggerInformations(fileLogreste,ligne)
                    reponse += "Echec import ligne " + compteur + " " + ex + "<br/>"
                    nbEchec++;
            
                } finally {
                    compteur++;
                }
            }            
        }
        
        loggerInformations(fileLog, "Fin import Formations : " + new Date())
        reponse += "Fin import Candidats : " + new Date() + "<br/>"
        loggerInformations(fileLog, "Nombre de lignes importées : " + nbImport + " sur " + (compteur - 1) + " lignes")
        reponse += "Nombre de lignes importées : " + nbImport + " sur " + compteur + " lignes" + "<br/>"
        loggerInformations(fileLog, "Nombre de lignes échouées : " + nbEchec)
        reponse += "Nombre de lignes échouées : " + nbEchec + "<br/>"
        return reponse
    }
    
    def importerInterlocuteurs(File fichier) {
        File fileLog = creerFichierLogImport("log_import_interlocuteurs")
        def compteur = 0;
        def nbImport = 0;
        def nbEchec = 0;
        def reponse = "Import Interlocuteurs " + new Date() + "<br/>"
        fichier.toCsvReader(['separatorChar':';','charset':'Windows-1252']).eachLine { tokens ->
            if(compteur == 0) {
                compteur++               
            } else {
                try {
                    def id = tokens[0]
                    def nom = tokens[1]
                    def prenom = tokens[2]
                    def fonction = tokens[3]
                    def telephonePortable=null
                    def villeautre=Ville.findByNom("AUTRE")
                    
                    if(tokens[4]!="" && tokens[4]!="null")
                    {
                        telephonePortable=tokens[4].replaceAll("[^\\.0123456789]",""); 
                    }
                  
                    
                    def telephoneFixe=null
                    if(tokens[5]!="" && tokens[5]!="null")
                    {
                        telephoneFixe=tokens[5].replaceAll("[^\\.0123456789]","");
                    }
                  
                    
                    def email=null
                    if(tokens[6]!="" && tokens[6]!="null" && tokens[6]!=null)
                    {
                        email=tokens[6]  
                    }
                      
                    def contact=null
                    
                    
                    if(tokens[7]!="" && tokens[7]!="null" && tokens[6]!=null)
                    {
                        contact=Contact.findByRaisonSocialeIlike(tokens[7])
                        
                    }
                   
                   
                    def map=[nom:nom,prenom:prenom,fonction:fonction,telephonePortable:telephonePortable,telephoneFixe:telephoneFixe,email:email]
                    //contact.addToInterlocuteurcontacts(map)
                    //                        def interloconta=new InterlocuteurContact(map)
                    //                        interloconta.save(failOnError:true,flush:true)
                    contact.addToInterlocuteurcontacts(map)
                    contact.save(failOnError:true,flush:true)  
                      
                         
                    //TODO
                    nbImport++;
                } catch(Exception ex) {
                    loggerInformations(fileLog, "Echec import ligne " + compteur + " " + ex)
                    reponse += "Echec import ligne " + compteur + " " + ex + "<br/>"
                    nbEchec++;
            
                } finally {
                    compteur++;
                }
            }
        }
        
        loggerInformations(fileLog, "Fin import Interlocuteurs : " + new Date())
        reponse += "Fin import Candidats : " + new Date() + "<br/>"
        loggerInformations(fileLog, "Nombre de lignes importées : " + nbImport + " sur " + (compteur-1) + " lignes")
        reponse += "Nombre de lignes importées : " + nbImport + " sur " + compteur + " lignes" + "<br/>"
        loggerInformations(fileLog, "Nombre de lignes échouées : " + nbEchec)
        reponse += "Nombre de lignes échouées : " + nbEchec + "<br/>"
        return reponse
    }
    
    def importerTests(File fichier) {
        File fileLog = creerFichierLogImport("log_import_tests")
        def compteur = 0;
        def nbImport = 0;
        def nbEchec = 0;
        def  TitreTestmax
        TitreTestmax=TitreTest.executeQuery("select max(ordre) from TitreTest ")
        int TitreTestsuiv=TitreTestmax[0]+100
        def na81
        def villeautre=Ville.findByNom("AUTRE")
        def reponse = "Import Tests " + new Date() + "<br/>"
        fichier.toCsvReader(['separatorChar':';','charset':'Windows-1252']).eachLine { tokens ->
            if(compteur == 0) {
                compteur++               
            } else {
                try {
                    
                    def dateTest=tokens[2]
                    
                    def candidat = Candidat.findByNomStockageAndPrenomStockage(tokens[4],tokens[5])
                    println("nom  "+tokens[4]+"  prenom  "+tokens[5])
                    if(candidat!=null){
                        def titre=null
                        if(tokens[1]!=""){
                            titre = TitreTest.findByLibelleIlike(tokens[1].substring(0,2)+"%")
                            if(titre==null){
                                loggerInformations(fileLog, " dateTest " + dateTest + " commentaire" + commentaire+" TitreTest et  valeur "+tokens[1] )
                                na81=new TitreTest(libelle:tokens[7],ordre:TitreTestsuiv).save(failOnError:true,flush:true)
                                titre=na81
                                TitreTestsuiv=TitreTestsuiv+100
                                //throw new Exception('titre de test : '+ tokens[1]+' --- n existe pas dans la base de données')    
                            }
                        }
                        def maptests
                        if(tokens[2]=='' || tokens[2]==null || tokens[2]=='null'){
                            maptests=[dateTest:null,commentaire:"",titre:titre]}
                        else{
                            maptests=[dateTest:Date.parse("dd/MM/yyyy",tokens[2]),commentaire:"",titre:titre]}
                        candidat.addToTests(maptests)
                        candidat.save(failOnError:true,flush:true)
                    }
                    else {
                        throw new Exception('Candidat : '+ tokens[3]+'---'+tokens[4]+' --- n existe pas dans la base de données')    
                    }
                    
                    
                    nbImport++;
                } 
                catch(Exception ex) {
                    loggerInformations(fileLog, "Echec import ligne " + compteur + " " + ex)
                    reponse += "Echec import ligne " + compteur + " " + ex + "<br/>"
                    nbEchec++;
            
                } finally {
                    compteur++;
                }
            }
        }
        
        loggerInformations(fileLog, "Fin import Tests : " + new Date())
        reponse += "Fin import Candidats : " + new Date() + "<br/>"
        loggerInformations(fileLog, "Nombre de lignes importées : " + nbImport + " sur " + (compteur-1) + " lignes")
        reponse += "Nombre de lignes importées : " + nbImport + " sur " + compteur + " lignes" + "<br/>"
        loggerInformations(fileLog, "Nombre de lignes échouées : " + nbEchec)
        reponse += "Nombre de lignes échouées : " + nbEchec + "<br/>"
        return reponse
    }
    
    def importerUtilisateurs(File fichier) {
        File fileLog = creerFichierLogImport("log_import_users")
        def compteur = 0;
        def nbImport = 0;
        def nbEchec = 0;
        def reponse = "Import Utilisateurs " + new Date() + "<br/>"
        fichier.toCsvReader(['separatorChar':';','charset':'Windows-1252']).eachLine { tokens ->
            if(compteur == 0) {
                compteur++               
            } else {
                try {
                    def firstName=tokens[0]
                    def lastName=tokens[1]
                    def email=tokens[2]
                    def password=tokens[3]
                    def enabled=tokens[4]
                    def fonctionDior=null
                    if(tokens[5]!=""){
                        fonctionDior = FonctionDior.findByLibelle(tokens[5])
                        if(fonctionDior==null){
                            throw new Exception('fonctionDior : '+ tokens[5]+' --- n existe pas dans la base de données')    
                        }
                    }
                        
                    def profil=null
                    if(tokens[6]!=""){
                        profil = Profil.findByLibelle(tokens[6])
                        if(profil==null){
                            throw new Exception('Profil : '+ tokens[6]+' --- n existe pas dans la base de données')    
                        }
                    }
                    def mapuser=[profil:profil,fonctionDior:fonctionDior,firstName:firstName,lastName:lastName,email:email,password:password,enabled:enabled,adresseIp:"81.192.114.12,41.214.132.134"]  
                    def utilisateur=new Utilisateur(mapuser)
                    utilisateur.save(failOnError:true,flush:true)
                    nbImport++;
                } catch(Exception ex) {
                    loggerInformations(fileLog, "Echec import ligne " + compteur + " " + ex)
                    reponse += "Echec import ligne " + compteur + " " + ex + "<br/>"
                    nbEchec++;
            
                } finally {
                    compteur++;
                }
            }
        }
        
        loggerInformations(fileLog, "Fin import Utilisateurs : " + new Date())
        reponse += "Fin import Candidats : " + new Date() + "<br/>"
        loggerInformations(fileLog, "Nombre de lignes importées : " + nbImport + " sur " + (compteur-1) + " lignes")
        reponse += "Nombre de lignes importées : " + nbImport + " sur " + compteur + " lignes" + "<br/>"
        loggerInformations(fileLog, "Nombre de lignes échouées : " + nbEchec)
        reponse += "Nombre de lignes échouées : " + nbEchec + "<br/>"
        return reponse
    }
    
    def importerMissions(File fichier) {
        File fileLog = creerFichierLogImport("log_import_missions")
        def compteur = 0;
        def nbImport = 0;
        def nbEchec = 0;
        def na81
        def StatutMissionmax=StatutMission.executeQuery("select max(ordre) from StatutMission ") 
        int StatutMissionsuiv=StatutMissionmax[0]+100
        def Postemax=Poste.executeQuery("select max(ordre) from Poste ") 
        int Postesuiv=Postemax[0]+100
        def NiveauEtudemax=NiveauEtude.executeQuery("select max(ordre) from NiveauEtude ") 
        int NiveauEtudesuiv=NiveauEtudemax[0]+100
        
        def PlageExperiencemax=PlageExperience.executeQuery("select max(ordre) from PlageExperience ") 
        int PlageExperiencesuiv=PlageExperiencemax[0]+100
        
        def Formationmax=Formation.executeQuery("select max(ordre) from Formation ") 
        int Formationsuiv=Formationmax[0]+100
        
        def EtapeAvancementmax=EtapeAvancement.executeQuery("select max(ordre) from EtapeAvancement ") 
        int EtapeAvancementsuiv=EtapeAvancementmax[0]+100
        
        def SecteurActivitemax=SecteurActivite.executeQuery("select max(ordre) from SecteurActivite ") 
        int SecteurActivitesuiv=SecteurActivitemax[0]+100
        
        def villeautre=Ville.findByNom("AUTRE")
        def reponse = "Import Missions " + new Date() + "<br/>"
        fichier.toCsvReader(['separatorChar':';','charset':'Windows-1252']).eachLine { tokens ->
            if(compteur == 0) {
                compteur++               
            } else {
                try {
                    def code= tokens[1]
                    def reference= tokens[2]
                    def poste= tokens[3]
                    def localisation= tokens[4]
                    def contexte= tokens[5]
                    def approche= tokens[6]
                    def interlocuteur= null 
                    
                    if(tokens[7]!="" && tokens[7]!='null' && tokens[7]!=null){
                        def inter=tokens[7].split(" ")
                        if(inter.length==2)
                        {
                            interlocuteur=InterlocuteurContact.findByNomAndPrenom(inter[0],inter[1]) 
                        }
                        if(inter.length==2)
                        {
                            interlocuteur=InterlocuteurContact.findByNom(inter[0]) 
                        }
                    }
                    def emailinterlocuteur= null
                    
                    def dateDemarrage=null
                    if(tokens[9]!="" && tokens[9]!='null' && tokens[9]!=null){
                        dateDemarrage= Date.parse("dd/MM/yyyy",tokens[9])}
                   
                    def datePublication=null
                    if(tokens[10]!="" && tokens[10]!='null' && tokens[10]!=null){
                        datePublication= Date.parse("dd/MM/yyyy",tokens[10])}
                    def rattachementHierarchique= tokens[11]
                    def rattachementFonctionnel= tokens[12]
                    def description=tokens[13].replace("<br/>", " ")
                    //                    def rattachementHierarchique= tokens[14]
                    //                    def rattachementHierarchique= tokens[15]
                    def descriptifSociete= tokens[16]
                    def descriptifPoste= tokens[17]
                    def profilCandidat= tokens[18]
                    def typeFormation= tokens[19]
                    def comportement= tokens[20]
                    def profilEquipe= tokens[21]
                    def budget= tokens[22]
                    def remunerationAvantages= tokens[23]
                    def connaissancesInfos= tokens[24]
                    def deplacement= tokens[25]
                    def deplacementLocalisation= tokens[26]
                    def nbrAnneeExperience= tokens[27]
                    def effectifEquipe= tokens[28]
                    def publierAnnonce= tokens[29]
                    def dureeGarantie= tokens[30]
                    //println("token31   "+tokens[31]+"  lligne  "+compteur+"   class  "+tokens[31].getClass())
                    def ggg=isInt(tokens[31].replaceAll("[^\\0123456789]",""))
                    def delaisRealisation=null
                    if(ggg==false)
                    {
                        delaisRealisation=null  
                    }
                    else
                    {
                        delaisRealisation= tokens[31].replaceAll("[^\\0123456789]","")
                    }
                    
                    def replanifier= false
                    if(replanifier!=null && replanifier!='null' && replanifier=='')
                    {
                        replanifier= true   
                    }
                    def dateFinGarantie=null
                    if(tokens[33]!="" && tokens[33]!='null' && tokens[33]!=null){
                        dateFinGarantie= Date.parse("dd/MM/yyyy",tokens[33])}
                    //                  def secteurActivite= tokens[34]
                    def entreprise= tokens[35]
                    
                    def contact=null
                    if(tokens[36]!="" && tokens[36]!="null" && tokens[36]!=null){
                        contact = Contact.findByRaisonSociale(tokens[36])
                        if(contact==null){
                            throw new Exception('contact : '+ tokens[36]+' --- n existe pas dans la base de données')    
                        }
                    }
                        
                    def consultant=null
                    if(tokens[37]!="" && tokens[37]!="null" && tokens[37]!=null){
                        consultant = Utilisateur.findByEmail(tokens[37])
                        if(consultant==null){
                            //throw new Exception('consultant : '+ tokens[37]+' --- n existe pas dans la base de données')    
                        }
                    }
                    
                    def assistant=null
                    if(tokens[38]!="" && tokens[38]!="null" && tokens[38]!=null){
                        assistant = Utilisateur.findByEmail(tokens[38])
                        if(assistant==null){
                            //throw new Exception('assistant : '+ tokens[38]+' --- n existe pas dans la base de données')    
                        }
                    }
                    
                    def chargeRecherche=null
                    if(tokens[39]!="" && tokens[39]!="null" && tokens[39]!=null){
                        chargeRecherche = Utilisateur.findByEmail(tokens[39])
                        if(chargeRecherche==null){
                            //throw new Exception('chargeRecherche : '+ tokens[39]+' --- n existe pas dans la base de données')    
                        }
                    }
                    
                    def statut=null
                    if(tokens[40]!="" && tokens[40]!="null" && tokens[40]!=null){
                        statut = StatutMission.findByLibelle(tokens[40])
                        if(statut==null){
                            
                            loggerInformations(fileLog, " code: " + code + " reference: " + reference+"  poste: "+poste+"localisation:  "+localisation+"   StatutMission et  valeur "+tokens[40] )
                            na81=new StatutMission(libelle:tokens[40],ordre:StatutMissionsuiv).save(failOnError:true,flush:true)
                            statut=na81
                            StatutMissionsuiv=StatutMissionsuiv+100
                            
                            //throw new Exception('statut : '+ tokens[40]+' --- n existe pas dans la base de données')    
                        }
                    }
                    
                    def typeFonction=null
                    if(tokens[41]!="" && tokens[41]!="null" && tokens[41]!=null){
                        typeFonction = Poste.findByLibelle(tokens[41])
                        if(typeFonction==null){
                            
                            
                            loggerInformations(fileLog, " code: " + code + " reference: " + reference+"  poste: "+poste+"localisation:  "+localisation+"   typeFonction et  valeur "+tokens[41] )
                            na81=new Poste(libelle:tokens[41],ordre:Postesuiv).save(failOnError:true,flush:true)
                            typeFonction=na81
                            Postesuiv=Postesuiv+100
                            
                            //throw new Exception('typeFonction : '+ tokens[41]+' --- n existe pas dans la base de données')    
                        }
                    }
                    
                   
                        
                    def niveauEtude=null
                    if(tokens[42]!="" && tokens[42]!="null" && tokens[42]!=null){
                        niveauEtude = NiveauEtude.findByLibelle(tokens[42])
                        if(niveauEtude==null){
                            loggerInformations(fileLog, " code: " + code + " reference: " + reference+"  poste: "+poste+"localisation:  "+localisation+"   niveauEtude et  valeur "+tokens[42] )
                            na81=new NiveauEtude(libelle:tokens[42],ordre:NiveauEtudesuiv,obsolute:false).save(failOnError:true,flush:true)
                            niveauEtude=na81
                            NiveauEtudesuiv=NiveauEtudesuiv+100
                            
                            //throw new Exception('niveauEtude : '+ tokens[42]+' --- n existe pas dans la base de données')    
                        }
                    }
                        
                    def plageExperience=null
                    if(tokens[43]!="" && tokens[43]!="null" && tokens[43]!=null){
                        plageExperience = PlageExperience.findByLibelle(tokens[43])
                        if(plageExperience==null){
                            loggerInformations(fileLog, " code: " + code + " reference: " + reference+"  poste: "+poste+"localisation:  "+localisation+"   plageExperience et  valeur "+tokens[43] )
                            na81=new PlageExperience(libelle:tokens[43],ordre:PlageExperiencesuiv).save(failOnError:true,flush:true)
                            plageExperience=na81
                            PlageExperiencesuiv=PlageExperiencesuiv+100
                            //throw new Exception('plageExperience : '+ tokens[43]+' --- n existe pas dans la base de données')    
                        }
                    }
                    
                    def formation=null
                    if(tokens[44]!="" && tokens[44]!="null" && tokens[44]!=null){
                        formation = Formation.findByLibelle(tokens[44])
                        if(formation==null){
                            loggerInformations(fileLog, " code: " + code + " reference: " + reference+"  poste: "+poste+"localisation:  "+localisation+"   Formation et  valeur "+tokens[44] )
                            na81=new Formation(libelle:tokens[44],ordre:Formationsuiv).save(failOnError:true,flush:true)
                            formation=na81
                            Formationsuiv=Formationsuiv+100
                            
                            //throw new Exception('formation : '+ tokens[44]+' --- n existe pas dans la base de données')    
                        }
                    }
                        
                    def etapeAvancement=null
                    if(tokens[45]!="" && tokens[45]!="null" && tokens[45]!=null){
                        etapeAvancement = EtapeAvancement.findByLibelle(tokens[45])
                        if(etapeAvancement==null){
                            loggerInformations(fileLog, " code: " + code + " reference: " + reference+"  poste: "+poste+"localisation:  "+localisation+"   etapeAvancement et  valeur "+tokens[45] )
                            na81=new EtapeAvancement(libelle:tokens[45],ordre:EtapeAvancementsuiv).save(failOnError:true,flush:true)
                            etapeAvancement=na81
                            EtapeAvancementsuiv=EtapeAvancementsuiv+100
                            
                            //throw new Exception('etapeAvancement : '+ tokens[45]+' --- n existe pas dans la base de données')    
                        }
                    }
                    
                    def secteurActivite=null
                    if(tokens[46]!="" && tokens[46]!="null" && tokens[46]!=null){
                        secteurActivite = SecteurActivite.findByLibelle(tokens[46])
                        if(secteurActivite==null){
                            loggerInformations(fileLog, " code: " + code + " reference: " + reference+"  poste: "+poste+"localisation:  "+localisation+"   secteurActivite et  valeur "+tokens[46] )
                            na81=new SecteurActivite(libelle:tokens[46],ordre:SecteurActivitesuiv).save(failOnError:true,flush:true)
                            secteurActivite=na81
                            SecteurActivitesuiv=SecteurActivitesuiv+100
                            
                            
                            // throw new Exception('secteurActivite : '+ tokens[46]+' --- n existe pas dans la base de données')    
                        }
                    }
                        
                    def mapmission=[code:code,reference:reference,dateDemarrage:dateDemarrage,poste:poste,localisation:localisation,contact:contact,contexte:contexte,approche:approche,interlocuteur:interlocuteur,rattachementHierarchique:rattachementHierarchique,rattachementFonctionnel:rattachementFonctionnel,chargeRecherche:chargeRecherche,consultant:consultant,assistant:assistant,datePublication:datePublication,entreprise:entreprise,publierAnnonce:publierAnnonce,dureeGarantie:dureeGarantie,typeFormation:typeFormation,plageExperience:plageExperience,nbrAnneeExperience:3,secteurActivite:secteurActivite,effectifEquipe:effectifEquipe,budget:budget,deplacement:deplacement,deplacementLocalisation:deplacementLocalisation,delaisRealisation:delaisRealisation,replanifier:replanifier,statut:statut,typeFonction:typeFonction,niveauEtude:niveauEtude,formation:formation,etapeAvancement:etapeAvancement,dateFinGarantie:dateFinGarantie,description:description,descriptifSociete:descriptifSociete,descriptifPoste:descriptifPoste,profilCandidat:profilCandidat,comportement:comportement,remunerationAvantages:remunerationAvantages]
                    def mission=new Mission(mapmission)
                    mission.save(failOnError:true,flush:true)
                    nbImport++;
                } catch(Exception ex) {
                    loggerInformations(fileLog, "Echec import ligne " + compteur + " " + ex)
                    reponse += "Echec import ligne " + compteur + " " + ex + "<br/>"
                    nbEchec++;
            
                } finally {
                    compteur++;
                }
            }
        }
        
        loggerInformations(fileLog, "Fin import Utilisateurs : " + new Date())
        reponse += "Fin import Candidats : " + new Date() + "<br/>"
        loggerInformations(fileLog, "Nombre de lignes importées : " + nbImport + " sur " + (compteur-1) + " lignes")
        reponse += "Nombre de lignes importées : " + nbImport + " sur " + compteur + " lignes" + "<br/>"
        loggerInformations(fileLog, "Nombre de lignes échouées : " + nbEchec)
        reponse += "Nombre de lignes échouées : " + nbEchec + "<br/>"
        return reponse
    }
    
    def importerCandidaturesnoveau(File fichier) {
        File fileLog = creerFichierLogImport("log_import_candidaturess")
        def compteur = 0;
        def nbImport = 0;
        def nbEchec = 0;
        def na81
        int inc=100
        def EtapeAvancementCandidaturemax=EtapeAvancementCandidature.executeQuery("select max(ordre) from EtapeAvancementCandidature ") 
        int EtapeAvancementCandidaturesuiv
        if(EtapeAvancementCandidaturemax.get(0)==null)
        {
            EtapeAvancementCandidaturesuiv=inc  
        }
        else
        {
            EtapeAvancementCandidaturesuiv=EtapeAvancementCandidaturemax.get(0)+inc
        }
        def StatutCandidaturemax=StatutCandidature.executeQuery("select max(ordre) from StatutCandidature ")
        int StatutCandidaturesuiv
        if(StatutCandidaturemax.get(0)==null)
        {
            StatutCandidaturesuiv=inc  
        }
        else
        {
            StatutCandidaturesuiv=StatutCandidaturemax.get(0)+inc
        }
        def EvaluationCandidaturemax=EvaluationCandidature.executeQuery("select max(ordre) from EvaluationCandidature ")
        int EvaluationCandidaturesuiv
        if(EvaluationCandidaturemax.get(0)==null)
        {
            EvaluationCandidaturesuiv=inc  
        }
        else
        {
            EvaluationCandidaturesuiv=EvaluationCandidaturemax.get(0)+inc
        }
       
        //int EvaluationCandidaturesuiv=EvaluationCandidaturemax[0]+100
        def reponse = "Import candidatures " + new Date() + "<br/>"
        fichier.toCsvReader(['separatorChar':';','charset':'Windows-1252']).eachLine { tokens ->
            if(compteur == 0) {
                compteur++               
            } else {
                try 
                {
                    def mission=Mission.findByCodeAndReference(tokens[10],tokens[11])
                    def candidat=Candidat.findByEmail(tokens[12])
                    if(mission!=null && candidat!=null)
                    {
                        def id = tokens[0]
                        def spontanee = tokens[1]
                        def dateCandidature = null
                        if(tokens[2]!="" && tokens[2]!="null")
                        {
                            DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
                            dateCandidature = df.parse(tokens[2]);
                            
                            // dateCandidature=Date.parse("dd/MM/yyyy",tokens[2])
                        }
                        def lettreMotivation = tokens[3]
                        def evaluationCommentaire = tokens[4]
                        def oldStatut = tokens[5]
                        def sourceCandidature=tokens[6]
                        def evaluation=null
                        if(tokens[7]!="" && tokens[7]!="null")
                        {
                            evaluation=EvaluationCandidature.findByLibelleIlike(tokens[7])
                            if(evaluation==null)
                            {
                                loggerInformations(fileLog, " mission: " + mission + " candidat: " + candidat+"  sourceCandidature: "+sourceCandidature+"   EvaluationCandidature et  valeur "+tokens[7] )
                                na81=new EvaluationCandidature(libelle:tokens[7],ordre:EvaluationCandidaturesuiv).save(failOnError:true,flush:true)
                                evaluation=na81
                                EvaluationCandidaturesuiv=EvaluationCandidaturesuiv+inc
                                
                                //throw new Exception("EvaluationCandidature "+tokens[7]+"  est innexitante dans la base de donnee")
                            }
                        }
                        def statut=null
                        if(tokens[8]!="" && tokens[8]!="null")
                        {
                            statut=StatutCandidature.findByLibelleIlike(tokens[8])
                            if(statut==null)
                            {
                                loggerInformations(fileLog, " mission: " + mission + " candidat: " + candidat+"  sourceCandidature: "+sourceCandidature+"   EvaluationCandidature et  valeur "+tokens[8] )
                                na81=new StatutCandidature(libelle:tokens[8],ordre:StatutCandidaturesuiv).save(failOnError:true,flush:true)
                                statut=na81
                                StatutCandidaturesuiv=StatutCandidaturesuiv+inc
                                
                                //throw new Exception("StatutCandidature "+tokens[8]+"  est innexitante dans la base de donnee  "+tokens[0])
                            }
                        }
                        def etapeAvancement=null
                        if(tokens[9]!="" && tokens[9]!="null" && tokens[9]!=null)
                        {
                            etapeAvancement=EtapeAvancementCandidature.findByLibelleIlike(tokens[9])
                            if(etapeAvancement==null)
                            {
                                loggerInformations(fileLog, " mission: " + mission + " candidat: " + candidat+"  sourceCandidature: "+sourceCandidature+"   EvaluationCandidature et  valeur "+tokens[9] )
                                na81=new EtapeAvancementCandidature(libelle:tokens[9],ordre:EtapeAvancementCandidaturesuiv).save(failOnError:true,flush:true)
                                etapeAvancement=na81
                                EtapeAvancementCandidaturesuiv=EtapeAvancementCandidaturesuiv+inc
                                
                                
                                //throw new Exception("etapeAvancement "+tokens[9]+"  est innexitante dans la base de donnee")
                            }
                        }
                    
                        def map=[id:id,spontanee:spontanee,dateCandidature:dateCandidature,lettreMotivation:lettreMotivation,
                            evaluationCommentaire:evaluationCommentaire,oldStatut:oldStatut,sourceCandidature:sourceCandidature,evaluation:evaluation,
                            statut:statut,etapeAvancement:etapeAvancement,mission:mission,candidat:candidat]
                    
                        def candidature=new Candidature(map)
                        candidature.save(failOnError:true,flush:true)
                        //TODO
                    
                    }
                    else
                    {
                        if(mission==null)
                        {
                            throw new Exception("mission est innexistante pour code et refernce  "+tokens[10]+" "+tokens[11])  
                        }
                        if(candidat==null)
                        {
                            throw new Exception("candidat est innexistant portant le mail "+tokens[12])  
                        }
                    }
                    nbImport++;
                } catch(Exception ex) {
                    loggerInformations(fileLog, "Echec import ligne " + compteur + " " + ex)
                    reponse += "Echec import ligne " + compteur + " " + ex + "<br/>"
                    nbEchec++;
            
                } finally {
                    compteur++;
                }
            }            
        }
        
        loggerInformations(fileLog, "Fin import Contacts : " + new Date())
        reponse += "Fin import Candidats : " + new Date() + "<br/>"
        loggerInformations(fileLog, "Nombre de lignes importées : " + nbImport + " sur " + (compteur - 1 ) + " lignes")
        reponse += "Nombre de lignes importées : " + nbImport + " sur " + compteur + " lignes" + "<br/>"
        loggerInformations(fileLog, "Nombre de lignes échouées : " + nbEchec)
        reponse += "Nombre de lignes échouées : " + nbEchec + "<br/>"
        return reponse
    }
    
    def importerEvenementCandidatures(File fichier) {
        File fileLog = creerFichierLogImport("log_import_evenement_candidatures")
        def compteur = 0;
        def nbImport = 0;
        def nbEchec = 0;
        def na81
        
        
        int inc1=100
        def TypeEvenementCandidaturemax=TypeEvenementCandidature.executeQuery("select max(ordre) from TypeEvenementCandidature ") 
        int TypeEvenementCandidaturesuiv
        if(TypeEvenementCandidaturemax.get(0)==null)
        {
            TypeEvenementCandidaturesuiv=inc1  
        }
        else
        {
            EtapeAvancementCandidaturesuiv=TypeEvenementCandidaturemax.get(0)+inc1
        }
        
        //        def TypeEvenementCandidaturemax=TypeEvenementCandidature.executeQuery("select max(ordre) from TypeEvenementCandidature ") 
        //        int TypeEvenementCandidaturesuiv=TypeEvenementCandidaturemax[0]+100
        def reponse = "Import evenement candidatures " + new Date() + "<br/>"
        fichier.toCsvReader(['separatorChar':';','charset':'Windows-1252']).eachLine { tokens ->
            if(compteur == 0) {
                compteur++               
            } else {
                try 
                {
                    def Candidature1=null  
                    def dateCandidature=Date.parse("dd/MM/yyyy",tokens[5])
                    Candidature1 = Candidature.createCriteria().get()
                    {
                        eq("dateCandidature",dateCandidature) 

                        candidat
                        {
                            eq("email",tokens[4])  
                        }
                    }      
        
                    if(Candidature1!=null)
                    {
                        def id = tokens[0]
                        def dateEvtCandidature = null
                        if(tokens[1]!="" && tokens[1]!="null")
                        {
                            dateEvtCandidature=Date.parse("dd/MM/yyyy",tokens[1])
                        }
                   
                        def typeEvenement=null
                        if(tokens[2]!="" && tokens[2]!="null")
                        {
                            typeEvenement=TypeEvenementCandidature.findByLibelleIlike(tokens[2])
                            if(typeEvenement==null)
                            {
                                loggerInformations(fileLog, " candidature: " + Candidature1 + " dateEvtCandidature: " + dateEvtCandidature+"  dateCandidature: "+dateCandidature+"   TypeEvenementCandidature et  valeur "+tokens[2] )
                                na81=new TypeEvenementCandidature(libelle:tokens[2],ordre:TypeEvenementCandidaturesuiv).save(failOnError:true,flush:true)
                                typeEvenement=na81
                                TypeEvenementCandidaturesuiv=TypeEvenementCandidaturesuiv+100
                                
                                // throw new Exception("TypeEvenementCandidatures "+tokens[2]+"  est innexitante dans la base de donnee")
                            }
                        }
                    
                    
                    
                        def map=[dateEvtCandidature:dateEvtCandidature,typeEvenement:typeEvenement]
                    
                        Candidature1.addToEvenementCandidatures(map)
                        Candidature1.save(failOnError:true,flush:true) 
                        //TODO
                    
                    }
                    else
                    {
                        
                        throw new Exception("candidature est innexistante pour la datecandidature "+tokens[5]+" et email "+tokens[4])  
                       
                    }
                    nbImport++;
                } catch(Exception ex) {
                    loggerInformations(fileLog, "Echec import ligne " + compteur + " " + ex)
                    reponse += "Echec import ligne " + compteur + " " + ex + "<br/>"
                    nbEchec++;
            
                } finally {
                    compteur++;
                }
            }            
        }
        
        loggerInformations(fileLog, "Fin import Contacts : " + new Date())
        reponse += "Fin import Candidats : " + new Date() + "<br/>"
        loggerInformations(fileLog, "Nombre de lignes importées : " + nbImport + " sur " + (compteur - 1 ) + " lignes")
        reponse += "Nombre de lignes importées : " + nbImport + " sur " + compteur + " lignes" + "<br/>"
        loggerInformations(fileLog, "Nombre de lignes échouées : " + nbEchec)
        reponse += "Nombre de lignes échouées : " + nbEchec + "<br/>"
        return reponse
    }
    
    def importerPlanification(File fichier) {
        File fileLog = creerFichierLogImport("log_import_evenement_candidatures")
        def compteur = 0;
        def nbImport = 0;
        def nbEchec = 0;
        def na81
        def EtapePlanningmax=EtapePlanning.executeQuery("select max(ordre) from EtapePlanning ") 
        int EtapePlanningsuiv=EtapePlanningmax[0]+100
        def reponse = "Import Planifications" + new Date() + "<br/>"
        fichier.toCsvReader(['separatorChar':';','charset':'Windows-1252']).eachLine { tokens ->
            if(compteur == 0) {
                compteur++               
            } else {
                try 
                {
                    
                    def mission=Mission.findByCodeAndReference(tokens[6],tokens[7])
                    
                    if(mission!=null){
                        
                        def dateDebut = null
                        if(tokens[2]!="" && tokens[2]!="null")
                        {
                            dateDebut=Date.parse("dd/MM/yyyy",tokens[2])
                        }
                        def dateFin = null
                        if(tokens[3]!="" && tokens[3]!="null")
                        {
                            dateFin=Date.parse("dd/MM/yyyy",tokens[3])
                        }
                        def etape=null
                        if(tokens[8]!="" && tokens[8]!="null")
                        {
                            etape=EtapePlanning.findByLibelleIlike(tokens[8])
                            if(etape==null)
                            {
                                loggerInformations(fileLog, " candidature: " + Candidature1 + " dateEvtCandidature: " + dateEvtCandidature+"  dateCandidature: "+dateCandidature+"   TypeEvenementCandidature et  valeur "+tokens[2] )
                                na81=new EtapePlanning(libelle:tokens[8],ordre:EtapePlanningsuiv).save(failOnError:true,flush:true)
                                etape=na81
                                TypeEvenementCandidaturesuiv=TypeEvenementCandidaturesuiv+100
                                
                                
                                //throw new Exception("etape "+tokens[8]+"  est innexitante dans la base de donnee")
                            }
                        }
                        def mapplanification=[dateDebut:dateDebut,dateFin:dateFin,etape:etape]
                        mission.addToPlanifications(mapplanification)
                        mission.save(failOnError:true,flush:true)
                    }
                    else {
                        throw new Exception("Mission "+tokens[6]+'----'+tokens[7]+"  est innexitante dans la base de donnee")
                    }
                    nbImport++;
                } catch(Exception ex) {
                    loggerInformations(fileLog, "Echec import ligne " + compteur + " " + ex)
                    reponse += "Echec import ligne " + compteur + " " + ex + "<br/>"
                    nbEchec++;
            
                } finally {
                    compteur++;
                }
            }            
        }
        
        loggerInformations(fileLog, "Fin import Contacts : " + new Date())
        reponse += "Fin import Candidats : " + new Date() + "<br/>"
        loggerInformations(fileLog, "Nombre de lignes importées : " + nbImport + " sur " + (compteur - 1 ) + " lignes")
        reponse += "Nombre de lignes importées : " + nbImport + " sur " + compteur + " lignes" + "<br/>"
        loggerInformations(fileLog, "Nombre de lignes échouées : " + nbEchec)
        reponse += "Nombre de lignes échouées : " + nbEchec + "<br/>"
        return reponse
    }
    def isInt(String chaine){ 
        
        boolean valeur = true; 
        char[] tab = chaine.toCharArray(); 

        for(char carac : tab){ 
            if(!Character.isDigit(carac) && valeur){ valeur = false; } 
        } 

        return valeur; 
    } 

    def importerCvs(File fichier) {
        File fileLog = creerFichierLogImport("log_import_cv")
        def compteur = 0;
        def nbImport = 0;
        def nbEchec = 0;
       
        def reponse = "Import Cvs" + new Date() + "<br/>"
        def user = "unknowen"
        fichier.toCsvReader(['separatorChar':';','charset':'Windows-1252']).eachLine { tokens ->
            if(compteur == 0) {
                compteur++               
            } else {
                try 
                {
                    def email = tokens[23]
                    
                    
                    
                    def fichierCv = tokens[19]
                    def fichierPhoto = tokens[20]
                    
                    def candidat=Candidat.findByEmail(email)
                    if(candidat != null) 
                    {
                        List<MultipartFile> filesToUpload = []
                     
                       
                        if(fichierCv!="" && fichierCv!="null" && fichierCv!=null)
                        {
                                                    
                            FichierDto fichidto=getFichierCandidat(fichierCv)
                            
                            ByteArrayInputStream bytarray=new ByteArrayInputStream(fichidto.getDonnees())
                            //ByteArrayInputStream in = new ByteArrayInputStream(buf); 
                            BufferedInputStream input1 = new BufferedInputStream(bytarray); 
                            
                            //BufferedInputStream input1 = new BufferedInputStream(new   FileInputStream(file));
                            //int contentLength = input1.available();

                            try
                            {
                                def file = new File(baseDir1 + "/" + fichierCv)
                                DiskFileItem fileItem = (DiskFileItem) new DiskFileItemFactory().createItem("cv", fichidto.getContentType(), true,"cv."+fichidto.getExtension());
                                //InputStream input =  new FileInputStream(file);
                                OutputStream os = fileItem.getOutputStream();
                                int ret = input1.read();
                                while ( ret != -1 )
                                {
                                    os.write(ret);
                                    ret = input1.read();
                                }
                                os.flush();
                                MultipartFile multipartFile = new CommonsMultipartFile(fileItem);
                                filesToUpload << multipartFile
                                //attachmentableService.upload(user, candidat, filesToUpload)
                                upload(user, candidat, filesToUpload)
                                //attachUploadedFilesTo(candidat)
                                //                                long id1=candidat.id
                                //                                def attc=AttachmentLink.findByReferenceId(id1)
                                //                                long idlink=attc.id
                                //                                println("attachment link "+idlink)
                                //                                def att=Attachment.findByLnk(id1)
                                //                                long idattach=att.id
                                //                                long l=candidat.id
                                //                                def mapattclin=[version:1,referenceClass:"com.rabbahsoft.diorhprofiler.Candidat",referenceId:l]
                                //                                AttachmentLink tr=new AttachmentLink(mapattclin)
                                //                                tr.save(failOnError:true,flush:true)
                                //                                println("b id attachment link   "+tr.id)
                                //                                long ln1=tr.id
                                //                                println("bvvvv   id attachmen   "+ln1)
                                //                                def mapatt=[version:1,contentType:"application/pdf",dateCreated:new Date(),ext:"pdf",inputName:"cv",length:file.length(),lnk:ln1,name:"pdf",posterClass:user,posterId:0]
                                //                                Attachment tr1=new Attachment(mapatt)
                                //                                tr1.save(failOnError:true,flush:true)
                            }
                            catch (Exception e)
                            {
                                // TODO Auto-generated catch block
                                loggerInformations(fileLog, "Echec import ligne " + compteur + " " + e)
                                reponse += "Echec import ligne " + compteur + " " + e + "<br/>"
                                nbEchec++;
                            }
                        } 
                     
                        /*          if(fichierPhoto!="" && fichierPhoto!="null" && fichierPhoto!=null)
                        {
                        FichierDto fichidto=getFichierCandidat(fichierPhoto)
                        ByteArrayInputStream bytarray=new ByteArrayInputStream(fichidto.getDonnees())
                        
                        //ByteArrayInputStream in = new ByteArrayInputStream(buf); 
                        BufferedInputStream input1 = new BufferedInputStream(bytarray); 
                            
                        //BufferedInputStream input1 = new BufferedInputStream(new   FileInputStream(file));
                        //int contentLength = input1.available();

                        try
                        {
                        def ext="pdf"
                        def file = new File(baseDir1 + "/" + fichierPhoto)
                        DiskFileItem fileItem = (DiskFileItem) new DiskFileItemFactory().createItem("photo", fichidto.getContentType(), true,"."+ext);
                        //InputStream input =  new FileInputStream(file);
                        OutputStream os = fileItem.getOutputStream();
                        int ret = input1.read();
                        while ( ret != -1 )
                        {
                        os.write(ret);
                        ret = input1.read();
                        }
                        os.flush();
                        MultipartFile multipartFile = new CommonsMultipartFile(fileItem);
                        filesToUpload << multipartFile
                        attachmentableService.upload(user, candidat, filesToUpload)
                        }
                        catch (Exception e)
                        {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                        }
                        } */
                        
                        nbImport++;  
                    } else {
                        loggerInformations(fileLog, "Echec import ligne " + compteur + " email : " + email)
                        reponse += "Echec import ligne " + compteur + " email : " + email  + "<br/>"
                        nbEchec++;
                    }
                     
               
                 
                } catch(Exception ex) {
                    loggerInformations(fileLog, "Echec import ligne " + compteur + " " + ex)
                    reponse += "Echec import ligne " + compteur + " " + ex + "<br/>"
                    nbEchec++;
            
                } finally {
                    compteur++;
                }
            }            
        }
        
        loggerInformations(fileLog, "Fin import Contacts : " + new Date())
        reponse += "Fin import Candidats : " + new Date() + "<br/>"
        loggerInformations(fileLog, "Nombre de lignes importées : " + nbImport + " sur " + (compteur - 1 ) + " lignes")
        reponse += "Nombre de lignes importées : " + nbImport + " sur " + compteur + " lignes" + "<br/>"
        loggerInformations(fileLog, "Nombre de lignes échouées : " + nbEchec)
        reponse += "Nombre de lignes échouées : " + nbEchec + "<br/>"
        return reponse
    }
    
    /**
     * Charge le fichier depuis le dossier du candidat
     */
    //	public FichierDto getFichierCandidat(String relativeFileName) throws Exception {
    def getFichierCandidat(String relativeFileName) throws Exception {
        // Serialisation
        
        def chemincomplet=baseDir1+"/"+relativeFileName
                
        new File(chemincomplet).withObjectInputStream(getClass().classLoader) { instream ->	
            FichierDto fichier = (FichierDto)instream.readObject()
            return fichier
        } 
    }
    
    
    List<MultipartFile> upload(def poster,
        def reference,
        List<MultipartFile> files) {
        def uploadedFiles = []
   
        try {
            //            Attachment.withTransaction 
            //            {status ->
            files.each {MultipartFile file ->
                try {
                    attachmentableService.addAttachment(poster, reference, file)
                    uploadedFiles << file
                } catch (Exception e) {
                    if (e instanceof EmptyFileException) {
                        log.error "Error adding attachment: ${e.message}"
                    } else if (e instanceof UndeclaredThrowableException
                        && e.cause instanceof EmptyFileException) {
                        log.error "Error adding attachment: ${e.cause.message}"
                    } else {
                        //status.setRollbackOnly()
                        log.error "Error adding attachment", e
                    }
                }
            }
               
            //}
        } catch (Exception e) {
            log.error "Error adding attachment: ${e.message}"
        }

        uploadedFiles
    }
    def sendMailCandidat()
    {
        def candidats=Candidat.list()
        for(candidat in candidats)
        {
            def pwd_claire = PasswordTools.generateRandomPassword(10)
            //def pwd = Blowfish.encryptBase64(pwd_claire, "#1Ab@.com")
            def candidat1=Candidat.get(candidat.id)
            candidat1.password=pwd_claire
            candidat1.save(failOnError:true,flush:true)
            mailinscription(candidat1, pwd_claire)
        
        }
    }
    def mailinscription(Candidat candidat, String pwd){
        def templatemail=MailTemplate.findByCode("mailinscription")
        def template=templatemail.template
        template= template.replace("#civilitecandidat",candidat.civilite.libelle);
        template= template.replace("#prenomcandidat",candidat.prenomStockage);
        template= template.replace("#nomcandidat",candidat.nomStockage);
        template= template.replace("#emailcandidat",candidat.email);
        template= template.replace("#motpassecandidat",pwd);
        try {
        sendMail {
            to candidat.email
            from "info.diorh@gmail.com"
            replyTo "satisfactionclient@diorh.com"
            subject templatemail.description
            html template
        }
        } catch(Exception ex) {
            println ex
        }
    }
    def sendMailUtilisateur()
    {
        def query = Utilisateur.where {
            (id >= 11261 && id <= 11286) || (id == 527897) || (id == 704)
        }
        def utilisateurs=query.list()
        def nbUsers = utilisateurs.size()
        println "!!!!!!!!!!!!!!!!!! nb users to send mail : " + nbUsers
        int nbLimit = 0;
        for(utilisateur in utilisateurs)
        {
            try {
                def pwd_claire = PasswordTools.generateRandomPassword(10)
                //def pwd = Blowfish.encryptBase64(pwd_claire, "#1Ab@.com")
                def utilisateur1=Utilisateur.get(utilisateur.id)
                utilisateur1.password=pwd_claire
                utilisateur1.save(failOnError:true,flush:true)
                mailinscriptionutilisateur(utilisateur1, pwd_claire)
                if(++nbLimit == 499) {
                    println "!!!!!!!!!!!!!!!!!! nombre limite email atteinte !!!!!!!!!!!!!!!!!" + new Date() 
                    break;
                }
            } catch(Exception ex) {
                println ex
                nbLimit++
            }
        }
    }
    def mailinscriptionutilisateur(Utilisateur utilisateur, String pwd){
        def templatemail=MailTemplate.findByCode("mailinscription")
        def template=templatemail.template
        //def contenu="votre mot de passe!    ${pwd}"
        //def total=template+contenu
        //        template= template.replace("#civilitecandidat",utilisateur.civilite.libelle);
        template= template.replace("#prenomcandidat",utilisateur.firstName);
        template= template.replace("#nomcandidat",utilisateur.lastName);
        template= template.replace("#emailcandidat",utilisateur.email);
        template= template.replace("#motpassecandidat",pwd);
        try {
        sendMail {
            to utilisateur.email
            from "info.diorh@gmail.com"
            replyTo "satisfactionclient@diorh.com"            
            subject templatemail.description
            html template
        }
        } catch(Exception ex) {
            println ex
        }
    }
    def importerCandidatures(File fichier) {
        File fileLog = creerFichierLogImport("log_import_candidaturess")
        def compteur = 0;
        def nbImport = 0;
        def nbEchec = 0;
        def na81
        def EtapeAvancementCandidaturemax=EtapeAvancementCandidature.executeQuery("select max(ordre) from EtapeAvancementCandidature ") 
        int EtapeAvancementCandidaturesuiv=EtapeAvancementCandidaturemax[0]+100
        
        
        def StatutCandidaturemax=StatutCandidature.executeQuery("select max(ordre) from StatutCandidature ") 
        int StatutCandidaturesuiv=StatutCandidaturemax[0]+100
        
        
        
        def EvaluationCandidaturemax=EvaluationCandidature.executeQuery("select max(ordre) from EvaluationCandidature ") 
        int EvaluationCandidaturesuiv=EvaluationCandidaturemax[0]+100
        
        
        def reponse = "Import candidatures " + new Date() + "<br/>"
        fichier.toCsvReader(['separatorChar':';','charset':'Windows-1252']).eachLine { tokens ->
            if(compteur == 0) {
                compteur++               
            } else {
                try 
                {
                    def mission=Mission.findByCodeAndReference(tokens[10],tokens[11])
                    def candidat=Candidat.findByEmail(tokens[12])
                    if(mission!=null && candidat!=null)
                    {
                        def id = tokens[0]
                        def spontanee = tokens[1]
                        def dateCandidature = null
                        if(tokens[2]!="" && tokens[2]!="null")
                        {
                            DateFormat df = new SimpleDateFormat("mm/dd/yyyy");
                            dateCandidature = df.parse(tokens[2]);
                            
                            // dateCandidature=Date.parse("dd/MM/yyyy",tokens[2])
                        }
                        def lettreMotivation = tokens[3]
                        def evaluationCommentaire = tokens[4]
                        def oldStatut = tokens[5]
                        def sourceCandidature=tokens[6]
                        def evaluation=null
                        if(tokens[7]!="" && tokens[7]!="null")
                        {
                            evaluation=EvaluationCandidature.findByLibelleIlike(tokens[7])
                            if(evaluation==null)
                            {
                                loggerInformations(fileLog, " mission: " + mission + " candidat: " + candidat+"  sourceCandidature: "+sourceCandidature+"   EvaluationCandidature et  valeur "+tokens[7] )
                                na81=new EvaluationCandidature(libelle:tokens[7],ordre:EvaluationCandidaturesuiv).save(failOnError:true,flush:true)
                                evaluation=na81
                                EvaluationCandidaturesuiv=EvaluationCandidaturesuiv+100
                                
                                //throw new Exception("EvaluationCandidature "+tokens[7]+"  est innexitante dans la base de donnee")
                            }
                        }
                        def statut=null
                        if(tokens[8]!="" && tokens[8]!="null")
                        {
                            statut=StatutCandidature.findByLibelleIlike(tokens[8])
                            if(statut==null)
                            {
                               
                                loggerInformations(fileLog, " mission: " + mission + " candidat: " + candidat+"  sourceCandidature: "+sourceCandidature+"   EvaluationCandidature et  valeur "+tokens[8] )
                                na81=new StatutCandidature(libelle:tokens[8],ordre:StatutCandidaturesuiv).save(failOnError:true,flush:true)
                                statut=na81
                                StatutCandidaturesuiv=StatutCandidaturesuiv+100
                                
                                //throw new Exception("StatutCandidature "+tokens[8]+"  est innexitante dans la base de donnee  "+tokens[0])
                            }
                        }
                        def etapeAvancement=null
                        if(tokens[9]!="" && tokens[9]!="null" && tokens[9]!=null)
                        {
                            etapeAvancement=EtapeAvancementCandidature.findByLibelleIlike(tokens[9])
                            if(etapeAvancement==null)
                            {
                                loggerInformations(fileLog, " mission: " + mission + " candidat: " + candidat+"  sourceCandidature: "+sourceCandidature+"   EvaluationCandidature et  valeur "+tokens[9] )
                                na81=new EtapeAvancementCandidature(libelle:tokens[9],ordre:EtapeAvancementCandidaturesuiv).save(failOnError:true,flush:true)
                                etapeAvancement=na81
                                EtapeAvancementCandidaturesuiv=EtapeAvancementCandidaturesuiv+100
                                
                                
                                //throw new Exception("etapeAvancement "+tokens[9]+"  est innexitante dans la base de donnee")
                            }
                        }
                    
                        def map=[id:id,spontanee:spontanee,dateCandidature:dateCandidature,lettreMotivation:lettreMotivation,
                            evaluationCommentaire:evaluationCommentaire,oldStatut:oldStatut,sourceCandidature:sourceCandidature,evaluation:evaluation,
                            statut:statut,etapeAvancement:etapeAvancement,mission:mission,candidat:candidat]
                    
                        def candidature=new Candidature(map)
                        candidature.save(failOnError:true,flush:true)
                        //TODO
                    
                    }
                    else
                    {
                        if(mission==null)
                        {
                            throw new Exception("mission est innexistante pour code et refernce  "+tokens[10]+" "+tokens[11])  
                        }
                        if(candidat==null)
                        {
                            throw new Exception("candidat est innexistant portant le mail "+tokens[12])  
                        }
                    }
                    nbImport++;
                } catch(Exception ex) {
                    loggerInformations(fileLog, "Echec import ligne " + compteur + " " + ex)
                    reponse += "Echec import ligne " + compteur + " " + ex + "<br/>"
                    nbEchec++;
            
                } finally {
                    compteur++;
                }
            }            
        }
        
        loggerInformations(fileLog, "Fin import Contacts : " + new Date())
        reponse += "Fin import Candidats : " + new Date() + "<br/>"
        loggerInformations(fileLog, "Nombre de lignes importées : " + nbImport + " sur " + (compteur - 1 ) + " lignes")
        reponse += "Nombre de lignes importées : " + nbImport + " sur " + compteur + " lignes" + "<br/>"
        loggerInformations(fileLog, "Nombre de lignes échouées : " + nbEchec)
        reponse += "Nombre de lignes échouées : " + nbEchec + "<br/>"
        return reponse
    }
    
    
     def importerCompetencesLinguistique(File fichier) {
        File fileLog = creerFichierLogImport("log_import_formations")
        File fileLogreste = creerFichierLogImport("log_import_formations_reste")
        def compteur = 0;
        def nbImport = 0;
        def nbEchec = 0;
        def ligne
        def reponse = "Import Formations " + new Date() + "<br/>"
        fichier.toCsvReader(['separatorChar':';','charset':'Windows-1252']).eachLine { tokens ->
            if(compteur == 0) {
                compteur++               
            } else {
                try {
                    //ligne=tokens[0]+";"+tokens[1]+";"+tokens[2]+";"+tokens[3]+";"+tokens[4]+";"+tokens[5]+";"+tokens[6]+";"+tokens[7]+";"+tokens[8]+";"+tokens[9]+";"+tokens[10]
                    
                    def candidat = Candidat.findByEmail(tokens[0])
                    def connaissanceLinguistique
                    def niveauConnaissanceLinguistique
                    if(candidat!=null)
                    {
                        if(tokens[1]!="" && tokens[1]!="null"){
                            connaissanceLinguistique = ConnaissanceLinguistique.findByIntituleLangue(tokens[1])
                            if(connaissanceLinguistique==null){
                               throw new Exception('ConnaissanceLinguistique : '+ tokens[1]+' --- n existe pas dans la base de données') 
                            }
                        }
                 
                        if(tokens[2]!="" && tokens[2]!="null"){
                            niveauConnaissanceLinguistique = NiveauConnaissanceLinguistique.findByIntituleNiveauLangue(tokens[2])
                            if(niveauConnaissanceLinguistique==null){
                               throw new Exception('NiveauConnaissanceLinguistique : '+ tokens[2]+' --- n existe pas dans la base de données')     
                            }
                        }
  def mapcompetencelinguistique=[deleted:true,langue:connaissanceLinguistique,niveau :niveauConnaissanceLinguistique]
                       
                        candidat.addToConnaissanceLinguistiques(mapcompetencelinguistique)
                        candidat.save(failOnError:true,flush:true)
                    
                    
                        
                    }
                    else {
                        println("else else    "+tokens[0])
                        throw new Exception('Candidat portant email: '+ tokens[0]+' --- n existe pas dans la base de données')    
                    }
                    nbImport++;
                } catch(Exception ex) {
                    loggerInformations(fileLog, "Echec import ligne " + compteur + " " + ex)
                    //loggerInformations(fileLogreste,ligne)
                    reponse += "Echec import ligne " + compteur + " " + ex + "<br/>"
                    nbEchec++;
            
                } finally {
                    compteur++;
                }
            }            
        }
        
        loggerInformations(fileLog, "Fin import Formations : " + new Date())
        reponse += "Fin import Candidats : " + new Date() + "<br/>"
        loggerInformations(fileLog, "Nombre de lignes importées : " + nbImport + " sur " + (compteur - 1) + " lignes")
        reponse += "Nombre de lignes importées : " + nbImport + " sur " + compteur + " lignes" + "<br/>"
        loggerInformations(fileLog, "Nombre de lignes échouées : " + nbEchec)
        reponse += "Nombre de lignes échouées : " + nbEchec + "<br/>"
        return reponse
    }

    
    
    
       def importerConnaissanceInformatique(File fichier) { 
           println("fichier dans service  "+fichier)
        File fileLog = creerFichierLogImport("log_import_ConnaissanceInformatique")
        def compteur = 0;
        def nbImport = 0;
        def nbEchec = 0;
        def profilcandidat=Profil.findByLibelle("candidat")
        def reponse = "Import ConnaissanceInformatique " + new Date() + " <br/>"
        def var
   
       def canj
       def connai
       def nbr=0
                         
        fichier.toCsvReader(['separatorChar':';','charset':'Windows-1252']).eachLine { tokens ->
            if(compteur == 0) {
                compteur++ 
            } else 
            {
                try { 
                      def candidat = Candidat.findByEmail(tokens[23])
                      canj=candidat
                      def id=candidat.id
                      def emptyList = []
                  if(candidat!=null)
                    {
                      if(tokens[17]!="" && tokens[17]!="null"){
                          def connaissanceInfo = tokens[17]
                          def fdf=connaissanceInfo.split(";")
                          def listconn=[]
                          for(i in fdf)
                          {
                              def fd=i.split(",")
                              for(j in fd)
                              {
                                 if(j!=null && j!='null' && j!='')
                                 {
                                     String lo=j.trim()
                                     def con1=ConnaissanceInformatique.findByIntituleConnaissanceLike("%"+lo+"%")
                                     if(con1!=null && con1!='null' && con1!='')
                                     {
                                         def list1=candidat.connaissancesInfo.id
                                         def res=list1.contains(con1.id)
                                 if(res==false)
                                 {
                                     candidat.addToConnaissancesInfo(con1)
                        candidat.save(failOnError:true,flush:true)   
                                 }
                                 else
                                 {                                     
                                     throw new Exception('Candidat portant email: '+ tokens[23]+' --- contient deja la connaissance informatique pour la ligne '+compteur) 
                                 }
                                     }
                                     else
                                     {
                                         def con=new ConnaissanceInformatique(intituleConnaissance:j)
                                        con.save(failOnError:true,flush:true)
                                     candidat.addToConnaissancesInfo(con)
                        candidat.save(failOnError:true,flush:true)  
                                     }   
                                 }

                        
                              } 
                          }
                      }
                    }
                    else {
                        nbr++
                        println("nbr  "+nbr)
                        throw new Exception('Candidat portant email: '+ tokens[23]+' --- n existe pas dans la base de données pour la ligne '+compteur)    
                    }
                    nbImport++;
                    //hibSession.flush()
                } catch(Exception ex) {
                    loggerInformations(fileLog, "Echec import ligne " + compteur + " " + ex)
                    //                    reponse += "Echec import ligne " + compteur + " " + ex + "<br/>"
                    nbEchec++;
            
                } finally {
                    compteur++;
                }
            }            
        }
        println("nbr   total  "+nbr)
        loggerInformations(fileLog, "Fin import Connaissance informatique : " + new Date())
        reponse += "Fin import Connaissance informatique: " + new Date() + "<br/>"
        loggerInformations(fileLog, "Nombre de lignes importées : " + nbImport + " sur " + (compteur - 2) + " lignes")
        reponse += "Nombre de lignes importées : " + nbImport + " sur " + compteur + " lignes" + "<br/>"
        loggerInformations(fileLog, "Nombre de lignes échouées : " + nbEchec)
        reponse += "Nombre de lignes échouées : " + nbEchec + "<br/>"
        return reponse
    }
    
    
    
}
