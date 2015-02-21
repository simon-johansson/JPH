
template = (functionCall) ->
  """
    #{functionCall}
      h1 Test
  """

describe 'rand mixin', ->

  describe '+rand', ->
    it 'Should throw an error if no arguments are passed', ->
      expect(-> generateHTML template '+rand' ).to.throw 'Usage Error'

  functionCall_1 = '+rand(20, 50)'
  describe functionCall_1, ->
    html = generateHTML template functionCall_1
    jsdom html: html, src: [jquery]

    it 'Should create 20-50 blocks', ->
      expect($('h1').length).to.be.within 20, 50

  functionCall_2 = '+rand(10)'
  describe functionCall_2, ->
    html = generateHTML template functionCall_2
    jsdom html: html, src: [jquery]

    it 'Should create 0-10 blocks', ->
      expect($('h1').length).to.be.within 0, 10
