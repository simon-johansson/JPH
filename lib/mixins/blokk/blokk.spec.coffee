
generateHTML = (functionCall) ->
  jadeCode = """
    include /JPH.jade
    #{functionCall}
  """
  jade.render jadeCode, { basedir: baseDir, pretty: true }

describe 'blokk mixin', ->

  describe '+blokk(25)', ->
    html = generateHTML('+blokk(25)')
    jsdom(html: html, src: [jquery])
    it 'Should create 25 <blokk> tags', ->
      $el = $('#t1')
      expect($('blokk').length).to.be.eql(25)

  describe '+blokk(25, "#87ffb8")', ->
    html = generateHTML('+blokk(25, "#87ffb8")')
    jsdom(html: html, src: [jquery])
    it 'Should create blokks in the right (#87ffb8) color', ->
      attrs = $('blokk').first().attr('style')
      expect(attrs).to.contain('#87ffb8')
