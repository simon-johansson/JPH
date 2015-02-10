global.expect = require("chai").expect;
global.jade = require('jade');
global.jquery = require('fs').readFileSync(__dirname + "/jquery.js", "utf-8");
global.jsdom = require('mocha-jsdom');
global.baseDir = __dirname + '/..';
