
imports = [
  (require('../errors.coffee')),
  (require('../log.coffee')),
  # mixins utilities
  (utils = require('./utils.coffee')),
  # helper functions
  (require('./lodash.coffee')),
  (require('./rand/index.coffee')),
  (require('./times/index.coffee')),
  # random data generation
  (require('./faker.coffee')),
  (require('./image/index.coffee')),
  (require('./person/index.coffee')),
]

JPH['faker'] = require 'faker'

# make all imports available on the global JPH object
for obj, index in imports
  for key, val of obj
    if JPH[key]?
      throw new Error "Trying to override property #{key} of JPH"
    JPH[key] = val

