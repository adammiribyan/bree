jQuery ->
  ($ "form.session label").inFieldLabels()
  ($ "form input.password").focus()
  
  ($ "form.session").submit ->
    ($ "form.session, span.error").hide()
    ($ "#login_loading").show()
    
