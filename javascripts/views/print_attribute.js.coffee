class DCE.Views.PrintAttribute extends Backbone.View
  template: JST['templates/print_attribute']
  className: 'dce-attribute'

  initialize: ->
    _.bindAll(@, 'render')
    @model.bind('change', @render)

    $('.js-swap-language').on('click', (e) =>
      lang = $(e.currentTarget).data('swap-language')
      @swapLanguage(lang)
    )

  swapLanguage: (lang) ->
    @model.swapLanguage(lang)

  render: ->
    $(@el).html(@template(@model.toJSON()))

    @