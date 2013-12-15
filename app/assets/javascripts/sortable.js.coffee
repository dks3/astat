$ ->
  $('.table-sortable').each ->
    $(this).sortable
      items: 'tr.handle'
      cancel: ".subdivision"
      update: (event, ui) ->
        position=ui.item.attr 'data-id'
        subdivision_id= ui.item.prevAll('tr.subdivision:first').attr('data-id')
        #console.log position
        #console.log subdivision_id
        $.ajax
          method: 'POST'
          url: ui.item.closest('table').attr('data-url')
          data:
            subdivision_id: subdivision_id
            position: position
