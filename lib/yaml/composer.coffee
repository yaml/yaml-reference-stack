Base = require('./base')
Dom = require('./dom')

class YamlComposer extends Base
  open: (input)->
    Parser = require('./parser')
    @parser = new Parser(@config)
      .open(input)
    return @

  compose: ->
    @dom = new Dom
    @stack = []
    for event in @parser.parse()
      method = "do_#{event.event}"
      try @[method](event)
      catch e
        if e.message == 'this[method] is not a function'
          e.message = "No YamlComposer method '#{method}'"
        throw e
    return @dom

  do_stream_start: (event)->
    @push @dom.stream
    return

  do_stream_end: (event)->
    @pop()
    return

  do_document_start: (event)->
    @push @add new Dom.Document
    return

  do_document_end: (event)->
    @pop()
    return

  do_mapping_start: (event)->
    @push @add new Dom.Mapping
    return

  do_mapping_end: (event)->
    @pop()
    return

  do_sequence_start: (event)->
    @push @add new Dom.Sequence
    return

  do_sequence_end: (event)->
    @pop()
    return

  do_scalar: (event)->
    node = @add new Dom.Value(event.value)
    if event.style != 'plain'
      node.string = true
    return

  push: (o)->
    @stack.push(o)
    return

  pop: ->
    @stack.pop()
    return

  add: (o)->
    try @stack[@stack.length - 1].add(o)
    catch e
      ccc @stack[@stack.length - 1]
      throw "#{o.constructor.name} has no method 'add'\n#{e}"
    return o

module?.exports = YamlComposer
