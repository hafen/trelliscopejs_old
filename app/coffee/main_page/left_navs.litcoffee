
# Left Navigation Section of Main Page

Contains navigations for the application

    # @litcoffee React.DOM
    React = require 'react'

    LeftNavGroup = require("./left_nav_group.litcoffee")
    # dataLeftNav = require("../data/data_left_navigation.litcoffee")
    LeftNavStore = require("../stores/store_left_nav.litcoffee")


    LeftNavsComponent = React.createClass
      displayName: "LeftNavsComponent"

      getInitialState: ->
        return {
          viewOptionsInfoArr: LeftNavStore.getAllViewOptions()
          cognosticsInfoArr:  LeftNavStore.getAllCognostics()
        }

      render: ->

        endDivs = []
        for navItem in @state.viewOptionsInfoArr
          endDivs.push(
            <div id={ navItem.divlink } className="slide-panel panel panel-default"></div>
          )
        for navItem in @state.cognosticsInfoArr
          endDivs.push(
            <div id={ navItem.divlink } className="slide-panel panel panel-default"></div>
          )

        <div>
          <div id="wrapper">
            <div id="sidebar-wrapper">
              <div id="logo">
                <img src="assets/images/logo.svg" />
              </div>

              <div className="list-group list-group-sidebar">
                <LeftNavGroup title="View Options"  navItems=@state.viewOptionsInfoArr key="view_options" />

                <LeftNavGroup title="Cognostics"    navItems=@state.cognosticsInfoArr  key="view_cognostics" />
              </div>

            </div>
          </div>
          { endDivs }
        </div>


    module.exports = LeftNavsComponent


