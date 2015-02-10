_ = require 'lodash'
faker = require 'faker'
lorem = require '../data/lorem.json'


global._ = _
global.faker = faker

class LoremIpsum
  constructor: ->
    @words = lorem.words
    @len = @words.length
  getWord: ->
    _.sample @words

class PropertyCollision extends Error
  constructor: (key, scope) ->
    @name = 'PropertyCollision'
    @message = "'#{key}' already exists in the #{scope} scope"
    super

makeGlobal = (key, val) ->
  # if global[key]?
    # throw new PropertyCollision key, 'global'
  global[key] = val

log = (key, val) ->
  console.log(key, val)

# fakers = _.assign(faker.name, faker.address, faker.internet, faker.phone)
# makeGlobal key, val for key, val of fakers

fakerProps = [
  'name',
  'address',
  'internet',
  'phone',
  'company',
  'image',
  'lorem',
  'helpers',
  'date',
  'random',
  'finance',
  'hacker'
]

for prop in fakerProps
  makeGlobal prop, faker[prop]

lodashProps = [
  'range',
  'shuffle',
  'capitalize',
  'trunc',
  'sample',
  'random',
  'includes'
]

for prop in lodashProps
  makeGlobal prop, _[prop]

global.LoremIpsum = LoremIpsum

JPH.person = -> global.faker.helpers.createCard()
JPH.people = (howmany) -> for [1..howmany] then person()

global.times = (times) -> _.range 1, times + 1
global.rand = (min, max) -> _.range _.random(min, max)
global.alts = (alts) -> _.random 1, alts

global._ = _
global.faker = faker

global.help = [
    ["+image() Great mixin"]
]
