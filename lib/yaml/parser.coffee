Base = require('./base')

# XXX Need to use a version from npm
require('../../.parser/javascript/lib/parser')
require('../../.parser/javascript/lib/receiver')

class YamlParser extends Base
  open: (input)->
    Reader = require('./reader')
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
