hideFlash = ->
  $('.flash').slideUp()
  clearTimeout()

jQuery ->
  # set the active tab
  $('nav a').removeClass('active')
  $('nav li.home', 'body.home').addClass('active')
  $('nav li.articles', 'body.articles').addClass('active')
  $('nav li.history', 'body.history').addClass('active')

  # setup the nav bar
  $('nav').height($(document).height())

  # hide the flash
  setTimeout(hideFlash, 5000)