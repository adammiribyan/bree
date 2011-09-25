jQuery ->
  # Sortable patients table
  if $("table#patients-list").length > 0
    $("table#patients-list").tablesorter({ sortList: [[2,0]] });
  
  # Patients profile file show progress dots 
  # and hide the file field on submit
  $("#patient_profile").change ->
    $(".dots").show()

    $("#patient_profile_form").submit()
    return false
    
  # Show other appointments button magic
  ($ "#show_other_appointments a").bind
    click: (event) ->
      event.preventDefault()
      
      # Hiding the button and fading up 
      # the hidden rows
      $(@).parent().hide()
      ($ "#recentVisits tbody tr.hidden").fadeIn()
      