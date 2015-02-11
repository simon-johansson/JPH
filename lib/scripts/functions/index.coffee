
imports = [
  (require('./rand/index.coffee')),
  (require('./lodash.coffee')),
  (require('./faker.coffee')),
  (require('./image/index.coffee')),
  (require('./times/index.coffee')),
  (require('./person/index.coffee')),
]

for obj, index in imports
  for key, val of obj
    if JPH[key]?
      console.log 'current import index', index
      console.log 'overriding:', JPH[key]
      console.log 'with:', val
      throw new Error "Trying to override property #{key} of JPH"
    JPH[key] = val

