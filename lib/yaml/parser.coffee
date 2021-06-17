Base = require './base'

require '../../../yaml-reference-parser/javascript/lib/parser'
require '../../../yaml-reference-parser/javascript/lib/receiver'

class YamlParser extends Base
  open: (input)->
    Reader = require './reader'
    @reader = new Reader(@config)
      .open(input)
    return @

  parse: ->
    receiver = new Receiver
    parser = new Parser(receiver)
    input = @reader.readAll()
    parser.parse(input)
    events = parser.receiver.event
    return events

module?.exports = YamlParser
