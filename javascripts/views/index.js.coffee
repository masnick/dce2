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
      o = "xxx,#{counter},#{slug}"
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

        for cell in cells[3..]
          attrs.add(new DCE.Models.Attribute({slug: cell}))

        unless cells[1] of sets

          sets[cells[1]] = new DCE.Models.Set({
            alternatives: new DCE.Collections.Alternatives
            slug: line
            survey_id: line.split(',')[0]
            choice_task_id: line.split(',')[1]
          })

        alternatives = sets[cells[1]].get('alternatives')
        alternatives.add(new DCE.Models.Alternative({
          attributes: attrs
          title: cells[2]
          slugs: line
        }))

    @$('#print').html(new DCE.Views.Print({sets: sets}).render().el).swapLanguage()
    $('body').imagePlacement().centerP()

  render: ->
    $(@el).html(@template())
    @