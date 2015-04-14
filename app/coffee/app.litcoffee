
Copyright (c) 2014, Facebook, Inc.
All rights reserved.
This source code is licensed under the BSD-style license found in the
LICENSE file in the root directory of this source tree. An additional grant
of patent rights can be found in the PATENTS file in the same directory.

    # @litcoffee React.DOM
    Flux = require('flux')
    React = require('react')

    {DefaultRoute, Link, Route, RouteHandler, run} = require('react-router')

    TodoApp = require('./test/test.litcoffee')
    TrelliscopeApp = require('./main_page/main.litcoffee')

      # <Route handler={App} path="/">
      #   <DefaultRoute handler={TrelliscopeApp} />
      #   <Route name="about" handler={TodoApp} />
      #   <Route name="users" handler={Users}>
      #     <Route name="recent-users" path="recent" handler={RecentUsers} />
      #     <Route name="user" path="/user/:userId" handler={User} />
      #     <NotFoundRoute handler={UserRouteNotFound}/>
      #   </Route>
      #   <NotFoundRoute handler={NotFound}/>
      #   <Redirect from="company" to="about" />
      # </Route>

    PanelLayout = require './main_page/related_displays/panel_layout.litcoffee'


    routes = (
      <Route name="app" path="/" handler={TrelliscopeApp}>
        <Route name="Panel_Layout" path="/panel_layout" handler={PanelLayout}/>
        <Route name="Panel_Function" path="/panel_function" handler={TodoApp}/>
        <DefaultRoute handler={TrelliscopeApp}/>
      </Route>
    )



    # # Run with 'raw' url, not hashtag
    # Router.run routes, Router.HistoryLocation, (Handler) ->
    #   React.render(<Handler/>, document.getElementById('todoapp'))
    #   return

    # Must run with hashtag as broccoli doesn't know how to refresh a single app page
    run routes, (Handler) ->
      React.render(<Handler/>, document.getElementById('todoapp'))
      return





