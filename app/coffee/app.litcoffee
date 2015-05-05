
Copyright (c) 2014, Facebook, Inc.
All rights reserved.
This source code is licensed under the BSD-style license found in the
LICENSE file in the root directory of this source tree. An additional grant
of patent rights can be found in the PATENTS file in the same directory.

    # @litcoffee React.DOM
    Flux = require('flux')
    React = require('react')

    {DefaultRoute, Link, Route, Redirect, RouteHandler, run} = require('react-router')

    TodoApp = require('./test/test.litcoffee')
    TrelliscopeApp = require('./pages/main.litcoffee')

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

    NullHandler = require './pages/etc/null_handler.litcoffee'

    PanelLayout     = require './pages/related_displays/panel_layout.litcoffee'
    PanelFunction   = require './pages/related_displays/panel_function.litcoffee'
    PanelLabels     = require './pages/related_displays/panel_labels.litcoffee'
    RelatedDisplays = require './pages/related_displays/related_displays.litcoffee'

    ActiveCognostics = require './pages/related_displays/active_cognostics.litcoffee'
    TableSortFilter  = require './pages/related_displays/table_sort_filter.litcoffee'
    UnivariateFilter = require './pages/related_displays/univariate_filter.litcoffee'


    SingleDataPage = require './pages/single_page/single_page.litcoffee'


    routes = (
      <Route name="app" path="/" handler={TrelliscopeApp}>
        <Route name="View_Options" path="view_options" handler={NullHandler}>
          <Route name="Panel_Layout_Route"   path="panel_layout" handler={PanelLayout}/>
          <Route name="Panel_Function_Route" path="panel_function" handler={PanelFunction}/>
          <Route name="Panel_Labels_Route" path="panel_labels" handler={PanelLabels}/>
          <Route name="Related_Displays_Route" path="related_displays" handler={RelatedDisplays}/>
          <Route name="Panel_Table" path="panel_table" handler={TodoApp}/>
        </Route>
        <Route name="Cognostics" path="cognostics" handler={NullHandler}>
          <Route name="Active Cognostics" path="active_cognostics" handler={ActiveCognostics} />
          <Route name="Table Sort Filter" path="table_sort_filter" handler={TableSortFilter} />
          <Route name="Univariate Filter" path="univariate_filter" handler={UnivariateFilter} />
        </Route>

        <DefaultRoute handler={SingleDataPage}/>
        <Redirect from="/view_options" to="/view_options/panel_function" />
        <Redirect from="/cognostics" to="/cognostics/active_cognostics" />
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
