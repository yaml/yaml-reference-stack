class Util

  error: (msg)->
    throw "YAML Error: '#{msg}'"

  keys: (o=@)->
    Object.keys o

module?.exports = Util
