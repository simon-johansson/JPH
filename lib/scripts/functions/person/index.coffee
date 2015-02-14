faker = require('faker').helpers.createCard

Function::property = (prop, desc) ->
  Object.defineProperty @prototype, prop, desc

class Person
  @property 'name', get: -> faker().name
  @property 'username', get: -> faker().username
  @property 'email', get: -> faker().email
  @property 'address', get: -> faker().address
  @property 'phone', get: -> faker().phone
  @property 'website', get: -> faker().website
  @property 'company', get: -> faker().company
  @property 'posts', get: -> faker().posts
  @property 'accountHistory', get: -> faker().accountHistory

# p = new Person()
# console.log p.email
# console.log p.name
# console.log p.email

person = new Person()
people = (howmany) ->
  for [1..howmany] then person()

module.exports = {
  person: person,
  people: people,
}
