{ rand } = require('./')

template = (functionCall) ->
  """
    each index in #{functionCall}
      h1= index
  """

describe 'rand', ->

  describe 'rand()', ->

    it 'Should throw an error, no arguments are passed', ->
      expect(-> generateHTML template 'rand()' ).to.throw Error
      expect(-> rand()).to.throw Error

  describe 'rand(10)', ->
    html = generateHTML template 'rand(10)'
    result = rand 10
    jsdom(html: html, src: [jquery])

    it 'Should generate an array with 0-10 items', ->
      expect($('h1')).to.have.length.within 0, 10
      expect(result).to.be.instanceof Array
      expect(result).to.have.length.within 0, 10

    it 'Should generate an array with ascending numbers starting from 0', ->
      result.forEach (el, i) ->
        expect(el).to.have.eql i
      $('h1').each (i, el) ->
        expect(parseInt $(el).html()).to.have.eql i

  describe 'rand(20, 55)', ->
    html = generateHTML template 'rand(20, 50)'
    result = rand 20, 50
    jsdom(html: html, src: [jquery])

    it 'Should generate 20-50 <h1> tags', ->
      expect(result).to.have.length.within 20, 50
      expect($('h1')).to.have.length.within 20, 50

  describe 'rand(4, 4)', ->
    html = generateHTML template 'rand(4, 4)'
    result = rand 4, 4
    jsdom(html: html, src: [jquery])

    it 'Should generate an array with exactly 4 items', ->
      expect(result).to.have.length 4
      expect($('h1')).to.have.length 4
