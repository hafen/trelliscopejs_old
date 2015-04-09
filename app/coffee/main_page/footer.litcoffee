
# Footer Section of Main Page

Contains filter and labels in bottom of page

    # @litcoffee React.DOM
    React = require 'react'

    FooterPage = React.createClass

      render: ->
        <div id="footer">
          <div id="filterStateInput" class="shiny-my-data-input"></div>
          <div id="panelLabelStateInput" class="shiny-my-data-input"></div>
          <div id="panelLayoutStateInput" class="shiny-my-data-input"></div>
          <div id="relatedDisplayStateInput" class="shiny-my-data-input"></div>
          <div id="activeCogStateInput" class="shiny-my-data-input"></div>
          <div id="sortStateInput" class="shiny-my-data-input"></div>
          <div id="appHashInput" class="shiny-my-data-input"></div>
          <div id="appHashOutput" class="shiny-apphash-output"></div>
          <div id="exposedStateDataOutput" data-callback="updateControlsExposedState" class="shiny-my-data-output"></div>
          <div id="panelDimInput" class="shiny-my-data-input"></div>
          <div class="container">
             <div class="pull-left shiny-template-output" id="cogBreadcrumbOutput" data-post-render="cogBreadcrumbOutputPostRender">
             </div>
          </div>
        </div>


    module.exports = FooterPage
