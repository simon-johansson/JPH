module.exports = {
  options: {
    port: process.env.PORT || 9000
  },
  dev: {
    options: {
      script: 'docs/app.js',
      debug: true
    }
  },
};
