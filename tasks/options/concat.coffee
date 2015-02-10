module.exports = dist:
  options: {}
  src: [
    'lib/intro.jade'
    '.tmp/vendor.min.js'
    '.tmp/lib.min.js'
    'lib/outro.jade'
    'lib/mixins/**/*.jade'
    '!lib/mixins/**/*.spec.jade'
  ]
  dest: 'JPH.jade'
