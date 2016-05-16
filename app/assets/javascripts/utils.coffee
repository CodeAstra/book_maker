@BookMakerUtils =
  showFlash: (flash_messages_tag) ->
    $('header .alert').remove();
    $('header').append(flash_messages_tag);
  markdownToHTML: ->
    $.each $('.markable'), (index, ele) ->
      $(ele).html(marked($(ele).html()))

$ ->
  BookMakerUtils.markdownToHTML()
