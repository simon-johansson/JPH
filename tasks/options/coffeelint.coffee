files = [
  'lib/**/*.coffee',
  'test/**/*.coffee',
  'tasks/**/*.coffee',
  '!node_modules/**/*.coffee'
]

module.exports =
  options:
    configFile: 'test/coffeelint.json'
  dev:
    options:
      force: true
    files: src: files
  build:
    files: src: files
