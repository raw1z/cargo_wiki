# setup the layout of the articles new/edit form
setInputWidth = (input, margin=10, padding=10) ->
  width = $(input).closest('form').width()
  $(input).css('width', width - margin - padding)
  $(input).css('margin-left', margin/2)
  $(input).css('padding-left', padding/2)
  $(input).css('margin-right', padding/2)
  $(input).next('.hint').css('margin-left', margin/2)

jQuery ->
  setInputWidth('#article_title')
  setInputWidth('#article_body')
  setInputWidth('#article_last_commit_message')