
imports = [
  (require('./lodash.coffee')),
  (require('./faker.coffee')),
  (require('./rand/index.coffee')),
  (require('./times/index.coffee')),
]

# make all imports available on the global JPH object
for obj, index in imports
  for key, val of obj
    if JPH[key]?
      throw new Error "Trying to override property #{key} of JPH"
    JPH[key] = val

