
describe '+src', ->

  failPath = 'fail'
  directPath = 'style.css'
  nestedPath = 'nested/folder/path/script.js'

  describe "+src('#{failPath}')", ->
    it 'Should throw an error, path does not lead to .css or .js file', ->
      expect(-> generateHTML "+src('#{failPath}')" ).to.throw Error

  describe "+src('#{directPath}')", ->
    html = generateHTML "+src('#{directPath}')"
    jsdom(html: html, src: [jquery])

    it 'Should generate a <link> tag with the right src path', ->
      $el = $('link')
      expect($el).to.have.length 1
      expect($el.attr('href')).to.be.eql(directPath)

  describe "+src('#{nestedPath}')", ->
    html = generateHTML "+src('#{nestedPath}')"
    jsdom(html: html, src: [jquery])

    it 'Should generate a <script> tag with the right src path', ->
      $el = $('script')
      expect($el).to.have.length 1
      expect($el.attr('src')).to.be.eql(nestedPath)
