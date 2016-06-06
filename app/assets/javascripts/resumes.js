$(document).on('page:change', function(){
  $(".panel").on("mouseenter", ".well-snippet", function(){
    $(".well-snippet").draggable({
      appendTo: "#resumebox",
      helper: "clone"
    });
  })
    $("#resumebox").droppable({
      activeClass: "ui-state-default",
      hoverClass: "ui-state-hover",
      accept: ":not(.ui-sortable-helper)",
      drop: function( event, ui ) {
        $(this).find(".placeholder").remove();
        $("<resumetext></resumetext>").html(ui.draggable.html() ).appendTo(this);
        $("resumetext .snippet-controls").remove();
        $('resumetext').each(function(i){
          $(this).children().first().attr("data-pos",i+1);
        });
      }
    }).sortable({
      items: "resumetext:not(.placeholder)",
      sort: function() {
        // gets added unintentionally by droppable interacting with sortable
        // using connectWithSortable fixes this, but doesn't allow you to customize active/hoverClass options
        $(this).removeClass( "ui-state-default" );
      }
    });
    $('#trash').droppable({
      drop: function(event, ui) {
        ui.draggable.remove();
    }
  });
});
