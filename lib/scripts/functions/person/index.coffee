faker = require 'faker'

person = ->
  faker.helpers.createCard()

people = (howmany) ->
  for [1..howmany] then person()


module.exports = {
  person: person,
  people: people,
}
