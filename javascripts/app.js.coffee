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

$.fn.swapLanguage = (lang = 'en') ->
  this.find('[data-lang]').hide()
  this.find("[data-lang~=#{lang}]").show()

$ ->
  $('body').append('<div id="dce"></div>') # Need a place to put stuff.
  window.router = new DCE.Routers.Router()
  Backbone.history.start()

  $('.js-swap-language').click( (e) ->
    lang = $(e.currentTarget).data('swap-language')
    $('body').swapLanguage(lang)
  )

