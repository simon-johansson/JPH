
template = (functionCall) ->
  """
  #{functionCall}
  """

describe 'placeholder mixin', ->

  functionCall_1 = '+placeholder'
  describe functionCall_1, ->
    html = generateHTML template functionCall_1
    jsdom html: html, src: [jquery]

    it 'Should create a "standard" placeholder <img> with the dimensions 100x100', ->
      expect($('img').length).to.be.eql 1
      expect($('img').attr 'src' ).to.contain '100x100'
      expect($('img').prop "tagName" ).to.be.eql 'IMG'

  functionCall_2 = '+placeholder(200)'
  describe functionCall_2, ->
    html = generateHTML template functionCall_2
    jsdom html: html, src: [jquery]

    it 'Should create a placeholder with the dimensions 200x200', ->
      expect($('img').attr 'src' ).to.contain '200x200'

  functionCall_3 = '+placeholder(200, 500)'
  describe functionCall_2, ->
    html = generateHTML template functionCall_3
    jsdom html: html, src: [jquery]

    it 'Should create a placeholder with the dimensions 200x500', ->
      expect($('img').attr 'src' ).to.contain '200x500'

  functionCall_4 = '+placeholder({w:313, h:666})'
  describe functionCall_4, ->
    html = generateHTML template functionCall_4
    jsdom html: html, src: [jquery]

    it 'Should be able to pass options argument. Expect the dimensions of the placeholder to be 313x666', ->
      expect($('img').attr 'src' ).to.contain '313x666'

  functionCall_5 = '+placeholder({h:200, bg:"87ffb8", fg:"2a0069"})'
  describe functionCall_5, ->
    html = generateHTML template functionCall_5
    jsdom html: html, src: [jquery]

    it 'Should be able to configure foreground and background color with options argument', ->
      expect($('img').attr 'src' ).to.contain '200x200/87ffb8/2a0069'

  functionCall_6 = '+placeholder({h:200, w:500, background:"87ffb8", fgColor:"#2a0069", text: "This is a test"})'
  describe functionCall_6, ->
    html = generateHTML template functionCall_6
    jsdom html: html, src: [jquery]

    it 'Should be able to specify placeholder text (among other stuff) with options argument', ->
      expect($('img').attr 'src' ).to.contain '500x200/87ffb8/2a0069&text=This+is+a+test'
