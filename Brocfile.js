/* global require, module */


// before anything happens, raise the ulimit to 2048
// this allows for many files to be compiled
// 'ulimit -n' is typically equal to 256, which is not enough
var posix = require('posix')
posix.setrlimit('nofile', {soft: 2048})


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

// var concat    = require('broccoli-concat'); // concat many files
var pickFiles = require('broccoli-static-compiler'); // static file compiler

var fastBrowserify = require('broccoli-fast-browserify'); // js
var lessCompiler   = require('broccoli-less'); // less

// var splitCss    = require('broccoli-csssplit');      // split css files into many files, if necessary
// https://github.com/aboekhoff/broccoli-csssplit
// http://stackoverflow.com/a/9906889 <- why the need to split css files... silly IE

var cleanCss    = require('broccoli-clean-css');      // css file compressor... clean!: https://github.com/jakubpawlowicz/clean-css#what-is-clean-css

// uglify the javascript
var uglify = require('broccoli-uglify-js');

var mergeTrees = require('broccoli-merge-trees'); // static file compiler
var env        = require('broccoli-env').getEnv(); // get environment from compiler
var replaceVal = require('broccoli-replace'); // replaces things in files that start with @@


var log = require('broccoli-stew').log;



if (process.env.ONLY_COFFEE && process.env.ONLY_COFFEE == "coffee") {
  var coffeeFiles = pickFiles('app', {srcDir: 'coffee', destDir: '/assets' });
  var broccoliCjsx = require('broccoli-cjsx'); // js

  log(coffeeFiles, {output: "tree", label: "pre compiled coffee files"})
  coffeeFiles = broccoliCjsx(coffeeFiles, {extensions: ['litcoffee']})
  log(coffeeFiles, {output: "tree", label: "compiled coffee files"})

  module.exports = coffeeFiles;
  return
}




// Styles
// var compileLess    = require('broccoli-less-single');      // less file compiler
// var compiledAppLess = compileLess(['.'], 'app/styles/app.less', 'assets/app.css', {
//     paths: ['.', 'public', 'node_modules']
// });
var lessFiles = pickFiles('app', {srcDir: 'styles', destDir: '/assets' });
// lessFiles = log(lessFiles, {output: 'tree', label: "css_files_picked tree"})
var compiledAppLess = lessCompiler(lessFiles, {
    paths: ['.', 'node_modules']
});
compiledAppLess = log(compiledAppLess, {output: 'tree', label: "css_files_compiled tree"})


// browserify the application code
// calls browserify transform: 'coffee-reactify' in package.json info
var appJs = fastBrowserify('app/coffee', {
  bundles: {
    'assets/app_bundle.js': {
      entryPoints: ['app.litcoffee']
    }
  }
});
appJs = log(appJs, { output: 'tree', label: 'js_files_compiled tree' });


// create tree for public folder (no filters needed here)
var publicFiles = 'public'


// create tree for public folder (no filters needed here)
var htmlFiles = pickFiles('app', {srcDir: 'html', destDir: '/' });


replaceValReplacement = "<script>document.write('<script src=\"http://' + (location.host || 'localhost').split(':')[0] + ':35729/livereload.js?snipver=1\"></' + 'script>')</script>"

// Sweet stuff for production environment
if (env === 'production') {
  replaceValReplacement = ""

  // minify js
  appJs = uglify(appJs, {
    // mangle: false,
    // compress: false
  })

  // minify css output
  compiledAppLess = cleanCss(compiledAppLess)
  // compiledAppLess = splitCss(compiledAppLess)
}

htmlFiles = replaceVal(htmlFiles, {
  files: [
    '**/*.html' // replace only html files
  ],
  patterns: [{
    match      : 'livereload',
    replacement: replaceValReplacement
  }]
});

// merge the trees
var mergedTree = mergeTrees([publicFiles, compiledAppLess, appJs, htmlFiles])

// if (env == "development") {
//   var cjsx = require('broccoli-cjsx');
//   var coffeeFilesDebug = pickFiles('app', {srcDir: 'coffee', destDir: '/assets/debug/js' });
//   coffeeFilesDebug = cjsx(coffeeFilesDebug, {extensions: ['.litcoffee']});
//   mergedTree = mergeTrees([mergedTree, coffeeFilesDebug])
// }

mergedTree = log(mergedTree, { output: 'tree', label: 'output tree' });

module.exports = mergedTree;
