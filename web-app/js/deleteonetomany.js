$(document).on( "click", ".del-interlocuteurcontact", function() {
        //find the parent div
        var prnt = $(this).parents(".interlocuteurcontact-div");
        //find the deleted hidden input
        var delInput = prnt.find("input[id$=deleted]");
        //check if this is still not persisted
        var newValue = prnt.find("input[id$=new]").attr('value');
        //if it is new then i can safely remove from dom
        if (newValue == 'true') {
            prnt.remove();
        } else {
            //set the deletedFlag to true
            delInput.attr('value', 'true');
            //hide the div
            prnt.remove();
        }
    });
$(document).on( "click", ".del-planification", function() {
        //find the parent div
        var prnt = $(this).parents(".planification-div");
            prnt.remove();
    });
    
$(document).on( "click", ".del-evenementCandidature", function() {
        //find the parent div
        var prnt = $(this).parents(".evenementCandidature-div");
            prnt.remove();
    });
    
    
    
       $("#statut").change(function()
{   
    var profil=$('select[name="statut.id"]').val();
  var id = $('#h_v').val();
    var url = "/DiorhProfiler/Candidature/statutcandidature";
            var data = {profil: profil,id:id};
            $.ajax({
                type: 'POST',
                url: url,
                data: data,
                success: function(result) {
                    if(result==='Non retenue')
                        {
                           if (confirm('Voulez-vous envoyer un mail de regret ?')) 
                    {
                        
         var url1 = "/DiorhProfiler/Candidature/envoimail";
    var data1={id: id};
         $.ajax({
        type: 'POST',
        url: url1,
        data: data1,
        success: function(result) {
      //location.reload();
        },
        dataType: "text",
        async: false
    });    
    }   
                        
                    
                            
                        }
                        
                                          },
                                                  
                                                  
                dataType: "text",
        async: false
            });   
});
    
    