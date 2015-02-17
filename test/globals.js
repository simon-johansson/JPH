expect = require("chai").expect;
jade = require('jade');
jquery = require('fs').readFileSync(__dirname + "/jquery.js", "utf-8");
jsdom = require('mocha-jsdom');
baseDir = __dirname + '/..';

getHTML = function (selector) {
  return $(selector).html();
};

generateHTML = function(jadeCode) {
  return jade.render(jadeCode, {
    basedir: baseDir,
    pretty: true
  });
};
