module.exports = function(grunt) {
  grunt.registerTask('dev', [
    'clean', // cleans .tmp folder
    'coffeelint', // lints the .coffee files
    'browserify:vendor', // bundles the external dependencies
    'browserify:lib', // bundles the lib, converts .coffee to .js and watch for changes
    'uglify', // minifys and uglifys main .js file
    'file_append', // prepends "- " before each line of code in the minified .js file
    'concat', // concats the jadeified .js file and mixins into JPH.jade
    'express:dev', // starts the dev/docs server
    'wait', // wait 1.5sec for server to start before browser window opens
    'watch', // watch for changes, then compiles lib alt. livereload the browser
  ]);
};
