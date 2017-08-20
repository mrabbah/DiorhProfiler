<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.rabbahsoft.diorhprofiler.Candidat" %>
<%@page defaultCodec="none" %>
<div class="tabbable tabbable-bordered">
  <ul class="nav nav-tabs">
    <li class="active"><a href="#tab_br1" data-toggle="tab">Informations personnelles</a></li>
    <li><a href="#tab_br2" data-toggle="tab">Formations et compétences</a></li>
    <li><a href="#tab_br3" data-toggle="tab">Expériences professionnelles</a></li>
    <g:if test="${session.droits!=null && session.droits.GERER_CANDIDAT!=null}">
      <li><a href="#tab_br4" data-toggle="tab">Suivi du candidat</a></li>
    </g:if>
  </ul>
  <div class="tab-content">
    <div class="tab-pane active" id="tab_br1">
      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Identité</span></h3>
      <div class="row">
        <div class="col-sm-3">
          <label for="civilite" class="control-label"><g:message code="candidat.civilite.label" default="Civilité" /><span style="color:red">* :</span></label>
        </div>
        <div class="col-sm-3">
          <g:select class="form-control" id="civilite" name="civilite.id" from="${com.rabbahsoft.diorhprofiler.Civilite.list()}" optionKey="id"  value="${candidatInstance?.civilite?.id}" noSelection="['': 'Sélectionner...']"/>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-3" >
          <label for="nomStockage" class="control-label"><g:message code="candidat.nomStockage.label" default="Nom" /><span style="color:red">* :</span></label>
        </div>
        <div class="col-sm-3" id="row showvalue">
          <g:textField class="form-control" name="nomStockage" id="nomStockage" maxlength="50"   value="${candidatInstance?.nomStockage}"/>
        </div>
        <div class="col-sm-3">
          <label for="prenomStockage" class="control-label"><g:message code="candidat.prenomStockage.label" default="Prénom" /><span style="color:red">* :</span></label>
        </div>
        <div class="col-sm-3" id="row showvalue">
          <g:textField class="form-control" name="prenomStockage" id="prenomStockage" maxlength="50"  value="${candidatInstance?.prenomStockage}"/>
        </div>
      </div>      


      <div class="row">
        <div class="col-sm-3">
          <label for="dateNaissance" class="control-label"><g:message code="candidat.dateNaissance.label" default="Date de naissance" format="yyyy-MM-dd HH:mm:ss.S" /><span style="color:blue">* :</span></label>
        </div>
        <div class="col-sm-3" id="row showvalue">
