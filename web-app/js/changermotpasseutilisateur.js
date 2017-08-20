
function changermotpasseutilisateur1() {
    $("#messageerreur1").empty();
    var messageerreur = [];
    if ($("#newpassword").val() =="") {
        messageerreur.push('Veuillez remplir le champ nouveau mot de passe');}
    else
        {
         if($("#newpassword").val()==$("#password").val())   
             {
                 messageerreur.push('le nouveau mot de passe doit etre different au mot de passe existant');} 
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
    $('#messageerreur1').html(lang);
    $("html, body").animate({scrollTop: 0}, 1000);
    }
    else{
     document.utilisateur.submit();
    }
}


