jQuery ->
  # new service form toggle
  $("#services tfoot #new_service_form_link").live "click", (event) ->
    event.preventDefault()    
    $("#services tfoot tr#service_form").toggle()
    $("#services tfoot #new_service_form_link").toggleClass "selected"