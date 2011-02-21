$(document).ready(function() {
    $("#datepicker").datepicker();
    var input = $("#search_form-field");
    input.autocomplete(
      {source: input.attr('data-load-event-url')}
    );
});