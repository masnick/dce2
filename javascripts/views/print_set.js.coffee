class DCE.Views.PrintSet extends Backbone.View
  template: JST['templates/print_set']
  className: 'dce-set'

  render: ->
    $(@el).html(@template())
    for alternative in @collection.models
      @$('.dce-alternatives').append(new DCE.Views.PrintAlternative({model: alternative}).render().el)
    @$('.dce-alternatives').append('<div style="clear: both;"></div>')

    @
