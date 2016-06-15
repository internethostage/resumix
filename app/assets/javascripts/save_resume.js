$(document).on('page:change', function(){
  // add binding to save resume button on resumes-new page
  $('#save-resume').on("click", function(event){
    // prevent default action from button
    event.preventDefault();
    // empty array for the ids of the snippets
    var snippet_ids = []
    // get the name of the resume from the input box
    var resume_name = $('#name').val()
    // go through each snippet on the resumebox, get their id and position and push inside snippet_ids array
    $('#resumebox .snippet-name').each(function(i){
      snippet_ids.push({
                        id: $(this).data("id"),
                        position: $(this).data("pos")
                      });
      });
    // ajax to post to create the new resume with the snippet ids array (position and snippet id)
    $.ajax({
      type: "POST",
      url: '/resumes',
      // data is the params sent to the server
      data: { snippet: snippet_ids, name: resume_name }
    });
  });
});
