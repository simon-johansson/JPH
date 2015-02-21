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

  functionCall_1 = 'rand(10)'
  describe functionCall_1, ->
    html = generateHTML template functionCall_1
    result = eval(functionCall_1)
    jsdom html: html, src: [jquery]

    it 'Should generate an array with 0-10 items', ->
      expect($('h1')).to.have.length.within 0, 10
      expect(result).to.be.instanceof Array
      expect(result).to.have.length.within 0, 10

    it 'Should generate an array with ascending numbers starting from 0', ->
      result.forEach (el, i) ->
        expect(el).to.have.eql i
      $('h1').each (i, el) ->
        expect(parseInt $(el).html()).to.have.eql i

  functionCall_2 = 'rand(20, 55)'
  describe functionCall_2, ->
    html = generateHTML template functionCall_2
    result = eval(functionCall_2)
    jsdom html: html, src: [jquery]

    it 'Should generate 20-50 <h1> tags', ->
      expect(result).to.have.length.within 20, 55
      expect($('h1')).to.have.length.within 20, 55

  functionCall_3 = 'rand(4, 4)'
  describe functionCall_3, ->
    html = generateHTML template functionCall_3
    result = eval(functionCall_3)
    jsdom html: html, src: [jquery]

    it 'Should generate an array with exactly 4 items', ->
      expect(result).to.have.length 4
      expect($('h1')).to.have.length 4
