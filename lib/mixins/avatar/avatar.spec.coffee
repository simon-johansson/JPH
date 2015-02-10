
generateHTML = (functionCall) ->
  jadeCode = """
    include /JPH.jade
    +avatar
  """
  jade.render jadeCode, { basedir: baseDir, pretty: true }

describe 'avatar mixin', ->

  describe '+avatar', ->
    html = generateHTML()
    jsdom(html: html, src: [jquery])
    it 'Should generate <img> tag with avatar from uifaces.com', ->
      $el = $('img')
      expect($el.length).to.be.eql(1)
      expect($el.attr('src')).to.contain('uifaces')
