class DCE.Views.PrintAttribute extends Backbone.View
  template: JST['templates/print_attribute']
  className: 'dce-attribute'

  render: ->
    $(@el).html(@template(@model.toJSON()))
    @