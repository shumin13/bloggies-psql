// $(function () {
//   alert('jquery loaded')
// })

$(document).on('turbolinks:load', function() {

  $(".static").ready(function() {

    // check if we are at static pages
    // load on static pages views
    alert('run ajax for static pages only')
  })

  $(".posts").ready(function() {

    // check if we are at posts pages
    // load on posts views
    alert('run ajax for posts views only')
  })
})
