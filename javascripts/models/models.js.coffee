class DCE.Models.Attribute extends Backbone.Model

  initialize: (options) ->
    # English is default
    options.language = 'en' unless 'language' of options
    if 'slug' of options
      captures = options.slug.match(/([A-Z]+)([0-9]+)/)

      unless captures[1] of DCE.Content
        alert("Unknown attribute: #{captures[1]}")
        return false
      unless captures[2] of DCE.Content[captures[1]]
        alert("Unknown level for #{captures[1]}: #{captures[2]}")
        return false

      raw_content = DCE.Content[captures[1]][captures[2]]
      @set({'raw_content': raw_content})
      @set(raw_content['default'])
      @set(raw_content[options.language])

  swapLanguage: (language) ->
    @set(@get('raw_content').default, {silent: true})
    @set(@get('raw_content')[language], {silent: true})
    @change()

class DCE.Collections.Attributes extends Backbone.Collection
  model: DCE.Models.Attribute

class DCE.Models.Alternative extends Backbone.Model

class DCE.Collections.Alternatives extends Backbone.Collection
  model: DCE.Models.Alternative

class DCE.Models.Set extends Backbone.Model