class DCE.Views.Index extends Backbone.View
  template: JST['templates/index']

  events: {
    "click #js-submit": "submit"
    "click #js-demo": "demo"
  }

  demo: ->
    output = ''
    counter = 1
    for slug, levels of DCE.Content
      o = "#{counter},#{slug}"
      for level of levels
        o += ",#{slug}#{level}"
      output += "#{o}\n#{o}\n"
      counter += 1

    @$('textarea').val(output)


  submit: ->
    # Create data objects
    submitted = @$('textarea').val()
    lines = submitted.split(/\n/)

    # sets = {
    #   '1': [
    #     DCE.Models.Alternative, ...
    #   ]
    # }
    sets = {}

    # Column 0: Set name
    # Column 1: Alternative name
    # Columns 2-n: Attributes
    for line in lines
      if line.match(/,[A-Z]+[0-9]+/)?
        cells = line.split(',')

        attrs = new DCE.Collections.Attributes

        for cell in cells[2..]
          attrs.add(new DCE.Models.Attribute({slug: cell}))

        sets[cells[0]] = new DCE.Collections.AlternativeSet unless cells[0] of sets

        sets[cells[0]].add(new DCE.Models.Alternative({
          attributes: attrs
          title: cells[1]
          slugs: line
        }))

    @$('#print').html(new DCE.Views.Print({sets: sets}).render().el).swapLanguage()

  render: ->
    $(@el).html(@template())
    @