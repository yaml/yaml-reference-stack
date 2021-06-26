Util = require('./util')

class YamlConfig extends Util
  @keys: [
    'version'
    'feature'
    'schema'
    'library'
  ]

  constructor: (config={})->
    super()
    @update(config)

    @version ?= '1.2'
    @feature ?= []
    @schema ?= 'Core12'
    @library ?= 'StdLib'

  set: (k, v)->
    name = k.replace /^constructor$/, 'constructor_'
    @error "Invalid config key '#{k}'" \
      unless name in YamlConfig.keys
    @[name] = v

  update: (o)->
    for k, v of o
      @set(k, v)

  loadSchema: ->
    if typeof(@schema) == 'string'
      Schema = require("./schema/#{@schema.toLowerCase()}")
      return new Schema

  loadLibrary: ->
    if typeof(@library) == 'string'
      Library = require("./#{@library.toLowerCase()}")

module?.exports = YamlConfig
