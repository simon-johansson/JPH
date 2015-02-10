expect = require("chai").expect
jade = require 'jade'
fs = require "fs"
jquery = fs.readFileSync "#{__dirname}/../jquery.js", "utf-8"
jsdom = require 'mocha-jsdom'

path = "#{__dirname}/maybe.spec.jade"
html = jade.renderFile path, { pretty: true }

describe 'maybe mixin', ->

  describe [
        'for(var i = 0; i <= 100; i++)',
          '+maybe',
            '   h1 Maybe... just maybe.'].join('\n\t'), ->
    jsdom(html: html, src: [jquery])
    it 'Should create ~50 elements', (done) ->
      expect($('h1').length).to.be.within(5, 95);
      done()
