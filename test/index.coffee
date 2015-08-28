assert = require("chai").assert
lib = require "../lib/coffee/index.coffee"
jade = require 'jade'

# describe 'compile', ->
#   path = "#{__dirname}/../JPH.jade"
#   str = require('fs').readFileSync path, 'utf8'
#   fn = jade.compile str
#   it 'Lib should be compileble', ->
#     assert.doesNotThrow fn
#   it 'Lib should not output any visible HTML', ->
#     assert.equal(fn(), '')

# describe 'person()', ->
#   p = person()
#   it 'Person can be created', ->
#     assert.typeOf(p, 'object')
#   it 'Person should have some properties', ->
#     assert.property(p, 'name')
#     assert.property(p, 'username')
#     assert.property(p, 'email')
#     assert.typeOf(p.company, 'object')

# describe 'people()', ->
#   it 'People-array can be created', ->
#     peeps = people(3)
#     assert.isArray(peeps)
#     assert.lengthOf(people(3), 3)
