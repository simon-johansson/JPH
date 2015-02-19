expect = require("chai").expect;
jade = require('jade');
jquery = require('fs').readFileSync(__dirname + "/jquery.js", "utf-8");
_ = require('lodash');
jsdom = require('mocha-jsdom');
baseDir = __dirname + '/..';

getHTML = function (selector) {
  return $(selector).html();
};

generateHTML = function(jadeCode) {
  template = jadeCode.indexOf('JPH.jade') !== -1 ?
             jadeCode :
             "include /JPH.jade \n" + jadeCode;

  return jade.render(template, {
    basedir: baseDir,
    pretty: true
  });
};
