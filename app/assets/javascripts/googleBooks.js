$(document).ready(function() {
  lookupByISBN13();  
});

var lookupByISBN13 = function(){
  $("#lookupISBN").on('click', function(event){

  event.preventDefault();

  var googleBooksAPI = "https://www.googleapis.com/books/v1/volumes?q=";
  var isbn13Field = $('#editionISBN13');
  var isbn13 = isbn13Field.val();

$.getJSON(googleBooksAPI + 'isbn:' + isbn13,
    function(data){
      var volumeInfo = data.items[0]["volumeInfo"]

      $('#authorName').val(volumeInfo["authors"][0]);
      $('#workTitle').val(volumeInfo["title"]);
      $('#publisherName').val(volumeInfo["publisher"]);
      $('#editionPublicationyear').val(volumeInfo["publishedDate"]);
    });
})};