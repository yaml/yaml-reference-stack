class Util
  xxx: (o)->
    console.dir(o, {depth: 10})
    process.exit(1)

  error: (msg)->
    throw "YAML Error: '#{msg}'"

  keys: (o=@)->
    Object.keys o

module?.exports = Util
