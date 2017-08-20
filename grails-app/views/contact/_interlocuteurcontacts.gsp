<script type="text/javascript">

    var childCountinterlocuteurcontact = ${contactInstance?.interlocuteurcontacts == null? 0: contactInstance?.interlocuteurcontacts.size()} + 0;
    function addInterlocuteurcontact(){
      var clone = $("#interlocuteurcontact_clone").clone();
      var htmlId = 'interlocuteurcontacts['+childCountinterlocuteurcontact+'].';
      var interlocuteurnom = clone.find("input[id$=nom]");
      var interlocuteurprenom = clone.find("input[id$=prenom]");
      var interlocuteurfonction = clone.find("input[id$=fonction]");
      var interlocuteurtelephonePortable = clone.find("input[id$=telephonePortable]");
      var interlocuteurtelephoneFixe= clone.find("input[id$=telephoneFixe]");
      var interlocuteuremail = clone.find("input[id$=email]");

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
      interlocuteurnom.attr('id',htmlId + 'nom')
              .attr('name',htmlId + 'nom')
              .attr('class', 'form-control-mini nom'); 
      interlocuteurprenom.attr('id',htmlId + 'prenom')
              .attr('name',htmlId + 'prenom')
              .attr('class', 'form-control-mini prenom'); 
      interlocuteurfonction.attr('id',htmlId + 'fonction')
              .attr('name',htmlId + 'fonction')
              .attr('class', 'form-control-mini fonction');
      interlocuteurtelephonePortable.attr('id',htmlId + 'telephonePortable')
              .attr('name',htmlId + 'telephonePortable')
              .attr('class', 'form-control-mini telephonePortable');
      interlocuteurtelephoneFixe.attr('id',htmlId + 'telephoneFixe')
              .attr('name',htmlId + 'telephoneFixe')
              .attr('class', 'form-control-mini telephoneFixe');
      interlocuteuremail.attr('id',htmlId + 'email')
              .attr('name',htmlId + 'email')
              .attr('class', 'form-control-mini email');

      clone.attr('id', 'interlocuteurcontact'+childCountinterlocuteurcontact);
      $("#interlocuteurcontactchildList").append(clone);
      clone.show();
      childCountinterlocuteurcontact++;
      document.getElementById("addinterlocuteurcontact").value = childCountinterlocuteurcontact;
    }

</script>
<div id="interlocuteurcontactchildList">
  <div class="row table-bordered2 odd">
    <div class="col-sm-2 fontrowtabletitle">Nom</div>
    <div class="col-sm-2 fontrowtabletitle">Prénom</div>
    <div class="col-sm-2 fontrowtabletitle">Fonction</div>
    <div class="col-sm-2 fontrowtabletitle">telephone Portable</div>
    <div class="col-sm-2 fontrowtabletitle">telephone Fixe</div>
    <div class="col-sm-2 fontrowtabletitle">Email</div>
  </div>
  <g:each var="interlocuteurcontact" in="${contactInstance.interlocuteurcontacts}" status="i">
    <g:render template='interlocuteurcontact' model="['interlocuteurcontact':interlocuteurcontact,'i':i,'hidden':false]"/>
  </g:each>
</div>
<div class="row text-center">
  <a href='javascript:addInterlocuteurcontact();' class="label label-danger">Ajouter un interlocuteur</a>
</div>
