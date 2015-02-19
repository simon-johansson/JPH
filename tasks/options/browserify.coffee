external = [
  'faker'
  'lodash'
]
src = [
  'lib/scripts/**/*.coffee',
  '!lib/scripts/functions/**/*.spec.coffee',
]

module.exports =

  vendor:
    src: []
    dest: '.tmp/vendor.js'
    options: require: [
      'faker'
      'lodash'
    ]

  lib:
    src: src
    dest: '.tmp/lib.js'
    options:
      transform: [ 'coffeeify' ]
      external: external

  libWatch:
    src: src
    dest: '.tmp/lib.js'
    options:
      transform: [ 'coffeeify' ]
      external: external
      watch: true
