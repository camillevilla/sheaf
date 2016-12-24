$(document).on('turbolinks:load', function () {
  pendingRequestHandler()
})

var pendingRequestHandler = function () {
  $('.btn-accept, .btn-reject').on('click', function(event) {
    event.preventDefault()
    var clickedButton = $(this)
    var copyInfo = $(this).parent().parent()
    console.log(clickedButton)
    var acceptButton = $(copyInfo).find('.btn-accept')
    var rejectButton = $(copyInfo).find('.btn-reject')

    if ($(clickedButton).hasClass('btn-accept')) {
      $(rejectButton).parent().remove()
      $(acceptButton).hide()
      $('#lent-books-table').append(copyInfo)
      // AJAX for accept
    } else if ($(clickedButton).hasClass('btn-reject')) {
      $(copyInfo).remove()
      // AJAX for reject
    }
      else {
        console.log('error')
    }

  })
}
