
function validerrendezvous() {
    $("#messageerreur").empty();
    var messageerreur = [];
    if ($("#dateRdv").val() =="") { 
        messageerreur.push('Veuillez remplir le champ Date de rendez-vous JJ/MM/AAAA ');}
    else if(!$("#dateRdv").val().match(/^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/)){
        messageerreur.push('Veuillez entrer une Date de rendez-vous valide JJ/MM/AAAA ');}
    if ($("#emplacement").val() =="") {
        messageerreur.push('Veuillez remplir le champ Emplacement'); }
    if ($("#commentaire").val() =="") {
        messageerreur.push('Veuillez remplir le champ Commentaire');} 
    
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