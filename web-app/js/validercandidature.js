
function validercandidature() {
    $("#messageerreur").empty();
    var messageerreur = [];
    if ($("#sourceCandidature").val() =="") {
        messageerreur.push('Veuillez remplir le champ Source de candidature');}
    else if ($("#sourceCandidature").val() =="autre" && $("#autre").val() =="") {
        messageerreur.push("Veuillez remplir le champ Autre");
    }
    
    if(checktypeEvenement()==1){
        messageerreur.push("Veuillez remplir le champ type de l'ev&eacute;nement {Avancement de la candidature}");
    }
    
    if(checkdateEvtCandidature()==1){
        messageerreur.push("Veuillez saisir une Date de l'ev&eacute;nement valide {Avancement de la candidature}");
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
     document.candidature.submit();
    }
}

function checktypeEvenement(){
    i=0;
    $(".typeEvenement").each(function() {
    if($(this).val()=="null"){
       i=1;
    }
    });
    return i;
}

function checkdateEvtCandidature(){
    i=0;
    $(".dateEvtCandidature").each(function() {
    if(!$(this).val().match(/^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/)){
       i=1;
    }
    });
    return i;
}