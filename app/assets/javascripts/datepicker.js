// for modal
$(document).on('page:change', function(){
  $('#new-snippet, #edit-snippet').on('shown.bs.modal', function (e) {
    $(".datepicker").MonthPicker();
  });
});
