module.exports = (grunt) ->
  grunt.registerTask 'build', [
    'clean' # cleans .tmp folder
    'coffeelint:build' # lints the .coffee files
    'browserify:vendor' # bundles the external dependencies
    'browserify:lib' # bundles the lib, converts .coffee to .js and watch for changes
    'uglify' # minifys and uglifys main .js file
    'file_append' # prepends "- " before each line of code in the minified .js file
    'concat' # concats the jadeified .js file and mixins into JPH.jade
    # run tests
  ]
