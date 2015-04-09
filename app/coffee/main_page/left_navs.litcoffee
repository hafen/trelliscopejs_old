
# Left Navigation Section of Main Page

Contains navigations for the application

    # @litcoffee React.DOM
    React = require 'react'

    LeftNavGroup = require("./left_nav_group.litcoffee")
    dataLeftNav = require("../data/data_left_navigation.litcoffee")

    LeftNavsComponent = React.createClass
      displayName: "LeftNavsComponent"

      render: ->

        endDivs = []
        for navItem in dataLeftNav.viewOptionsInfoArr
          endDivs.push(
            <div id={ navItem.divlink } className="slide-panel panel panel-default"></div>
          )
        for navItem in dataLeftNav.cognosticsInfoArr
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
                <LeftNavGroup title="View Options"  navItems=dataLeftNav.viewOptionsInfoArr />

                <LeftNavGroup title="Cognostics"    navItems=dataLeftNav.cognosticsInfoArr />
              </div>

            </div>
          </div>
          { endDivs }
        </div>


    module.exports = LeftNavsComponent


