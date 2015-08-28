expect = require("chai").expect
jade = require 'jade'
fs = require "fs"
# jquery = fs.readFileSync "#{__dirname}/../jquery.js", "utf-8"
jsdom = require 'mocha-jsdom'

path = "#{__dirname}/lorem.spec.jade"
html = jade.renderFile path, { pretty: true }

describe 'lorem mixin', ->

  describe '+lorem(25, false)', ->
    jsdom(html: html, src: [jquery])
    it 'Should create 25 random words', (done) ->
      $el = $('#t1')
      expect($el.html().split(" ").length).to.be.eql(25)
      done()
