/* global require, module */

var compileSass         = require('broccoli-sass');
var mergeTrees          = require('broccoli-merge-trees');
var cjsx                = require('broccoli-cjsx');

// https://www.npmjs.com/package/broccoli-asset-rev
    // "jquery": "^1.11.1",
    // "qunit": "~1.17.1",
    // "bootstrap": "~3.3.1",
    // "underscore": "~1.8.2"


var styles = compileSass(['app/scss'], 'app.scss', 'app.css');
var scripts = filterCoffeeScript(coffeeDir);

module.exports = mergeTrees([styles, scripts]);
