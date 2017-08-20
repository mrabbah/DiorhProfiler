function authentifier() {
    var t = checkfields();
    if (t.length > 0) {
        var lang = '';
        lang += '<div class="alert alert-info">';
        lang += '<a class="close" data-dismiss="alert">Fermer</a>';
        lang += '<ul>';
        for (var i = 0; i < t.length; i = i + 1) {
            lang += '<li>' + t[i] + '</li>';
        }
        lang += '</ul>';
        lang += '</div>';
        $('#messageerreur').html(lang);
        $("html, body").animate({scrollTop: 0}, 1000);
    }
    else {
        document.authentification.submit();
    }
}
function motdepasseoublie() {
    var t = checkemail();
    if (t.length > 0) {
        var lang = '';
        lang += '<div class="alert alert-info">';
        lang += '<a class="close" data-dismiss="alert">Fermer</a>';
        lang += '<ul>';
        for (var i = 0; i < t.length; i = i + 1) {
            lang += '<li>' + t[i] + '</li>';
        }
        lang += '</ul>';
        lang += '</div>';
        $('#messageerreur').html(lang);
        $("html, body").animate({scrollTop: 0}, 1000);
    }
    else {
        document.motdepasseoublie.submit();
    }
}

function checkfields() {
    $("#messageerreur").empty();
    var messageerreur = [];
    if ($("#email").val() == "") {
        messageerreur.push('Veuillez remplir le champ Email');
    }
    if ($("#password").val() == "") {
        messageerreur.push('Veuillez remplir le champ Mot de passe');
    }
    return messageerreur;
}


function checkemail() {
    $("#messageerreur").empty();
    var messageerreur = [];
    if ($("#emailoublie").val() == "") {
        messageerreur.push('Veuillez remplir le champ Email');
    }
    return messageerreur;
}
