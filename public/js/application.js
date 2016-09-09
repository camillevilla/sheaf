$(document).ready(function() {
  booksBorrowedListener();
  booksLentListener();
  newBookListener();
});

var booksBorrowedListener = function(){
  $("#books-borrowed-toggle").on("click", function(event){
    event.preventDefault();

    //hide if clicked again
    if ($("#books-borrowed").length > 0){
      $("#books-borrowed").remove();
    }
    else
    {
    var targetUrl = $("#home").attr("href") + "/borrows"

    $.ajax({
      method: "GET",
      url: targetUrl
    })

    .done(function(response){
      // debug
      $("#user-options").append(response);
    })
    .fail(function(error){
      console.log(error)
    });
  }})
}

var booksLentListener = function(){
  $("#books-lent-toggle").on("click", function(event){
    event.preventDefault();

    //hide if clicked again
    if ($("#books-lent").length > 0){
      $("#books-lent").remove();
    }
    else
    {

    var targetUrl = $("#home").attr("href") + "/books-lent"

    $.ajax({
      method: "GET",
      url: targetUrl
    })

    .done(function(response){
      // debug
      $("#user-options").append(response);
    })
    .fail(function(error){
      console.log(error)
    });
  }})
}

var newBookListener = function(){
  $("#new-work-form").on("submit", function(event){
    
    event.preventDefault();
    
    var input = $("#new-work-form").serialize();
    
    $.ajax({
      method: "POST",
      url: "/works",
      data: input
    })
    .done(function(response){
      $("#new-work-form-container").append(response)
    })
    .fail(function(error){
      console.log(error)
    });
    
  })
}