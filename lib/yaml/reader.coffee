Base = require './base'

class YamlReader extends Base
  open: (@input)->
    return @

  readAll: ->
    if not @input.string?
      xxx ["Can't read", @input]
    return @input.string

module?.exports = YamlReader

