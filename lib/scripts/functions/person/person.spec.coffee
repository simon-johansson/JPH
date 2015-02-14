{ person, people } = require('./')

getHTML = (selector) -> $(selector).html()

personJadeTemplate = '''
  include /JPH.jade

  p.typeof.person= typeof person()

  each val, key in person()
    p(class="typeof #{key}")= Array.isArray(val) || typeof val
'''

peopleJadeTemplate = '''
  include /JPH.jade

  each person in people(10)
    p.people.name= person.name
'''

generateHTML = (jadeCode) ->
  jade.render jadeCode, { basedir: baseDir, pretty: true }

describe 'person', ->

  describe 'person()', ->
    # html = generateHTML(personJadeTemplate)
    result = person.name
    console.log person.name
    console.log person.name
    console.log person.name
    # jsdom(html: html, src: [jquery])

    # it 'Should generate an person object', ->
    #   expect(result).to.be.a "object"
    #   expect(getHTML('.typeof.person')).to.be.eql "object"

#     it 'Should have the property types', ->
#       expect(getHTML('.typeof.name')).to.be.eql "string"
#       expect(result.name).to.be.a "string"

#       expect(getHTML('.typeof.email')).to.be.eql "string"
#       expect(result.email).to.be.a "string"

#       expect(getHTML('.typeof.address')).to.be.eql "object"
#       expect(result.address).to.be.a "object"

#       expect(getHTML('.typeof.phone')).to.be.eql "string"
#       expect(result.phone).to.be.a "string"

#       expect(getHTML('.typeof.website')).to.be.eql "string"
#       expect(result.website).to.be.a "string"

#       expect(getHTML('.typeof.company')).to.be.eql "object"
#       expect(result.company).to.be.a "object"

#       expect(getHTML('.typeof.posts')).to.be.eql "true"
#       expect(result.posts).to.be.a "array"

#       expect(getHTML('.typeof.accountHistory')).to.be.eql "true"
#       expect(result.accountHistory).to.be.a "array"


# describe 'people', ->

#   describe 'people(10)', ->
#     html = generateHTML(peopleJadeTemplate)
#     result = people(10)
#     jsdom(html: html, src: [jquery])

#     console.log(html);

    # it 'Should generate an person object', ->
    #   expect(result).to.be.a "object"
    #   expect(getHTML('.typeof.person')).to.be.eql "object"


