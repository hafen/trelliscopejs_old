
Copyright (c) 2014, Facebook, Inc.
All rights reserved.
This source code is licensed under the BSD-style license found in the
LICENSE file in the root directory of this source tree. An additional grant
of patent rights can be found in the PATENTS file in the same directory.

    # @litcoffee React.DOM
    Flux = require('flux')
    React = require('react')

    Router = require('react-router')

    DefaultRoute  = Router.DefaultRoute;
    Link          = Router.Link;
    Route         = Router.Route;
    RouteHandler  = Router.RouteHandler;

    TodoApp = require('./test/test.litcoffee')
    TrelliscopeApp = require('./main_page/main.litcoffee')

    # React.render(
    #   <TrelliscopeApp />,
    #   document.getElementById('todoapp')
    # )

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



    App = React.createClass
      displayName: "App"

      render: ->
        <RouteHandler/>

    routes = (
      <Route name="app" path="/" handler={App}>
        <Route name="Panel_Function" path="/panel_function" handler={TodoApp}/>
        <DefaultRoute handler={TrelliscopeApp}/>
      </Route>
    )



    # # Run with 'raw' url, not hashtag
    # Router.run routes, Router.HistoryLocation, (Handler) ->
    #   React.render(<Handler/>, document.getElementById('todoapp'))
    #   return

    # Must run with hashtag as broccoli doesn't know how to refresh a single app page
    Router.run routes, (Handler) ->
      React.render(<Handler/>, document.getElementById('todoapp'))
      return





