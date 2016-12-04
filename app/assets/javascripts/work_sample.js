$(function() {
  $('.user-work-sample-image-link').on('click', function(){
    var url = $(this).data('worksamplemedurl');
    $('.work-sample-med-image').attr("src", url);
  });
});