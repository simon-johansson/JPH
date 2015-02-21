{ person, people } = require('./')

personTemplate = '''
  include /JPH.jade

  p.typeof.person= typeof person

  each val, key in person.__proto__
    p(class="typeof #{key}")= Array.isArray(val) || typeof val
'''

peopleTemplate = '''
  include /JPH.jade

  each person in people(10)
    p.people.name= person.name
'''

describe 'person', ->

  describe 'person', ->
    html = generateHTML(personTemplate)
    result = person.__proto__
    jsdom(html: html, src: [jquery])

    it 'Should generate an person object', ->
      expect(result).to.be.a "object"
      expect(getHTML('.typeof.person')).to.be.eql "object"

    it 'Should have "name" property', ->
      expect(getHTML('.typeof.name')).to.be.eql "string"
      expect(result.name).to.be.a "string"

    it 'Should have "email" property', ->
      expect(getHTML('.typeof.email')).to.be.eql "string"
      expect(result.email).to.be.a "string"

    it 'Should have "adress" property', ->
      expect(getHTML('.typeof.address')).to.be.eql "object"
      expect(result.address).to.be.a "object"

    it 'Should have "phone" property', ->
      expect(getHTML('.typeof.phone')).to.be.eql "string"
      expect(result.phone).to.be.a "string"

    it 'Should have "website" property', ->
      expect(getHTML('.typeof.website')).to.be.eql "string"
      expect(result.website).to.be.a "string"

    it 'Should have "company" property', ->
      expect(getHTML('.typeof.company')).to.be.eql "object"
      expect(result.company).to.be.a "object"

    it 'Should have (blog) "posts" property', ->
      expect(getHTML('.typeof.posts')).to.be.eql "true"
      expect(result.posts).to.be.a "array"

    it 'Should have "accountHistory" property', ->
      expect(getHTML('.typeof.accountHistory')).to.be.eql "true"
      expect(result.accountHistory).to.be.a "array"


describe 'people', ->

  describe 'people(10)', ->
    html = generateHTML(peopleTemplate)
    result = people(10)
    jsdom(html: html, src: [jquery])

    it 'Should generate an array of 10 person objects', ->
      expect(result).to.be.a "array"
      expect(result).to.have.length 10
      $('.people.name').each (i, el) ->
        expect(getHTML(el).split(" ")).to.have.length.of.at.least 2
      expect($('.people.name')).to.have.length 10


