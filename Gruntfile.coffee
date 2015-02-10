module.exports = (grunt) ->

  loadConfig = (path) ->
    glob = require 'glob'
    obj = {}
    glob.sync('*', {cwd: path}).map (option) ->
      key = option.replace(/\.coffee$/,'')
      obj[key] = require(path + option)
    obj

  config =
    pkg: grunt.file.readJSON('package.json')

  grunt.loadTasks('tasks')
  grunt.util._.extend(config, loadConfig('./tasks/options/'))
  grunt.initConfig(config)

  require('load-grunt-tasks')(grunt)
