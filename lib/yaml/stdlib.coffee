Library = require './library'

class YamlStdLib extends Library
  @function:
    str: (str)->
      return String(str)

    int: (str)->
      return parseInt(str)

    float: (str)->
      return parseFloat(str)

    bool: (str)->
      return switch str
        when 'true' then true
        when 'false' then false
        else @error "Can't transform '#{str}' to boolean"

    null: (str)->
      return null

    import: (str)->
      throw str

    expand: (str)->
      throw str

    merge: (list)->
      throw list
