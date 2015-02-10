expect = require("chai").expect
jade = require 'jade'
fs = require "fs"
jquery = fs.readFileSync "#{__dirname}/../jquery.js", "utf-8"
jsdom = require 'mocha-jsdom'

path = "#{__dirname}/times.spec.jade"
html = jade.renderFile path, { pretty: true }

describe 'times mixin', ->

  describe ['+times(5)',
              'h1 Give me five!'].join('\n\t'), ->

    jsdom(html: html, src: [jquery])

    it 'Should create 5 <h1> tags', (done) ->
      expect($('h1').length).to.be.eql(5)
      done()

  describe ['+times(0)',
              'h2 Nope...'].join('\n\t'), ->

    jsdom(html: html, src: [jquery])

    it 'Should not create any <h2> tags', (done) ->
      expect($('h2').length).to.be.eql(0)
      done()
