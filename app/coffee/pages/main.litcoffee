
# Main Page

Should be shell to application

    # @litcoffee React.DOM
    React = require 'react'
    {DefaultRoute, Link, Route, RouteHandler, run} = require('react-router')

    Footer     = require "./etc/footer.litcoffee"
    RightPanel = require "./etc/right_panel.litcoffee"

    LeftNav = require "./left_nav/left_nav.litcoffee"


    MainPage = React.createClass
      displayName: "MainPage"

      render: ->
        <div>
          <div className="container">

            <LeftNav />

            <RouteHandler/>

            <RightPanel />
          </div>
          <Footer />
        </div>


    module.exports = MainPage
