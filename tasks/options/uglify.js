module.exports = {
  options: {
    maxLineLen: 0,
    mangle: false
  },
  lib: {
    src: '.tmp/lib.js',
    dest: '.tmp/lib.min.js'
  },
  vendor: {
    src: '.tmp/vendor.js',
    dest: '.tmp/vendor.min.js'
  }
};
