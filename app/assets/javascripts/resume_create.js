$(document).on('page:change', function(){
  // Make the snippets on the toolbox draggable, listen on the parent in case of edit
  $(".panel").on("mouseenter", ".well-snippet", function(){
    $(".panel .well-snippet").draggable({
      appendTo: "body",
      helper: "clone",
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
      //hides the placeholder (text on resumebox) when the item is over the sortable
      $(".placeholder").hide();
      //removes the auto size added by sortable
      $('#resumebox .well-snippet').css({'width': 'auto', 'height': 'auto'});
      //removes the edit and delete buttons only from items in resumebox
      $("#resumebox .snippet-controls").remove();
      //reveals a link which is used to remove snippet from resumebox
      $('#resumebox .well-snippet .pull-right').removeClass('snippet-remove-hidden');
    }
  });
  // this function listens on "resumebox" and binds to the "a href" to enable removing items from list.
  $("#resumebox").on("click", "a", function(){
    $(this).parent().parent().remove()
  });
});
