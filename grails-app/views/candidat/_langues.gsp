<script type="text/javascript">
    var childCountLangue = ${candidatInstance?.connaissanceLinguistiques == null? 0: candidatInstance?.connaissanceLinguistiques.size()} + 0;
    function addLangue(){
      var clone = $("#connaissanceLinguistique_clone").clone();
      var htmlId = 'connaissanceLinguistiques['+childCountLangue+'].';
      var langueInput = clone.find("select[id$=langue]");
      var niveauInput = clone.find("select[id$=niveau]");

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
      langueInput.attr('id',htmlId + 'langue')
              .attr('name',htmlId + 'langue');
      niveauInput.attr('id',htmlId + 'niveau')
              .attr('name',htmlId + 'niveau');

      clone.attr('id', 'connaissanceLinguistique'+childCountLangue);
      $("#connaissanceLinguistiquechildList").append(clone);
      clone.show();
      //connaissanceLinguistiqueInput.focus();
      childCountLangue++;
      document.getElementById("addlangue").value = childCountLangue;
    }
    </script>
<div id="connaissanceLinguistiquechildList">
<g:each var="connaissanceLinguistique" in="${candidatInstance.connaissanceLinguistiques}" status="i">
    <g:render template='langue' model="['connaissanceLinguistique':connaissanceLinguistique,'i':i,'hidden':false]"/>
    <!-- Render the connaissanceLinguistique template (_connaissanceLinguistique.gsp) here -->
</g:each>
    </div>
      <div class="row text-center">
        <a href='javascript:addLangue();' class="label label-danger">Ajouter une compétence linguistique</a>
      </div>
    

