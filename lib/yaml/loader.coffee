Base = require './base'

class YamlLoader extends Base
  open: (input)->
    Constructor = require './constructor'
    @constructor_ = new Constructor(@config)
      .open(input)
    return @

  next: ->
    return @constructor_.next()

  load: ->
    object = @next()
    if object == undefined
      @error 'No YAML documents in stream'
    if @next() != undefined
      @error 'More than one YAML document in stream'
    return object

  loadAll: ->
    all = []
    while (object = @next) != undefined
      all.push(object)
    return all

module?.exports = YamlLoader
