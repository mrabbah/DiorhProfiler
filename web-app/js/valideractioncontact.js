
function valideractioncontact() {
    $("#messageerreur").empty();
    var messageerreur = [];
    if ($("#contact").val() =="") { 
        messageerreur.push('Veuillez remplir le champ Contact ');}
    if ($("#responsable").val() =="") { 
        messageerreur.push('Veuillez remplir le champ Consultant ');}
    if ($("#dateAction").val() =="") { 
        messageerreur.push('Veuillez remplir le champ Date pr&eacute;vue JJ/MM/AAAA ');}
    else if(!$("#dateAction").val().match(/^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/)){
        messageerreur.push('Veuillez entrer une Date pr&eacute;vue valide JJ/MM/AAAA ');}
    if ($("#statutAction").val() =="") {
        messageerreur.push('Veuillez remplir le champ Statut'); }
    if ($("#contenu").val() =="") {
        messageerreur.push('Veuillez remplir le champ Contenu'); }
    if(messageerreur.length>0){
    var lang = '';
    lang+='<div class="alert alert-danger">';
    lang+='<ul>';
    for ( var i = 0; i <messageerreur.length; i = i + 1 ) {
    lang+='<li>'+messageerreur[i]+'</li>';
    }
    lang+='</ul>';
    lang+='</div>';
    $('#messageerreur').html(lang);
    $("html, body").animate({scrollTop: 0}, 1000);
    }
    else{
     document.contact.submit();
    }
}

function validercontactupdate() {
    $("#messageerreur").empty();
    var messageerreur = [];
    if ($("#raisonSociale").val() =="") {
        messageerreur.push('Veuillez remplir le champ raison sociale {Informations du contact}'); }
    if ($("#directeurGeneral").val() =="") {
        messageerreur.push('Veuillez remplir le champ directeur g&eacute;n&eacute;ral {Informations du contact}');} 
    if ($("#dateCreation").val() =="") { 
        messageerreur.push('Veuillez remplir le champ Date de creation JJ/MM/AAAA {Informations du contact}');}
    else if(!$("#dateCreation").val().match(/^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/)){
        messageerreur.push('Veuillez entrer une Date de creation valide JJ/MM/AAAA {Informations du contact}');}
    if ($("#dateCreationEntrep").val() =="") { 
        messageerreur.push('Veuillez remplir le champ Date de creation de la soci&eacute;t&eacute; JJ/MM/AAAA {Informations du contact}');}
    else if(!$("#dateCreationEntrep").val().match(/^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/)){
        messageerreur.push('Veuillez entrer une Date de creation de la société valide JJ/MM/AAAA {Informations du contact}');}
    if(!$("#telephone").val().match(/^([0-9\(\)\/\+ \-]*)$/i)){
        messageerreur.push('Veuillez entrer un Num&eacute;ro de t&eacute;l&eacute;phone valide {Informations du contact}');}
            if(!$("#effectif").val().match(/^([0-9\(\)\/\+ \-]*)$/i)){
        messageerreur.push('Veuillez entrer un effectif valide {Informations du contact}');}
    if(!$("#effectifCadre").val().match(/^([0-9\(\)\/\+ \-]*)$/i)){
        messageerreur.push('Veuillez entrer un effectif cadre valide {Informations du contact}');}
    if(!$("#fax").val().match(/^([0-9\(\)\/\+ \-]*)$/i)){
        messageerreur.push('Veuillez entrer un Num&eacute;ro de fax valide {Informations du contact}');}
    if(!$("#chiffreAffaire").val().match(/^([0-9\(\)\/\+ \-]*)$/i)){
        messageerreur.push('Veuillez entrer un chiffre d affaires valide {Informations du contact}');}
    if(checknom()==1){
        messageerreur.push('Veuillez remplir le champ Nom {Interlocuteur} ');
    }
    
    if(checkprenom()==1){
        messageerreur.push('Veuillez remplir le champ Pr&eacute;nom {Interlocuteur} ');
    }
    
    if(checkfonction()==1){
        messageerreur.push('Veuillez remplir le champ fonction {Interlocuteur} ');
    }
    
    if(checktelephonePortable()==1){
        messageerreur.push('Veuillez remplir le champ fonction {Interlocuteur} ');
    }
    
    if(checktelephoneFixe()==1){
        messageerreur.push('Veuillez remplir le champ t&eacute;l&eacute;phone Fixe {Interlocuteur} ');
    }
    
        if(checkemail()==1){
        messageerreur.push('Veuillez entrer une adresse electronique valide {Interlocuteur} ');
    }
    if(messageerreur.length>0){
    var lang = '';
    lang+='<div class="alert alert-danger">';
    lang+='<ul>';
    for ( var i = 0; i <messageerreur.length; i = i + 1 ) {
    lang+='<li>'+messageerreur[i]+'</li>';
    }
    lang+='</ul>';
    lang+='</div>';
    $('#messageerreur').html(lang);
    $("html, body").animate({scrollTop: 0}, 1000);
    }
    else{
     document.contactupdate.submit();
    }
}

function checkemail(){
    var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
    i=0;
    $(".email").each(function() {
    if(!pattern.test($(this).val())){
       i=1;
    }
    });
    return i;
}

 function checknom(){
    i=0;
    $(".nom").each(function() {
    if($(this).val()==""){
       i=1;
    }
    });
    return i;
}

function checkprenom(){
    i=0;
    $(".prenom").each(function() {
    if($(this).val()==""){
       i=1;
    }
    });
    return i;
}

function checkfonction(){
    i=0;
    $(".fonction").each(function() {
    if($(this).val()==""){
       i=1;
    }
    });
    return i;
}

function checktelephonePortable(){
    i=0;
    $(".telephonePortable").each(function() {
    if($(this).val()==""){
       i=1;
    }
    });
    return i;
}

function checktelephoneFixe(){
    i=0;
    $(".telephoneFixe").each(function() {
    if($(this).val()==""){
       i=1;
    }
    });
    return i;
}