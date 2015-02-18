_ = require('lodash')
faker = require('faker').helpers.createCard
utils = require '../utils.coffee'

# This approach makes for a clean API, e.g 'person.name' instead of 'person().name'
# or person.name(). Drawback is that the properites are available on the prototype
# and will not show up in for example a for loop in the Jade-template unless you
# loop over person.__proto__ (see tests)

extend = (obj) ->
  _.assign obj, { enumerable: true }

properties =
  'name':           (get: -> faker().name)
  'username':       (get: -> faker().username)
  'email':          (get: -> faker().email)
  'address':        (get: -> faker().address)
  'phone':          (get: -> faker().phone)
  'website':        (get: -> faker().website)
  'company':        (get: -> faker().company)
  'posts':          (get: -> faker().posts)
  'accountHistory': (get: -> faker().accountHistory)

extend properties[key] for key, val of properties

class Person
Object.defineProperties(Person::, properties)

module.exports = {
  person: new Person(),
  people: (howmany) -> for [1..howmany] then new Person(),
}
