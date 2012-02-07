# setup the layout of the articles new/edit form
setInputWidth = (input, margin=10, padding=10) ->
  width = $(input).closest('form').width()
  $(input).css('width', width - margin - padding)
  $(input).css('margin-left', margin/2)
  $(input).css('padding-left', padding/2)
  $(input).css('margin-right', padding/2)
  $(input).next('.hint').css('margin-left', margin)

jQuery ->
  setInputWidth('#article_title')
  setInputWidth('#article_body')
  setInputWidth('#article_tag_list')
  setInputWidth('#article_last_commit_message')

  $('#show-article-preview').click ->
    if $(this).hasClass('active')
      $('#article-preview').remove()
      $('form.article, .cheatsheet, .toolbar .cancel-button').show();
      $(this).removeClass('active').text("Preview")
    else
      $(this).text("Please wait...")
      $.ajax({
        url: $(this).data('url'),
        dataType: "script",
        type: "post",
        data: { body: $('#article_body').val() },
      })

    return false