
template = (functionCall) -> """
  ul
    #{functionCall}
      p Hello
"""

describe 'wrap mixin', ->

  functionCall = "+wrap('li', [1,2,3,4,5,6,7,8,9])"

  describe functionCall, ->
    html = generateHTML template functionCall
    jsdom(html: html, src: [jquery])

    it 'Should create 9 <li> tags', ->
      expect($('li')).to.have.length 9

    it 'Should wrap the items in the correct order', ->
      $('li').each (i, el) ->
        expect(parseInt $(el).html()).to.eql i + 1
