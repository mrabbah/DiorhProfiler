function validercandidat() {
    var typeutili=$("input[name='myField']").val();
    var t = chechfields();
    if (t.length > 0) {
        var lang = '';
        lang += '<div class="alert alert-danger">';
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
        println("ggggggg");
        document.candidat.submit();
    }
}

function chechfields() {
    $("#messageerreur").empty();
    var messageerreur = [];
    if ($("#nomStockage").val() == "") {
        messageerreur.push('Veuillez remplir le champ Nom {Informations personnelles}');
    }
    if ($("#prenomStockage").val() == "") {
        messageerreur.push('Veuillez remplir le champ Pr&eacute;nom {Informations personnelles}');
    }
    if ($("#civilite").val() == "") {
        messageerreur.push('Veuillez remplir le champ Civilit&eacute; {Informations personnelles}');
    }
    if($(".required").length>0){
    if ($("#situationFamiliale").val() == "") {
        messageerreur.push('Veuillez remplir le champ Situation familiale {Informations personnelles}');
    }
    }
//    if($(".required").length>0){
//    if ($("#lieuNaissance").val() == "") {
//        messageerreur.push('Veuillez remplir le champ lieu de naissance {Informations personnelles}');
//    }
//    }
    if ($("#telPortable").val() == "") {
        messageerreur.push('Veuillez remplir le champ T&eacute;l&eacute;phone {Informations personnelles}');
    }
    else if (!$("#telPortable").val().match(/^([0-9\(\)\/\+ \-]*)$/i)) {
        messageerreur.push('Veuillez entrer un Num&eacute;ro de t&eacute;l&eacute;phone valide {Informations personnelles}');
    }
    if (!$("#telFix").val().match(/^([0-9\(\)\/\+ \-]*)$/i)) {
        messageerreur.push('Veuillez entrer un Num&eacute;ro de t&eacute;l&eacute;phone fixe valide {Informations personnelles}');
    }
//    if(typeutili=='candidat')
//        {
//            if ($("#dateNaissance").val() == "") {
//        messageerreur.push('Veuillez remplir le champ Date de naissance {Informations personnelles}');
//    }
if($(".required").length>0)
{
    if ($("#dateNaissance1").val() !== "" && $("#dateNaissance1").val() !== "null" && $("#dateNaissance1").val() !== null) {
    if (!$("#dateNaissance1").val().match(/^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/)) {
        messageerreur.push('Veuillez entrer un Date de naissance valide {Informations personnelles}');
    }
    }
    else
        {
            messageerreur.push('Veuillez remplir la Date de naissance  {Informations personnelles}');
        }
        
}
    if ($("#nationalite").val() === "") {
        messageerreur.push('Veuillez remplir le champ Nationalite}');
    }
        
//}
//    if ($("#adresse").val() == "") {
//        messageerreur.push('Veuillez remplir le champ Adresse {Informations personnelles}');
//    }
    if ($("#villecandidat").val() == "") {
        messageerreur.push('Veuillez remplir le champ ville {Informations personnelles}');
    }
    var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
    if ($("#email").val() == "") {
        messageerreur.push('Veuillez remplir le champ Adresse mail {Informations personnelles}');
    }
    else if (!pattern.test($("#email").val())) {
        messageerreur.push("Veuillez entrer un Email valide {Informations personnelles}")
    }
    else if ($("#email").val() != $("#confirmationemail").val()) {
        messageerreur.push('Les adresses mail ne sont pas identique{Informations personnelles}');
    }
    else if (checkemail($("#email").val())) {
        
        messageerreur.push('L adresse &eacute;lectronique que vous avez saisie est associ&eacute;e à un autre candidat');
    }
    if ($("#niveauEtude").val() == "") {
//        messageerreur.push('Veuillez remplir le champ Niveau d&#39;&eacute;tudes {Informations personnelles}');
         messageerreur.push('Veuillez remplir le champ Niveau d&#39;&eacute;tudes {Formations et comp&eacute;tences}');
    }
    if ($("#plageExperience").val() == "") {
        messageerreur.push('Veuillez remplir le champ Nombre d&#39;ann&eacute;es d exp&eacute;rience {Expériences professionnelles}');
    }
    if($(".required").length>0){
    if ($("#mobiliteGeographique").val() == "") {
        messageerreur.push('Veuillez remplir le champ Mobilit&eacute; g&eacute;ographique{Exp&eacute;riences professionnelles}');
    }
    }
    if($(".required").length>0)
    {
    if ($("#remunMontantNet").val() == "") {
        messageerreur.push('Veuillez remplir le champ Salaire mensuel net (actuel) {Exp&eacute;riences professionnelles}');
    }
    else if (!$("#remunMontantNet").val().match(/^\d*[0-9](|.\d*[0-9]|,\d*[0-9])?$/) || $("#remunMontantNet").val()==0) {
        messageerreur.push("Veuillez entrer un Salaire mensuel net valide {Exp&eacute;riences professionnelles}");
    }
    }
    else if ($("#remunMontantNet").val() !="" && (!$("#remunMontantNet").val().match(/^\d*[0-9](|.\d*[0-9]|,\d*[0-9])?$/) || $("#remunMontantNet").val()==0)) {
        messageerreur.push("Veuillez entrer un Salaire mensuel net valide {Exp&eacute;riences professionnelles}");
    }
    if($(".required").length>0){
    if ($("#remunPretention").val() == "") {
        messageerreur.push('Veuillez remplir le champ Pr&eacute;tentions salariales {Exp&eacute;riences professionnelles}');
    }
    else if (!$("#remunPretention").val().match(/^\d*[0-9](|.\d*[0-9]|,\d*[0-9])?$/) || $("#remunPretention").val()==0) {
        messageerreur.push("Veuillez entrer une Pr&eacute;tentions salariales valide {Exp&eacute;riences professionnelles}");
    }
    }
    else if ($("#remunPretention").val() != "" && (!$("#remunPretention").val().match(/^\d*[0-9](|.\d*[0-9]|,\d*[0-9])?$/) || $("#remunPretention").val()==0)) {
        messageerreur.push("Veuillez entrer une Pr&eacute;tentions salariales valide {Exp&eacute;riences professionnelles}");
    }
    if ($("#cvfile").val() == "") {
//        messageerreur.push('Veuillez remplir le champ CV {Exp&eacute;riences professionnelles}');
        messageerreur.push(' Veuillez joindre votre CV');
    }
    else if ($("#cvfile").val().substr(($("#cvfile").val().lastIndexOf('.') + 1))!= "pdf" && $("#cvfile").val().substr(($("#cvfile").val().lastIndexOf('.') + 1))!= "docx" && $("#cvfile").val().substr(($("#cvfile").val().lastIndexOf('.') + 1))!= "doc" && $("#cvfile").val().substr(($("#cvfile").val().lastIndexOf('.') + 1))!= "rtf") {
        messageerreur.push('Attacher vos fichiers sous format WORD ou PDF {Exp&eacute;riences professionnelles}');
    }
    return messageerreur;
}


