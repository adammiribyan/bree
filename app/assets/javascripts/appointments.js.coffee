jQuery ->
  # Attaching autoresize to history field
  ($ "textarea#appointment_history").autoResize
    # Quite slow animation
    animateDuration: 500
