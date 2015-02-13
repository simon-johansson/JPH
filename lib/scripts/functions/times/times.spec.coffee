times = require('./').times

generateHTML = (functionCall) ->
  jadeCode = """
    include /JPH.jade

    each index in #{functionCall}
      h1= index
  """
  jade.render jadeCode, { basedir: baseDir, pretty: true }

describe 'times', ->

  describe 'times(10)', ->
    html = generateHTML 'times(10)'
    result = times(10)
    jsdom(html: html, src: [jquery])

    it 'Should generate an array with exactly 10 items', ->
      expect($('h1')).to.have.length(10)
      expect(result).to.be.instanceof(Array)
      expect(result).to.have.length(10)

    it 'Should generate an array with ascending numbers starting from 0', ->
      result.forEach (el, i) ->
        expect(el).to.have.eql(i)
      $('h1').each (i, el) ->
        expect(parseInt $(el).html()).to.have.eql(i)