<!--          <g:textField type="text" class="${session.user==null || session.user.profil.libelle =='candidat'  ? "form-control required" : "form-control"}" name="dateNaissance" id="dateNaissance"  value="${formatDate(format:'dd/MM/yyyy',date:candidatInstance?.dateNaissance)}" default="none" placeholder="DD/MM/YYYY"/>-->
        <g:textField type="text" class="${session.user==null || session.user.profil.libelle =='candidat'  ? "form-control required" : "form-control"}" name="dateNaissance1" id="dateNaissance1"  value="${formatDate(format:'dd/MM/yyyy',date:candidatInstance?.dateNaissance)}" default="none" placeholder="JJ/MM/AAAA"/>
        </div>
        <div class="col-sm-3">
          <label for="lieuNaissance" class="control-label"><g:message code="candidat.lieuNaissance.label" default="Lieu de naissance" /><span style="color:blue">* :</span></label>
        </div>
        <div class="col-sm-3">
          <g:select class="${session.user==null || session.user.profil.libelle =='candidat'  ? "form-control required" : "form-control"}" id="lieuNaissance" name="lieuNaissance.id"  from="${com.rabbahsoft.diorhprofiler.Ville.list()}" optionKey="id" value="${candidatInstance?.lieuNaissance?.id}" noSelection="['': 'Sélectionner...']"/>
        </div>
      </div>

      <div class="row">
        <div class="col-sm-3">
          <label for="nationalite" class="control-label"><g:message code="candidat.nationalite.label" default="Nationalité" /><span style="color:blue">*:</span></label>
        </div>
        <div class="col-sm-3">
          <g:select class="${session.user==null || session.user.profil.libelle =='candidat'  ? "form-control required" : "form-control"}" id="nationalite" name="nationalite.id" from="${com.rabbahsoft.diorhprofiler.Nationalite.list()}" optionKey="id" value="${candidatInstance?.nationalite?.id}" class="form-control" noSelection="['null': '']"/>
        </div>
        <div class="col-sm-3">
          <label for="situationFamiliale" class="control-label"><g:message code="candidat.situationFamiliale.label" default="Situation familiale" /><span style="color:blue">* :</span></label>
        </div>
        <div class="col-sm-3">
          <g:select class="${session.user==null || session.user.profil.libelle =='candidat'  ? "form-control required" : "form-control"}" id="situationFamiliale" name="situationFamiliale.id" from="${com.rabbahsoft.diorhprofiler.SituationFamiliale.list()}" optionKey="id"  value="${candidatInstance?.situationFamiliale?.id}" noSelection="['': 'Sélectionner...']"/>
        </div>
      </div>

      <div class="row">
        <div class="col-sm-3">
          <label for="adresse" class="control-label"><g:message code="candidat.adresse.label" default="Adresse " /><span style="color:red"> :</span></label>
        </div>
        <div class="col-sm-3" id="row showvalue">
          <g:textField class="form-control" name="adresse" id="adresse"  maxlength="65535" value="${candidatInstance?.adresse}"/>
        </div>
        <div class="col-sm-3">
          <label for="ville" class="control-label"><g:message code="candidat.ville.label" default="Ville" /><span style="color:red">* :</span></label>
        </div>
        <div class="col-sm-3">
          <g:select class="form-control" id="villecandidat" name="villecandidat.id" from="${com.rabbahsoft.diorhprofiler.Ville.list()}" optionKey="id"  value="${candidatInstance?.villecandidat?.id}" noSelection="['': 'Sélectionner...']"/>
        </div>
      </div>

      <div class="row">
        <div class="col-sm-3">
          <label for="ville" class="control-label"><g:message code="candidat.telPortable.label" default="N° de GSM" /><span class="required-indicator">* :</span></label>
        </div>
        <div class="col-sm-3" id="row showvalue">
          <g:textField class="form-control" name="telPortable" id="telPortable" maxlength="20" value="${candidatInstance?.telPortable}"/>
        </div>
        <div class="col-sm-3">
          <label for="telFix" class="control-label"><g:message code="candidat.telFix.label" default="Téléphone fixe" /></label>
        </div>
        <div class="col-sm-3" id="row showvalue">
          <g:textField class="form-control" name="telFix" id="telFix" maxlength="50" value="${candidatInstance?.telFix}"/>
        </div>
      </div>




      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Fichiers joints</span></h3>
      <h3 class="alert"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'chain.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/></span><g:message code="candidat.fichiersjoints.label" default="" /></h3>

      <div class="row" id="cv">
        <g:if test="${candidatInstance.email!=null}">
          <g:if test="${candidatInstance.getTotalAttachments('cv')!=0}">
            <div class="col-sm-4"> 
              <attachments:icon attachment="${candidatInstance.getAttachments('cv')[0]}"/> 
              <attachments:downloadLink attachment="${candidatInstance.getAttachments('cv')[0]}"/>
            </div>
            <div class="col-sm-4">
              <a href="#" onclick="deletefile(${candidatInstance.getAttachments('cv')[0].id},${candidatInstance.id},'cv'); return false;">Supprimer</a>
            </div>
          </g:if>
          <g:else>
            <div class="col-sm-4 labelfile">
              <g:message code="candidat.telechargercv.label" default="Télécharger le CV :" /><span class="required-indicator">* :</span>
            </div>
            <div class="col-sm-4">
              <input type="file" name="cv" id="cvfile"/>
            </div>
          </g:else>
        </g:if>
        <g:else>
          <div class="col-sm-4 labelfile">
            <g:message code="candidat.telechargercv.label" default="Télécharger le CV" /><span class="required-indicator">* :</span>
          </div>
          <div class="col-sm-4">
            <input type="file" name="cv" id="cvfile"/>
          </div>
        </g:else>
      </div>
      <div class="row" id="photo">
        <g:if test="${candidatInstance.email!=null}">
          <g:if test="${candidatInstance.getTotalAttachments('photo')!=0}">
            <div class="col-sm-4"> 
              <attachments:icon attachment="${candidatInstance.getAttachments('photo')[0]}"/> 
              <attachments:downloadLink attachment="${candidatInstance.getAttachments('photo')[0]}"/>
            </div>
            <div class="col-sm-4">
              <a href="#" onclick="deletefile(${candidatInstance.getAttachments('photo')[0].id},${candidatInstance.id},'photo'); return false;">Supprimer</a>
            </div>
          </g:if>
          <g:else>
            <div class="col-sm-4 labelfile">
              <g:message code="candidat.telechargerphoto.label" default="Télécharger le CV :" /><span class="required-indicator">:</span>
            </div>
            <div class="col-sm-4">
              <input type="file" name="photo" id="photo"/>
            </div>
          </g:else>
        </g:if>
        <g:else>
          <div class="col-sm-4 labelfile">
            <g:message code="candidat.telechargerphoto.label" default="Télécharger le CV" /><span class="required-indicator">:</span>
          </div>
          <div class="col-sm-4">
            <input type="file" name="photo" id="photo"/>
          </div>
        </g:else>
      </div>

      <div class="row" id="diplome">
        <g:if test="${candidatInstance.email!=null}">
          <g:if test="${candidatInstance.getTotalAttachments('diplome')!=0}">
            <div class="col-sm-4"> 
              <attachments:icon attachment="${candidatInstance.getAttachments('diplome')[0]}"/> 
              <attachments:downloadLink attachment="${candidatInstance.getAttachments('diplome')[0]}"/>
            </div>
            <div class="col-sm-4">
              <a href="#" onclick="deletefile(${candidatInstance.getAttachments('photo')[0].id},${candidatInstance.id},'diplome'); return false;">Supprimer</a>
            </div>
          </g:if>
          <g:else>
            <div class="col-sm-4 labelfile">
              <g:message code="candidat.telechargerdiplome.label" default="Télécharger le CV :" /><span class="required-indicator">:</span>
            </div>
            <div class="col-sm-4">
              <input type="file" name="diplome" id="diplome"/>
            </div>
          </g:else>
        </g:if>
        <g:else>
          <div class="col-sm-4 labelfile">
            <g:message code="candidat.telechargerdiplome.label" default="Télécharger le CV" /><span class="required-indicator">:</span>
          </div>
          <div class="col-sm-4">
            <input type="file" name="diplome" id="diplome"/>
          </div>
        </g:else>
      </div>

      <div class="row" id="bulletinpaie">
        <g:if test="${candidatInstance.email!=null}">
          <g:if test="${candidatInstance.getTotalAttachments('bulletinpaie')!=0}">
            <div class="col-sm-4"> 
              <attachments:icon attachment="${candidatInstance.getAttachments('bulletinpaie')[0]}"/> 
              <attachments:downloadLink attachment="${candidatInstance.getAttachments('bulletinpaie')[0]}"/>
            </div>
            <div class="col-sm-4">
              <a href="#" onclick="deletefile(${candidatInstance.getAttachments('photo')[0].id},${candidatInstance.id},'bulletinpaie'); return false;">Supprimer</a>
            </div>
          </g:if>
          <g:else>
            <div class="col-sm-4 labelfile">
              <g:message code="candidat.telechargerbulletinpaie.label" default="Télécharger le CV :" /><span class="required-indicator">:</span>
            </div>
            <div class="col-sm-4">
              <input type="file" name="bulletinpaie" id="bulletinpaie"/>
            </div>
          </g:else>
        </g:if>
        <g:else>
          <div class="col-sm-4 labelfile">
            <g:message code="candidat.telechargerbulletinpaie.label" default="Télécharger le CV" /><span class="required-indicator">:</span>
          </div>
          <div class="col-sm-4">
            <input type="file" name="bulletinpaie" id="bulletinpaie"/>
          </div>
        </g:else>
      </div>

      <div class="row" id="attestation">
        <g:if test="${candidatInstance.email!=null}">
          <g:if test="${candidatInstance.getTotalAttachments('attestation')!=0}">
            <div class="col-sm-4"> 
              <attachments:icon attachment="${candidatInstance.getAttachments('attestation')[0]}"/> 
              <attachments:downloadLink attachment="${candidatInstance.getAttachments('attestation')[0]}"/>
            </div>
            <div class="col-sm-4">
              <a href="#" onclick="deletefile(${candidatInstance.getAttachments('attestation')[0].id},${candidatInstance.id},'attestation'); return false;">Supprimer</a>
            </div>
          </g:if>
          <g:else>
            <div class="col-sm-4 labelfile">
              <g:message code="candidat.telechargerattestation.label" default="Télécharger le CV :" /><span class="required-indicator">:</span>
            </div>
            <div class="col-sm-4">
              <input type="file" name="attestation" id="attestation"/>
            </div>
          </g:else>
        </g:if>
        <g:else>
          <div class="col-sm-4 labelfile">
            <g:message code="candidat.telechargerattestation.label" default="Télécharger le CV" /><span class="required-indicator">:</span>
          </div>
          <div class="col-sm-4">
            <input type="file" name="attestation" id="attestation"/>
          </div>
        </g:else>
      </div>

      <div class="row">
        <div class="col-sm-4 labelfile">   
          <g:message code="candidat.sourceInscription.label" default="Source Inscription" /><span class="required-indicator">:</span></label>
        </div>
        <div class="col-sm-3">
          <g:select class="form-control" id="sourceInscription" name="sourceInscription.id" from="${com.rabbahsoft.diorhprofiler.SourceInscription.list()}" optionKey="id"  value="${candidatInstance?.sourceInscription?.id}" noSelection="['': 'Sélectionner...']"/>
        </div>
      </div>
      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Authentification</span></h3>
      <div class="row">
        <div class="col-sm-3">
          <label for="email" class="control-label"><g:message code="candidat.email.label" default="Adresse mail:" /><span class="required-indicator">* :</span></label>
        </div>
        <div class="col-sm-3" id="row showvalue">
          <g:textField class="form-control" name="email" id="email" maxlength="50"  value="${candidatInstance?.email}"/>
        </div>
        <div class="col-sm-3">
          <label for="email" class="control-label"><g:message code="candidat.confirmationemail.label"  default="Confirmation Adresse mail:" /><span class="required-indicator">* :</span></label>
        </div>
        <div class="col-sm-3" id="row showvalue">
          <g:textField class="form-control" name="confirmationemail" id="confirmationemail" maxlength="50" value="${candidatInstance?.email}"/>					
        </div>
      </div>
      <h3 class="alert"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/></span><g:message code="candidat.alerteemail.label" default="" /></h3>
    </div>
    <div class="tab-pane" id="tab_br2">
      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Formations</span></h3>
      <div class="row">
        <div class="col-sm-3">
          <label for="niveauEtude" class="control-label"><g:message code="candidat.niveauEtude.label" default="Niveau d'études" /><span class="required-indicator">* :</span></label>
        </div>
        <div class="col-sm-3">
          <g:select class="form-control" id="niveauEtude" name="niveauEtude.id" from="${com.rabbahsoft.diorhprofiler.NiveauEtude.list()}" optionKey="id"  value="${candidatInstance?.niveauEtude?.id}" noSelection="['': 'Sélectionner...']"/>
        </div>
      </div>
      <div class="row">
        <g:render template="formations" model="['candidatInstance':candidatInstance,'inscription':'${params.inscription}']" />
      </div>

