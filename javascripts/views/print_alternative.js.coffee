class DCE.Views.PrintAlternative extends Backbone.View
  template: JST['templates/print_alternative']
  className: 'dce-alternative'

  render: ->
    $(@el).html(@template(@model.toJSON()))
    for attribute in @model.get('attributes').models
      @$('.dce-attributes').append(new DCE.Views.PrintAttribute({model: attribute}).render().el)

    @
