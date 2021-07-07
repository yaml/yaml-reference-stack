Base = require('./base')

class YamlConstructor extends Base
  open: (input)->
    Composer = require('./composer')
    @composer = new Composer(@config)
      .open(input)
    @schema = @config.loadSchema()
    @library = @config.loadLibrary()
    return @

  next: ->
    @dom ?= @composer.compose()

    if @doc?
      @doc = @doc.nextDocument()
    else
      @doc = @dom.stream.firstDocument()

    if not @doc?
      return  # undefined

    return @constructNode(@doc.node, @schema.root)

  kind:
    Mapping: 'Map'
    Sequence: 'Seq'
    Value: 'Val'

  constructNode: (node, type)->
    [type, error] = @schemaInfoForNode(node, type)
    kind = @kind[node.constructor.name]
    switch kind
      when 'Map' then @constructMapping(node, type)
      when 'Seq' then @constructSequence(node, type)
      when 'Val' then @constructValue(node, type)
      else throw kind

  constructMapping: (node, type)->
    mapping = {}
    for pair in node.pair
      [keyType, valType, error] = @schemaInfoForPair(pair)
      key = @constructNode(pair.key, keyType)
      val = @constructNode(pair.value, valType)
      mapping[key] = val
    return mapping

  constructSequence: (node, type)->
    sequence = []
    for elem in node.list
      sequence.push(@constructNode(elem))
    return sequence

  constructValue: (node, type)->
    value = node.value
    if value.match /^-?\d+$/
      value = Number(value)
    else if value.match /^-?\d+\.\d+$/
      value = parseFloat(value)
    else if value == 'true'
      value = true
    else if value == 'false'
      value = false
    else if value == 'null'
      value = null
    return value

  constructString: (node, type)->
    return node.value

  schemaInfoForNode: (node, type)-> []

  schemaInfoForPair: -> []

module?.exports = YamlConstructor
