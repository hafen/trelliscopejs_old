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

// var splitCss    = require('broccoli-csssplit');      // split css files into many files, if necessary
// https://github.com/aboekhoff/broccoli-csssplit
// http://stackoverflow.com/a/9906889 <- why the need to split css files... silly IE

var cleanCss    = require('broccoli-clean-css');      // css file compressor... clean!: https://github.com/jakubpawlowicz/clean-css#what-is-clean-css

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


// Sweet stuff for production environment
if (env === 'production') {
  // minify js
  appJs = uglify(appJs, {
    // mangle: false,
    // compress: false
  })

  // minify css output
  compiledAppLess = cleanCss(compiledAppLess)
  // compiledAppLess = splitCss(compiledAppLess)

}

// create tree for public folder (no filters needed here)
var publicFiles = 'public'

// create tree for public folder (no filters needed here)
var htmlFiles = pickFiles('app', {srcDir: 'html', destDir: '/' });

// merge the trees
var mergedTree = mergeTrees([publicFiles, compiledAppLess, appJs, htmlFiles])
mergedTree = log(mergedTree, { output: 'tree', label: 'output tree' });

module.exports = mergedTree;
