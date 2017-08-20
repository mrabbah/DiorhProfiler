$(document).ready(function() {
    $('.datecss').on('click', function() {
        $(this).datepicker({
            dateFormat: 'dd/mm/yy'
        });
        $(this).trigger("focus");
    });
    $(document).on("focus", ".datecss", function() {
        $(this).datepicker({
            dateFormat: 'dd/mm/yy'
        });
        $(this).trigger("focus");
    });
});
$("#dateNaissance").datepicker({
    dateFormat: 'dd/mm/yy'
});
$("#dateFin").datepicker({
    dateFormat: 'dd/mm/yy'
});
$("#dateDebut").datepicker({
    dateFormat: 'dd/mm/yy'
});

