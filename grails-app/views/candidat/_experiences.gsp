<script type="text/javascript">
     var childCountExperience = ${candidatInstance?.experiences == null? 0: candidatInstance?.experiences.size()} + 0;
 function createexperience() {
     checkformexperience()
     $('.erreur').html("");
     if(messageerreur.length>0)
     {
      var lang = '';
        lang += '<div class="alert alert-danger">';
        lang += '<ul>';
        for (var i = 0; i < messageerreur.length; i = i + 1) {
            lang += '<li>' + messageerreur[i] + '</li>';
        }
        lang += '</ul>';
        lang += '</div>';
        $('.erreur').html(lang);
     }
     else
     {
      if($('input[id="addupdateexperience"]').val()=="add")
      {
      var clone = $("#experience_clone").clone();
      var htmlId = 'experiences['+childCountExperience+'].';
      var experienceInputposte = clone.find("input[id$=poste]");
      var experienceInputintitulePoste = clone.find("input[id$=intitulePoste]");
      var experienceInputentreprise = clone.find("input[id$=entreprise]");
      var experienceInputville = clone.find("input[id$=ville]");
      var experienceInputdateDebut = clone.find("input[id$=dateDebut]");
      var experienceInputdateFin = clone.find("input[id$=dateFin]");
      var experienceInputtypeEntreprise = clone.find("input[id$=typeEntreprise]");
      var experienceInputsecteurActivite = clone.find("input[id$=secteurActivite]");
      var experienceInputnbrPersonneEncadre = clone.find("input[id$=nbrPersonneEncadre]");
      var experienceInputrattachement = clone.find("input[id$=rattachement]");
      var experienceInputtelephoneContact = clone.find("input[id$=telephoneContact]");
      var experienceInputfonctionContact = clone.find("input[id$=fonctionContact]");
      var experienceInputcontact = clone.find("input[id$=contact]");
      var experienceInputmission = clone.find("input[id$=mission]");
      var experienceInputintitulePosteshow= clone.find("div[id$=intitulePosteshow]");
      var experienceInputentrepriseshow = clone.find("div[id$=entrepriseshow]");
      var experienceInputrattachementshow = clone.find("div[id$=rattachementshow]");
      var update = clone.find("a[id$=updateexperience]");
      clone.find("input[id$=id]")
             .attr('id',htmlId + 'id')
             .attr('name',htmlId + 'id');
      clone.find("input[id$=deleted]")
              .attr('id',htmlId + 'deleted')
              .attr('name',htmlId + 'deleted');
      clone.find("input[id$=new]")
              .attr('id',htmlId + 'new')
              .attr('name',htmlId + 'new')
              .attr('value', 'true');
      experienceInputposte.attr('id',htmlId + 'poste')
              .attr('name',htmlId + 'poste')
              .attr('value',$('select[id="poste"]').val());
      experienceInputintitulePoste.attr('id',htmlId + 'intitulePoste')
              .attr('name',htmlId + 'intitulePoste')
              .attr('value',$('input[id="intitulePoste"]').val());        
      experienceInputentreprise.attr('id',htmlId + 'entreprise')
              .attr('name',htmlId + 'entreprise')
              .attr('value',$('input[id="entreprise"]').val());
      experienceInputville.attr('id',htmlId + 'ville')
              .attr('name',htmlId + 'ville')
              .attr('value',$('select[id="villeexp"]').val());
      experienceInputdateDebut.attr('id',htmlId + 'dateDebut')
              .attr('name',htmlId + 'dateDebut')
              .attr('value',$('input[id="dateDebut"]').val());
      experienceInputdateFin.attr('id',htmlId + 'dateFin')
              .attr('name',htmlId + 'dateFin')
              .attr('value',$('input[id="dateFin"]').val());
      experienceInputtypeEntreprise.attr('id',htmlId + 'typeEntreprise')
              .attr('name',htmlId + 'typeEntreprise')
              .attr('value',$('select[id="typeEntreprise"]').val());
      experienceInputsecteurActivite.attr('id',htmlId + 'secteurActivite')
              .attr('name',htmlId + 'secteurActivite')
              .attr('value',$('select[id="secteurActivite"]').val());
      experienceInputnbrPersonneEncadre.attr('id',htmlId + 'nbrPersonneEncadre')
              .attr('name',htmlId + 'nbrPersonneEncadre')
              .attr('value',$('select[id="nbrPersonneEncadre"]').val());
      experienceInputrattachement.attr('id',htmlId + 'rattachement')
              .attr('name',htmlId + 'rattachement')
              .attr('value',$('input[id="rattachement"]').val());
      experienceInputcontact.attr('id',htmlId + 'contact')
              .attr('name',htmlId + 'contact')
              .attr('value',$('input[id="contact"]').val());
      experienceInputtelephoneContact.attr('id',htmlId + 'telephoneContact')
              .attr('name',htmlId + 'telephoneContact')
              .attr('value',$('input[id="telephoneContact"]').val());
      experienceInputfonctionContact.attr('id',htmlId + 'fonctionContact')
              .attr('name',htmlId + 'fonctionContact')
              .attr('value',$('input[id="fonctionContact"]').val());
      experienceInputmission.attr('id',htmlId + 'mission')
               .attr('name',htmlId + 'mission')
               .attr('value',$("#mission").val());
        experienceInputintitulePosteshow.attr('id',htmlId + 'intitulePosteshow');
        experienceInputentrepriseshow.attr('id',htmlId + 'entrepriseshow');
        experienceInputrattachementshow.attr('id',htmlId + 'rattachementshow');
        experienceInputintitulePosteshow.text($('input[id="dateDebut"]').val()+' - '+$('input[id="dateFin"]').val());
        experienceInputentrepriseshow.text($('select[id="poste"] option:selected').text()+' - '+$('input[id="intitulePoste"]').val()+' - '+$('input[id="entreprise"]').val()+' - '+$("#mission").val());
        update.attr('id',childCountExperience);
      clone.attr('id', 'experience'+childCountExperience);
      $("#experiencechildList").append(clone);
      clone.show();
      childCountExperience++;
      document.getElementById("addexperience").value = childCountExperience;
      resetexperience();
      $('.erreur').html("<div class='alert alert-info'>L'Expérience a été ajoutée</div>");
      }
      if($('input[id="addupdateexperience"]').val()=="update"){       
          var element=$('input[id="elementexperience"]').val();
          document.getElementById("experiences["+element+"].intitulePoste").value=$('input[id="intitulePoste"]').val();
          document.getElementById("experiences["+element+"].entreprise").value=$('input[id="entreprise"]').val();
          document.getElementById("experiences["+element+"].dateDebut").value=$('input[id="dateDebut"]').val();
          document.getElementById("experiences["+element+"].dateFin").value=$('input[id="dateFin"]').val();
          document.getElementById("experiences["+element+"].nbrPersonneEncadre").value=$('select[id="nbrPersonneEncadre"]').val();
          document.getElementById("experiences["+element+"].rattachement").value=$('input[id="rattachement"]').val();
          document.getElementById("experiences["+element+"].ville").value=$('select[id="villeexp"]').val();
          document.getElementById("experiences["+element+"].typeEntreprise").value=$('select[id="typeEntreprise"]').val();
          document.getElementById("experiences["+element+"].secteurActivite").value=$('select[id="secteurActivite"]').val();
          document.getElementById("experiences["+element+"].poste").value=$('select[id="poste"]').val();
          document.getElementById("experiences["+element+"].contact").value=$('input[id="contact"]').val();
          document.getElementById("experiences["+element+"].telephoneContact").value=$('input[id="telephoneContact"]').val();
          document.getElementById("experiences["+element+"].fonctionContact").value=$('input[id="fonctionContact"]').val();
          document.getElementById("experiences["+element+"].mission").value=$("textarea#mission").val();
          
          $("div[id='experiences["+element+"].intitulePosteshow']").text($('input[id="dateDebut"]').val()+' - '+$('input[id="dateFin"]').val());
          $("div[id='experiences["+element+"].entrepriseshow']").text($('select[id="poste"] option:selected').text()+' - '+$('input[id="intitulePoste"]').val()+' - '+$('input[id="entreprise"]').val()+' - '+$("#mission").val());
          reset();
          $('.erreur').html("<div class='alert alert-info'>L'Expérience a été modifié</div>");
      }
      }
  }
</script>
<div id="experiencechildList">
  <div class="row table-bordered2 odd">
      <div class="col-sm-4 fontrowtabletitle">Date d’entrée – Date de sortie</div>
      <div class="col-sm-6 fontrowtabletitle">Poste – Intitulé du poste - Entreprise - Mission</div>
      <div class="col-sm-1 fontrowtabletitle">Supprimer</div>
      <div class="col-sm-1 fontrowtabletitle">Modifier</div>
  </div>
  <g:each var="experience" in="${candidatInstance.experiences}" status="i">
    <g:render template='experienceshow' model="['experience':experience,'i':i,'hidden':false]"/>
  </g:each>
</div>
<div class="row text-center">
  <a data-toggle="modal" href="#modalexperience" onclick="addexperience();" class="label label-danger">Ajouter une expérience</a>
</div>