jQuery ->    
  # magic search field
  $(".overlay-wrap > input").attr "value", ""

  $(".overlay-wrap > input").focusin ->
    $("label[for=#{@id}]").addClass "focus"

  .blur ->
    if this.value == ""
      $("label[for=#{@id}]").removeClass("focus").show()
      
  .keypress ->
    if event.keyCode == Event.KEY_TAB 
      return
    $("label[for=#{@id}]").hide()