
function validerprofil() {
    $("#messageerreur").empty();
    var messageerreur = [];
    if ($("#libelle").val() =="") {
        messageerreur.push('Veuillez remplir le champ Libell&eacute;');}
    
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
     document.profil.submit();
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