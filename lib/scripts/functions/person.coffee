faker = require 'faker'

person = ->
  faker.helpers.createCard()

module.exports = {
  person: person,
}
