load_datepicker = ->
  $(".datepicker").datepicker
    dateFormat: "dd-mm-yy"
    showButtonPanel: true
    onSelect: (dateText, inst) ->
      window.location = '/?date=' + dateText;

$(document).ready(load_datepicker)
$(document).on('page:load', load_datepicker)