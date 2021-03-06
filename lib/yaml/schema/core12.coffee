Schema = require '../schema'

class Schema.Core12 extends Schema
  root: '+node'

  type:
    '+node':
      any1: [ '+str', '+val', '+map', '+list' ]

    '+value':
      kind: 'Val'
      case: [
        like: /^(|~|null|Null|NULL)/
        func: 'null'
       ,
        like: /^(true|True|TRUE|false|False|FALSE)$/
        func: 'bool'
       ,
        like: /^[-+]?[0-9]+$/
        func: 'int'
       ,
        like: /^0o[0-7]+$/
        func: 'base8'
       ,
        like: /^0x[0-9a-fA-F]+$/
        func: 'base16'
       ,
        like: /^[-+]?(\.[0-9]+|[0-9]+(\.[0-9]*)?)([eE][-+]?[0-9]+)?$/
        func: 'float'
       ,
        like: /^[-+]?(\.inf|\.Inf|\.INF)$/
        func: 'inf'
       ,
        like: /^(\.nan|\.NaN|\.NAN)$/
        func: 'nan'
      ]

    '+str': kind: 'Str'

    '+map':
      kind: 'Map'
      pair: [
        ['+str', '+node']
      ]

    '+list':
      kind: 'Seq'
      list: '+node'

module?.exports = Schema.Core12

