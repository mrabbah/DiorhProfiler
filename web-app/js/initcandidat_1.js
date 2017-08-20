$(document).ready(function(){
    $("#formation_add").dialog({
        autoOpen: false,
        height: 480,
        width: 850,
        modal: true,
        show: {
            effect: "slide",
            duration: 1000
        },
        hide: {
            effect: "drop",
            duration: 1000
        },
        buttons: {
            "Ajouter": function() {
                var bValid = true;
                allFields.removeClass("ui-state-error");
                addFormation();
                $(this).dialog("close");
            },
            Cancel: function() {
                $(this).dialog("close");
            }
        },
        close: function() {
            allFields.val("").removeClass("ui-state-error");
        }
    });

    $("#addForma").click(function() {
        $("#formation_add").dialog("open");
    });

    $("#experience_add").dialog({
        autoOpen: false,
        height: 480,
        width: 850,
        modal: true,
        show: {
            effect: "slide",
            duration: 1000
        },
        hide: {
            effect: "drop",
            duration: 1000
        },
        buttons: {
            "Ajouter": function() {
                var bValid = true;
                allFields.removeClass("ui-state-error");
                addExperience();
                $(this).dialog("close");
            },
            Cancel: function() {
                $(this).dialog("close");
            }
        },
        close: function() {
            allFields.val("").removeClass("ui-state-error");
        }
    });

    $("#btnexp").click(function() {
        $("#experience_add").dialog("open");
    });

    $(document).on( "click", ".del-connaissanceLinguistique", function() {
        //find the parent div
        var prnt = $(this).parents(".connaissanceLinguistique-div");
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
            prnt.hide();
        }
    });
    $(document).on( "click", ".del-formationcandidat", function() {
        //find the parent div
        var prnt = $(this).parents(".formation-div");
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
    $(document).on( "click", ".del-experience", function() {
        //find the parent div
        var prnt = $(this).parents(".experience-div");
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
    $(document).on( "click", ".del-test", function() {
        //find the parent div
        var prnt = $(this).parents(".test-div");
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
            prnt.hide();
        }
    });
    $("#send_mail").dialog({
        autoOpen: false,
        height: 480,
        width: 600,
        modal: true,
        show: {
            effect: "slide",
            duration: 1000
        },
        hide: {
            effect: "drop",
            duration: 1000
        },
        buttons: {
            "Envoyer": function() {
                var bValid = true;
                allFields.removeClass("ui-state-error");
                envoyermail();
                $(this).dialog("close");
            },
            Cancel: function() {
                $(this).dialog("close");
            }
        },
        close: function() {
            allFields.val("").removeClass("ui-state-error");
        }
    });

    $("#sendmail").click(function() {
       $("#send_mail").dialog("open");
    });
    
     

});