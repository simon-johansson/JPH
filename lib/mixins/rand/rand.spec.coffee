
generateHTML = (functionCall) ->
  jadeCode = """
    include /JPH.jade
    #{functionCall}
      h1 Test
  """
  jade.render jadeCode, { basedir: baseDir, pretty: true }

describe 'rand mixin', ->

  describe '+rand', ->
    it 'Should throw an error if no arguments are passed', ->
      expect(-> generateHTML('+rand')).to.throw('Usage Error')

  describe '+rand(20, 50)', ->
    html = generateHTML('+rand(20, 50)')
    jsdom(html: html, src: [jquery])

    it 'Should create 20-50 blocks', ->
      expect($('h1').length).to.be.within(20, 50)

  describe '+rand(10)', ->
    html = generateHTML('+rand(10)')
    jsdom(html: html, src: [jquery])

    it 'Should create 0-10 blocks', ->
      expect($('h2').length).to.be.within(0, 10)
