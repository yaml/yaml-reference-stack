class Util
  say: (m)-> console.log(m)

  xxx: (o...)->
    for e in o
      console.dir(e, {depth: 10})
    process.exit(1)

  www: (o...)->
    for e in o
      console.dir(e, {depth: 10})
    return o[0]

  error: (msg)->
    throw "YAML Error: '#{msg}'"

  keys: (o=@)->
    Object.keys(o)

for f in ['say', 'xxx', 'www']
  global[f] = Util::[f]

module?.exports = Util
