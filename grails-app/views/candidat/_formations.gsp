<script type="text/javascript">
     var childCountFormation = ${candidatInstance?.formationcandidats == null? 0: candidatInstance?.formationcandidats.size()} + 0;
 function createformation() {
     $('.erreur').html("");
     if($('input[id="intituleDiplome"]').val()=="" || $('select[id="diplome"]').val()=="" || $('select[id="annee"]').val()=="" || $('select[id="ville"]').val()=="" || $('select[id="typeEtablissement"]').val()==""  || $('input[id="etablissement"]').val()=="")
     {
      $('.erreur').html("<div class='alert alert-danger'>Veuillez remplir tous les champs</div>");
     }
     else
     {
      if($('input[id="addupdate"]').val()=="add")
      {
      var clone = $("#formation_clone").clone();
      var htmlId = 'formationcandidats['+childCountFormation+'].';
      var formationInputdiplome = clone.find("input[id$=diplome]");
      var formationInputintituleDiplome = clone.find("input[id$=intituleDiplome]");
      var formationInputannee = clone.find("input[id$=annee]");
      var formationInputoptionFormation = clone.find("input[id$=optionFormation]");
      var formationInputetablissement = clone.find("input[id$=etablissement]");
      var formationInputtypeEtablissement = clone.find("input[id$=typeEtablissement]");
      var formationInputville = clone.find("input[id$=ville]");
      var formationInputdescription = clone.find("input[id$=description]");
      var formationInputintituleDiplomeshow = clone.find("div[id$=intituleDiplomeshow]");
      var formationInputanneeshow = clone.find("div[id$=anneeshow]");
      var formationInputoptionFormationshow = clone.find("div[id$=optionFormationshow]");
      var update = clone.find("a[id$=update]");
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
      formationInputdiplome.attr('id',htmlId + 'diplome')
              .attr('name',htmlId + 'diplome')
              .attr('value',$('select[id="diplome"]').val());
      formationInputintituleDiplome.attr('id',htmlId + 'intituleDiplome')
              .attr('name',htmlId + 'intituleDiplome')
              .attr('value',$('input[id="intituleDiplome"]').val());   
      formationInputannee.attr('id',htmlId + 'annee')
              .attr('name',htmlId + 'annee')
              .attr('value',$('select[id="annee"]').val());
      formationInputoptionFormation.attr('id',htmlId + 'optionFormation')
              .attr('name',htmlId + 'optionFormation')
              .attr('value',$('input[id="optionFormation"]').val());
      formationInputetablissement.attr('id',htmlId + 'etablissement')
              .attr('name',htmlId + 'etablissement')
              .attr('value',$('input[id="etablissement"]').val());
      formationInputtypeEtablissement.attr('id',htmlId + 'typeEtablissement')
              .attr('name',htmlId + 'typeEtablissement')
              .attr('value',$('select[id="typeEtablissement"]').val());
      formationInputville.attr('id',htmlId + 'ville')
              .attr('name',htmlId + 'ville')
              .attr('value',$('select[id="villef"]').val());
      formationInputdescription.attr('id',htmlId + 'description')
               .attr('name',htmlId + 'description')
               .attr('value',$("#description").val());
      formationInputintituleDiplomeshow.attr('id',htmlId + 'intituleDiplomeshow');
      formationInputanneeshow.attr('id',htmlId + 'anneeshow');
      formationInputoptionFormationshow.attr('id',htmlId + 'optionFormationshow');
      if($('select[id="villef"] option:selected').text()=="Sélectionner..."){var villef=""}else{ var villef=$('select[id="villef"] option:selected').text()}
      formationInputintituleDiplomeshow.text($('select[id="diplome"] option:selected').text() +' - '+$('input[id="intituleDiplome"]').val() +' - '+$('input[id="etablissement"]').val() +' - '+$('select[id="typeEtablissement"] option:selected').text() +' - '+villef);
      formationInputanneeshow.text($('select[id="annee"]').val());
      update.attr('id',childCountFormation);
      clone.attr('id', 'formation'+childCountFormation);
      $("#formationchildList").append(clone);
//      $("#intituleDiplomeshow["+childCountFormation+"].intituleDiplomeshow").text($('input[id="intituleDiplome"]').val());
      clone.show();
      //formationInput.focus();
      childCountFormation++;
      document.getElementById("addformationcandidat").value = childCountFormation;
      reset();
      $('.erreur').html("<div class='alert alert-info'>La formation a été ajoutée</div>");
//      $('#formation').modal('hide');
      }
      if($('input[id="addupdate"]').val()=="update"){
          
          var element=$('input[id="element"]').val();
          if($('select[id="villef"] option:selected').text()=="Sélectionner..."){var villef=""}else{ var villef=$('select[id="villef"] option:selected').text()}
          document.getElementById("formationcandidats["+element+"].intituleDiplome").value=$('input[id="intituleDiplome"]').val();
          document.getElementById("formationcandidats["+element+"].annee").value=$('select[id="annee"]').val();
          document.getElementById("formationcandidats["+element+"].optionFormation").value=$('input[id="optionFormation"]').val();
          document.getElementById("formationcandidats["+element+"].etablissement").value=$('input[id="etablissement"]').val();
          document.getElementById("formationcandidats["+element+"].description").value=$("#description").val();
          document.getElementById("formationcandidats["+element+"].ville").value=$('select[id="villef"]').val();
          document.getElementById("formationcandidats["+element+"].typeEtablissement").value=$('select[id="typeEtablissement"]').val();
          document.getElementById("formationcandidats["+element+"].diplome").value=$('select[id="diplome"]').val();
          
          $("div[id='formationcandidats["+element+"].intituleDiplomeshow']").text($('select[id="diplome"] option:selected').text() +' - '+$('input[id="intituleDiplome"]').val() +' - '+$('input[id="etablissement"]').val() +' - '+$('select[id="typeEtablissement"] option:selected').text() +' - '+villef);
          $("div[id='formationcandidats["+element+"].anneeshow']").text($('select[id="annee"]').val());
          reset();
          $('.erreur').html("<div class='alert alert-info'>La formation a été modifié</div>");
      }
     }
  }
</script>
<div id="formationchildList">
      <div class="row table-bordered2 odd">
      <div class="col-sm-3 fontrowtabletitle">Année d’obtention</div>
      <div  class="col-sm-7 fontrowtabletitle"> Diplôme – Intitulé du diplôme - Établissement - Type Établissement – Ville </div>
      <div class="col-sm-1 fontrowtabletitle">Supprimer</div>
      <div class="col-sm-1 fontrowtabletitle">Modifier</div>
      </div>

                  <g:each in="${candidatInstance.formationcandidats}" var="formationcandidat" status="i">
      <g:render template='formationshow' model="['formationcandidat':formationcandidat,'i':i,'hidden':false]"/>
    </g:each>
  
</div>
<div class="row text-center">
  <a data-toggle="modal" href="#formation" onclick="addformation();" class="label label-danger">Ajouter une formation</a>
</div>