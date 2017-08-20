<script type="text/javascript">
    var childCountLangue = ${candidatureInstance?.evenementCandidatures == null? 0: candidatureInstance?.evenementCandidatures.size()} + 0;
    function addEvenementCandidature(){
      var clone = $("#evenementCandidature_clone").clone();
      var htmlId = 'evenementCandidatures['+childCountLangue+'].';
      var dateEvtCandidatureInput = clone.find("input[id$=dateEvtCandidature]");
      var TypeEvenementCandidatureInput = clone.find("select[id$=typeEvenement]");

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
      dateEvtCandidatureInput.attr('id',htmlId + 'dateEvtCandidature')
              .attr('name',htmlId + 'dateEvtCandidature')
              .attr('class', 'form-control datecss dateEvtCandidature'); 
      TypeEvenementCandidatureInput.attr('id',htmlId + 'typeEvenement')
              .attr('name',htmlId + 'typeEvenement')
              .attr('class', 'form-control typeEvenement'); 

      clone.attr('id', 'evenementCandidature'+childCountLangue);
      $("#evenementCandidaturechildList").append(clone);
      clone.show();
      childCountLangue++;
      document.getElementById("addEvenementCandidature").value = childCountLangue;
    }
    </script>
<div id="evenementCandidaturechildList">
<g:each var="evenementCandidature" in="${candidatureInstance.evenementCandidatures}" status="i">
    <g:render template='avancement' model="['evenementCandidature':evenementCandidature,'i':i,'hidden':false]"/>
</g:each>
    </div>
      <div class="row text-center">
        <a href='javascript:addEvenementCandidature();' class="label label-danger">Ajouter un évenement de candidature</a>
      </div>
    

