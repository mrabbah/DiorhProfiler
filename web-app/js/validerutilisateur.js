
function validerutilisateur() {
    $("#messageerreur").empty();
    var messageerreur = [];
    if ($("#firstName").val() =="") {
        messageerreur.push('Veuillez remplir le champ Pr&eacute;nom');}
    if ($("#lastName").val() =="") {
        messageerreur.push('Veuillez remplir le champ Nom'); }
    if ($("#profil").val() =="null") {
        messageerreur.push('Veuillez remplir le champ Profil'); }
    if ($("#fonctionDior").val() =="null") {
        messageerreur.push('Veuillez remplir le champ Fonction'); }
    var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
    if ($("#email").val() == "") {
        messageerreur.push('Veuillez remplir le champ Adresse mail');
    }
    else if (!pattern.test($("#email").val())) {
        messageerreur.push("Veuillez entrer un Email valide");
    }
    else if (checkemail($("#email").val())) {
        messageerreur.push('L adresse &eacute;lectronique que vous avez saisie est associ&eacute;e à une autre personne');
    }
    
    if ($("#adresseIp").val() == "") {
        messageerreur.push('Veuillez sélectionner au moins une adresse Ip ou *');
    }
    else if (checkadresseIp($("#adresseIp").val()) == 1 && $("#adresseIp").val() != "*") {
        messageerreur.push('Veuillez entrer des adresses Ip valides');
    }
    
    if(messageerreur.length>0){
    var lang = '';
    lang+='<div class="alert alert-danger">';
    lang += '<a class="close" data-dismiss="alert">Fermer</a>';
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
     document.utilisateur.submit();
    }
}

function checkemail(email) {
    var got = false;
    var url = "/DiorhProfiler/Candidat/checkemail";
    var data = {email: email};
    $.ajax({
        type: 'POST',
        url: url,
        data: data,
        success: function(result) {
            if (result === "true") {
                got = true;
            }
        },
        dataType: "text",
        async: false
    });
    return got;
}

function modifierutilisateur() {
    $("#messageerreur").empty();
    var messageerreur = [];
    if ($("#firstName").val() =="") {
        messageerreur.push('Veuillez remplir le champ Pr&eacute;nom');}
    if ($("#lastName").val() =="") {
        messageerreur.push('Veuillez remplir le champ Nom'); }
    if ($("#profil").val() =="null") {
        messageerreur.push('Veuillez remplir le champ Profil'); }
    if ($("#fonctionDior").val() =="null") {
        messageerreur.push('Veuillez remplir le champ Fonction'); }
    var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
    if ($("#email").val() == "") {
        messageerreur.push('Veuillez remplir le champ Adresse mail');
    }
    else if (!pattern.test($("#email").val())) {
        messageerreur.push("Veuillez entrer un Email valide");
    }
    
    if ($("#adresseIp").val() == "") {
        messageerreur.push('Veuillez sélectionner au moins une adresse Ip ou *');
    }
    else if (checkadresseIp($("#adresseIp").val()) == 1 && $("#adresseIp").val() != "*") {
        messageerreur.push('Veuillez entrer des adresses Ip valides');
    }
    
    if(messageerreur.length>0){
    var lang = '';
    lang+='<div class="alert alert-danger">';
    lang += '<a class="close" data-dismiss="alert">Fermer</a>';
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
     document.utilisateur.submit();
    }
}

function checkadresseIp(adressesIp) {
    j = 0;
    var listeadressesIp = adressesIp.split(',');
    for (var value in listeadressesIp) {
        if (!listeadressesIp[value].match(/^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/)) {
            j = 1;
        }
    }
    return j;
}