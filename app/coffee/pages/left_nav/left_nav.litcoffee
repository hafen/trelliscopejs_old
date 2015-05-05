
# Left Navigation Section of Main Page

Contains navigations for the application

    # @litcoffee React.DOM
    React = require 'react'
    _     = require 'underscore'

    LeftNavGroup = require "./left_nav_group.litcoffee"
    LeftNavStore = require "../../stores/left_nav_store.litcoffee"


    LeftNavComponent = React.createClass
      displayName: "LeftNavigation"

      getViewOptionsInfoArr: _.once(-> return LeftNavStore.get_all_view_options())
      getCognosticsInfoArr: _.once(-> return LeftNavStore.get_all_cognostics())

      getEndDivs: ->
        endDivs = []
        for navItem in @getViewOptionsInfoArr()
          endDivs.push(
            <div id={ navItem.divlink } key={navItem.divlink} className="slide-panel panel panel-default"></div>
          )
        for navItem in @cognosticsInfoArr()
          endDivs.push(
            <div id={ navItem.divlink } key={navItem.divlink} className="slide-panel panel panel-default"></div>
          )
        # add { endDivs } after wrapper.  This causes warning to appear.  divs above are place holders that will be deleted.
        endDivs


      render: ->
        <div>
          <div id="wrapper">
            <div id="sidebar-wrapper">
              <div id="logo">
                <img src="assets/images/logo.svg" />
              </div>
              <div className="list-group list-group-sidebar">
                <LeftNavGroup title="View Options" navItems=@getViewOptionsInfoArr() key="view_options" />

                <LeftNavGroup title="Cognostics"   navItems=@getCognosticsInfoArr()  key="view_cognostics" />
              </div>

            </div>
          </div>
        </div>


    module.exports = LeftNavComponent
