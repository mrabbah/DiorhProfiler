import com.rabbahsoft.diorhprofiler.*
 import cr.co.arquetipos.crypto.Blowfish
class BootStrap {

    //def springSecurityService
    //def searchableService
    
    def init = { servletContext ->
         
        environments {
            vvv {
                //searchableService.stopMirroring()
                
                new Profil(libelle:'Consultante').save(failOnError: true)
                new Profil(libelle:'Assistante recrutement').save(failOnError: true)
//                new Profil(libelle:'FULL').save(failOnError: true)
                new Profil(libelle:'Barbara').save(failOnError: true)
                new Profil(libelle:'mig2').save(failOnError: true)
                new Profil(libelle:'Asmaa LAMDAGHRI').save(failOnError: true)
                new Profil(libelle:'vide').save(failOnError: true)
                new Profil(libelle:'meriem hamam').save(failOnError: true)
                new Profil(libelle:'camilia ben').save(failOnError: true)
                new Profil(libelle:'mezyane saloua').save(failOnError: true)
                new Profil(libelle:'chama.c').save(failOnError: true)
                new Profil(libelle:'kbellamine').save(failOnError: true)
                new Profil(libelle:'mtiwi Meriem').save(failOnError: true)
                new Profil(libelle:'i.soussi2').save(failOnError: true)
                new Profil(libelle:'hananplus').save(failOnError: true)
                new Profil(libelle:'WIDAD').save(failOnError: true)
                new Profil(libelle:'khadija faddoul').save(failOnError: true)
                new Profil(libelle:'ALIA ALAMI').save(failOnError: true)
                new Profil(libelle:'mazali3').save(failOnError: true)
                new Profil(libelle:'elyousfi').save(failOnError: true)
                new Profil(libelle:'ROLE_CANDIDAT').save(failOnError: true)
                
                def d1 = new Droit(code : 'MODIFIER_CANDIDAT').save(failOnError: true)
                def d2 = new Droit(code : 'SUPPRIMER_CANDIDAT').save(failOnError: true)
                def d3 = new Droit(code : 'AJOUTER_CANDIDAT').save(failOnError: true)   
                def d4 = new Droit(code : 'RECHERCHER_CANDIDAT').save(failOnError: true)
                def da5 = new Droit(code : 'LISTE_CANDIDAT').save(failOnError: true)
                def da6 = new Droit(code : 'ENVOYERMAIL_CANDIDAT').save(failOnError: true)
                
                def d41 = new Droit(code : 'GERER_CANDIDAT').save(failOnError: true)
                def d42 = new Droit(code : 'AFFECTER_MISSION_CANDIDAT').save(failOnError: true)
                def d43 = new Droit(code : 'PRETENTION_SALARIALE_CANDIDAT').save(failOnError: true)
                def d5 = new Droit(code : 'IMPRIMERFICHE_CANDIDAT').save(failOnError: true) 
                def d6 = new Droit(code : 'CONSULTER_CANDIDAT').save(failOnError: true)
                
                
                def d7 = new Droit(code : 'AJOUTER_CONTACT').save(failOnError: true) 
                def d8 = new Droit(code : 'MODIFIER_CONTACT').save(failOnError: true) 
                def d9 = new Droit(code : 'SUPPRIMER_CONTACT').save(failOnError: true) 
                def d10 = new Droit(code : 'CONSULTER_CONTACT').save(failOnError: true) 
                def d11 = new Droit(code : 'LISTE_CONTACT').save(failOnError: true) 
                def d12 = new Droit(code : 'RECHERCHER_CONTACT').save(failOnError: true)
                def d123 = new Droit(code : 'ENVOYERMAIL_CONTACT').save(failOnError: true)
                def dc12 = new Droit(code : 'LISTE_ACTIONCONTACT').save(failOnError: true)
                
                def d14 = new Droit(code : 'AJOUTER_MISSION').save(failOnError: true)
                def d15 = new Droit(code : 'MODIFIER_MISSION').save(failOnError: true)
                def d20 = new Droit(code : 'LISTE_MISSION').save(failOnError: true)
                def d17 = new Droit(code : 'CONSULTER_MISSION').save(failOnError: true)
                def d19 = new Droit(code : 'CLOTURER_MISSION').save(failOnError: true)
                def d21 = new Droit(code : 'ARCHIVER_MISSION').save(failOnError: true)
                def d22 = new Droit(code : 'PLANIFIER_MISSION').save(failOnError: true)
                def dma22 = new Droit(code : 'RECHERCHER_MISSION').save(failOnError: true)
                def dm222 = new Droit(code : 'SUPPRIMER_MISSION').save(failOnError: true)
                def dm21 = new Droit(code : 'LISTE_ANNONCE').save(failOnError: true)
                
                def dm22 = new Droit(code : 'LISTE_CANDIDATURE').save(failOnError: true)
                def candid1 = new Droit(code : 'AJOUTER_CANDIDATURE').save(failOnError: true)
                def candid2 = new Droit(code : 'MODIFIER_CANDIDATURE').save(failOnError: true)
                def candid3 = new Droit(code : 'CONSULTER_CANDIDATURE').save(failOnError: true)
                def candid4 = new Droit(code : 'SUPPRIMER_CANDIDATURE').save(failOnError: true)
                def candid5 = new Droit(code : 'RECHERCHER_CANDIDATURE').save(failOnError: true)
                def candid6 = new Droit(code : 'GERER_CANDIDATURE').save(failOnError: true)
                def candid7 = new Droit(code : 'LISTE_RENDEZVOUS').save(failOnError: true)
                
                def uti1 = new Droit(code : 'AJOUTER_UTILISATEUR').save(failOnError: true)
                def uti11 = new Droit(code : 'MODIFIER_UTILISATEUR').save(failOnError: true)
                def uti111 = new Droit(code : 'CONSULTER_UTILISATEUR').save(failOnError: true)
                def uti2 = new Droit(code : 'LISTE_UTILISATEUR').save(failOnError: true)
                def uti22 = new Droit(code : 'SUPPRIMER_UTILISATEUR').save(failOnError: true)
                def uti3 = new Droit(code : 'AJOUTER_PROFIL').save(failOnError: true)
                def uti33 = new Droit(code : 'MODIFIER_PROFIL').save(failOnError: true)
                def uti4 = new Droit(code : 'LISTE_PROFIL').save(failOnError: true)
                def uti44 = new Droit(code : 'SUPPRIMER_PROFIL').save(failOnError: true)
                
                def parametrage = new Droit(code : 'PARAMETRAGE').save(failOnError: true)
                
                def profilfull = new Profil(libelle: 'FULL')
                .addToDroits(d1)
                .addToDroits(d2)
                .addToDroits(d3)
                .addToDroits(d4)
                .addToDroits(d5)
                .addToDroits(d6)
                .addToDroits(d7)
                .addToDroits(d8)
                .addToDroits(d9)
                .addToDroits(d10)
                .addToDroits(d11)
                .addToDroits(d12)
                .addToDroits(dc12)
                .addToDroits(d42)
                .addToDroits(d17)
                .addToDroits(d21)
                .addToDroits(d21)
                .addToDroits(d20)
                .addToDroits(d14)
                .addToDroits(dma22)
                .addToDroits(dm21)
                .addToDroits(dm22)
                .addToDroits(d19)
                .addToDroits(d43)
                .addToDroits(da5)
                .addToDroits(da6)
                .addToDroits(uti1)
                .addToDroits(uti11)
                .addToDroits(uti111)
                .addToDroits(uti2)
                .addToDroits(uti3)
                .addToDroits(uti33)
                .addToDroits(uti4)
                .addToDroits(parametrage)
                .addToDroits(dm22)
                .addToDroits(candid1)
                .addToDroits(candid2)
                .addToDroits(candid3)
                .addToDroits(candid4)
                .addToDroits(candid5)
                .addToDroits(candid6)
                .addToDroits(candid7)
                .addToDroits(d123)
                .save(flush: true)
                
                def candidatprofil = new Profil(libelle: 'candidat')
                .addToDroits(d6)
                .addToDroits(d1)
                .save(flush: true)
                def chargerrechercheprofil = new Profil(libelle: 'chargerrecherche')
                .addToDroits(d6)
                .addToDroits(d1)
                .save(flush: true)
                def consultantprofil = new Profil(libelle: 'consultant')
                .addToDroits(d6)
                .addToDroits(d1)
                .save(flush: true)
                def assistantprofil = new Profil(libelle: 'assistant')
                .addToDroits(d6)
                .addToDroits(d1)
                .save(flush: true)
                
                
                def maroc = new Pays(nom : 'Maroc').save();
                def ville1=new Ville(nom : 'AGADIR', pays : maroc).save();
                
                def c1=new Civilite(libelle:'M.',ordre:100).save() 
                def c2=new Civilite(libelle:'Mlle',ordre:200).save()
                def c3=new Civilite(libelle:'Mme',ordre:300).save()
                
                def s1=new SituationFamiliale(libelle:'Célibataire',ordre:100).save()
                def s2=new SituationFamiliale(libelle:'Marié(e)',ordre:200).save()
                def s3=new SituationFamiliale(libelle:'Divorcé(e)',ordre:300).save()
                def s4=new SituationFamiliale(libelle:'Veuf(ve)',ordre:400).save()
                def s5=new SituationFamiliale(libelle:'NC',ordre:500).save()
                
                def si1=new PlageExperience(libelle:'Débutant',ordre:100).save() 
                def si2=new PlageExperience(libelle:'Moins de 1 an',ordre:200).save()
                def si3=new PlageExperience(libelle:'De 1 à 3 ans',ordre:300).save()
                def si4=new PlageExperience(libelle:'De 3 à 5 ans',ordre:400).save()
                def si5=new PlageExperience(libelle:'De 5 à 10 ans',ordre:500).save()
                def si6=new PlageExperience(libelle:'De 10 à 20 ans',ordre:600).save()
                def si7=new PlageExperience(libelle:'Plus de 20 ans',ordre:700).save()
                
                def n1=new NiveauEtude(libelle:'Niveau Bac',ordre:100,obsolute:true).save()
                def n2=new NiveauEtude(libelle:'Bac',ordre:200,obsolute:true).save()
                def n3=new NiveauEtude(libelle:'Bac+1 et Bac+2 ',ordre:300,obsolute:true).save()
                def n4=new NiveauEtude(libelle:'Bac+3 et Bac+4',ordre:400,obsolute:true).save()
                def n5=new NiveauEtude(libelle:'Bac+5 et plus',ordre:500,obsolute:true).save()
                
                def diplome1=new Diplome(libelle:'BTS / DUT',ordre:100).save()
                def diplome2=new Diplome(libelle:'DEA',ordre:200).save()
                def diplome3=new Diplome(libelle:'DECF / DCG',ordre:300).save()
                def diplome4=new Diplome(libelle:'DESA',ordre:400).save()
                def diplome5=new Diplome(libelle:'DESCF / DSCG',ordre:500).save()
                def diplome6=new Diplome(libelle:'DESS',ordre:600).save()
                def diplome7=new Diplome(libelle:'DEUG',ordre:700).save()
                def diplome8=new Diplome(libelle:'Doctorat',ordre:800).save()
                def diplome9=new Diplome(libelle:'DPECF / DCG',ordre:900).save()
                def diplome10=new Diplome(libelle:'Expertise Comptable / DEC',ordre:1000).save()
                def diplome11=new Diplome(libelle:'Ingénieur d\'application',ordre:1100).save()
                def diplome12=new Diplome(libelle:'Ingénieur d\'Etat',ordre:1200).save()
                def diplome13=new Diplome(libelle:'Licence',ordre:1300).save()
                def diplome14=new Diplome(libelle:'Maîtrise',ordre:1400).save()
                def diplome15=new Diplome(libelle:'Master',ordre:1500).save()
                def diplome16=new Diplome(libelle:'Master 1',ordre:1600).save()
                def diplome17=new Diplome(libelle:'Master 2',ordre:1700).save()
                def diplome18=new Diplome(libelle:'MBA',ordre:1800).save()
                def diplome19=new Diplome(libelle:'MSG',ordre:1900).save()
                def diplome20=new Diplome(libelle:'MSTCF',ordre:2000).save()
                def diplome21=new Diplome(libelle:'Baccalauréat',ordre:2100).save()
                def diplome22=new Diplome(libelle:'Classes Préparatoires',ordre:2200).save()
                def diplome23=new Diplome(libelle:'Bachelor',ordre:2300).save()
                
                def te1=new TypeEtablissement(libelle:'Autre',ordre:100).save()
                def te2=new TypeEtablissement(libelle:'Ecole d Administration',ordre:200).save()
                def te3=new TypeEtablissement(libelle:'Ecole d Architecture',ordre:300).save()
                def te4=new TypeEtablissement(libelle:'Ecole de commerce',ordre:400).save()
                
                def p1=new Poste(libelle:'Acheteur',ordre:100).save()
                def p2=new Poste(libelle:'Actuaire',ordre:200).save()
                def p3=new Poste(libelle:'Administrateur Bases de Données / SI',ordre:300).save()
                def p4=new Poste(libelle:'Analyste Financier',ordre:400).save()
                def p5=new Poste(libelle:'Architecte / Urbaniste',ordre:500).save()
                def p6=new Poste(libelle:'Assistante',ordre:600).save()
                def p7=new Poste(libelle:'Assistante Administrative',ordre:700).save()
                def p8=new Poste(libelle:'Assistante de Direction',ordre:800).save()
                def p9=new Poste(libelle:'Attaché de Direction',ordre:900).save()
                def p10=new Poste(libelle:'Auditeur',ordre:1000).save()
                def p11=new Poste(libelle:'Business Analyst',ordre:1100).save()
                def p12=new Poste(libelle:'Cadre Financier / Cadre adminstratif et financier',ordre:1200).save()
                def p13=new Poste(libelle:'Cadre Marketing',ordre:1300).save()
                def p14=new Poste(libelle:'Cadre RH',ordre:1400).save()
                def p15=new Poste(libelle:'Chargé d\'affaires',ordre:1500).save()
                def p16=new Poste(libelle:'Chargé de clientèle',ordre:1600).save()
                def p17=new Poste(libelle:'Chargé de Mission',ordre:1700).save()
                def p18=new Poste(libelle:'Chargé d\'études',ordre:1800).save()
                def p19=new Poste(libelle:'Chef de Groupe',ordre:1900).save()
                def p20=new Poste(libelle:'Chef de Marque',ordre:2000).save()
                def p21=new Poste(libelle:'Chef de Produit',ordre:2100).save()
                def p22=new Poste(libelle:'Chef de projet BTP',ordre:2200).save()
                def p23=new Poste(libelle:'Chef de projet informatique',ordre:2300).save()
                def p24=new Poste(libelle:'Chef de publicité',ordre:2400).save()
                def p25=new Poste(libelle:'Commercial',ordre:2500).save()
                def p26=new Poste(libelle:'Comptable',ordre:2600).save()
                def p27=new Poste(libelle:'Conducteur de travaux',ordre:2700).save()
                def p28=new Poste(libelle:'Consultant RH',ordre:2800).save()
                def p29=new Poste(libelle:'Contrôleur de Gestion',ordre:2900).save()
                def p30=new Poste(libelle:'Contrôleur Interne',ordre:3000).save()
                def p31=new Poste(libelle:'Courtier',ordre:3100).save()
                def p32=new Poste(libelle:'Customer Relationship Manager (CRM)',ordre:3200).save()
                def p33=new Poste(libelle:'Délégué médical',ordre:3300).save()
                def p34=new Poste(libelle:'Directeur',ordre:3400).save()
                def p35=new Poste(libelle:'Directeur Audit',ordre:3500).save()
                def p36=new Poste(libelle:'Directeur Commercial',ordre:3600).save()
                def p37=new Poste(libelle:'Directeur Communication',ordre:3700).save()
                def p38=new Poste(libelle:'Directeur Contrôle de Gestion',ordre:3800).save()
                def p39=new Poste(libelle:'Directeur d\'agence bancaire / assurance',ordre:3900).save()
                def p40=new Poste(libelle:'Directeur de chantier',ordre:4000).save()
                def p41=new Poste(libelle:'Directeur de clientèle',ordre:4100).save()
                def p42=new Poste(libelle:'Directeur de création',ordre:4200).save()
                def p43=new Poste(libelle:'Directeur de formation',ordre:4300).save()
                def p44=new Poste(libelle:'Directeur des achats',ordre:4400).save()
                def p45=new Poste(libelle:'Directeur des études',ordre:4500).save()
                def p46=new Poste(libelle:'Directeur des Ressources Humaines',ordre:4600).save()
                def p47=new Poste(libelle:'Directeur des Ventes',ordre:4700).save()
                def p48=new Poste(libelle:'Directeur Développement / Organisation',ordre:4800).save()
                def p49=new Poste(libelle:'Directeur d\'hébergement',ordre:4900).save()
                def p50=new Poste(libelle:'Directeur d\'hôtel',ordre:5000).save()
                def p51=new Poste(libelle:'Directeur d\'usine',ordre:5100).save()
                def p52=new Poste(libelle:'Directeur Financier /  DAF',ordre:5200).save()
                def p53=new Poste(libelle:'Directeur Général',ordre:5300).save()
                def p54=new Poste(libelle:'Directeur Général Adjoint (DGA)',ordre:5400).save()
                def p55=new Poste(libelle:'Directeur informatique / SI',ordre:5500).save()
                def p56=new Poste(libelle:'Directeur Juridique',ordre:5600).save()
                def p57=new Poste(libelle:'Directeur Logistique',ordre:5700).save()
                def p58=new Poste(libelle:'Directeur Marketing',ordre:5800).save()
                def p59=new Poste(libelle:'Directeur Production',ordre:5900).save()
                def p60=new Poste(libelle:'Directeur Qualité',ordre:6000).save()
                def p61=new Poste(libelle:'Directeur Technique',ordre:6100).save()
                def p62=new Poste(libelle:'Docteur en médecine',ordre:6200).save()
                def p63=new Poste(libelle:'Docteur en pharmacie',ordre:6300).save()
                def p64=new Poste(libelle:'Financial Controller',ordre:6400).save()
                def p65=new Poste(libelle:'Fiscaliste',ordre:6500).save()
                def p66=new Poste(libelle:'Formateur',ordre:6600).save()
                def p67=new Poste(libelle:'Gestionnaire de patrimoine',ordre:6700).save()
                def p68=new Poste(libelle:'Ingénieur / Technico -Commercial',ordre:6800).save()
                def p69=new Poste(libelle:'Ingénieur d\'affaires',ordre:6900).save()
                def p70=new Poste(libelle:'Ingénieur développement informatique',ordre:7000).save()
                def p71=new Poste(libelle:'Ingénieur Génie Civil',ordre:7100).save()
                def p72=new Poste(libelle:'Ingénieur Informatique',ordre:7200).save()
                def p73=new Poste(libelle:'Ingénieur Maintenance',ordre:7300).save()
                def p74=new Poste(libelle:'Ingénieur Méthodes et process',ordre:7400).save()
                def p75=new Poste(libelle:'Ingénieur Production',ordre:7500).save()
                def p76=new Poste(libelle:'Ingénieur télecoms et réseau',ordre:7600).save()
                def p77=new Poste(libelle:'Journaliste',ordre:7700).save()
                def p78=new Poste(libelle:'Juriste',ordre:7800).save()
                def p79=new Poste(libelle:'Logisticien / Cadre Logistique',ordre:7900).save()
                def p80=new Poste(libelle:'Manager Call Center',ordre:8000).save()
                def p81=new Poste(libelle:'Qualiticien',ordre:8100).save()
                def p82=new Poste(libelle:'Rédacteur en chef',ordre:8200).save()
                def p83=new Poste(libelle:'Reponsable Approvisionnements',ordre:83).save()
                def p84=new Poste(libelle:'Reponsable Transit',ordre:8400).save()
                def p85=new Poste(libelle:'Responsable achats',ordre:8500).save()
                def p86=new Poste(libelle:'Responsable Administration des Ventes',ordre:8600).save()
                def p87=new Poste(libelle:'Responsable Administration du personnel',ordre:8700).save()
                def p88=new Poste(libelle:'Responsable Agence',ordre:8800).save()
                def p89=new Poste(libelle:'Responsable Audit',ordre:8900).save()
                def p90=new Poste(libelle:'Responsable Commercial',ordre:9000).save()
                def p91=new Poste(libelle:'Responsable Communication',ordre:9100).save()
                def p92=new Poste(libelle:'Responsable Comptable / Chef Comptable',ordre:9200).save()
                def p93=new Poste(libelle:'Responsable Contentieux',ordre:9300).save()
                def p94=new Poste(libelle:'Responsable Contrôle de Gestion',ordre:9400).save()
                def p95=new Poste(libelle:'Responsable Contrôle Interne',ordre:9500).save()
                def p96=new Poste(libelle:'Responsable de la communication externe',ordre:9600).save()
                def p97=new Poste(libelle:'Responsable de la communication institutionnelle',ordre:9700).save()
                def p98=new Poste(libelle:'Responsable de la communication interne',ordre:9800).save()
                def p99=new Poste(libelle:'Responsable des affaires réglementaires',ordre:9900).save()
                def p100=new Poste(libelle:'Responsable des opérations',ordre:10000).save()
                def p101=new Poste(libelle:'Responsable des Relations Sociales',ordre:10100).save()
                def p102=new Poste(libelle:'Responsable des Ressources Humaines',ordre:10200).save()
                def p103=new Poste(libelle:'Responsable des Ventes',ordre:10300).save()
                def p104=new Poste(libelle:'Responsable Développement RH',ordre:10400).save()
                def p105=new Poste(libelle:'Responsable Export / Import',ordre:10500).save()
                def p106=new Poste(libelle:'Responsable Facturation',ordre:10600).save()
                def p107=new Poste(libelle:'Responsable Financier / RAF',ordre:10700).save()
                def p108=new Poste(libelle:'Responsable Fiscalité',ordre:10800).save()
                def p109=new Poste(libelle:'Responsable Formation',ordre:10900).save()
                def p110=new Poste(libelle:'Responsable Grands Comptes',ordre:11000).save()
                def p111=new Poste(libelle:'Responsable Hygiène Sécurité Environnement',ordre:11100).save()
                def p112=new Poste(libelle:'Responsable informatique',ordre:11200).save()
                def p113=new Poste(libelle:'Responsable juridique',ordre:11300).save()
                def p114=new Poste(libelle:'Responsable Logistique',ordre:11400).save()
                def p115=new Poste(libelle:'Responsable Maintenance',ordre:11500).save()
                def p116=new Poste(libelle:'Responsable Marketing',ordre:11600).save()
                def p117=new Poste(libelle:'Responsable Méthodes et process',ordre:11700).save()
                def p118=new Poste(libelle:'Responsable Production',ordre:11800).save()
                def p119=new Poste(libelle:'Responsable Projets (project manager)',ordre:11900).save()
                def p120=new Poste(libelle:'Responsable Qualité',ordre:12000).save()
                def p121=new Poste(libelle:'Responsable Recouvrement',ordre:12100).save()
                def p122=new Poste(libelle:'Responsable Recrutement',ordre:12200).save()
                def p123=new Poste(libelle:'Responsable Reporting',ordre:12300).save()
                def p124=new Poste(libelle:'Responsable RP & Evenementiel',ordre:12400).save()
                def p125=new Poste(libelle:'Responsable SAV',ordre:12500).save()
                def p126=new Poste(libelle:'Responsable Sécurité SI',ordre:12600).save()
                def p127=new Poste(libelle:'Responsable Service Clientèle',ordre:12700).save()
                def p128=new Poste(libelle:'Responsable services généraux',ordre:12800).save()
                def p129=new Poste(libelle:'Responsable Trésorerie',ordre:12900).save()
                def p130=new Poste(libelle:'Secrétaire Général',ordre:13000).save()
                def p131=new Poste(libelle:'Supply Chain Manager',ordre:13100).save()
                def p132=new Poste(libelle:'Trader',ordre:13200).save()
                def p133=new Poste(libelle:'Chef de projet',ordre:13300).save()
                
                def ten1=new TypeEntreprise(libelle:'Multinationale',ordre:100).save() 
                def ten2=new TypeEntreprise(libelle:'Privée Internationale',ordre:200).save()
                def ten3=new TypeEntreprise(libelle:'Privée Nationale',ordre:300).save()
                def ten4=new TypeEntreprise(libelle:'Publique',ordre:400).save()
                def ten5=new TypeEntreprise(libelle:'Semi-publique',ordre:500).save()
                def ten6=new TypeEntreprise(libelle:'PME-PMI',ordre:600).save()
                
                def sa7=new SecteurActivite(libelle:'Banque / Assurance',ordre:100).save()
                def sa8=new SecteurActivite(libelle:'BTP /  Immobilier',ordre:200).save()
                def sa9=new SecteurActivite(libelle:'Call Center',ordre:300).save()
                def sa10=new SecteurActivite(libelle:'Chimie / Parachimie',ordre:400).save()
                def sa11=new SecteurActivite(libelle:'Communication / Evènementiel',ordre:500).save()
                def sa12=new SecteurActivite(libelle:'Conseil aux entreprises et particuliers',ordre:600).save()
                def sa13=new SecteurActivite(libelle:'Distribution / Commerce / Grande Consommation',ordre:700).save()
                def sa14=new SecteurActivite(libelle:'Emballage',ordre:800).save()
                def sa15=new SecteurActivite(libelle:'Enseignement / Formation',ordre:900).save()
                def sa16=new SecteurActivite(libelle:'Environnement',ordre:1000).save()
                def sa17=new SecteurActivite(libelle:'Finances /  Bourse',ordre:110).save()
                def sa18=new SecteurActivite(libelle:'Holding',ordre:1200).save()
                def sa19=new SecteurActivite(libelle:'Hôtellerie / Tourisme / Restauration / Loisirs',ordre:1300).save()
                def sa20=new SecteurActivite(libelle:'Informatique',ordre:1400).save()
                def sa21=new SecteurActivite(libelle:'Juridique',ordre:1500).save()
                def sa22=new SecteurActivite(libelle:'Médical / Pharmacie',ordre:1600).save()
                def sa23=new SecteurActivite(libelle:'Métallurgie /  Mécanique /  Electrique /  Electonique',ordre:1700).save()
                def sa24=new SecteurActivite(libelle:'Mines / Energie',ordre:1800).save()
                def sa25=new SecteurActivite(libelle:'Offshoring',ordre:1900).save()
                def sa26=new SecteurActivite(libelle:'Presse / Edition',ordre:200).save()
                def sa27=new SecteurActivite(libelle:'Services aux entreprises et particuliers',ordre:2100).save()
                def sa28=new SecteurActivite(libelle:'Télécommunications / Audiovisuel',ordre:2200).save()
                def sa29=new SecteurActivite(libelle:'Textile',ordre:2300).save()
                def sa30=new SecteurActivite(libelle:'Transport / Logistique',ordre:2400).save()
                def sa31=new SecteurActivite(libelle:'Agriculture / Agroalimentaire',ordre:2500).save()
                def sa32=new SecteurActivite(libelle:'Autres Industries',ordre:25600).save()
                def sa33=new SecteurActivite(libelle:'Autres Services',ordre:25700).save()
                def sa34=new SecteurActivite(libelle:'Autres Services',ordre:25800).save()
                def sa35=new SecteurActivite(libelle:'Automobile',ordre:25800).save()
                
                def ea1=new EtapeAvancement(libelle:'Entretien client',ordre:100).save()
                def ea2=new EtapeAvancement(libelle:'Suivi canditature',ordre:200).save()
                def ea3=new EtapeAvancement(libelle:'Suivi intégration',ordre:300).save()
                def ea4=new EtapeAvancement(libelle:'Préselection',ordre:400).save()
                def ea5=new EtapeAvancement(libelle:'Entretien physique',ordre:500).save()
                def ea6=new EtapeAvancement(libelle:'Entretien téléphonique',ordre:600).save()
                def ea7=new EtapeAvancement(libelle:'Recherche',ordre:700).save()
                
                def na1=new Nationalite(libelle:'Marocaine',ordre:100).save() 
                def na2=new Nationalite(libelle:'Tunisien',ordre:200).save() 
                def na3=new Nationalite(libelle:'Française',ordre:300).save() 
                def na4=new Nationalite(libelle:'Anglaise',ordre:300).save() 
                def na5=new Nationalite(libelle:'Italienne',ordre:400).save() 
                def na6=new Nationalite(libelle:'Belge',ordre:500).save() 
                def na7=new Nationalite(libelle:'Turque',ordre:600).save() 
                def na9=new Nationalite(libelle:'Espagnole',ordre:700).save() 
                def na10=new Nationalite(libelle:'Canadienne',ordre:700).save() 
                def na11=new Nationalite(libelle:'Anglaise',ordre:800).save() 
                def na12=new Nationalite(libelle:'Suèdoise',ordre:900).save() 
                def na14=new Nationalite(libelle:'Hongroise',ordre:1000).save() 
                def na15=new Nationalite(libelle:'Américaine',ordre:1000).save() 
                def na16=new Nationalite(libelle:'Libanaise',ordre:1100).save() 
                def na17=new Nationalite(libelle:'Sénégalaise',ordre:1200).save() 
                def na8=new Nationalite(libelle:'Autre',ordre:9999).save() 
                
                def sin2=new SourceInscription(libelle:'Site DIORH',ordre:100).save() 
                def sin3=new SourceInscription(libelle:'Portail externe',ordre:200).save() 
                def sin4=new SourceInscription(libelle:'Réseau professionnel',ordre:300).save() 
                def sin5=new SourceInscription(libelle:'Press',ordre:400).save()
                def sin6=new SourceInscription(libelle:'Autre',ordre:500).save()
                
                def ann1=new AnnotationNote(libelle:'A+',ordre:100).save() 
                def ann2=new AnnotationNote(libelle:'A',ordre:200).save() 
                def ann3=new AnnotationNote(libelle:'B',ordre:300).save() 
                def ann4=new AnnotationNote(libelle:'C',ordre:400).save() 
                
                def annofichier1=new AnnotationProfil(libelle:'Achat',ordre:100).save()
                def annofichier2=new AnnotationProfil(libelle:'Assistanat',ordre:200).save()
                def annofichier3=new AnnotationProfil(libelle:'Audit',ordre:300).save()
                def annofichier4=new AnnotationProfil(libelle:'Services Généraux',ordre:400).save()
                def annofichier5=new AnnotationProfil(libelle:'Service Après Vente (SAV)',ordre:500).save()
                def annofichier6=new AnnotationProfil(libelle:'Commercial',ordre:600).save()
                def annofichier7=new AnnotationProfil(libelle:'Communication / Publicité',ordre:700).save()
                def annofichier8=new AnnotationProfil(libelle:'Comptabilité',ordre:800).save()
                def annofichier9=new AnnotationProfil(libelle:'Contrôle de gestion',ordre:900).save()
                def annofichier10=new AnnotationProfil(libelle:'Direction / Direction Générale',ordre:1000).save()
                def annofichier11=new AnnotationProfil(libelle:'Finance',ordre:1100).save()
                def annofichier12=new AnnotationProfil(libelle:'Informatique',ordre:1200).save()
                def annofichier13=new AnnotationProfil(libelle:'Jeune diplômé',ordre:1300).save()
                def annofichier14=new AnnotationProfil(libelle:'Juridique',ordre:1400).save()
                def annofichier15=new AnnotationProfil(libelle:'Fiscalité',ordre:1500).save()
                def annofichier16=new AnnotationProfil(libelle:'Logistique',ordre:1600).save()
                def annofichier17=new AnnotationProfil(libelle:'Marketing',ordre:1700).save()
                def annofichier18=new AnnotationProfil(libelle:'Production',ordre:1800).save()
                def annofichier19=new AnnotationProfil(libelle:'Qualité',ordre:1900).save()
                def annofichier20=new AnnotationProfil(libelle:'RH',ordre:2000).save()
                def annofichier21=new AnnotationProfil(libelle:'Maintenance',ordre:2100).save()
                def annofichier22=new AnnotationProfil(libelle:'SI (Système d\'information)',ordre:2200).save()
                def annofichier23=new AnnotationProfil(libelle:'Conseil',ordre:2300).save()
                def annofichier24=new AnnotationProfil(libelle:'Organisation',ordre:2400).save()
                def annofichier25=new AnnotationProfil(libelle:'Assurance',ordre:2500).save()
                def annofichier26=new AnnotationProfil(libelle:'Administration du personnel',ordre:2600).save()
                def annofichier27=new AnnotationProfil(libelle:'Administration des ventes',ordre:2700).save()
                def annofichier28=new AnnotationProfil(libelle:'Banque',ordre:2800).save()
                def annofichier29=new AnnotationProfil(libelle:'Génie Civil / BTP',ordre:2900).save()
                def annofichier30=new AnnotationProfil(libelle:'Hygiène, Sécurité et environnement',ordre:3000).save()
                def annofichier31=new AnnotationProfil(libelle:'Réseaux et télécommunications',ordre:3100).save()
                def annofichier32=new AnnotationProfil(libelle:'Enseignement',ordre:3200).save()
                def annofichier33=new AnnotationProfil(libelle:'Hôtellerie / Restauration',ordre:3300).save()
                def annofichier34=new AnnotationProfil(libelle:'Journalisme',ordre:3400).save()
                def annofichier35=new AnnotationProfil(libelle:'Médical / Pharmaceutique',ordre:3500).save()
                def annofichier36=new AnnotationProfil(libelle:'Urbanisme/Architecture',ordre:3600).save()
                
                def aa4=new MobiliteGeographique(libelle:'National',ordre:100).save()
                def aap5=new MobiliteGeographique(libelle:'International',ordre:200).save()
                def aap6=new MobiliteGeographique(libelle:'Aucune',ordre:300).save()
                
                def connailiing1=new ConnaissanceLinguistique(intituleLangue:'Allemand').save()
                def connailiing2=new ConnaissanceLinguistique(intituleLangue:'Anglais').save()
                def connailiing3=new ConnaissanceLinguistique(intituleLangue:'Arabe').save()
                def connailiin4=new ConnaissanceLinguistique(intituleLangue:'Espagnol').save()
                def connailiin5=new ConnaissanceLinguistique(intituleLangue:'Français').save()
                def connailiin6=new ConnaissanceLinguistique(intituleLangue:'Italien').save()
                def connailiin7=new ConnaissanceLinguistique(intituleLangue:'Berbère').save()
                def nivlang1=new NiveauConnaissanceLinguistique(libelle:'Excellent',ordre:1).save()
                def nivlang2=new NiveauConnaissanceLinguistique(libelle:'Bon',ordre:2).save()
                def nivlang3=new NiveauConnaissanceLinguistique(libelle:'Moyen',ordre:3).save()
                def nivlang4=new NiveauConnaissanceLinguistique(libelle:'Notions',ordre:4).save()
                def coninfo1=new ConnaissanceInformatique(intituleConnaissance:'excel').save()
                def coninfo2=new ConnaissanceInformatique(intituleConnaissance:'j2ee').save()
                def coninfo3=new ConnaissanceInformatique(intituleConnaissance:'Zend framework').save()
                def coninfo4=new ConnaissanceInformatique(intituleConnaissance:'Symfony').save()
                
                def titretest1=new TitreTest(libelle:'Performance',ordre:100).save(failOnError: true)
                def titretest2=new TitreTest(libelle:'Papi',ordre:200).save(failOnError: true)
                
//           
                //initialisation de la localisation
                new Pays(nom : 'Angola').save();
                new Pays(nom : 'Anguilla').save();
                new Pays(nom : 'Antigua-et-Barbuda').save();
                new Pays(nom : 'Antilles néerlandaises').save();
                new Pays(nom : 'Arabie saoudite').save();
                new Pays(nom : 'Argentine').save();
                new Pays(nom : 'Arménie').save();
                new Pays(nom : 'Aruba').save();
                new Pays(nom : 'Australie').save();
                new Pays(nom : 'Autriche').save();
                new Pays(nom : 'Azerbaïdjan').save();
                new Pays(nom : 'Bahamas').save();
                new Pays(nom : 'Bahreïn').save();
                new Pays(nom : 'Bangladesh').save();
                new Pays(nom : 'Barbade').save();
                new Pays(nom : 'Belau').save();
                def belgique = new Pays(nom : 'Belgique').save();
                new Pays(nom : 'Belize').save();
                new Pays(nom : 'Bénin').save();
                new Pays(nom : 'Bermudes').save();
                new Pays(nom : 'Bhoutan').save();
                new Pays(nom : 'Biélorussie').save();
                new Pays(nom : 'Birmanie').save();
                new Pays(nom : 'Bolivie').save();
                new Pays(nom : 'Bosnie-Herzégovine').save();
                new Pays(nom : 'Botswana').save();
                new Pays(nom : 'Brésil').save();
                new Pays(nom : 'Brunei').save();
                new Pays(nom : 'Bulgarie').save();
                new Pays(nom : 'Burkina Faso').save();
                new Pays(nom : 'Burundi').save();
                new Pays(nom : 'Cambodge').save();
                new Pays(nom : 'Cameroun').save();
                def canada = new Pays(nom : 'Canada').save();
                new Pays(nom : 'Cap-Vert').save();
                new Pays(nom : 'Chili').save();
                new Pays(nom : 'Chine').save();
                new Pays(nom : 'Chypre').save();
                new Pays(nom : 'Colombie').save();
                new Pays(nom : 'Comores').save();
                new Pays(nom : 'Congo').save();
                new Pays(nom : 'Congo (République démocratique du )').save();
                new Pays(nom : 'Corée du Nord').save();
                new Pays(nom : 'Corée du Sud').save();
                new Pays(nom : 'Costa Rica').save();
                new Pays(nom : 'Côte d\'Ivoire').save();
                new Pays(nom : 'Croatie').save();
                new Pays(nom : 'Cuba').save();
                new Pays(nom : 'Danemark').save();
                new Pays(nom : 'Djibouti').save();
                new Pays(nom : 'Dominique').save();
                new Pays(nom : 'Égypte').save();
                new Pays(nom : 'Émirats arabes unis').save();
                new Pays(nom : 'Équateur').save();
                new Pays(nom : 'Érythrée').save();
                new Pays(nom : 'Espagne').save();
                new Pays(nom : 'Estonie').save();
                def usa = new Pays(nom : 'États-Unis').save();
                new Pays(nom : 'Éthiopie').save();
                new Pays(nom : 'Fidji').save();
                new Pays(nom : 'Finlande').save();
                def france = new Pays(nom : 'France').save();
                new Pays(nom : 'Gabon').save();
                new Pays(nom : 'Gambie').save();
                new Pays(nom : 'Géorgie').save();
                new Pays(nom : 'Ghana').save();
                new Pays(nom : 'Gibraltar').save();
                new Pays(nom : 'Grèce').save();
                new Pays(nom : 'Grenade').save();
                new Pays(nom : 'Groenland').save();
                new Pays(nom : 'Guadeloupe').save();
                new Pays(nom : 'Guam').save();
                new Pays(nom : 'Guatemala').save();
                new Pays(nom : 'Guinée').save();
                new Pays(nom : 'Guinée équatoriale').save();
                new Pays(nom : 'Guinée-Bissao').save();
                new Pays(nom : 'Guyana').save();
                new Pays(nom : 'Guyane française').save();
                new Pays(nom : 'Haïti').save();
                new Pays(nom : 'Honduras').save();
                new Pays(nom : 'Hong Kong').save();
                new Pays(nom : 'Hongrie').save();
                new Pays(nom : 'Ile Christmas').save();
                new Pays(nom : 'Ile Norfolk').save();
                new Pays(nom : 'Iles Cayman').save();
                new Pays(nom : 'Iles Cook').save();
                new Pays(nom : 'Iles des Cocos').save();
                new Pays(nom : 'Iles Falkland').save();
                new Pays(nom : 'Iles Féroé').save();
                new Pays(nom : 'Îles Marshall').save();
                new Pays(nom : 'Iles Pitcairn').save();
                new Pays(nom : 'Iles Salomon').save();
                new Pays(nom : 'Iles Svalbard et Jan Mayen').save();
                new Pays(nom : 'Iles Turks-et-Caicos').save();
                new Pays(nom : 'Iles Vierges américaines').save();
                new Pays(nom : 'Iles Vierges britanniques').save();
                new Pays(nom : 'Inde').save();
                new Pays(nom : 'Indonésie').save();
                new Pays(nom : 'Iran').save();
                new Pays(nom : 'Iraq').save();
                new Pays(nom : 'Irlande').save();
                new Pays(nom : 'Islande').save();
                new Pays(nom : 'Italie').save();
                new Pays(nom : 'Jamaïque').save();
                new Pays(nom : 'Japon').save();
                new Pays(nom : 'Jordanie').save();
                new Pays(nom : 'Kazakhstan').save();
                new Pays(nom : 'Kenya').save();
                new Pays(nom : 'Kirghizistan').save();
                new Pays(nom : 'Kiribati').save();
                new Pays(nom : 'Koweït').save();
                new Pays(nom : 'Laos').save();
                new Pays(nom : 'Lesotho').save();
                new Pays(nom : 'Lettonie').save();
                new Pays(nom : 'Liban').save();
                new Pays(nom : 'Liberia').save();
                new Pays(nom : 'Libye').save();
                new Pays(nom : 'Liechtenstein').save();
                new Pays(nom : 'Lituanie').save();
                def Luxembourg = new Pays(nom : 'Luxembourg').save();
                new Pays(nom : 'Macao').save();
                new Pays(nom : 'Macédoine').save();
                new Pays(nom : 'Madagascar').save();
                new Pays(nom : 'Malaisie').save();
                new Pays(nom : 'Malawi').save();
                new Pays(nom : 'Maldives').save();
                new Pays(nom : 'Mali').save();
                new Pays(nom : 'Malte').save();
                new Pays(nom : 'Mariannes du Nord').save();
                
                new Pays(nom : 'Martinique').save();
                new Pays(nom : 'Maurice').save();
                new Pays(nom : 'Mauritanie').save();
                new Pays(nom : 'Mayotte').save();
                new Pays(nom : 'Mexique').save();
                new Pays(nom : 'Micronésie').save();
                new Pays(nom : 'Moldavie').save();
                new Pays(nom : 'Monaco').save();
                new Pays(nom : 'Mongolie').save();
                new Pays(nom : 'Montserrat').save();
                new Pays(nom : 'Mozambique').save();
                new Pays(nom : 'Namibie').save();
                new Pays(nom : 'Nauru').save();
                new Pays(nom : 'Népal').save();
                new Pays(nom : 'Nicaragua').save();
                new Pays(nom : 'Niger').save();
                new Pays(nom : 'Nigeria').save();
                new Pays(nom : 'Nioué').save();
                new Pays(nom : 'Norvège').save();
                new Pays(nom : 'Nouvelle-Calédonie').save();
                new Pays(nom : 'Nouvelle-Zélande').save();
                new Pays(nom : 'Oman').save();
                new Pays(nom : 'Ouganda').save();
                new Pays(nom : 'Ouzbékistan').save();
                new Pays(nom : 'Pakistan').save();
                new Pays(nom : 'Panama').save();
                new Pays(nom : 'Papouasie-Nouvelle-Guinée').save();
                new Pays(nom : 'Paraguay').save();
                new Pays(nom : 'Pays-Bas').save();
                new Pays(nom : 'Pérou').save();
                new Pays(nom : 'Philippines').save();
                new Pays(nom : 'Pologne').save();
                new Pays(nom : 'Polynésie française').save();
                new Pays(nom : 'Porto Rico').save();
                new Pays(nom : 'Portugal').save();
                new Pays(nom : 'Paléstine').save();
                new Pays(nom : 'Qatar').save();
                new Pays(nom : 'République centrafricaine').save();
                new Pays(nom : 'République dominicaine').save();
                new Pays(nom : 'République tchèque').save();
                new Pays(nom : 'Réunion').save();
                new Pays(nom : 'Roumanie').save();
                new Pays(nom : 'Royaume-Uni').save();
                new Pays(nom : 'Russie').save();
                new Pays(nom : 'Rwanda').save();
                new Pays(nom : 'Saint-Christophe-et-Niévès').save();
                new Pays(nom : 'Sainte-Hélène').save();
                new Pays(nom : 'Sainte-Lucie').save();
                new Pays(nom : 'Saint-Marin').save();
                new Pays(nom : 'Saint-Pierre-et-Miquelon').save();
                new Pays(nom : 'Saint-Siège').save();
                new Pays(nom : 'Saint-Vincent-et-les-Grenadines').save();
                new Pays(nom : 'Salvador').save();
                new Pays(nom : 'Samoa').save();
                new Pays(nom : 'Samoa américaines').save();
                new Pays(nom : 'Sao Tomé-et-Principe').save();
                new Pays(nom : 'Sénégal').save();
                new Pays(nom : 'Serbie-et-Monténégro').save();
                new Pays(nom : 'Seychelles').save();
                new Pays(nom : 'Sierra Leone').save();
                new Pays(nom : 'Singapour').save();
                new Pays(nom : 'Slovaquie').save();
                new Pays(nom : 'Slovénie').save();
                new Pays(nom : 'Somalie').save();
                new Pays(nom : 'Soudan').save();
                new Pays(nom : 'Sri Lanka').save();
                new Pays(nom : 'Suède').save();
                new Pays(nom : 'Suisse').save();
                new Pays(nom : 'Suriname').save();
                new Pays(nom : 'Swaziland').save();
                new Pays(nom : 'Syrie').save();
                new Pays(nom : 'Tadjikistan').save();
                new Pays(nom : 'Taïwan').save();
                new Pays(nom : 'Tanzanie').save();
                new Pays(nom : 'Tchad').save();
                new Pays(nom : 'Thaïlande').save();
                new Pays(nom : 'Timor oriental').save();
                new Pays(nom : 'Togo').save();
                new Pays(nom : 'Tokélaou').save();
                new Pays(nom : 'Tonga').save();
                new Pays(nom : 'Trinité-et-Tobago').save();
                new Pays(nom : 'Tunisie').save();
                new Pays(nom : 'Turkménistan').save();
                new Pays(nom : 'Turquie').save();
                new Pays(nom : 'Tuvalu').save();
                new Pays(nom : 'Ukraine').save();
                new Pays(nom : 'Uruguay').save();
                new Pays(nom : 'Vanuatu').save();
                new Pays(nom : 'Venezuela').save();
                new Pays(nom : 'Viêt Nam').save();
                new Pays(nom : 'Wallis-et-Futuna').save();
                new Pays(nom : 'Yémen').save();
                new Pays(nom : 'Zambie').save();
                new Pays(nom : 'Zimbabwe').save();
                def paysAutre = new Pays(nom : 'AUTRE').save();
                
                
                new Ville(nom : 'AGLOU', pays : maroc).save();
                new Ville(nom : 'AHFIR', pays : maroc).save();
                new Ville(nom : 'AHFIR', pays : maroc).save();
                new Ville(nom : 'AL HOCEIMA', pays : maroc).save();
                new Ville(nom : 'AROUIT', pays : maroc).save();
                new Ville(nom : 'ASILAH', pays : maroc).save();
                new Ville(nom : 'AZROU', pays : maroc).save();
                new Ville(nom : 'BEN AHMED', pays : maroc).save();
                new Ville(nom : 'BERKANE', pays : maroc).save();
                new Ville(nom : 'BERKANE', pays : maroc).save();
                new Ville(nom : 'BERRECHID', pays : maroc).save();
                new Ville(nom : 'BOUBEKER', pays : maroc).save();
                new Ville(nom : 'BOUFEKRANE', pays : maroc).save();
                new Ville(nom : 'Bouznika', pays : maroc).save();
                new Ville(nom : 'CASABLANCA', pays : maroc).save();
                new Ville(nom : 'CHEFCHAOUEN', pays : maroc).save();
                new Ville(nom : 'DAKHLA', pays : maroc).save();
                new Ville(nom : 'EL JADIDA', pays : maroc).save();
                new Ville(nom : 'ESSAOUIRA', pays : maroc).save();
                new Ville(nom : 'Errachidia', pays : maroc).save();
                new Ville(nom : 'FÈS', pays : maroc).save();
                new Ville(nom : 'GOULIMIME', pays : maroc).save();
                new Ville(nom : 'GOULMINA', pays : maroc).save();
                new Ville(nom : 'IFRANE', pays : maroc).save();
                new Ville(nom : 'INEZGANE', pays : maroc).save();
                new Ville(nom : 'JERADA', pays : maroc).save();
                new Ville(nom : 'KÉNITRA', pays : maroc).save();
                new Ville(nom : 'KHOURIBGA', pays : maroc).save();
                new Ville(nom : 'MARRAKECH', pays : maroc).save();
                new Ville(nom : 'MEKNÈS', pays : maroc).save();
                new Ville(nom : 'MIDELT', pays : maroc).save();
                new Ville(nom : 'MIRLEFT', pays : maroc).save();
                new Ville(nom : 'NADOR', pays : maroc).save();
                new Ville(nom : 'MOHAMMÉDIA', pays : maroc).save();
                new Ville(nom : 'OUARZAZATE', pays : maroc).save();
                new Ville(nom : 'OUEZZANE', pays : maroc).save();
                new Ville(nom : 'OUED EL HEIMER', pays : maroc).save();
                new Ville(nom : 'OUJDA', pays : maroc).save();
                new Ville(nom : 'OUZOUD', pays : maroc).save();
                new Ville(nom : 'RABAT', pays : maroc).save();
                new Ville(nom : 'CHELLA', pays : maroc).save();
                new Ville(nom : 'RICH', pays : maroc).save();
                new Ville(nom : 'SAFI', pays : maroc).save();
                new Ville(nom : 'SAÏDIA', pays : maroc).save();
                new Ville(nom : 'SALÉ', pays : maroc).save();
                new Ville(nom : 'SALÉ JADIDA', pays : maroc).save();
                new Ville(nom : 'SEFROU', pays : maroc).save();
                new Ville(nom : 'SETTAT', pays : maroc).save();
                new Ville(nom : 'SIDI IFNI', pays : maroc).save();
                new Ville(nom : 'TAFILALET', pays : maroc).save();
                new Ville(nom : 'TAFORALT', pays : maroc).save();
                new Ville(nom : 'TAFRAOUTE', pays : maroc).save();
                new Ville(nom : 'TAGHAZOUT', pays : maroc).save();
                new Ville(nom : 'TANGER', pays : maroc).save();
                new Ville(nom : 'TAROUDANT', pays : maroc).save();
                new Ville(nom : 'TAZA', pays : maroc).save();
                new Ville(nom : 'TÉMARA', pays : maroc).save();
                new Ville(nom : 'TÉNÈS', pays : maroc).save();
                new Ville(nom : 'TÉTOUAN', pays : maroc).save();
                new Ville(nom : 'TIMIDERTE', pays : maroc).save();
                new Ville(nom : 'TINEGHIR', pays : maroc).save();
                def tiznit=new Ville(nom : 'TIZNIT', pays : maroc).save();
                new Ville(nom : 'TOUISSIT', pays : maroc).save();
                new Ville(nom : 'VALLÉE DU DRÂA', pays : maroc).save();
                def zagora = new Ville(nom : 'ZAGORA', pays : maroc).save();
                def paris = new Ville(nom : 'PARIS', pays : france).save();
                new Ville(nom : 'MARSEILLE', pays : france).save();
                new Ville(nom : 'LYON', pays : france).save();
                new Ville(nom : 'LILLE', pays : france).save();
                new Ville(nom : 'BORDEAUX', pays : france).save();
                new Ville(nom : 'POITIERS', pays : france).save();
                new Ville(nom : 'TOULOUSE', pays : france).save();
                new Ville(nom : 'MONTRÉAL', pays : canada).save();
                new Ville(nom : 'Québec', pays : canada).save();
                new Ville(nom : 'NEW YORK', pays : usa).save();
                new Ville(nom : 'OHIO', pays : usa).save();
                new Ville(nom : 'BRUXELLES', pays : belgique).save();
                new Ville(nom : 'Luxembourg', pays : Luxembourg).save();
                new Ville(nom : 'AUTRE', pays : paysAutre).save();
                new NiveauConnaissanceLinguistique(intituleNiveauLangue : 'Exellent').save();
                new NiveauConnaissanceLinguistique(intituleNiveauLangue : 'Bon').save();
                new NiveauConnaissanceLinguistique(intituleNiveauLangue : 'Moyen').save();
                new NiveauConnaissanceLinguistique(intituleNiveauLangue : 'Notions').save();
                
                def formation1=new Formation(libelle:'formation1',ordre:100).save(flush: true)
                def formation2=new Formation(libelle:'formation2',ordre:200).save(flush: true)
                def formation3=new Formation(libelle:'formation3',ordre:300).save(flush: true)
             
                new EtapePlanning(libelle:'Recherche',ordre:100).save(flush: true)
                new EtapePlanning(libelle:'Entretien téléphonique',ordre:200).save(flush: true)
                new EtapePlanning(libelle:'Entretien physique',ordre:300).save(flush: true)
                new EtapePlanning(libelle:'Entretien client',ordre:400).save(flush: true)
                new EtapePlanning(libelle:'Suivi candidature',ordre:500).save(flush: true)
                new EtapePlanning(libelle:'Suivi intégration',ordre:600).save(flush: true)
                new EtapePlanning(libelle:'Ciblage',ordre:700).save(flush: true)
                
                
                def statutmission1=new StatutMission(libelle:'En cours',ordre:100).save(flush: true)
                def statutmission2=new StatutMission(libelle:'Clôturée',ordre:200).save(flush: true)
                def statutmission3=new StatutMission(libelle:'En attente',ordre:300).save(flush: true)
                def statutmission4=new StatutMission(libelle:'Archivée',ordre:400).save(flush: true)
                
               def contact1=new Contact(dateCreation:new Date('20/03/1990'),fax:222222222222222,dateCreationEntrep:new Date('20/03/1990'),type:"Prospect",secteurActivite:sa7,typeEntreprise:ten1,adresse1:"test1",adresse2:"jjjj",chiffreAffaire:12,ville:tiznit,codePostal:22222,effectif:4444,effectifCadre:4444,adresse3:"test1",directeurGeneral:"admant ahmed", telephone:2222222222222,raisonSociale:"rabahsoft1").save(flush: true)
                def mission1=new Mission(poste:"dev",contexte:'Création de poste',approche:'Mixte',deplacement:'Aucun',datePublication:new Date('20/03/2010'),dateFinAnnonce:new Date('09/05/2014'),formation:formation1,niveauEtude:n1,statut:statutmission1,typeFonction:p1,contact:contact1,etapeAvancement:ea1,publierAnnonce:true,descriptifPoste:"bcbcvcgvcgv<br/>allalii",description:'hchch').save(failOnError:true,flush:true)
                def mission2=new Mission(poste:"dev",contexte:'Création de poste',approche:'Mixte',deplacement:'Aucun',datePublication:new Date('20/03/2010'),dateFinAnnonce:new Date('09/05/2014'),formation:formation1,niveauEtude:n1,statut:statutmission1,typeFonction:p1,contact:contact1,etapeAvancement:ea1,publierAnnonce:true,descriptifPoste:"bcbcvcgvcgv<br/>allalii",description:'hchch').save(failOnError:true,flush:true)
                def mission3=new Mission(poste:"dev",contexte:'Création de poste',approche:'Mixte',deplacement:'Aucun',datePublication:new Date('20/03/2010'),dateFinAnnonce:new Date('09/05/2014'),formation:formation1,niveauEtude:n1,statut:statutmission1,typeFonction:p1,contact:contact1,etapeAvancement:ea1,publierAnnonce:true,descriptifPoste:"bcbcvcgvcgv<br/>allalii",description:'hchch').save(failOnError:true,flush:true)
                def mission4=new Mission(poste:"dev",contexte:'Création de poste',approche:'Mixte',deplacement:'Aucun',datePublication:new Date('20/03/2010'),dateFinAnnonce:new Date('09/05/2014'),formation:formation1,niveauEtude:n1,statut:statutmission1,typeFonction:p1,contact:contact1,etapeAvancement:ea1,publierAnnonce:true,descriptifPoste:"bcbcvcgvcgv<br/>allalii",description:'hchch').save(failOnError:true,flush:true)
                def mission5=new Mission(poste:"dev",contexte:'Création de poste',approche:'Mixte',deplacement:'Aucun',datePublication:new Date('20/03/2010'),dateFinAnnonce:new Date('09/05/2014'),formation:formation1,niveauEtude:n1,statut:statutmission1,typeFonction:p1,contact:contact1,etapeAvancement:ea1,publierAnnonce:true,descriptifPoste:"bcbcvcgvcgv<br/>allalii",description:'hchch').save(failOnError:true,flush:true)
                
                
                
               
                
                
                new MailTemplate(code :"mailinscription",description:'description 1',template:"Bonjour M. hamid ouchayan,Nous avons bien enregistré votre inscription et nous vous en remercions. Nous étudions actuellement votre dossier avec la plus grande attention et vous invitons à consulter régulièrement l'ensemble de nos opportunités renouvelées régulièrement sur notre site.Pour vous connecter, vous avez besoin de :E-mail : ouchayan.h@gmail.com Mot de passe : d32zml6k Ce mot de passe étant généré automatiquement par l’application, il est fortement recommandé de le modifier.Afin que DIORH puisse traiter votre candidature de manière optimale, nous vous demandons d’être particulièrement complet au niveau de vos réponses pour toutes les rubriques de l’inscription.Nous vous remercions de votre confiance, et vous souhaitons d'aboutir prochainement dans vos recherches.Cordialement,Département Recrutement DIORH").save(failOnError:true,flush:true)
                new MailTemplate(code :"mailcandidature",description:'description 2',template:"Bonjour,Nous avons bien reçu votre candidature à l'annonce 18.R009.A pour le poste Directeur Commercial (Berrechid) et nous vous remercions de la confiance que vous témoignez à notre Cabinet.Nous procédons à son examen approfondi, et prendrons contact avec vous dans un délai de 15 jours, si votre profil correspond aux exigences du poste. Dans le cas contraire, nous vous proposons de la conserver en toute confidentialité et de vous contacter dès qu'une autre opportunité correspondant à votre profil se présentera.Nous vous invitons également à visiter régulièrement les annonces sur notre site et nous vous remercions de votre compréhension.Cordialement,Département Recrutement DIORH").save(failOnError:true,flush:true)
                new MailTemplate(code :"mailchangementmotpasse",description:'description 3',template:"Bonjour,Votre mot de passe a été réinitialisé. Les nouvelles informations de connexion sont : E-mail : ouchayan.h@gmail.com Mot de passe : u35jx0vc Ce mot de passe étant généré automatiquement par l’application, il est fortement recommandé de le modifier.Cordialement,Département Recrutement DIORH").save(failOnError:true,flush:true)
                new MailTemplate(code :"mailrecuperationmotpasse",description:'description 4',template:'template 4').save(failOnError:true,flush:true)
                new MailTemplate(code :"actualisationProfil",description:'description 5',template:'template 4').save(failOnError:true,flush:true)
                new MailTemplate(code :"finannonce",description:'description 6',template:'template 4').save(failOnError:true,flush:true)
                
                def fonctiondior=new FonctionDior(libelle:"Assistant(e)",ordre:100).save(failOnError:true,flush:true)
                def fonctiondiorconsultant=new FonctionDior(libelle:"Consultant(e)",ordre:200).save(failOnError:true,flush:true)
                def fonctiondiorchargerrecrutement=new FonctionDior(libelle:"Chargé(e) de recherche",ordre:300).save(failOnError:true,flush:true)
                def fonctiondioradministrateur=new FonctionDior(libelle:"Administrateur",ordre:400).save(failOnError:true,flush:true)
                def fonctiondiordirecteur=new FonctionDior(libelle:"Directeur",ordre:500).save(failOnError:true,flush:true)
                def fonctiondiorresponsable=new FonctionDior(libelle:"Responsable BD",ordre:600).save(failOnError:true,flush:true)
                
                
                
               

                def adminUser = new Utilisateur(
                    username: 'admin@diorh.com',
                    email: 'test@test.com',
                    firstName: 'ADMIN',
                    lastName: 'DIORH',
                    password: 'admin',
                    adresseIp:"*",
                    enabled: true,profil:profilfull,fonctionDior:fonctiondior).save(failOnError: true)
                def candidat12=new Candidat(dateNaissance:new Date('20/03/1990'),lieuNaissance:ville1,telPortable:'0673327392',telFix:'0673327392',adresse:'ain sebaa',villecandidat:ville1,nationalite:na1,preavis:12,remunMontantNet:40,remunNbrMois:45,remunAvantages:45,remunPretention:45,nomStockage:'ouchayan',prenomStockage:'hamid',plageExperience:si1,civilite:c1,niveauEtude:n1,situationFamiliale:s1,annotation1:ann1,annotation2:ann2,profil1:annofichier1,profil2:annofichier1,annote:true,annotationCommentaire:'',syntheseDiorh:'synthese',rapportPerformance:'rappperfor',dateCreated:new Date('19/03/2014'),lastUpdated:new Date('19/03/2014'),sourceInscription:sin2,mobilite1:ville1,mobilite2:ville1,mobilite3:ville1,mobiliteGeographique:aa4,username: 'admin1',email: 'admin1@diorh.com',firstName: 'ouchayan',lastName: 'hamid',password: 'admin1',enabled: true,obsolute:false,profil:candidatprofil).save(failOnError: true)
                candidat12.addToExperiences(new Experience(intitulePoste:'superviseur',entreprise:'Dev application Software',dateDebut:new Date('20/03/2009'),dateFin:new Date('20/03/2011'),mission:'charge de clientèle',nbrPersonneEncadre:5,rattachement:'',ville:ville1,secteurActivite:sa7,poste:p1,typeEntreprise:ten1,contact:'omar',telephoneContact:'0663235602',fonctionContact:'encadrant',deleted:false)) 
                candidat12.addToExperiences(new Experience(intitulePoste:'superviseur',entreprise:'Dev application Software',dateDebut:new Date('20/03/2009'),dateFin:new Date('20/03/2011'),mission:'charge de clientèle',nbrPersonneEncadre:5,rattachement:'',ville:ville1,secteurActivite:sa8,poste:p1,typeEntreprise:ten2,contact:'omar1',telephoneContact:'0663235602',fonctionContact:'encadrant1',deleted:false))
                candidat12.addToExperiences(new Experience(intitulePoste:'superviseur',entreprise:'Dev application Software',dateDebut:new Date('20/03/2009'),dateFin:new Date('20/03/2011'),mission:'charge de clientèle',nbrPersonneEncadre:5,rattachement:'',ville:ville1,secteurActivite:sa8,poste:p1,typeEntreprise:ten2,contact:'omar3',telephoneContact:'0663235602',fonctionContact:'encadrant3',deleted:true))
                candidat12.addToExperiences(new Experience(intitulePoste:'superviseur',entreprise:'Dev application Software',dateDebut:new Date('20/03/2009'),dateFin:new Date('20/03/2011'),mission:'charge de clientèle',nbrPersonneEncadre:5,rattachement:'',ville:ville1,secteurActivite:sa7,poste:p2,typeEntreprise:ten2,contact:'omar2',telephoneContact:'0663235602',fonctionContact:'encadrant2',deleted:true))
                candidat12.save(flush:true)
                def candidat13=new Candidat(dateNaissance:new Date('20/03/1990'),lieuNaissance:ville1,telPortable:'0673327392',telFix:'0673327392',adresse:'ain sebaa',villecandidat:ville1,nationalite:na1,preavis:12,remunMontantNet:40,remunNbrMois:45,remunAvantages:45,remunPretention:45,nomStockage:'allali',prenomStockage:'youssef',plageExperience:si1,civilite:c1,niveauEtude:n2,situationFamiliale:s1,annotation1:ann1,annotation2:ann2,profil1:annofichier1,profil2:annofichier1,annote:true,annotationCommentaire:'',syntheseDiorh:'synthese',rapportPerformance:'rappperfor',dateCreated:new Date('19/03/2014'),lastUpdated:new Date('19/03/2014'),sourceInscription:sin2,mobilite1:ville1,mobilite2:ville1,mobilite3:ville1,mobiliteGeographique:aa4,username: 'utilisateur1',email: 'allaemsi1@diorh.com',firstName: 'allali',lastName: 'youssef',password: 'utilisateur1',enabled: true,obsolute:false).save(flush: true)
                candidat13.addToExperiences(new Experience(intitulePoste:'superviseur',entreprise:'chora',dateDebut:new Date('20/03/2009'),dateFin:new Date('20/03/2011'),mission:'charge de clientèle',nbrPersonneEncadre:5,rattachement:'',ville:ville1,secteurActivite:sa7,poste:p2,typeEntreprise:ten1,contact:'omar',telephoneContact:'0663235602',fonctionContact:'encadrant',deleted:false)) 
                candidat13.addToExperiences(new Experience(intitulePoste:'superviseur',entreprise:'chora',dateDebut:new Date('20/03/2009'),dateFin:new Date('20/03/2011'),mission:'charge de clientèle',nbrPersonneEncadre:5,rattachement:'',ville:ville1,secteurActivite:sa7,poste:p2,typeEntreprise:ten2,contact:'omar',telephoneContact:'0663235602',fonctionContact:'encadrant',deleted:false)) 
                candidat13.addToExperiences(new Experience(intitulePoste:'superviseur',entreprise:'chora',dateDebut:new Date('20/03/2009'),dateFin:new Date('20/03/2011'),mission:'charge de clientèle',nbrPersonneEncadre:5,rattachement:'',ville:ville1,secteurActivite:sa8,poste:p3,typeEntreprise:ten1,contact:'omar',telephoneContact:'0663235602',fonctionContact:'encadrant',deleted:false))
                candidat13.save(flush:true)


                 def candidat14=new Candidat(dateNaissance:new Date('20/03/1990'),lieuNaissance:ville1,telPortable:'0673327392',telFix:'0673327392',adresse:'ain sebaa',villecandidat:ville1,nationalite:na1,preavis:12,remunMontantNet:40,remunNbrMois:45,remunAvantages:45,remunPretention:45,nomStockage:'allali1',prenomStockage:'youssef1',plageExperience:si2,civilite:c1,niveauEtude:n1,situationFamiliale:s1,annotation1:ann1,annotation2:ann2,profil1:annofichier1,profil2:annofichier1,annote:false,annotationCommentaire:'',syntheseDiorh:'synthese',rapportPerformance:'rappperfor',dateCreated:new Date('19/03/2014'),lastUpdated:new Date('19/03/2014'),sourceInscription:sin2,mobilite1:ville1,mobilite2:ville1,mobilite3:ville1,mobiliteGeographique:aa4,username: 'utilisateur11',email: 'allaemsi11@diorh.com',firstName: 'allali1',lastName: 'youssef1',password: 'utilisateur11',enabled: false,obsolute:false).save(flush: true)
                candidat14.addToExperiences(new Experience(intitulePoste:'superviseur',entreprise:'chora',dateDebut:new Date('20/03/2009'),dateFin:new Date('20/03/2011'),mission:'charge de clientèle',nbrPersonneEncadre:5,rattachement:'',ville:ville1,secteurActivite:sa8,poste:p3,typeEntreprise:ten1,contact:'omar',telephoneContact:'0663235602',fonctionContact:'encadrant',deleted:false)) 
                candidat14.addToExperiences(new Experience(intitulePoste:'superviseur',entreprise:'chora',dateDebut:new Date('20/03/2009'),dateFin:new Date('20/03/2011'),mission:'charge de clientèle',nbrPersonneEncadre:5,rattachement:'',ville:ville1,secteurActivite:sa7,poste:p3,typeEntreprise:ten1,contact:'omar',telephoneContact:'0663235602',fonctionContact:'encadrant',deleted:false))
                candidat14.save(flush:true)

               
            }
            test {
                
            }
            production {
                
            }
        }
    }
    def destroy = {
    }
}
