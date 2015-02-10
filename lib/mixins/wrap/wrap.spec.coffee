expect = require("chai").expect
jade = require 'jade'
fs = require "fs"
jquery = fs.readFileSync "#{__dirname}/../jquery.js", "utf-8"
jsdom = require 'mocha-jsdom'

describe 'wrap mixin', ->
  describe '+wrap("li", [1,2,3,4,5,6,7,8,9]).test-class', ->
    path = "#{__dirname}/wrap.spec.jade"
    html = jade.renderFile path, { pretty: true }

    jsdom(html: html, src: [jquery])

    it 'Should create 9 <li> tags', (done) ->
      expect($('.test-class').prop("tagName")).to.be.eql('LI')
      expect($('li').length).to.be.eql(9)
      done()

    it 'Should wrap the items in the correct order', (done) ->
      for index in [0..8]
        expect($('li').eq(index).html()).to.be.eql("#{index + 1}")
      done()
