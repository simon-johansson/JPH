module.exports = {
  scripts: {
    options: {
      reporter: 'spec',
      // captureFile: 'results.txt', // Optionally capture the reporter output to a file
      quiet: false, // Optionally suppress output to standard out (defaults to false)
      clearRequireCache: true, // Optionally clear the require cache before running tests (defaults to false)
      require: [
        'coffee-script/register',
        'test/globals.js'
      ]
    },
    src: ['lib/scripts/**/*.spec.coffee']
  },
  mixins: {
    options: {
      reporter: 'spec',
      // captureFile: 'results.txt', // Optionally capture the reporter output to a file
      quiet: false, // Optionally suppress output to standard out (defaults to false)
      clearRequireCache: true, // Optionally clear the require cache before running tests (defaults to false)
      require: [
        'coffee-script/register',
        'test/globals.js'
      ]
    },
    src: ['lib/mixins/**/*.spec.coffee']
  },
  test: {
    options: {
      reporter: 'spec',
      // captureFile: 'results.txt', // Optionally capture the reporter output to a file
      quiet: false, // Optionally suppress output to standard out (defaults to false)
      clearRequireCache: true, // Optionally clear the require cache before running tests (defaults to false)
      require: [
        'coffee-script/register',
        'test/globals.js'
      ]
    },
    src: ['lib/mixins/blokk/*.spec.coffee']
  },
};
