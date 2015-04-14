
# Main Page

Should be shell to application

    # @litcoffee React.DOM
    React = require 'react'
    {DefaultRoute, Link, Route, RouteHandler, run} = require('react-router')

    Header     = require "./etc/header.litcoffee"
    Footer     = require "./etc/footer.litcoffee"
    RightPanel = require "./etc/right_panel.litcoffee"

    LeftNav = require "./left_nav/left_nav.litcoffee"


    MainPage = React.createClass
      displayName: "MainPage"

      render: ->
        <div>
          <Header />
          <div className="container">

            <LeftNav />

            <div className="shiny-template-output" id="panelTableContentOutput" data-post-render="panelTableContentOutputPostRender">
              <RouteHandler/>
            </div>

            <RightPanel />
          </div>
          <Footer />
        </div>


    module.exports = MainPage
