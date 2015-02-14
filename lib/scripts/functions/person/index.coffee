faker = require('faker').helpers.createCard

# Function::property = (prop, desc) ->
#   Object.defineProperty @prototype, prop, desc

Function::getters = (props) ->
  for key, val of props
    Object.defineProperty @prototype, key, val

# Function::getter = (prop, get) ->
#   Object.defineProperty @prototype, prop, {get, configurable: yes}

# defineProperty = (obj, prop, val) ->
#   Object.defineProperty obj, prop,
#     enumerable: true
#     get: -> val

class Person
  @getters
    'name':           {get: (-> faker().name), enumerable: true}
    'username':       {get: (-> faker().username), enumerable: true}
    'email':          {get: (-> faker().email), enumerable: true}
    'address':        {get: (-> faker().address), enumerable: true}
    'phone':          {get: (-> faker().phone), enumerable: true}
    'website':        {get: (-> faker().website), enumerable: true}
    'company':        {get: (-> faker().company), enumerable: true}
    'posts':          {get: (-> faker().posts), enumerable: true}
    'accountHistory': {get: (-> faker().accountHistory), enumerable: true}

# p = new Person()
# console.log p.__proto__
# console.log p.name
# console.log p.name

module.exports = {
  person: new Person(),
  people: (howmany) -> for [1..howmany] then new Person(),
}
