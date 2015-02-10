expect = require("chai").expect
jade = require 'jade'
fs = require "fs"
jquery = fs.readFileSync "#{__dirname}/../jquery.js", "utf-8"
jsdom = require 'mocha-jsdom'

path = "#{__dirname}/placeholder.spec.jade"
html = jade.renderFile path, { pretty: true }

describe 'placeholder mixin', ->

  describe '+placeholder', ->
    jsdom(html: html, src: [jquery])
    it 'Should create a "standard" placeholder <img> with the dimensions 100x100', (done) ->
      $el = $('#t1 img')
      expect($el.length).to.be.eql(1)
      expect($el.attr('src')).to.contain('100x100')
      expect($el.prop("tagName")).to.be.eql('IMG')
      done()

  describe '+placeholder(200)', ->
    jsdom(html: html, src: [jquery])
    it 'Should create a placeholder with the dimensions 200x200', (done) ->
      $el = $('#t2 img')
      expect($el.attr('src')).to.contain('200x200')
      done()

  describe '+placeholder(200, 500)', ->
    jsdom(html: html, src: [jquery])
    it 'Should create a placeholder with the dimensions 200x500', (done) ->
      $el = $('#t3 img')
      expect($el.attr('src')).to.contain('200x500')
      done()

  describe '+placeholder({w:313, h:666})', ->
    jsdom(html: html, src: [jquery])
    it 'Should be able to pass options argument. Expect the dimensions of the placeholder to be 313x666', (done) ->
      $el = $('#t4 img')
      expect($el.attr('src')).to.contain('313x666')
      done()

  describe '+placeholder({h:200, bg:"87ffb8", fg:#"2a0069"})', ->
    jsdom(html: html, src: [jquery])
    it 'Should be able to configure foreground and background color with options argument', (done) ->
      $el = $('#t5 img')
      expect($el.attr('src')).to.contain('200x200/87ffb8/2a0069')
      done()

  describe '+placeholder({h:200, w:500, background:"87ffb8", fgColor:"#2a0069", text: "This is a test"})', ->
    jsdom(html: html, src: [jquery])
    it 'Should be able to specify placeholder text (among other stuff) with options argument', (done) ->
      $el = $('#t6 img')
      expect($el.attr('src')).to.contain('500x200/87ffb8/2a0069&text=This+is+a+test')
      done()
