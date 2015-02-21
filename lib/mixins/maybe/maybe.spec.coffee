
template =
  """
    - for(var i = 0; i <= 100; i++) {
      +maybe
        h1 Maybe... just maybe.
    - }
  """

describe 'maybe mixin', ->

  describe '+maybe', ->
    html = generateHTML template
    jsdom html: html, src: [jquery]

    it 'Should create ~50 blocks when runned 100 times', ->
      expect($('h1').length).to.be.within 5, 95