function validercandidat1() {
    $("#messageerreur").empty();
    var messageerreur = [];
    if ($("#nomStockage").val() == "") {
        messageerreur.push('Veuillez remplir le champ Nom {Informations personnelles}');
    }
    if ($("#prenomStockage").val() == "") {
        messageerreur.push('Veuillez remplir le champ Pr&eacute;nom {Informations personnelles}');
    }
    if ($("#civilite").val() == "") {
        messageerreur.push('Veuillez remplir le champ Civilit&eacute; {Informations personnelles}');
    }
    if($(".required").length>0){
    if ($("#situationFamiliale").val() == "") {
        messageerreur.push('Veuillez remplir le champ Situation familiale {Informations personnelles}');
    }
    }
//    if($(".required").length>0){
//    if ($("#lieuNaissance").val() == "") {
//        messageerreur.push('Veuillez remplir le champ lieu de naissance {Informations personnelles}');
//    }
//    }
    if ($("#telPortable").val() == "") {
        messageerreur.push('Veuillez remplir le champ T&eacute;l&eacute;phone {Informations personnelles}');
    }
    else if (!$("#telPortable").val().match(/^([0-9\(\)\/\+ \-]*)$/i)) {
        messageerreur.push('Veuillez entrer un Num&eacute;ro de t&eacute;l&eacute;phone valide {Informations personnelles}');
    }
    if (!$("#telFix").val().match(/^([0-9\(\)\/\+ \-]*)$/i)) {
        messageerreur.push('Veuillez entrer un Num&eacute;ro de t&eacute;l&eacute;phone fixe valide {Informations personnelles}');
    }
    if ($("#dateNaissance").val() == "") {
        messageerreur.push('Veuillez remplir le champ Date de naissance {Informations personnelles}');
    }
    else if (!$("#dateNaissance").val().match(/^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/)) {
        messageerreur.push('Veuillez entrer un Date de naissance valide {Informations personnelles}');
    }
    if ($("#adresse").val() == "") {
        messageerreur.push('Veuillez remplir le champ Adresse {Informations personnelles}');
    }
    if ($("#villecandidat").val() == "") {
        messageerreur.push('Veuillez remplir le champ ville {Informations personnelles}');
    }
    var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
    if ($("#email").val() == "") {
        messageerreur.push('Veuillez remplir le champ Adresse mail {Informations personnelles}');
    }
    else if (!pattern.test($("#email").val())) {
        messageerreur.push("Veuillez entrer un Email valide {Informations personnelles}")
    }
    else if ($("#email").val() != $("#confirmationemail").val()) {
        
        messageerreur.push('Les adresses mail ne sont pas identique{Informations personnelles}');
    }
    if ($("#niveauEtude").val() == "") {
        messageerreur.push('Veuillez remplir le champ Niveau d&#39;&eacute;tudes {Informations personnelles}');
    }
    if ($("#plageExperience").val() == "") {
        messageerreur.push('Veuillez remplir le champ Nombre d&#39;ann&eacute;es d exp&eacute;rience {Expériences professionnelles}');
    }
    if($(".required").length>0){
    if ($("#mobiliteGeographique").val() == "") {
        messageerreur.push('Veuillez remplir le champ Mobilit&eacute; g&eacute;ographique{Exp&eacute;riences professionnelles}');
    }
    }
    if($(".required").length>0){
    if ($("#remunMontantNet").val() == "") {
        messageerreur.push('Veuillez remplir le champ Salaire mensuel net (actuel) {Exp&eacute;riences professionnelles}');
    }
    else if (!$("#remunMontantNet").val().match(/^\d*[0-9](|.\d*[0-9]|,\d*[0-9])?$/) || $("#remunMontantNet").val()==0) {
        messageerreur.push("Veuillez entrer un Salaire mensuel net valide {Exp&eacute;riences professionnelles}");
    }
    }
    else if ($("#remunMontantNet").val() !="" && (!$("#remunMontantNet").val().match(/^\d*[0-9](|.\d*[0-9]|,\d*[0-9])?$/) || $("#remunMontantNet").val()==0)) {
        messageerreur.push("Veuillez entrer un Salaire mensuel net valide {Exp&eacute;riences professionnelles}");
    }
    if($(".required").length>0){
    if ($("#remunPretention").val() == "") {
        messageerreur.push('Veuillez remplir le champ Pr&eacute;tentions salariales {Exp&eacute;riences professionnelles}');
    }
    else if (!$("#remunPretention").val().match(/^\d*[0-9](|.\d*[0-9]|,\d*[0-9])?$/) || $("#remunPretention").val()==0) {
        messageerreur.push("Veuillez entrer une Pr&eacute;tentions salariales valide {Exp&eacute;riences professionnelles}");
    }
    }
    else if ($("#remunPretention").val() != "" && (!$("#remunPretention").val().match(/^\d*[0-9](|.\d*[0-9]|,\d*[0-9])?$/) || $("#remunPretention").val()==0)) {
        messageerreur.push("Veuillez entrer une Pr&eacute;tentions salariales valide {Exp&eacute;riences professionnelles}");
    }
    if(($("#cvfile").length)){
    if ($("#cvfile").val() == "") {
        messageerreur.push('Veuillez remplir le champ CV {Exp&eacute;riences professionnelles}');
    }
    else if ($("#cvfile").val().substr(($("#cvfile").val().lastIndexOf('.') + 1))!= "pdf" && $("#cvfile").val().substr(($("#cvfile").val().lastIndexOf('.') + 1))!= "docx" && $("#cvfile").val().substr(($("#cvfile").val().lastIndexOf('.') + 1))!= "doc" && $("#cvfile").val().substr(($("#cvfile").val().lastIndexOf('.') + 1))!= "rtf") {
        messageerreur.push('Attacher vos fichiers sous format WORD ou PDF {Exp&eacute;riences professionnelles}');
    }
    }
    if (messageerreur.length > 0) {
        var lang = '';
        lang += '<div class="alert alert-danger">';
        lang += '<a class="close" data-dismiss="alert">Fermer</a>';
        lang += '<ul>';
        for (var i = 0; i < messageerreur.length; i = i + 1) {
            lang += '<li>' + messageerreur[i] + '</li>';
        }
        lang += '</ul>';
        lang += '</div>';
        $('#messageerreur').html(lang);
        $("html, body").animate({scrollTop: 0}, 1000);
    }
    else {
        document.candidat1.submit();
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


