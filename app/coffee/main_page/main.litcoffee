
# Main Page

Should be shell to application

    # @litcoffee React.DOM
    React = require 'react'

    Header = require("./header.litcoffee")
    Footer = require("./footer.litcoffee")
    LeftNavs = require("./left_navs.litcoffee")
    RightPanel = require("./right_panel.litcoffee")

    MainPage = React.createClass

      render: ->
        <div>
          <Header />
          <div class="container">

            <LeftNavs />

            <div class="shiny-template-output" id="panelTableContentOutput" data-post-render="panelTableContentOutputPostRender"></div>

            <RightPanel />
          </div>
          <Footer />
        </div>


    module.exports = MainPage
