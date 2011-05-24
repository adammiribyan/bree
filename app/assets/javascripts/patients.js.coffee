jQuery ->
  # Patients profile file show progress dots 
  # and hide the file field on submit
  $("#patient_profile").change ->
    $(".dots").show()

    $("#patient_profile_form").submit()
    return false