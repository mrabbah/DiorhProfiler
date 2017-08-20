package com.rabbahsoft.diorhprofiler
import org.grails.databinding.BindingFormat
import org.apache.commons.collections.list.LazyList;
import org.apache.commons.collections.FactoryUtils;

class Candidat extends Utilisateur implements Comparable<Candidat>{
    
    //static searchable = true  
    static attachmentable = true
//    static searchable = {
//    nationalite (component:true)
//  }

  static searchable = true
//  static searchable = {
//      connaissancesInfo component: true
//      mapping {
//        root false
//      }
//   }
    static embedded = ['nationalite']
    
    Date dateNaissance
    Ville lieuNaissance
    String telPortable
    String telFix
    String adresse
    Ville villecandidat
    Nationalite nationalite
    Integer preavis
    Double remunMontantNet
    Double remunNbrMois
    String remunAvantages
    Double remunPretention
    String nomStockage
    String prenomStockage
    PlageExperience plageExperience
    Civilite civilite
    NiveauEtude niveauEtude
    SituationFamiliale situationFamiliale
    AnnotationNote annotation1
    AnnotationProfil profil1
    AnnotationNote annotation2
    AnnotationProfil profil2
    Boolean annote = false
    Boolean obsolute = false
    String annotationCommentaire
    String syntheseDiorh
    Date	dateCreated
    Date	lastUpdated
    SourceInscription sourceInscription
    Ville mobilite1
    Ville mobilite2
    Ville mobilite3
    MobiliteGeographique mobiliteGeographique
    static hasMany = [
        connaissanceLinguistiques: ConnaissanceLinguistiqueNiveau,
        tests:Test,
        experiences:Experience,
        formationcandidats:FormationCandidat,
        connaissancesInfo : ConnaissanceInformatique,
        candidatures : Candidature
    ]
    List<ConnaissanceLinguistiqueNiveau> connaissanceLinguistiques
    List<FormationCandidat> tests 
    List<Test> formationcandidats
    List<Experience> experiences
                     
    static mapping = {
        connaissanceLinguistiques cascade:"all-delete-orphan"
        tests cascade:"all-delete-orphan"
        formationcandidats cascade:"all-delete-orphan"
        experiences cascade:"all-delete-orphan"
        
        
        plageExperience lazy: false
        annotation1 lazy: false
        profil1 lazy: false
        niveauEtude lazy: false
        experiences lazy: false
        civilite lazy: false
        
        
        ///////////////////
        //nationalite lazy: false
        
    }
    
    static constraints = {
        dateNaissance nullable : true
        lieuNaissance nullable : true
        telPortable nullable : true,maxSize: 20
        telFix nullable: true, maxSize: 20
        adresse nullable : true, maxSize: 65535
        nationalite nullable: true
        preavis nullable: true
        remunMontantNet nullable: true, maxSize: 20
        remunNbrMois nullable: true
        remunAvantages nullable: true, maxSize: 80
        remunPretention nullable: true, maxSize: 80
        annote nullable: false
        annotationCommentaire nullable: true, maxSize: 65535
        syntheseDiorh nullable: true, maxSize: 65535
        nomStockage nullable: true, maxSize: 50
        prenomStockage nullable: true, maxSize: 50
        sourceInscription nullable: true
        annotation1 nullable : true
        annotation2 nullable : true
        situationFamiliale nullable : true
        profil1 nullable : true
        profil2 nullable : true
        mobilite1 nullable : true
        mobilite2 nullable : true
        mobilite3 nullable : true
        mobiliteGeographique nullable: true
        niveauEtude nullable : true
        villecandidat nullable : true
        plageExperience nullable : true
        civilite nullable : true
    }
    
    transient def beforeDelete = {
        withNewSession{
            removeAttachments()
        }
    }
    transient def beforeInsert = {        
        obsolute = false
        if(annotation1 != null) {
            annote = true
        } else {
            annote = false
        }
    }
    transient def beforeUpdate = {
        obsolute = false
        if(annotation1 != null) {
            annote = true
        } else {
            annote = false
        }
    }
    
    @Override	
    public String toString() {
        if(nomStockage != null && nomStockage != 'null' && nomStockage != '' && prenomStockage!=null && prenomStockage!='null' && prenomStockage!='') 
        {
            println("11")
            return "${nomStockage} ${prenomStockage}";
        }
        else if((nomStockage != null && nomStockage != 'null' && nomStockage != '') && (prenomStockage==null || prenomStockage != 'null' || prenomStockage != '')) 
        {
            println("22")
           return "${nomStockage}"; 
        }
        else if((nomStockage == null || nomStockage == 'null' || nomStockage == '') && (prenomStockage!=null && prenomStockage!='null' && prenomStockage!=''))
        {
            println("33")
           return "${prenomStockage}"; 
        }
       else if((nomStockage == null || nomStockage == 'null' || nomStockage == '') && (prenomStockage==null || prenomStockage=='null' || prenomStockage!=''))
        {
            println("44")
           return ""; 
        }
    }
    public int compareTo(Candidat compareCandidat) {
        Date dateCreated = ((Candidat) compareCandidat).dateCreated; 
//        return this.dateCreated > dateCreated;
        if (this.dateCreated > dateCreated)
        return 1;
        else if ( this.dateCreated < dateCreated)
        return -1;
        else 
        return 0;
        
        
//        int dateCmp = e2.hireDate().compareTo(e1.hireDate());
//        if (dateCmp != 0)
//            return dateCmp;
//
//        return (e1.number() < e2.number() ? -1 :
//               (e1.number() == e2.number() ? 0 : 1));
        
    }	
}
