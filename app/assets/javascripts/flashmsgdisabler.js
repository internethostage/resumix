$(document).on('page:change', function(){
$("#flashmsg").fadeTo(5000, 0).slideUp(500, function(){
      $(".alert").alert('close');
  });
});
