class YamlInput
  constructor: (args)->
    args = string: args if typeof(args) == 'string'
    {@string, @file, @handle} = args

module?.exports = YamlInput
