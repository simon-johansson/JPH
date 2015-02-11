module.exports =
  dist:
    options: {}
    src: [
      'lib/scripts/intro.jade'
      '.tmp/vendor.min.js'
      '.tmp/lib.min.js'
      'lib/scripts/outro.jade'
      'lib/mixins/**/*.jade'
      '!lib/mixins/**/*.spec.jade'
    ]
    dest: 'JPH.jade'
