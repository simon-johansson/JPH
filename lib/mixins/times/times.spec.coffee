
template = (functionCall) -> """
  ul
    #{functionCall}
      h1 Give me five!
"""

describe 'times mixin', ->

  functionCall_1 = '+times(5)'
  describe functionCall_1, ->
    html = generateHTML template functionCall_1
    jsdom(html: html, src: [jquery])

    it 'Should create 5 <h1> tags', ->
      expect($('h1').length).to.be.eql 5

  functionCall_2 = '+times(0)'
  describe functionCall_2, ->

    html = generateHTML template functionCall_2
    jsdom(html: html, src: [jquery])

    it 'Should not create any <h2> tags', ->
      expect($('h1').length).to.be.eql 0
