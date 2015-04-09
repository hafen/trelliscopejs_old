
Copyright (c) 2014, Facebook, Inc.
All rights reserved.
This source code is licensed under the BSD-style license found in the
LICENSE file in the root directory of this source tree. An additional grant
of patent rights can be found in the PATENTS file in the same directory.

    # @litcoffee React.DOM
    Flux = require('flux')
    React = require('react')
    # TodoApp = require('./test/test.litcoffee')
    TrelliscopeApp = require('./main_page/main.litcoffee')

    React.render(
      <TrelliscopeApp />,
      document.getElementById('todoapp')
    )
