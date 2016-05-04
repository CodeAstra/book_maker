ChapterSorter =
  orderedChapterIds: ->
    JSON.stringify $('#chapters-list').sortable('toArray').map (eleId) ->
      eleId.split("_")[1]
  saveNewSortOrder: ->
    $.ajax
      method: "PUT"
      url: "/books/#{$('#book')[0].dataset.bookId}",
      dataType: "script"
      data:
        book:
          sorted_chapter_ids: ChapterSorter.orderedChapterIds()
  init: ->
    $('#chapters-list').sortable
      handle: '.fa-bars'
      items: '> .chapter'
      placeholder: 'sortable-placeholder'
      update: ->
        ChapterSorter.saveNewSortOrder()

$ ->
  $('#book #sidebar #chapters-list .chapter .chapter-title').click (ev) ->
    ev.preventDefault()
    $(@).parents('.chapter').toggleClass('expanded')

  ChapterSorter.init()
