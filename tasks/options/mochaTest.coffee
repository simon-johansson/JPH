module.exports =
  scripts:
    options:
      reporter: 'spec'
      quiet: false
      clearRequireCache: true
      require: [
        'coffee-script/register'
        'test/globals.js'
      ]
    src: [ 'lib/scripts/**/*.spec.coffee' ]
  mixins:
    options:
      reporter: 'spec'
      quiet: false
      clearRequireCache: true
      require: [
        'coffee-script/register'
        'test/globals.js'
      ]
    src: [ 'lib/mixins/**/*.spec.coffee' ]
  test:
    options:
      reporter: 'spec'
      quiet: false
      clearRequireCache: true
      require: [
        'coffee-script/register'
        'test/globals.js'
      ]
    src: [ 'lib/mixins/blokk/*.spec.coffee' ]
