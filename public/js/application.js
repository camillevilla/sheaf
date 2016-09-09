$(document).ready(function() {
  booksBorrowedListener();
  booksLentListener();
});

var booksBorrowedListener = function(){
  $("#books-borrowed-toggle").on("click", function(event){
    event.preventDefault();

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
  })
}

var booksLentListener = function(){
  $("#books-lent-toggle").on("click", function(event){
    event.preventDefault();

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
  })
}