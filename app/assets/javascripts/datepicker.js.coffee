jQuery ->
  $(".datepicker").datepicker
    dateFormat: "dd-mm-yy"
    showButtonPanel: true
    onSelect: (dateText, inst) ->
      Turbolinks.visit('/?date=' + dateText)