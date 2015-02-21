
describe 'avatar mixin', ->

  describe '+avatar', ->
    html = generateHTML '+avatar'
    jsdom(html: html, src: [jquery])

    it 'Should generate an <img> tag', ->
      $el = $('img')
      expect($el).to.have.length 1

    it 'src for <img> tag should point random avatar supplied by uifaces.com', ->
      $el = $('img')
      expect($el.attr('src')).to.contain 'uifaces'
