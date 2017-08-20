var messageerreur = [];
function updateexperience(id1, id2) {
    $(".erreur").empty();
    var i;
    if (id2 == '_clone') {
        i = id1
    } else {
        i = id2
    }
    $("#titremodal").html("<span class='label label-danger'>Modifier l'Exp&eacute;rience</span>");
    resetexperience();
    $('input[id="addupdateexperience"]').val("update");
    $('input[id="elementexperience"]').val(i);
    $("#poste").val(document.getElementById("experiences[" + i + "].poste").value);
    $('input[id="intitulePoste"]').val(document.getElementById("experiences[" + i + "].intitulePoste").value);
    $('input[name="entreprise"]').val(document.getElementById("experiences[" + i + "].entreprise").value);
    $("#villeexp").val(document.getElementById("experiences[" + i + "].ville").value);
    $('input[id="dateDebut"]').val(document.getElementById("experiences[" + i + "].dateDebut").value);
    $('input[id="dateFin"]').val(document.getElementById("experiences[" + i + "].dateFin").value);
    $("#typeEntreprise").val(document.getElementById("experiences[" + i + "].typeEntreprise").value);
    $("#secteurActivite").val(document.getElementById("experiences[" + i + "].secteurActivite").value);
    $('select[id="nbrPersonneEncadre"]').val(document.getElementById("experiences[" + i + "].nbrPersonneEncadre").value);
    $('input[id="rattachement"]').val(document.getElementById("experiences[" + i + "].rattachement").value);
    $('input[id="contact"]').val(document.getElementById("experiences[" + i + "].contact").value);
    $('input[id="telephoneContact"]').val(document.getElementById("experiences[" + i + "].telephoneContact").value);
    $('input[id="fonctionContact"]').val(document.getElementById("experiences[" + i + "].fonctionContact").value);
    $("textarea#mission").val(document.getElementById("experiences[" + i + "].mission").value);

}

function addexperience() {
    $(".erreur").empty();
    $('input[id="addupdateexperience"]').val("add");
    $("#titremodal").html("<span class='label label-danger'>Ajouter une exp&eacute;rience</span>");
    resetexperience();
}
function resetexperience() {
    $('select[name="poste"]').val('');
    $('input[name="intitulePoste"]').val('');
    $('input[name="entreprise"]').val('');
    $('select[name="villeexp"]').val('');
    $('input[name="dateDebut"]').val('');
    $('input[name="dateFin"]').val('');
    $('select[name="typeEntreprise"]').val('');
    $('select[name="secteurActivite"]').val('');
    $('input[name="nbrPersonneEncadre"]').val('');
    $('input[name="rattachement"]').val('');
    $('input[name="contact"]').val('');
    $('input[name="telephoneContact"]').val('');
    $('input[name="fonctionContact"]').val('');
    $('textarea[name="mission"]').val('');
}

function checkformexperience() {
    $(".erreur").empty();
    messageerreur.length = 0
    if($(".required").length>0)
    {
    if ($('select[id="typeEntreprise"]').val() == "" || $('select[id="poste"]').val() == "" || $('input[id="intitulePoste"]').val() == "" || $('input[id="entreprise"]').val() == "" || $('select[id="villeexp"]').val() == "")
    {
        messageerreur.push("Veuillez remplir tous les champs obligatoire par apres");
    }
    if ($('input[id="telephoneContact"]').val() != "" && !$('input[id="telephoneContact"]').val().match(/^([0-9\(\)\/\+ \-]*)$/i)) {
        messageerreur.push("Veuillez entrer un Num&eacute;ro de t&eacute;l&eacute;phone de contact valide");
    }
    if ($('input[id="dateDebut"]').val() != "" && !$('input[id="dateDebut"]').val().match(/^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/)) {
        messageerreur.push("Veuillez entrer une date de d&eacute;but valide");
    }
    if ($('input[id="dateFin"]').val() != "" && !$('input[id="dateFin"]').val().match(/^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/)) {
        messageerreur.push("Veuillez entrer une date de fin valide");
    }
    }
    else {
//     if ($('select[id="typeEntreprise"]').val() == "" || $('select[id="poste"]').val() == "" || $('input[id="intitulePoste"]').val() == "" || $('input[id="entreprise"]').val() == "" || $('input[id="dateDebut"]').val() == "" || $('input[id="dateFin"]').val() == "" || $('select[id="villeexp"]').val() == "" || $("#mission").val() == "")
//    {
//        messageerreur.push("Veuillez remplir tous les champs obligatoire");
//    }
     if ($('select[id="typeEntreprise"]').val() == "" || $('select[id="poste"]').val() == "" || $('input[id="intitulePoste"]').val() == "" || $('input[id="entreprise"]').val() == ""  || $('select[id="villeexp"]').val() == "" )
    {
        messageerreur.push("Veuillez remplir tous les champs obligatoire");
    }
    if ($('input[id="telephoneContact"]').val() != "" && !$('input[id="telephoneContact"]').val().match(/^([0-9\(\)\/\+ \-]*)$/i)) {
        messageerreur.push("Veuillez entrer un Num&eacute;ro de t&eacute;l&eacute;phone de contact valide");
    }
    if ($('input[id="dateDebut"]').val() != "" && !$('input[id="dateDebut"]').val().match(/^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/)) {
            messageerreur.push("Veuillez entrer une date de d&eacute;but valide");
    }
    if ($('input[id="dateFin"]').val() != "" && !$('input[id="dateFin"]').val().match(/^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/)) {
        messageerreur.push("Veuillez entrer une date de fin valide");
    }   
    }
}