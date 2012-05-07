class DCE.Views.Print extends Backbone.View
  template: JST['templates/print']

  initialize: (options) ->
    @attribute_sets = options.sets

  render: ->
    $(@el).html(@template())
    for id, set of @attribute_sets
      @$('#dce-sets').append(new DCE.Views.PrintSet({collection: set}).render().el)

    @