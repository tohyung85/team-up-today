$(function(){

  $( ".checkbox input[type='checkbox']" ).each(function() {
    var thisInput = $(this);
    if(thisInput.prop("checked")) {
      $(this).parent().addClass('checked');  
    }    
  });

  $('.checkbox label').click(function(e){
    if (e.target.tagName.toUpperCase() === "LABEL") {
        return; //clicks on checkbox gets called twice! once on label once on input. So have to shutoff one.
    }
    var thisInput = $(this);
    if(thisInput.hasClass("checked")) {
      thisInput.removeClass("checked");
    } else {
      thisInput.addClass("checked");
    }
  });

  $('form.edit_profile').on('keypress keyup', function(e){
    var keyCode = e.keyCode || e.which;
    if (keyCode === 13) {
      e.preventDefault();
      return false;
    }
  });

  $("#languages").on('focus', 'input.language-input' ,function(){
    $(this).parent().parent().find('.search-result').removeClass('hidden');
    $(this).parent().parent().find('.search-result').show();
  });
  $("#languages").on('click', 'p.individual-result',function(event){
    var selection = $(this).html();
    $(this).parent().parent().find('input.language-input').val(selection);
  });

  $("#languages").on('focusout', 'input.language-input' ,function(e){
    var searchbox = $(this).parent().parent().find('.search-result');
    window.setTimeout(function(){
      searchbox.hide();
    }, 100); // avoid focus out before click
  });  

  $("#languages").on('keyup', 'input.language-input' ,function(){
    var searchbox = $(this).parent().parent().find('.search-result');
    var searchboxtext = this.value;
    $.ajax({
      url: $('#languages').data('searchurl'),
      type: 'GET',
      data: 'input_string='+searchboxtext,
      success: function(data) {
        searchbox.empty();
        data['languages'].forEach(function(element){
          searchbox.append($("<p class='individual-result'>"+element+"</p>"));
        });
      },
      error: function(e) {
        console.log(e.message);
      }
    });
  });


  $("#skills").on('focus', 'input.skill-input' ,function(){
    $(this).parent().parent().find('.search-result').removeClass('hidden');
    $(this).parent().parent().find('.search-result').show();
  });
  $("#skills").on('click', 'p.individual-result',function(event){
    var selection = $(this).html();
    $(this).parent().parent().find('input.skill-input').val(selection);
  });

  $("#skills").on('focusout', 'input.skill-input' ,function(e){
    var searchbox = $(this).parent().parent().find('.search-result');
    window.setTimeout(function(){
      searchbox.hide();
    }, 100); // avoid focus out before click
  });  

  $("#skills").on('keyup', 'input.skill-input' ,function(){
    var searchbox = $(this).parent().parent().find('.search-result');
    var searchboxtext = this.value;
    $.ajax({
      url: $('#skills').data('searchurl'),
      type: 'GET',
      data: 'input_string='+searchboxtext,
      success: function(data) {
        searchbox.empty();
        data['skills'].forEach(function(element){
          searchbox.append($("<p class='individual-result'>"+element+"</p>"));
        });
      },
      error: function(e) {
        console.log(e.message);
      }
    });
  });

});