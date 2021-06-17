Util = require './util'
Config = require './config'

class Base extends Util
  constructor: (config={})->
    super()
    @config = config
    if not (@config instanceof Config)
      @config = new Config @config

module?.exports = Base
