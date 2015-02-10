module.exports = (grunt) ->
  grunt.registerTask 'custom', 'Say hello!', ->
    grunt.log.writeln "Custom task log"
