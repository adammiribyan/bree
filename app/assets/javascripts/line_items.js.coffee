jQuery ->
  # Model
  class window.LineItem extends Backbone.Model
    url: -> if @id then "/line_items/#{@id}" else "/line_items"
  
  # Collection
  class window.LineItemCollection extends Backbone.Collection
    model: LineItem
    url: "/line_items"
  
  window.LineItems = new LineItemCollection
  
  # View
  class window.LineItemView extends Backbone.View
    tagName: "tr"
    className: ""
    id: ""
    
    initialize: ->
      @model.bind('change', @render)
      @model.view = @
    
    render: =>
      line_item = @model.toJSON()
      ($ @el).html(ich.line_item_template(line_item))
      @
  
  # Application View
  class window.AppView extends Backbone.View
    el: ($ "body.appointments")
    
    initialize: ->
      LineItems.bind('add', @addOne)
      # LineItems.bind('refresh', @addAll)
      LineItems.bind('all', @render)
      
      LineItems.fetch()
      
    addOne: (line_item) =>
      view = new LineItemView({ 
        model: line_item 
        id: "line_item_#{line_item.id}"
      })
      (@$ "#line_items_table tbody").append(view.render().el)
                  
    addAll: =>
      LineItems.each(@addOne)      
    
    newAttributes: (model) ->
      line_item: {
        service_id: model.get("id")
        appointment_id: parseInt(($ "input#appointment_id").val()) # TODO
        id: model.get("id")
        name: model.get("name")
        price: model.get("price")
      }        
    
    createLineItem: (model) =>  
      params = @newAttributes(model)
      LineItems.create(params)
    
  window.App = new AppView
    