jQuery ->
  $(".datepicker").datepicker
    dateFormat: "dd-mm-yy"
    showButtonPanel: true
    onSelect: (dateText, inst) ->
      window.location = '/?date=' + dateText;
