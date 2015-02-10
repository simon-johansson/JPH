person = require './person.coffee'

people = (howmany) ->
  for [1..howmany] then person.person()

module.exports = {
  people: people,
}
