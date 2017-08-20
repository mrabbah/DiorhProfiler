package com.rabbahsoft.diorhprofiler

import com.rabbahsoft.profiler.ExcelImporterService
import java.text.SimpleDateFormat;
import cr.co.arquetipos.password.PasswordTools
import cr.co.arquetipos.crypto.Blowfish
/**
 * ImportsController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class ImportsController {

        def excelImporterService
        def searchableService
        
    static String fs = System.getProperty('file.separator');
    static String ls = System.getProperty('line.separator');
    static SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd-hh-mm");
    
    def index() { }
    
	def candidats = {
            def mf = request.getFile('fichier')
            File fichier = new File(System.getProperty('user.home')+fs+"candidats"+dateFormat.format(new Date())+".csv")
            fichier.createNewFile();
            mf.transferTo(fichier)   
            def reponse = excelImporterService.importerCandidats(fichier)
            render reponse
        }
	def contacts = {
            def mf = request.getFile('fichier')
            File fichier = new File(System.getProperty('user.home')+fs+"contacts"+dateFormat.format(new Date())+".csv")
            fichier.createNewFile();
            mf.transferTo(fichier)
            def reponse = excelImporterService.importerContacts(fichier)
            render reponse
        }
	def experiences = {
            def mf = request.getFile('fichier')
            File fichier = new File(System.getProperty('user.home')+fs+"experiences"+dateFormat.format(new Date())+".csv")
            fichier.createNewFile();
            mf.transferTo(fichier)
            def reponse = excelImporterService.importerExperiences(fichier)
            render reponse
        }
	def formations = {
            def mf = request.getFile('fichier')
            File fichier = new File(System.getProperty('user.home')+fs+"formations"+dateFormat.format(new Date())+".csv")
            fichier.createNewFile();
            mf.transferTo(fichier)
            def reponse = excelImporterService.importerFormations(fichier)
//            def reponse = excelImporterService.importerFormations(fichier)
            render reponse
        }	
	def interlocuteurs = {            
            def mf = request.getFile('fichier')
            File fichier = new File(System.getProperty('user.home')+fs+"interlocuteurs"+dateFormat.format(new Date())+".csv")
            fichier.createNewFile();
            mf.transferTo(fichier)
            def reponse = excelImporterService.importerInterlocuteurs(fichier)
            render reponse
        }
	def tests = {
            def mf = request.getFile('fichier')
            File fichier = new File(System.getProperty('user.home')+fs+"tests"+dateFormat.format(new Date())+".csv")
            fichier.createNewFile();
            mf.transferTo(fichier)
            def reponse = excelImporterService.importerTests(fichier)
            render reponse
        }
	def users = {
            def mf = request.getFile('fichier')
            File fichier = new File(System.getProperty('user.home')+fs+"users"+dateFormat.format(new Date())+".csv")
            fichier.createNewFile();
            mf.transferTo(fichier)
            def reponse = excelImporterService.importerUtilisateurs(fichier)
            render reponse
        }
	def missions = {
            def mf = request.getFile('fichier')
            File fichier = new File(System.getProperty('user.home')+fs+"missions"+dateFormat.format(new Date())+".csv")
            fichier.createNewFile();
            mf.transferTo(fichier)
            def reponse = excelImporterService.importerMissions(fichier)
            render reponse
        }
        def candidatures = {
            def mf = request.getFile('fichier')
            File fichier = new File(System.getProperty('user.home')+fs+"candidatures"+dateFormat.format(new Date())+".csv")
            fichier.createNewFile();
            mf.transferTo(fichier)
            def reponse = excelImporterService.importerCandidaturesnoveau(fichier)
            render reponse
        }
        def candidaturesnouveau = {
            def mf = request.getFile('fichier')
            File fichier = new File(System.getProperty('user.home')+fs+"candidatures"+dateFormat.format(new Date())+".csv")
            fichier.createNewFile();
            mf.transferTo(fichier)
            def reponse = excelImporterService.importerCandidaturesnoveau(fichier)
            render reponse
        }
         def evenementscandidatures = {
             def mf = request.getFile('fichier')
            File fichier = new File(System.getProperty('user.home')+fs+"events"+dateFormat.format(new Date())+".csv")
            fichier.createNewFile();
            mf.transferTo(fichier)
            def reponse = excelImporterService.importerEvenementCandidatures(fichier)
            render reponse
        }
         def planifications = {
             def mf = request.getFile('fichier')
            File fichier = new File(System.getProperty('user.home')+fs+"planifications"+dateFormat.format(new Date())+".csv")
            fichier.createNewFile();
            mf.transferTo(fichier)
            def reponse = excelImporterService.importerPlanification(fichier)
            render reponse
        }
        def cvs = {
           def mf = request.getFile('fichier')
            File fichier = new File(System.getProperty('user.home')+fs+"cvs"+dateFormat.format(new Date())+".csv")
            fichier.createNewFile();
            mf.transferTo(fichier)   
            def reponse = excelImporterService.importerCvs(fichier)
            render reponse
        }
       def reindex = {
            searchableService.reindex()
        }
        def sendMailCandidat = {
            excelImporterService.sendMailCandidat()
        }
        def sendMailUtilisateur = {
            excelImporterService.sendMailUtilisateur()
        }
        def connaissanceInformatiques  = {
             def mf = request.getFile('fichier')
            File fichier = new File(System.getProperty('user.home')+fs+"planifications"+dateFormat.format(new Date())+".csv")
            fichier.createNewFile();
            mf.transferTo(fichier)
            def reponse = excelImporterService.importerConnaissanceInformatique(fichier)
            render reponse
        }
        def competenceLinguistiques= {
             def mf = request.getFile('fichier')
            File fichier = new File(System.getProperty('user.home')+fs+"planifications"+dateFormat.format(new Date())+".csv")
            fichier.createNewFile();
            mf.transferTo(fichier)
            def reponse = excelImporterService.importerCompetencesLinguistique(fichier)
            render reponse
        }
       
}
