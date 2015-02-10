expect = require("chai").expect
jade = require 'jade'
fs = require "fs"
jquery = fs.readFileSync "#{__dirname}/../jquery.js", "utf-8"
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

  describe '+lorem(25)', ->
    jsdom(html: html, src: [jquery])
    it 'Should start with "Lorem ipsum dolor sit amet." follwed by 25 random words', (done) ->
      $el = $('#t2')
      expect($el.html().split(".")[0]).to.be.eql('Lorem ipsum dolor sit amet')
      expect($el.html().split(" ").length).to.be.eql(30)
      done()
