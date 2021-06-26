Base = require('./yaml/base')

class Yaml extends Base
  load: (@input, {@schema}={})->
    Input = require('./yaml/input')
    if not (@input instanceof Input)
      @input = new Input(@input)

    Loader = require('./yaml/loader')
    @loader = new Loader(@config)
    @loader.open(@input)

    return @loader.load()

  dump: (node...)->
    Output = require('./yaml/output')
    @output = new Output

    Dumper = require('./yaml/dumper')
    @dumper = new Dumper(@config)
    @dumper.open(@output)

    return @dumper.dumpAll(node)

  conf: (config)->
    if not config?
      return @config
    if config.constructor.name == 'YamlConfig'
      @config = config
    else
      @config.update(config)
    return @

yaml = new Yaml
yaml.YAML = Yaml

module?.exports = yaml

# vim: set sw=2:
