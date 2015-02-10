module.exports =
  vendor:
    src: []
    dest: '.tmp/vendor.js'
    options: require: [
      'faker'
      'lodash'
    ]
  lib:
    src: [ 'lib/scripts/functions/*.coffee' ]
    dest: '.tmp/lib.js'
    options:
      transform: [ 'coffeeify' ]
      external: [
        'faker'
        'lodash'
      ]
      watch: true
