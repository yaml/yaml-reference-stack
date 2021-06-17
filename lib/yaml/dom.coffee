class YamlDom
  constructor: ->
    @stream = new Dom.Stream
    @anchor = {}
    return

Dom = YamlDom

class Dom.Node
  constructor: ->
    [@parent] = nulls
    return

class Dom.Stream
  constructor: ->
    [@first, @last] = nulls()
    return

  firstDocument: ->
    return @first

  add: (doc)->
    if @last?
      @last.next = doc
      doc.prev = @last
      @last = doc
    else
      @first = doc
      @last = doc
    return

class Dom.Document
  add: (o)->
    @node = o
    return

  nextDocument: ->
    return @next

class Dom.Mapping
  constructor: ->
    @pair = []
    return

  add: (node)->
    if @key?
      @pair.push(new Dom.Pair(@key, node))
      delete @key
    else
      @key = node
    return

class Dom.Sequence
  constructor: ->
    @list = []
    return

  add: (node)->
    @list.push(node)
    return

class Dom.String
  constructor: (node)->
    @value = node
    return

class Dom.Value
  constructor: (node)->
    @value = node
    return

class Dom.Pair
  constructor: (@key, @value)->
    return

class Dom.Alias
  constructor: (@name)->
    return

nulls = -> [null, null, null, null]

module?.exports = YamlDom