<!--      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Compétences informatiques</span></h3>
      <div class="row"> 
        <div class="col-sm-3">
          <label for="connaissancesInfo" class="control-label"><g:message code="candidat.connaissancesInfo.label" default="Connaissances Info" /></label>
        </div>
        <div class="col-sm-3">
          <g:select class="form-control" multiple="multiple" name="connaissancesInfo" id="connaissancesInfo" from="${com.rabbahsoft.diorhprofiler.ConnaissanceInformatique.list()}" optionKey="id" size="5" value="${candidatInstance?.connaissancesInfo?.id}"/>
        </div>
      </div>-->
      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class='label label-info'>Compétences linguistiques</span></h3>
      <div class="row">
        <g:render template="langues" model="['candidatInstance':candidatInstance]" /></td>
      </div>

    </div>
    <div class="tab-pane" id="tab_br3">
      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Expériences</span></h3>
      <div class="row">
        <div class="col-sm-3">
          <label for="plageExperience" class="control-label"><g:message code="candidat.plageExperience.label" default="Plage Experience" /><span class="required-indicator">* :</span></label>
        </div>
        <div class="col-sm-3">
          <g:select class="form-control" id="plageExperience" name="plageExperience.id" from="${com.rabbahsoft.diorhprofiler.PlageExperience.list()}" optionKey="id"  value="${candidatInstance?.plageExperience?.id}" noSelection="['': 'Sélectionner...']"/>
        </div>
      </div>
      <td valign="top" class="value ${hasErrors(bean: candidatInstance, field: 'formations', 'errors')}">
      <g:render template="experiences" model="['candidatInstance':candidatInstance]" />



      <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Informations complémentaires</span></h3>
      <div class="row">
        <div class="col-sm-3">
          <label for="remunMontantNet" class="control-label"><g:message code="candidat.remunMontantNet.label" default="Remun Montant Net" /><span style="color:blue">* :</span></label>
        </div>
        <div class="col-sm-3" id="row showvalue">
          <g:field class="${session.user==null || session.user.profil.libelle =='candidat'  ? "form-control required" : "form-control"}" name="remunMontantNet" id="remunMontantNet"  value="${fieldValue(bean: candidatInstance, field: 'remunMontantNet')}"/>
        </div>
        <div class="col-sm-3">
          <label for="remunNbrMois" class="control-label"><g:message code="candidat.remunNbrMois.label" default="Remun Nbr Mois" /></label>
        </div>
        <div class="col-sm-3" id="row showvalue">
          <g:field class="form-control" name="remunNbrMois" type="number" value="${fieldValue(bean: candidatInstance, field: 'remunNbrMois')}"/>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-3">
          <label for="remunAvantages" class="control-label"><g:message code="candidat.remunAvantages.label" default="Remun Avantages" /></label>
        </div>
        <div class="col-sm-3" id="row showvalue">
          <g:field class="form-control" name="remunAvantages" value="${fieldValue(bean: candidatInstance, field: 'remunAvantages')}"/>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-3">  
          <label for="preavis" class="control-label"><g:message code="candidat.preavis.label" default="Preavis" /></label>
        </div>
        <div class="col-sm-3" id="row showvalue">
          <g:field class="form-control" name="preavis" type="number" value="${candidatInstance.preavis}"/>
        </div>
        <div class="col-sm-3">
          <label for="remunPretention" class="control-label"><g:message code="candidat.remunPretention.label" default="Remun Pretention" /><span style="color:blue">* :</span></label>
        </div>
        <div class="col-sm-3" id="row showvalue">
          <g:field class="${session.user==null || session.user.profil.libelle =='candidat'  ? "form-control required" : "form-control"}" name="remunPretention" id="remunPretention" value="${fieldValue(bean: candidatInstance, field: 'remunPretention')}"/>
        </div>
      </div>


      <h3 class="heading"></h3>
      <div class="row">
        <div class="col-sm-3">
          <label for="mobiliteGeographique" class="control-label"><g:message code="candidat.mobiliteGeographique.label" default="Mobilite Geographique" /><span style="color:blue">* :</span></label>
        </div>
        <div class="col-sm-3">
          <g:select class="${session.user==null || session.user.profil.libelle =='candidat'  ? "form-control required" : "form-control"}" id="mobiliteGeographique" name="mobiliteGeographique.id" from="${com.rabbahsoft.diorhprofiler.MobiliteGeographique.list()}" optionKey="id"  value="${candidatInstance?.mobiliteGeographique?.id}" noSelection="['': 'Sélectionner...']"/>
        </div>
        <div class="col-sm-3">
          <label for="mobilite1" class="control-label"><g:message code="candidat.mobilite1.label" default="Mobilite1" /></label>
        </div>
        <div class="col-sm-3">
          <g:select class="form-control" id="mobilite1" name="mobilite1.id" from="${com.rabbahsoft.diorhprofiler.Ville.list()}" optionKey="id" value="${candidatInstance?.mobilite1?.id}" noSelection="['null': 'Sélectionner...']"/>
        </div>
      </div>

      <div class="row">
        <div class="col-sm-3">
          <label for="mobilite2" class="control-label"><g:message code="candidat.mobilite2.label" default="Mobilite2" /></label>
        </div>
        <div class="col-sm-3">
          <g:select class="form-control" id="mobilite2" name="mobilite2.id" from="${com.rabbahsoft.diorhprofiler.Ville.list()}" optionKey="id" value="${candidatInstance?.mobilite2?.id}" noSelection="['null': 'Sélectionner...']"/>
        </div>
        <div class="col-sm-3">
          <label for="mobilite3" class="control-label"><g:message code="candidat.mobilite3.label" default="Mobilite3" /></label>
        </div>
        <div class="col-sm-3">
          <g:select class="form-control" id="mobilite3" name="mobilite3.id" from="${com.rabbahsoft.diorhprofiler.Ville.list()}" optionKey="id" value="${candidatInstance?.mobilite3?.id}" noSelection="['null': 'Sélectionner...']"/>
        </div>
      </div>
    </div>
    <g:if test="${session.droits!=null && session.droits.GERER_CANDIDAT!=null}">
      <div class="tab-pane" id="tab_br4">
        <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Annotation par profil</span></h3>
        <div class="row">
          <div class="col-sm-3">
            <td width="250"><label for="annotationProfil1" class="control-label"><g:message code="candidat.annotationProfil1.label" default="Profil 1" /> :</label>
          </div>
          <div class="col-sm-3">
            <g:select class="form-control" id="profil1" name="profil1.id" from="${com.rabbahsoft.diorhprofiler.AnnotationProfil.list()}" optionKey="id" value="${candidatInstance?.profil1?.id}" noSelection="['null': 'Sélectionner...']"/> 
          </div>
          <div class="col-sm-3">
            <label for="annotationNote1" class="control-label"><g:message code="candidat.annotationNote1.label" default="Annotation 1" /> :</label>
          </div>
          <div class="col-sm-3">
            <g:select class="form-control" id="annotation1" name="annotation1.id" from="${com.rabbahsoft.diorhprofiler.AnnotationNote.list()}" optionKey="id" value="${candidatInstance?.annotation1?.id}" noSelection="['null': 'Sélectionner...']"/>
          </div>
        </div>

        <div class="row">
          <div class="col-sm-3">
            <label for="annotationProfil2" class="control-label"><g:message code="candidat.annotationProfil2.label" default="Profil 2" /> :</label>
          </div>
          <div class="col-sm-3">
            <g:select class="form-control" id="profil2" name="profil2.id" from="${com.rabbahsoft.diorhprofiler.AnnotationProfil.list()}" optionKey="id" value="${candidatInstance?.profil2?.id}" noSelection="['null': 'Sélectionner...']"/>
          </div>
          <div class="col-sm-3">
            <label for="annotationNote2" class="control-label"><g:message code="candidat.annotationNote2.label" default="Annotation 2" /> :</label>
          </div>
          <div class="col-sm-3"> 
            <g:select class="form-control" id="annotation2" name="annotation2.id" from="${com.rabbahsoft.diorhprofiler.AnnotationNote.list()}" optionKey="id" value="${candidatInstance?.annotation2?.id}" noSelection="['null': 'Sélectionner...']"/>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-3"> 
            <label for="annotationCommentaire" class="control-label"><g:message code="candidat.annotationCommentaire.label" default="Commentaire" /></label>
          </div>
          <div class="col-sm-9" id="row showvalue"> 
            <g:textArea class="form-control" name="annotationCommentaire" cols="40" rows="5" maxlength="65535" value="${candidatInstance?.annotationCommentaire}"/>
          </div>
        </div>

        <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Synthèse et rapport de performance</span></h3>
        <div class="row">
          <div class="col-sm-3"> 
            <label for="syntheseDiorh" class="control-label"><g:message code="candidat.syntheseDiorh.label" default="Synthese Diorh" /></label>
          </div>
          <div class="col-sm-9" id="row showvalue">       
            <g:textArea class="form-control" name="syntheseDiorh" id="syntheseDiorh" cols="40" rows="5" maxlength="65535" value="${candidatInstance?.syntheseDiorh}"/>
          </div>
        </div>
        <div class="row" id="rapportPerformance">
        <g:if test="${candidatInstance.email!=null}">
          <g:if test="${candidatInstance.getTotalAttachments('rapportPerformance')!=0}">
            <div class="col-sm-3"> 
              <attachments:icon attachment="${candidatInstance.getAttachments('rapportPerformance')[0]}"/> 
              <attachments:downloadLink attachment="${candidatInstance.getAttachments('rapportPerformance')[0]}"/>
            </div>
            <div class="col-sm-4">
              <a href="#" onclick="deletefile(${candidatInstance.getAttachments('rapportPerformance')[0].id},${candidatInstance.id},'rapportPerformance'); return false;">Supprimer</a>
            </div>
          </g:if>
          <g:else>
            <div class="col-sm-3 labelfile">
              <g:message code="candidat.rapportPerformance.label" default="Rapport de performance" />
            </div>
            <div class="col-sm-4">
              <input type="file" name="rapportPerformance" id="rapportPerformancefile"/>
            </div>
          </g:else>
        </g:if>
        <g:else>
          <div class="col-sm-3 labelfile">
            <g:message code="candidat.rapportPerformance.label" default="Rapport de performance" />
          </div>
          <div class="col-sm-4">
            <input type="file" name="rapportPerformance" id="rapportPerformancefile"/>
          </div>
        </g:else>
      </div>

        <h3 class="heading"><img class="logo" src="${resource(plugin: 'kickstart', dir:'images/icon', file:'push-pin.png')}" alt="${meta(name:'app.name')}" width="20px" height="20px"/><span class="label label-info">Récaputilatif des tests</span></h3>
        <div class="row">
          <g:render template="tests" model="['candidatInstance':candidatInstance]" />
        </div>
      </div>
    </g:if>
  </div>
</div>
<g:hiddenField id="addlangue" name="addlangue" value="${candidatInstance?.connaissanceLinguistiques == null? 0: candidatInstance?.connaissanceLinguistiques.size()}"/>
<g:hiddenField id="addtest" name="addtest" value="${candidatInstance?.tests == null? 0: candidatInstance?.tests.size()}"/>
<g:hiddenField id="addformationcandidat" name="addformationcandidat" value="${candidatInstance?.formationcandidats == null? 0: candidatInstance?.formationcandidats.size()}"/>
<g:hiddenField id="addexperience" name="addexperience" value="${candidatInstance?.experiences == null? 0: candidatInstance?.experiences.size()}"/>
