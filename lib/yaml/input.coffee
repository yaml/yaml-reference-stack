class YamlInput
  constructor: (args)->
    if typeof(args) == 'string'
      args = string: args
    {@string, @file, @handle} = args

module?.exports = YamlInput
