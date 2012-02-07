$('form.article, .cheatsheet, .toolbar .cancel-button').hide()
$('#form-placeholder').append("<%= escape_javascript(render('preview')) %>")
$('#show-article-preview').addClass('active').text("Back to Edit")