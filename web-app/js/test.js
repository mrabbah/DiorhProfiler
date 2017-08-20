function updateformation(id1, id2) {
    $('.erreur').html("");
    var i;
    if (id2 == '_clone') {
        i = id1
    } else {
        i = id2
    }
    $("#titremodalformation").html("<span class='label label-danger'>Modifier la formation</span>");
    reset();
    $('input[id="addupdate"]').val("update");
    $('input[id="element"]').val(i);
    $('select[id="diplome"]').val(document.getElementById("formationcandidats["+i+"].diplome").value);
    $('input[id="intituleDiplome"]').val(document.getElementById("formationcandidats[" + i + "].intituleDiplome").value);
    $("#annee").val(document.getElementById("formationcandidats[" + i + "].annee").value);
    $('input[name="optionFormation"]').val(document.getElementById("formationcandidats[" + i + "].optionFormation").value);
    $('input[name="etablissement"]').val(document.getElementById("formationcandidats[" + i + "].etablissement").value);
    $("#typeEtablissement").val(document.getElementById("formationcandidats[" + i + "].typeEtablissement").value);
    $('select[id="villef"]').val(document.getElementById("formationcandidats[" + i + "].ville").value);
    $("textarea#description").val(document.getElementById("formationcandidats[" + i + "].description").value);

}

function addformation() {
    $('.erreur').html("");
    $('input[id="addupdate"]').val("add");
    $("#titremodalformation").html("<span class='label label-danger'>Ajouter une formation</span>");
    reset();
}
function reset() {
    $('select[name="diplome.id"]').val('');
    $('input[name="intituleDiplome"]').val('');
    $('select[name="annee"]').val('');
    $('input[name="optionFormation"]').val('');
    $('input[name="etablissement"]').val('');
    $('select[name="typeEtablissement.id"]').val('');
    $('select[name="ville.id"]').val('');
    $("textarea#description").val('');
}