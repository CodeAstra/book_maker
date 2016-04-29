@ChapterUtils =
  hideNewChapterForm: ->
    $('#new-chapter-form').hide()
    $('#new-chapter-form-trigger').show()
  bindNewChapterCancelLink: ->
    $('#cancel-new-chapter-form').click ->
      ChapterUtils.hideNewChapterForm()
$ ->
  $('#new-chapter-form').hide()
  $('#new-chapter-form-trigger').click ->
    $('#new-chapter-form').show()
    $(@).hide()
  ChapterUtils.bindNewChapterCancelLink()
