$(document).on('page:change', function(){
  // Make the snippets on the toolbox draggable, listen on the parent in case of edit
  $(".panel").on("mouseenter", ".well-snippet", function(){
    $(".well-snippet").draggable({
      appendTo: "body",
      connectToSortable: "#resumebox"
    });
  });
  // Make the resumebox sortabe (and droppable)
  $("#resumebox").sortable({
    items: ".well-snippet:not(.placeholder)",
    // on sort, or drop, remove the ui-state-default class
    sort: function () {
      $(this).removeClass("ui-state-default");
    },
    // on update, set the position on 'data-pos'
    update: function() {
      $('.snippet-name').each(function(i){
        $(this).attr("data-pos",i+1);
      });
    },
    over: function () {
      //hides the placeholder when the item is over the sortable
      $(".placeholder").hide();
      //removes the auto size added by sortable, adds class to style delete button
      $('#resumebox .well-snippet').css({'width': 'auto', 'height': 'auto'}).addClass('resume-snippet');
      //removes the edit and delete buttons only from items in resumebox
      $("#resumebox .snippet-controls").remove();
    }
  });
  $('#trash').droppable({
    drop: function(event, ui) {
      ui.draggable.remove();
    }
  });
});
