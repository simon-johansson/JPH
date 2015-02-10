module.exports = {
  vendor: {
    src: [],
    dest: '.tmp/vendor.js',
    options: {
      require: ['faker', 'lodash'],
    }
  },

  lib: {
    // src: ['lib/coffee/**/*.coffee'],
    src: ['lib/scripts/functions/*.coffee'],
    dest: '.tmp/lib.js',
    options: {
      transform: ['coffeeify'],
      external: ['faker', 'lodash'],
      watch: true,
    }
  },

  // //standalone browserify watch - do NOT use with grunt-watch
  // client: {
  //   src: ['client/**/*.js'],
  //   dest: 'public/app.js',
  //   options: {
  //     external: ['jQuery', 'momentWrapper'],
  //     watch: true,
  //     keepAlive: true
  //   }
  // },

  // //working with grunt-watch - do NOT use with keepAlive above
  // watchClient: {
  //   src: ['client/**/*.js'],
  //   dest: 'public/app.js',
  //   options: {
  //     external: ['jQuery', 'momentWrapper'],
  //     watch: true
  //   }
  // },
};
