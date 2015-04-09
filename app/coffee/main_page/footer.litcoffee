
# Footer Section of Main Page

Contains filter and labels in bottom of page

    # @litcoffee React.DOM
    React = require 'react'

    FooterPage = React.createClass

      render: ->
        <div id="footer">
          <div id="filterStateInput" className="shiny-my-data-input"></div>
          <div id="panelLabelStateInput" className="shiny-my-data-input"></div>
          <div id="panelLayoutStateInput" className="shiny-my-data-input"></div>
          <div id="relatedDisplayStateInput" className="shiny-my-data-input"></div>
          <div id="activeCogStateInput" className="shiny-my-data-input"></div>
          <div id="sortStateInput" className="shiny-my-data-input"></div>
          <div id="appHashInput" className="shiny-my-data-input"></div>
          <div id="appHashOutput" className="shiny-apphash-output"></div>
          <div id="exposedStateDataOutput" data-callback="updateControlsExposedState" className="shiny-my-data-output"></div>
          <div id="panelDimInput" className="shiny-my-data-input"></div>
          <div className="container">
             <div className="pull-left shiny-template-output" id="cogBreadcrumbOutput" data-post-render="cogBreadcrumbOutputPostRender">
             </div>
          </div>
        </div>


    module.exports = FooterPage
