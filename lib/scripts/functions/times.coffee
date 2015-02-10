_ = require 'lodash'

times = (times) ->
  _.range 1, times + 1

module.exports = {
  times: times
}
