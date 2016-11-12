$(function(){
  $("#languages").on('focus', 'input.language-input' ,function(){
    $(this).parent().parent().find('.search-result').removeClass('hidden');
    $(this).parent().parent().find('.search-result').show();
  });
  $("#languages").on('focusout', 'input.language-input' ,function(){
    $(this).parent().parent().find('.search-result').hide();
  });  

  $("#languages").on('keyup', 'input.language-input' ,function(){
    var searchbox = $(this).parent().parent().find('.search-result');
    searchbox.html(this.value);
  });

});