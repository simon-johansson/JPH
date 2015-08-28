expect = require("chai").expect
jade = require 'jade'
fs = require "fs"
# jquery = fs.readFileSync "#{__dirname}/../jquery.js", "utf-8"
jsdom = require 'mocha-jsdom'

# ['abstract', 'animals', 'business', 'cats', 'city', 'food', 'nightlife', 'fashion', 'people', 'nature', 'sports', 'technics', 'transport']

path = "#{__dirname}/image.spec.jade"
html = jade.renderFile path, { pretty: true }

describe 'image mixin', ->

  describe '+image()', ->
    jsdom(html: html, src: [jquery])
    it 'Should generate <img> tag with random src', (done) ->
      $el = $('#t1')
      expect($el.length).to.be.eql(1)
      expect($el.prop("tagName")).to.be.eql('IMG')
      done()

  describe '+image({category: "cats", width: 1000, height: 500})', (done) ->
    jsdom(html: html, src: [jquery])
    it 'Should generate image from options object', (done) ->
      $el = $('#t2')
      expect($el.attr('src')).to.be.eql("http://lorempixel.com/1000/500/cats")
      done()

  describe '+image(200, 100, "buissnesss")', (done) ->
    jsdom(html: html, src: [jquery])
    it 'Should automatically pick another category', (done) ->
      $el = $('#t3')
      expect($el.attr('src')).to.not.contain('buissnesss')
      done()
