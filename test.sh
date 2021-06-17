#!/bin/sh

cat <<'___' | coffee -s
require "ingy-prelude"

yaml = require "./lib/yaml"

object = yaml.load '''
---
foo: 'bar'
baz: [42, true, -1.23, null]
...
'''

console.dir object, {depth:10}
___
