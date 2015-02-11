_ = require 'lodash'

rand = (min = 0, max) ->
  unless min or max then throw new Error 'Pass at least one argument to "rand"'
  _.range _.random(min, max)

module.exports = {
  rand: rand
}
