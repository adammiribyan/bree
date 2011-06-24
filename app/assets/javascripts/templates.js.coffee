jQuery ->
  # Model
  class window.Template extends Backbone.Model
    url: -> if @id then "/templates/#{@id}" else "/templates"
    
  # Collection
  class window.TemplateCollection extends Backbone.Collection
    model: Template
    url: "/templates"
  
  # Getting templates
  window.Templates = new TemplateCollection
  Templates.fetch()
  
  # Appending templates to history field when template 
  # label is clicked
  ($ "#template_append_buttons").delegate "li", "click", ->
    $this = $(@)
    
    field = ($ "textarea#appointment_history")
    template = Templates.get($this.attr("data-id"))
    
    if field.val().length > 0
      line_breaks = "\n\n"
    else
      line_breaks = ""
    
    # Appending the template to textarea and focusing it
    field.val("#{field.val()}#{line_breaks}#{template.get('body')}").focus()
    
    # Moving the cursor to the end
    field_length = field.val().length
    field.get(0).setSelectionRange(field_length, field_length)
  
  # They look like real buttons
  ($ "#template_append_buttons li.template").bind  
    mousedown: ->
      $(@).css("background-color", "#ddd")      
    mouseup: ->
      $(@).css("background-color", "#eee")
    