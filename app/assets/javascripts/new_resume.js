$(document).on('page:change', function(){
  $('#save-resume').on("click", function(event){
    event.preventDefault();
    var snippet_ids = []
    var resume_name = $('#name').val()
    $('#resumebox .snippet-name').each(function(i){
            snippet_ids.push({
                            id: $(this).data("id"),
                            position: $(this).data("pos")
                            });
          });
          console.log(snippet_ids);
          $.ajax({
          type: "POST",
          url: '/resumes',
          data: { snippet: snippet_ids,
                  name: resume_name }
      });
  });
});
