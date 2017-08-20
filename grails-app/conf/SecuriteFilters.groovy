
/**
 *
 * @author RABBAH
 */
class SecuriteFilters {
    def filters = {
        loginCheck(controller: '*', action: '*', controllerExclude  : 'securite|home|imports') {
            before = {
                if (!session.user) {
                    session.user = null
                    if(!(controllerName=='annonce' && (actionName=='show' || actionName=='list')) && !(controllerName=='candidat' && (actionName=='show' || actionName=='create' || actionName=='save' || actionName=='checkemail'))) 
                         {
                             redirect(controller : "home")
                             return false
                         }
                         
                } else {
                                     
                         if(session.user.profil.libelle=="candidat")
                         {
                         
                         if(controllerName=='candidat' && actionName=='show' && Long.parseLong(params.id)!=session.user.id)
                         {
                             redirect(controller : "candidat",action:"show",id:session.user.id)
                         }
                         if(controllerName=='candidat' && actionName=='edit' && Long.parseLong(params.id)!=session.user.id)
                         {
                             redirect(controller : "candidat",action:"edit",id:session.user.id)
                         }
                     }
                     
                    
                     // UTILISATEUR
                     
                    if(session.droits.AJOUTER_UTILISATEUR == null && controllerName.equals("utilisateur") && actionName.equals("create")) {
                        redirect(controller : "home")
                        return false
                    }
                    if(session.droits.MODIFIER_UTILISATEUR == null && controllerName.equals("utilisateur") && actionName.equals("edit")) {
                        redirect(controller : "home")
                        return false
                    }
                    if(session.droits.SUPPRIMER_UTILISATEUR == null && controllerName.equals("utilisateur") && actionName.equals("delete")) {
                        redirect(controller : "home")
                        return false
                    }
                    if(session.droits.LISTE_UTILISATEUR == null && controllerName.equals("utilisateur") && actionName.equals("list")) {
                        redirect(controller : "home")
                        return false
                    }
                    if(session.droits.CONSULTER_UTILISATEUR == null && controllerName.equals("utilisateur") && actionName.equals("show")) {
                        redirect(controller : "home")
                        return false
                    }
                    
                    // PROFIL
                    
                    if(session.droits.AJOUTER_PROFIL == null && controllerName.equals("profil") && actionName.equals("create")) {
                        redirect(controller : "home")
                        return false
                    }
                    if(session.droits.MODIFIER_PROFIL == null && controllerName.equals("profil") && actionName.equals("edit")) {
                        redirect(controller : "home")
                        return false
                    }
                    if(session.droits.LISTE_PROFIL == null && controllerName.equals("profil") && actionName.equals("list")) {
                        redirect(controller : "home")
                        return false
                    }
                    if(session.droits.SUPPRIMER_PROFIL == null && controllerName.equals("profil") && actionName.equals("delete")) {
                        redirect(controller : "home")
                        return false
                    }
                    
                    //CONTACT
                    
                    if(session.droits.AJOUTER_CONTACT == null && controllerName.equals("contact") && actionName.equals("create")) {
                        redirect(controller : "home")
                        return false
                    }
                    if(session.droits.MODIFIER_CONTACT == null && controllerName.equals("contact") && actionName.equals("edit")) {
                        redirect(controller : "home")
                        return false
                    }
                    if(session.droits.SUPPRIMER_CONTACT == null && controllerName.equals("contact") && actionName.equals("delete")) {
                        redirect(controller : "home")
                        return false
                    }
                    if(session.droits.RECHERCHER_CONTACT == null && controllerName.equals("contact") && actionName.equals("rechercher_contact")) {
                        redirect(controller : "home")
                        return false
                    }
                    if(session.droits.LISTE_CONTACT == null && controllerName.equals("contact") && actionName.equals("list")) {
                        redirect(controller : "home")
                        return false
                    }
                    
                    if(session.droits.CONSULTER_CONTACT == null && controllerName.equals("contact") && actionName.equals("show")) {
                        redirect(controller : "home")
                        return false
                    }
                    
                    //MISSION
                    
                    if(session.droits.AJOUTER_MISSION == null && controllerName.equals("mission") && actionName.equals("create")) {
                        redirect(controller : "home")
                        return false
                    }
                    if(session.droits.MODIFIER_MISSION == null && controllerName.equals("mission") && actionName.equals("edit")) {
                        redirect(controller : "home")
                        return false
                    }
                    if(session.droits.SUPPRIMER_MISSION == null && controllerName.equals("mission") && actionName.equals("delete")) {
                        redirect(controller : "home")
                        return false
                    }
                     if(session.droits.RECHERCHER_MISSION == null && controllerName.equals("mission") && actionName.equals("recherche")) {
                        redirect(controller : "home")
                        return false
                    }
                     if(session.droits.CONSULTER_MISSION == null && controllerName.equals("mission") && actionName.equals("show")) {
                        redirect(controller : "home")
                        return false
                    }
                     if(session.droits.CLOTURER_MISSION == null && controllerName.equals("mission") && actionName.equals("cloturer")) {
                        redirect(controller : "home")
                        return false
                    }
                     if(session.droits.ARCHIVER_MISSION == null && controllerName.equals("mission") && actionName.equals("archiver")) {
                        redirect(controller : "home")
                        return false
                    }
                     if(session.droits.PLANIFIER_MISSION == null && controllerName.equals("mission") && actionName.equals("planifier")) {
                        redirect(controller : "home")
                        return false
                    }
                    
                    //CANDIDAT
                    
                    if(session.droits.AJOUTER_CANDIDAT == null && controllerName.equals("candidat") && actionName.equals("create")) {
                        redirect(controller : "home")
                        return false
                    }
                    if(session.droits.MODIFIER_CANDIDAT == null && controllerName.equals("candidat") && actionName.equals("edit")) {
                        redirect(controller : "home")
                        return false
                    }
                    if(session.droits.SUPPRIMER_CANDIDAT == null && controllerName.equals("candidat") && actionName.equals("delete")) {
                        redirect(controller : "home")
                        return false
                    }
                    if(session.droits.CONSULTER_CANDIDAT == null && controllerName.equals("candidat") && actionName.equals("show")) {
                        redirect(controller : "home")
                        return false
                    }
                    if(session.droits.LISTE_CANDIDAT == null && controllerName.equals("candidat") && actionName.equals("list")) {
                        redirect(controller : "home")
                        return false
                    }
                    if(session.droits.RECHERCHER_CANDIDAT == null && controllerName.equals("candidat") && actionName.equals("create_recherche")) {
                        redirect(controller : "home")
                        return false
                    }
                    if(session.droits.ENVOYERMAIL_CANDIDAT == null && controllerName.equals("candidat") && actionName.equals("sendmail")) {
                        redirect(controller : "home")
                        return false
                    }
                     if(session.droits.GERER_CANDIDAT  == null && controllerName.equals("candidat") && actionName.equals("gerer")) {
                        redirect(controller : "home")
                        return false
                    }
                     if(session.droits.AFFECTER_MISSION_CANDIDAT  == null && controllerName.equals("candidat") && actionName.equals("affectermission")) {
                        redirect(controller : "home")
                        return false
                    }
//                     if(session.droits.AFFECTER_MISSION_CANDIDAT  == null && controllerName.equals("candidat") && actionName.equals("affectermission")) {
//                        redirect(controller : "home")
//                        return false
//                    }
                    // ACTION CONTACT
                     if(session.droits.LISTE_ACTIONCONTACT  == null && controllerName.equals("actionContact")) {
                        redirect(controller : "home")
                        return false
                    }
                    
                    // RENDEZ-VOUS
                    
                     if(session.droits.LISTE_RENDEZVOUS  == null && controllerName.equals("rendezVous")) {
                        redirect(controller : "home")
                        return false
                    }
                    
                    // PARAMETRE
                    //MODULE CANDIDAT
                     if(session.droits.PARAMETRAGE  == null && (controllerName.equals("annotationNote") || controllerName.equals("annotationProfil") || controllerName.equals("civilite") || controllerName.equals("connaissanceInformatique") || controllerName.equals("connaissanceLinguistique") || controllerName.equals("diplome") || controllerName.equals("poste"))) {
                        redirect(controller : "home")
                        return false
                    }
                    //MODULE FORMATION
                     if(session.droits.PARAMETRAGE  == null && (controllerName.equals("typeEtablissement") || controllerName.equals("mobiliteGeographique") || controllerName.equals("nationalite") || controllerName.equals("niveauEtude") || controllerName.equals("niveauConnaissanceLinguistique") || controllerName.equals("plageExperience") || controllerName.equals("situationFamiliale") || controllerName.equals("titreTest") || controllerName.equals("typeEvenementCandidat"))) {
                        redirect(controller : "home")
                        return false
                    }
                    //MODULE CONTACT
                     if(session.droits.PARAMETRAGE  == null && controllerName.equals("statutActionContact")) {
                        redirect(controller : "home")
                        return false
                    }
                    //MODULE MISSION
                     if(session.droits.PARAMETRAGE  == null && (controllerName.equals("etapePlanning") || controllerName.equals("etapeAvancementCandidature") || controllerName.equals("evaluationCandidature") || controllerName.equals("statutCandidature") || controllerName.equals("typeEvenementCandidature") || controllerName.equals("typeRendezvous"))) {
                        redirect(controller : "home")
                        return false
                    }
                    //MODULE PARAMETRE GENERAUX
                     if(session.droits.PARAMETRAGE  == null && (controllerName.equals("formation") || controllerName.equals("pays") || controllerName.equals("secteurActivite") || controllerName.equals("typeEntreprise") || controllerName.equals("ville") || controllerName.equals("fonctionDior") || controllerName.equals("mailTemplate") )) {
                        redirect(controller : "home")
                        return false
                    }             
                }
            }
        }
    }
}

