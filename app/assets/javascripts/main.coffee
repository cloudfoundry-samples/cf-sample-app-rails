$ ->
  interval = 4000
  ping = setInterval ->
    $.ajax
      url: '/ping.txt'
      dataType: 'text'
      success: (data) ->
        $('[data-ping=\'ping\']').append data
  , interval
