$(document).ready(function() {
  resetLookupStatus();
  resetButton();
  lookupByISBN13();  
});

var lookupByISBN13 = function(){
  $("#lookupISBN").on('click', function(event){

  event.preventDefault();

  resetLookupStatus();

  var googleBooksAPI = "https://www.googleapis.com/books/v1/volumes?q=";
  var isbn13Field = $('#editionISBN13');
  var isbn13 = isbn13Field.val();

$.getJSON(googleBooksAPI + 'isbn:' + isbn13,
    function(data){
      if (data.totalItems >= 1) {
        var volumeInfo = data.items[0]["volumeInfo"]
        console.log(volumeInfo)
        $('#authorName').val(volumeInfo["authors"][0]);
        $('#workTitle').val(volumeInfo["title"]);
        $('#publisherName').val(volumeInfo["publisher"]);
        $('#editionPublicationyear').val(volumeInfo["publishedDate"]);
        $('#lookup-status').show()
        $('#lookup-status').addClass('btn-success')
        $('#lookup-status').html('<i class="fa fa-check fa-lg" alt="search successful"></i>')
      } else {
        $('#lookup-status').show()
        $('#lookup-status').addClass('btn-danger')
        $('#lookup-status').html('<i class="fa fa-times fa-lg" alt="failed search"></i>')
        $('#lookup-failure-message').show();
      }
    }); //end $.getJSON
  }) // end $("#lookupISBN").on
}; // end lookupByISBN13

// reset ISBN lookup form 
var resetLookupStatus = function(){
  $('#lookup-status').hide()
  $('#lookup-failure-message').hide();
  $('#lookup-status').removeClass('btn-success')
  $('#lookup-status').removeClass('btn-danger')
}

var resetButton = function(){
  $('button[type="reset"]').on('click', function(){
    resetLookupStatus();
  })
}