jQuery ->
  ($ "form.session label").inFieldLabels()
  ($ "form input.password").focus()
  
  ($ "form.session").submit ->
    ($ "form.session, span.error, span.notice").hide()
    ($ "#login_loading").show()
    
  ($ "#reset_password a").click ->
    ($ "form.session, span.error, #reset_password").hide()
    ($ "#login_loading").show()    
