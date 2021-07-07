#!/bin/sh

coffee -s <<'___'
yaml = require "./lib/yaml"

yaml.constructor::xxx yaml.load '''
---
foo: 'bar'
baz: [42, true, -1.23, null]
...
'''
___
