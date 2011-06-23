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
    console.log("clicked")
    $this = $(@)
    
    field = ($ "textarea#appointment_history")
    template = Templates.get($this.attr("data-id"))
    
    if field.val().length > 0
      line_breaks = "\n\n"
    else
      line_breaks = ""

    field.val("#{field.val()}#{line_breaks}#{template.get('body')}")
    