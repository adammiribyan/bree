jQuery ->
  # new service form toggle
  $("#services tfoot #new_service_form_link").live "click", (event) ->
    event.preventDefault()    
    $("#services tfoot tr#service_form").toggle()
    $("#services tfoot #new_service_form_link").toggleClass "selected"
  
  # Model
  class window.Service extends Backbone.Model
    url: -> if @id then "/services/#{@id}" else "/services"
  
  # Collection
  class window.ServiceCollection extends Backbone.Collection
    model: Service
    url: "/services"
    
  window.Services = new ServiceCollection
  
  Services.fetch()
  
  $("#service_query").bb_autocomplete
    collection: Services
    attr: "name"
    additional_attr: "price"
    ul_class: "services_autocomplete"
    noCase: true
  