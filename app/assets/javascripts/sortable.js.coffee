$ ->
  $('.table-sortable tbody').each ->
    $(this).sortable
      items: 'tr'
      update: (event, ui) ->
        $.ajax
          method: 'POST'
          url: ui.item.closest('table').attr('data-url')
          data: ui.item.closest('tbody').sortable('serialize')
