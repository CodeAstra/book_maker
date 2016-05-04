@BookMakerUtils =
  showFlash: (flash_messages_tag) ->
    $('header .alert').remove();
    $('header').append(flash_messages_tag);
