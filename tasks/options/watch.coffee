module.exports =

  options:
    livereload: true
    spawn: false

  scripts:
    files: [ '.tmp/lib.js' ]
    tasks: [
      'uglify'
      'file_append'
      'concat'
    ]

  jade:
    files: [
      'lib/**/*.jade'
      '!lib/mixins/**/*.spec.jade'
    ]
    tasks: [ 'concat' ]

  livereload:
    files: [ 'docs/**/*.{jade,js,less}' ]

  express:
    files: [
      'docs/*.js'
      'docs/routes/*.js'
    ]
    tasks: [
      'express:dev'
      'wait'
    ]
    options: nospawn: true

  tests:
    files: ['lib/**/*.spec.coffee']
    tasks: ['mochaTest:test']
