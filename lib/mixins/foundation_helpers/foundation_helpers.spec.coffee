
describe 'foundation mixins', ->

  describe '+cdn', ->
    html = generateHTML '+cdn'
    jsdom(html: html, src: [jquery])

    getFileNames = (tag, attr) ->
      _.toArray $(tag).map (i, el) -> $(el).attr(attr).split('/').pop()

    scripts = [
        "jquery.js",
        "fastclick.js",
        "foundation.min.js"
      ]

    styles = [
        "normalize.min.css",
        "font-awesome.min.css",
        "foundation.min.css"
      ]

    it "Should create #{scripts.length} <script> and #{styles.length} <link> tags", ->
      expect($('script')).to.have.length scripts.length
      expect($('link')).to.have.length styles.length

    it 'Should inject Foundation .js and .css files', ->

      js = getFileNames 'script', 'src'
      css = getFileNames 'link', 'href'

      expect(js).to.include.members scripts
      expect(css).to.include.members styles

  describe '+init', ->
    html = generateHTML '+init'
    jsdom(html: html, src: [jquery])

    it "Should create a <script> tag containing script that initializes foundation", ->
      $el = $('script')
      expect($el).to.have.length 1
      expect($el.html().trim()).to.be.eql "$(document).foundation();"
