module.exports =
  options: livereload: true
  scripts:
    files: [ '.tmp/lib.js' ]
    tasks: [
      'coffeelint'
      'uglify'
      'file_append'
      'concat'
    ]
    options: spawn: false
  jade:
    files: [
      'lib/**/*.jade'
      '!lib/mixins/**/*.spec.jade'
    ]
    tasks: [ 'concat' ]
    options: spawn: false
  livereload:
    files: [ 'docs/**/*.{jade,js,less}' ]
    options: spawn: false
  express:
    files: [
      'docs/*.js'
      'docs/routes/*.js'
    ]
    tasks: [
      'express:dev'
      'wait'
    ]
    options:
      livereload: true
      nospawn: true
