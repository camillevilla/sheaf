$(document).ready(function () {
  sendBorrowRequest()
})

var sendBorrowRequest = function() {
  $('.btn-borrow').on('click', function(event){
    event.preventDefault()
    var borrowButton = $(this)
    $(borrowButton).hide()
    $(borrowButton).parent().append('<button class="btn btn-warning btn-pending">Requested</button>')
  })
}