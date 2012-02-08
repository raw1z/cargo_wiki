hideFlash = ->
  $('.flash').slideUp()
  clearTimeout()

setupLayout = ->
  $('nav').height($(document).height())

jQuery ->
  # set the active tab
  $('nav li').removeClass('active')
  $('nav li.tags', 'body.tags').addClass('active')
  $('nav li.articles', 'body.articles').addClass('active')
  $('nav li.history', 'body.history').addClass('active')
  $('nav li.versions', 'body.versions').addClass('active')
  $('nav li.users', 'body.users').addClass('active')

  # setup the nav bar
  setupLayout()
  $(window).resize ->
    setupLayout()
  $(document).scroll ->
    setupLayout()

  # hide the flash
  setTimeout(hideFlash, 5000)