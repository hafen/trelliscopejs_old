/* global require, module */

// Broccoli Example file
// https://github.com/broccolijs/broccoli-sample-app/blob/master/Brocfile.js

// https://gist.github.com/eploko/bf21669439789c439f80
// great example file with
// js, react, browserify,
// scss, images, html,
// bootstrap, fonts, images,
// assetRev

// var assetRev    = require('broccoli-asset-rev');           // change file name for new sources
// https://github.com/rickharrison/broccoli-asset-rev

// var concat      = require('broccoli-concat');           // concat many files
var pickFiles   = require('broccoli-static-compiler');  // static file compiler
var compileLess = require('broccoli-less-single');      // less file compiler
var minifyCss = require('broccoli-more-css');      // less file compiler

var cjsx        = require('broccoli-cjsx');             // coffee script jsx compiler
var uglify      = require('broccoli-uglify-js');        // uglify the javascript

var mergeTrees  = require('broccoli-merge-trees');      // static file compiler
var env         = require('broccoli-env').getEnv();     // get environment from compiler

var log = require('broccoli-stew').log;

    // "jquery": "^1.11.1",
    // "qunit": "~1.17.1",
    // "bootstrap": "~3.3.1",
    // "underscore": "~1.8.2"

// Styles
var compiledAppLess = compileLess(['.'], 'app/styles/app.less', 'assets/app.css', {
    paths: ['.', 'public', 'node_modules']
});
compiledAppLess = log(compiledAppLess, {output: 'tree', label: "css_files_picked tree"})

// var appJs = pickFiles('app', { srcDir: "coffee", destDir: '/js' });
// appJs = log(appJs, { output: 'tree', label: 'js_files_picked tree' });
// appJs = cjsx(appJs, {extensions: ['.litcoffee']});
// appJs = log(appJs, { output: 'tree', label: 'js_files_compiled tree' });


// browserify the application code
// calls browserify transform: 'coffee-reactify' in package.json info
var fastBrowserify = require('broccoli-fast-browserify');
var appJs = fastBrowserify('app/coffee', {
  bundles: {
    'assets/app_bundle.js': {
      entryPoints: ['app.litcoffee']
    }
  }
});
appJs = log(appJs, { output: 'tree', label: 'js_files_compiled tree' });


if (env === 'production') {
  // minify js
  appJs = uglifyJavaScript(appJs, {
    // mangle: false,
    // compress: false
  })

  compiledAppLess = minifyCss(compiledAppLess)
}

// var mergedTree = mergeTrees([compiledAppLess, scripts])
// create tree for public folder (no filters needed here)
var publicFiles = 'public'

var mergedTree = mergeTrees([compiledAppLess, publicFiles])
module.exports = mergedTree;
