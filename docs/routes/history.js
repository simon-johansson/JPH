var express = require('express');
var router = express.Router();

/* GET history page. */
router.get('/', function(req, res) {
  var versionHeader = /(\d+\.\d+\.\d+) *\/ *\d\d\d\d\-\d\d\-\d\d\<\/h2\>/g;
  var versions = JSON.parse(fs.readFileSync(__dirname + '/versions.json', 'utf8'));
  if (versions.indexOf(version) === -1) {
    versions.push(version);
    fs.writeFileSync(__dirname + '/versions.json', JSON.stringify(versions, null, '  '));
  }
  var history = marked(fs.readFileSync(__dirname + '/../History.md', 'utf8'))
    .replace(/h1/g, 'h2')
    .replace(versionHeader, function (_, version) {
      if (versions.indexOf(version) !== -1) {
        return _ + '<p><a href="/' + version +
          '/reference" rel="nofollow">Documentation</a></p>';
      } else {
        return _;
      }
    });
  res.render('history.jade', {
    section: 'history',
    history: history
  });
});

module.exports = router;
