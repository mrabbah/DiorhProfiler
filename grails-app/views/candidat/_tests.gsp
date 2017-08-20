<script type="text/javascript">

    var childCountTest = ${candidatInstance?.tests == null? 0: candidatInstance?.tests.size()} + 0;
    function addTest(){
      var clone = $("#test_clone").clone();
      var htmlId = 'tests['+childCountTest+'].';
      var testTitre = clone.find("select[id$=titre]");
      var testComm = clone.find("textarea[id$=commentaire]");
      var testDate = clone.find("input[id$=dateTest]");

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
      testComm.attr('id',htmlId + 'commentaire')
              .attr('name',htmlId + 'commentaire');
      testTitre.attr('id',htmlId + 'titre')
              .attr('name',htmlId + 'titre');
      testDate.attr('id',htmlId + 'dateTest')
              .attr('name',htmlId + 'dateTest');

      clone.attr('id', 'test'+childCountTest);
      $("#testchildList").append(clone);
      clone.show();
      //testInput.focus();
      childCountTest++;
      document.getElementById("addtest").value = childCountTest;
    }

</script>
<div id="testchildList">
  <table class="table table-striped table-bordered table-condensed">
    <tr>
      <td class="col-sm-4">
    <g:message code="test.typetest.label" default="Type de test"/>
    </td>
    <td class="col-sm-4">
    <g:message code="test.datetest.label" default="Date de test"/>
    </td>
    <td class="col-sm-4">
    <g:message code="test.commentaire.label" default="Commentaire"/>   
    </td>
    <tr/>
  </table>
  <g:each var="test" in="${candidatInstance.tests}" status="i">
    <g:render template='test' model="['test':test,'i':i,'hidden':false]"/>
    <!-- Render the test template (_test.gsp) here -->
  </g:each>
</div>
<div class="row text-center">
  <a href='javascript:addTest();' class="label label-danger">Ajouter un test</a>
</div>
