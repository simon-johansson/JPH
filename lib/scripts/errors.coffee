InvalidPathError = (path) ->
  self = new Error "The path '#{path}' that was given to +src() is not valid, \
                    it has to end with either .css or .js"
  self.name = 'InvalidPathError'
  self.__proto__ = InvalidPathError::
  self

InvalidPathError::__proto__ = Error::

module.exports = {
  InvalidPathError: InvalidPathError
}
