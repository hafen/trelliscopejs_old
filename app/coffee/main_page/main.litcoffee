
# Main Page

Should be shell to application

    # @litcoffee React.DOM
    React = require 'react'

    Header = require("./etc/header.litcoffee")
    Footer = require("./etc/footer.litcoffee")
    LeftNav = require("./left_nav/left_nav.litcoffee")
    RightPanel = require("./right_panel.litcoffee")




    MainPage = React.createClass
      displayName: "MainPage"

      render: ->
        <div>
          <Header />
          <div className="container">

            <LeftNav />

            <div className="shiny-template-output" id="panelTableContentOutput" data-post-render="panelTableContentOutputPostRender"></div>

            <RightPanel />
          </div>
          <Footer />
        </div>


    module.exports = MainPage
