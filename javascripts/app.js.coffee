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

$.fn.imagePlacement = () ->
  $img = this.find('.dce-alternative:nth-child(2) img')
  if $img.hasClass('left-image')
    $img.removeClass('left-image')
  else
    $img.addClass('left-image')

$.fn.centerP = () ->
  this.find('.dce-attribute p').each( (i, elem) ->
    $elem = $(elem)
    height = $elem.height()
    $elem.css('margin-top', (100 - height)/2)
  )


$ ->
  $('body').append('<div id="dce"></div>') # Need a place to put stuff.
  window.router = new DCE.Routers.Router()
  Backbone.history.start()

  $('.js-swap-language').click( (e) ->
    lang = $(e.currentTarget).data('swap-language')
    $('body').swapLanguage(lang)
  )

  $('.js-image-placement').click( (e) ->
    $('body').imagePlacement()
    return false
  )

  $('.js-center-p').click( ->
    $('body').centerP()
    return false

  )

