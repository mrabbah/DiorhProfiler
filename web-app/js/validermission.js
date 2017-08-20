
function validermission() {
    $("#messageerreur").empty();
    var messageerreur = [];
    if ($("#dateDemarrage").val() != "" && !$("#dateDemarrage").val().match(/^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/)) {
        messageerreur.push('Veuillez entrer une Date de d&eacute;marrage valide JJ/MM/AAAA {Informations mission}');
    }
    if ($("#datePublication").val() != "" && !$("#datePublication").val().match(/^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/)) {
        messageerreur.push('Veuillez entrer une Date de publication valide JJ/MM/AAAA {Informations mission}');
    }
    if ($("#dateFinGarantie").val() != "" && !$("#dateFinGarantie").val().match(/^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/)) {
        messageerreur.push('Veuillez entrer une Date de d&eacute;marrage valide JJ/MM/AAAA {Informations mission}');
    }
    if ($("#budget").val() != "" && !$("#budget").val().match(/^([0-9 ]*)$/i)) {
        messageerreur.push('Veuillez entrer un budget valide {Description du poste}');
    }
    if ($("#poste").val() == "") {
        messageerreur.push('Veuillez remplir le champ poste {description de la mission}');
    }
    if ($("#approche").val() == "") {
        messageerreur.push('Veuillez remplir le champ approche {description de la mission}');
    }
//    if ($("#description").val() == "") {
//        messageerreur.push('Veuillez remplir le champ description {description de la mission}');
//    }
    if ($("#delaisRealisation").val() != "" && !$("#delaisRealisation").val().match(/^([0-9 ]*)$/i)) {
        messageerreur.push('Veuillez entrer un D&eacute;lais R&eacute;alisation valide {Suivi poste}');
    }
    if ($("#dateFinAnnonce").val() == "") {
        messageerreur.push('Veuillez remplir le champ Date fin annonce JJ/MM/AAAA {Suivi poste}');
    }
    else if (!$("#dateFinAnnonce").val().match(/^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/)) {
        messageerreur.push('Veuillez entrer une Date fin annonce valide JJ/MM/AAAA {Suivi poste}');
    }
    if(checkdatedebut()==1){
        messageerreur.push('Veuillez entrer une Date de d&eacute;but valide JJ/MM/AAAA {Planifications} ');
    }
    if(checkdatefin()==1){
        messageerreur.push('Veuillez entrer une Date de fin valide JJ/MM/AAAA {Planifications} ');
    }
    if (messageerreur.length > 0) {
        var lang = '';
        lang += '<div class="alert alert-danger">';
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
        document.mission.submit();
    }
}

$(document).ready(function() {
    $("#contact").change(function() {
        $('#interlocuteur').find('option').remove().end().append('<option value="">Sélectionner...</option>').val('');
        var idcontact = this.value;
        var url = "/DiorhProfiler/Mission/getinterlocuteurbycontact";
        var data = {idcontact: idcontact};
        $.ajax({
            type: 'POST',
            url: url,
            data: data,
            success: function(result) {
                $.each(result, function(key, value) {
                    $('#interlocuteur').append($('<option>', {
                        value: value.id,
                        text: value.nom +" "+value.prenom
                    }));
                });
               
            },
            dataType: "json"
        });
    });
});

function checkdatedebut(){
    i=0;
    $(".dateDebut").each(function() {
    if ($(this).val()=="") {
       i=1;
    }
    });
    return i;
}

function checkdatefin(){
    i=0;
    $(".dateFin").each(function() {
    if ($(this).val()=="") {
    i=1;
    }
    });
    return i;
}