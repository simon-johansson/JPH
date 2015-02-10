module.exports = (grunt) ->
  # Used for delaying livereload until after server has restarted
  grunt.registerTask 'wait', ->
    grunt.log.ok 'Waiting for server reload...'
    done = @async()
    setTimeout ->
      grunt.log.writeln 'Done waiting!'
      done()
    , 1500
