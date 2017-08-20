
function validerlibelle() {
    $("#messageerreur").empty();
    var messageerreur = [];
    if ($("#libellerecherche").val() =="") {
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
     document.enregistrerrecherche.submit();
    }
}