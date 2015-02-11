faker = require 'faker'

image = faker.image.image
image.avatar = faker.image.avatar
image.imageUrl = faker.image.imageUrl
image.abstract = faker.image.abstract
image.animals = faker.image.animals
image.business = faker.image.business
image.cats = faker.image.cats
image.city = faker.image.city
image.food = faker.image.food
image.nightlife = faker.image.nightlife
image.fashion = faker.image.fashion
image.people = faker.image.people
image.nature = faker.image.nature
image.sports = faker.image.sports
image.technics = faker.image.technics
image.transport = faker.image.transport

module.exports = {
  image: image,
}
