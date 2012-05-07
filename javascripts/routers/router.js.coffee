# Alternative is the entire column
# Attribute is a cell in the column
# Level is one of the options for an attribute

class DCE.Routers.Router extends Backbone.Router
  initialize: (options) ->

  routes:
    ".*" : "index"

  index: ->
    view = new DCE.Views.Index()
    $("#dce").html(view.render().el)