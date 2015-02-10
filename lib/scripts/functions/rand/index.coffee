_ = require 'lodash'

rand = (min = 0, max) ->
  unless min or max then throw new Error 'At least one argument'
  _.range _.random(min, max)

module.exports = {
  rand: rand
}
