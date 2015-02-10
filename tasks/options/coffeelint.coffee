module.exports =
  options:
    configFile: 'test/coffeelint.json'
    force: true
  lib: [
    'lib/**/*.coffee',
    'test/**/*.coffee',
    'tasks/**/*.coffee',
    '!node_modules/**/*.coffee'
  ]
