require('testml/bridge')
util = require('util')

class TestMLBridge extends TestML.Bridge
  load: (input)->
    yaml = require('../lib/yaml')
    yaml.load(input)

  inspect: (node)->
    text = util.inspect(node)
      .replace /\n?$/, "\n"

module.exports = TestMLBridge
