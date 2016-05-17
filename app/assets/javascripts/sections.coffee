@SectionUtils =
  previewToggler: ->
    $('#section-preview-raw').html(marked($('#section-preview-raw').html()))
    $('#section-edit a.preview-trigger').click (ev) ->
      ev.preventDefault()
      $('#section-preview').html(marked($('form#section-edit-form textarea').val()))
      $('form#section-edit-form').addClass('hidden')
      $('#section-preview').removeClass('hidden')

    $('#section-edit a.editor-trigger').click (ev) ->
      ev.preventDefault()
      $('form#section-edit-form').removeClass('hidden')
      $('#section-preview').addClass('hidden')
