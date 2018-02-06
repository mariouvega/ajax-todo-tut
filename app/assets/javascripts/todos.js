// This is shorthand for $( document ).ready(function() { })
$(function(){
  $('form').submit(function(event){
    event.preventDefault();

    // this debugger should be hit when you click the submit button!
    // debugger;

    var action = $(this).attr('action');
    var method = $(this).attr('method');

    var description = $(this).find('#todo_description').val();
    var priority = $(this).find('#todo_priority').val();
    // .serializeArray() can be called on any form element (and here, $(this) is our form)
    var data = $(this).serializeArray();

    $.ajax({
      method: method,
      url: action,
      data: data,

      //this line makes the response format JavaScript and not HTML.
      dataType: 'script',
    });

  });
});
