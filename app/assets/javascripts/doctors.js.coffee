jQuery ->
  # Doctors show&hide the photo upload field 
  # and hide&show all other
  $("#switch_to_photo").click (event) ->
    event.preventDefault()
    $(".hide_while_photo").hide()
    $("#doctor_photo_form").fadeIn()

  $("#switch_to_data").click (event) ->
    event.preventDefault()
    $(".hide_while_photo").fadeIn()
    $("#doctor_photo_form").hide()

  $("#doctor_photo").change (event) ->
    $(".dots").show()
    $(".cancel").hide()

    $("#doctor_photo_form").submit()
    return false