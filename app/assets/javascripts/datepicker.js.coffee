jQuery ->
  $(".datepicker").datepicker
    dateFormat: "dd-mm-yy"
    showButtonPanel: false
    onSelect: (dateText, inst) ->
      Turbolinks.visit('/?date=' + dateText)
    onClose: (dateText, inst) ->
      $(this).attr('readonly', false)
    beforeShow: (input, inst) -> 
      $(this).attr('readonly', true)
