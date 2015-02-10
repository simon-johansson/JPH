module.exports = {
  dist: {
    options: {
      // process: function(src, filepath) {
      //     return src.split('\n').map(function(line) {
      //       if (line[0] !== "!") return line;
      //       else return "- " + line;
      //     }).join('\n');
      // },
      // banner: "",
      // footer: ""
    },
    src: [
      'lib/intro.jade',
      '.tmp/vendor.min.js',
      '.tmp/lib.min.js',
      'lib/outro.jade',
      'lib/mixins/**/*.jade',
      '!lib/mixins/**/*.spec.jade',
    ],
    dest: 'JPH.jade'
  },
};
