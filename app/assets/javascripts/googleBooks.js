$(document).ready(function() {
  lookupByISBN13();  
  $('#lookup-status').hide()
});

var lookupByISBN13 = function(){
  $("#lookupISBN").on('click', function(event){

  event.preventDefault();

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
        $('#lookup-status').html('<i class="fa fa-check fa-lg" alt="success"></i>')
      } else {
        console.log('error')
        $('#lookup-status').show()
        $('#lookup-status').addClass('btn-danger')
        $('#lookup-status').html('<i class="fa fa-times fa-lg" alt="success"></i>')
      }
    });
})};