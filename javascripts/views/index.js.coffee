class DCE.Views.Index extends Backbone.View
  template: JST['templates/index']

  events: {
    "click #js-submit": "submit"
  }

  submit: ->
    # Create data objects
    submitted = @$('textarea').val()
    lines = submitted.split(/\n/)
    # heading = lines[0].split(',')

    # sets = {
    #   '1': [
    #     DCE.Models.Alternative
    #   ]
    # }
    sets = {}

    # Column 0: Set name
    # Column 1: Alternative name
    # Columns 2-n: Attributes
    for line in lines[1..]
      cells = line.split(',')

      attrs = new DCE.Collections.Attributes

      for cell in cells[2..]
        attrs.add(new DCE.Models.Attribute({slug: cell}))

      sets[cells[0]] = new DCE.Collections.AlternativeSet unless cells[0] of sets

      sets[cells[0]].add(new DCE.Models.Alternative({
        attributes: attrs
        title: cells[1]
      }))

    @$('#print').html(new DCE.Views.Print({sets: sets}).render().el).swapLanguage()

  render: ->
    $(@el).html(@template())
    @