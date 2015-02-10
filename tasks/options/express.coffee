module.exports =
  options:
    port: process.env.PORT or 9000
  dev:
    options:
      script: 'docs/app.js'
      debug: true
