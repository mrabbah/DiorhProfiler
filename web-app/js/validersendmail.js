
function validersendmail(controller) {
    $("#messageerreur").empty();
    CKEDITOR.instances.myeditor.updateElement();
    var message = document.getElementById('myeditor').value;
    var messageerreur = [];
    if ($("#emails").val() == "") {
        messageerreur.push('Veuillez sélectionner au moins une adresse &eacute;lectronique');
    }
    else if (checkemails($("#emails").val()) == 1) {
        messageerreur.push('Veuillez entrer des adresses &eacute;lectroniques valides');
    }
    else {
        ;
    }
    if ($("#sujet").val() == "") {
        messageerreur.push('Veuillez remplir le champ Sujet');
    }
    if (message == "") {
        messageerreur.push('Veuillez remplir le champ Message');
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
        var controller=controller;
        $.post("/DiorhProfiler/"+controller+"/sendmail",
                {
                    emails: $("#emails").val(),
                    send: "true",
                    sujet: $("#sujet").val(),
                    message: message
                },
        function(data) {
            var lang = '';
            lang += '<div class="alert alert-info">';
            lang += '<ul>';
            lang += '<li>Votre mail a &eacute;t&eacute; envoy&eacute;</li>';
            lang += '</ul>';
            lang += '</div>';
            $('#messageerreur').html(lang);
            CKEDITOR.instances.myeditor.setData('');
            document.getElementById('sujet').value="";
            $("html, body").animate({scrollTop: 0}, 1000);
            $("#emails").tagsinput('removeAll');
        }
        );

    }
}

function checkemails(emails) {
    var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
    j = 0;
    var listofemails = emails.split(',');
    for (var value in listofemails) {
        if (!pattern.test(listofemails[value])) {
            j = 1;
        }
    }
    return j;
}