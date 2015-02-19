
describe 'input-[TYPE] mixin', ->

  describe '+input', ->
    html = generateHTML('+input')
    jsdom(html: html, src: [jquery])

    it 'Should create one <input> tag', ->
      expect($('input')).to.have.length 1

    it '<input> tag should be of type "text"', ->
      expect($('input').attr('type')).to.be.eql 'text'

    it 'Should not create a <label> tag', ->
      expect($('label')).to.have.length 0

  describe '+input-checkbox(label="Test label")', ->
    html = generateHTML('+input-checkbox(label="Test label")')
    jsdom(html: html, src: [jquery])

    it 'Should create a <label> tag', ->
      expect($('label')).to.have.length 1

    it 'Label should be "Test label"', ->
      expect(getHTML('label')).to.be.eql 'Test label'

  describe '+input-email(placeholder="Email goes here" class="email-input")', ->
    html = generateHTML('+input-email(placeholder="Email goes here" class="email-input")')
    jsdom(html: html, src: [jquery])

    it 'Should create a <input> tag of type "email"', ->
      expect($('input').attr('type')).to.be.eql 'email'

    it '<input> tag should have a class named "email-input"', ->
      expect($('input').hasClass('email-input')).to.be.true

    it '<input> tag should have a placeholder holding the text "Email goes here"', ->
      expect($('input').attr('placeholder')).to.be.eql 'Email goes here'

  types = ['button', 'checkbox', 'color', 'date',
           'datetime', 'email', 'file',
           'hidden', 'image', 'month', 'number', 'password',
           'radio', 'range', 'reset', 'search', 'submit',
           'tel', 'text', 'time', 'url', 'week']

  for type in types
    do (type) ->
      describe "+input-#{type}", ->
        html = generateHTML("+input-#{type}")
        jsdom(html: html, src: [jquery])

        it "Should create a <input> tag of type '#{type}'", ->
          expect($('input').attr('type')).to.be.eql type
