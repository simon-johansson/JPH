module.exports = {
  default_options: {
    files: [
      {
        prepend: "- ",
        input: '.tmp/vendor.min.js',
        output: '.tmp/vendor.min.js'
      },
      {
        prepend: "- ",
        input: '.tmp/lib.min.js',
        output: '.tmp/lib.min.js'
      },
    ],
  },
};
