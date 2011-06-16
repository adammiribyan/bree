jQuery ->
  # Model
  class window.LineItem extends Backbone.Model
    url: -> if @id then "/line_items/#{@id}" else "/line_items"    