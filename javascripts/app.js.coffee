#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.DCE =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

$ ->
  $('body').append('<div id="dce"></div>') # Need a place to put stuff.
  window.router = new DCE.Routers.Router()
  Backbone.history.start()

