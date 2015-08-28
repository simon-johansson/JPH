var express = require('express');
var path = require('path');
var fs = require('fs');
var marked = require('marked');
var less = require('less-file');
var browserify = require('browserify-middleware');
var CodeMirror = require('highlight-codemirror');
var highlightJade = require('jade-highlighter');
var favicon = require('static-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var jade = require('jade');

var version = require('../package.json').version;

var app = express();
var filters = jade.filters;

CodeMirror.loadMode('xml');//dep of htmlmixed
CodeMirror.loadMode('htmlmixed');
CodeMirror.loadMode('javascript');
CodeMirror.loadMode('css');

filters.jadesrc = highlightJade;
// filters.jadesrc = function(jade) {
//   return CodeMirror.highlight(jade, {name: 'jade'});
// }
filters.htmlsrc = function (html) {
  return CodeMirror.highlight(html, {name: 'htmlmixed'});
};
filters.jssrc = function (js) {
  return CodeMirror.highlight(js, {name: 'javascript'});
};
filters.csssrc = function (css) {
  return CodeMirror.highlight(css, {name: 'css'});
};

// view engine setup
// app.engine('jade', jade.renderFile);
app.set('view engine', 'jade');
app.set('views', path.join(__dirname, 'views'));

app.locals.pretty = true;
app.locals.compileDebug = true;
app.locals.doctypes = jade.doctypes;
// app.locals.basedir = app.get('views');

app.use(favicon());
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded());
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use(require('connect-livereload')());

app.use(function (req, res, next) {
  if (req.url.substr(0, version.length + 2) === '/' + version + '/') {
    req.url = req.url.substr(version.length + 1);
    res.locals.path = function (path) {
      return '/' + version + path;
    };
  } else if (/^\/\d+\.\d+\.\d+\//.test(req.url)) {
    res.send(404, 'This page only exists on the live website');
    return;
  } else {
    res.locals.path = function (path) {
      return path;
    };
  }
  next();
});

app.get('/client.js', browserify(__dirname + '/public/scripts/index.js'));
app.use('/style', less(__dirname + '/public/styles/index.less'));
// app.use('/style', express.static(__dirname + '/public/styles'));
// app.use('/coverage', express.static(path.resolve(__dirname + '/../coverage/lcov-report')));


var routes = require('./routes/index');
var history = require('./routes/history');

app.use('/', routes);
app.use('/history', history);

/// catch 404 and forward to error handler
app.use(function(req, res, next) {
    var err = new Error('Not Found');
    err.status = 404;
    next(err);
});

/// error handlers

// development error handler
// will print stacktrace
if (app.get('env') === 'development') {
    app.use(function(err, req, res, next) {
        res.status(err.status || 500);
        res.render('error.jade', {
            message: err.message,
            error: err
        });
    });
}

// production error handler
// no stacktraces leaked to user
app.use(function(err, req, res, next) {
    res.status(err.status || 500);
    res.render('error', {
        message: err.message,
        error: {}
    });
});

app.set('port', process.env.PORT || 3000);

var server = app.listen(app.get('port'), function() {
  console.log('Express server listening on port ' + server.address().port);
});

module.exports = app;
