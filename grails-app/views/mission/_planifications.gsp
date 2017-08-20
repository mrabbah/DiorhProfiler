<script type="text/javascript">

    var childCountPlanification = ${missionInstance?.planifications == null? 0: missionInstance?.planifications.size()} + 0;
    function addPlanification(){
      var clone = $("#planification_clone").clone();
      var htmlId = 'planifications['+childCountPlanification+'].';
      var planificationEtape = clone.find("select[id$=etape]");
      var planificationDateDebut = clone.find("input[id$=dateDebut]");
      var planificationDateFin = clone.find("input[id$=dateFin]");

      clone.find("input[id$=id]")
             .attr('id',htmlId + 'id')
             .attr('name',htmlId + 'id');
      planificationEtape.attr('id',htmlId + 'etape')
              .attr('name',htmlId + 'etape');
      planificationDateDebut.attr('id',htmlId + 'dateDebut')
              .attr('name',htmlId + 'dateDebut')
              .attr('class', 'datecss form-control dateDebut');
      planificationDateFin.attr('id',htmlId + 'dateFin')
              .attr('name',htmlId + 'dateFin')
              .attr('class', 'datecss form-control dateFin');

      clone.attr('id', 'planification'+childCountPlanification);
      $("#planificationchildList").append(clone);
      clone.show();
      childCountPlanification++;
      document.getElementById("addplanification").value = childCountPlanification;
    }

    </script>
    <div id="planificationchildList">
    <div class="row table-bordered2 odd">
      <div class="col-sm-4 fontrowtabletitle">Etape</div>
      <div class="col-sm-4 fontrowtabletitle">Date de début </div>
      <div class="col-sm-3 fontrowtabletitle">Date de fin</div>
      <div class="col-sm-1 fontrowtabletitle"></div>
 </div>
<g:each var="planification" in="${missionInstance.planifications}" status="i">
    <g:render template='planification' model="['planification':planification,'i':i,'hidden':false]"/>
</g:each>
    </div>
<div class="row text-center">
  <a href='javascript:addPlanification();' class="label label-danger">Ajouter une planification</a>
</div>
