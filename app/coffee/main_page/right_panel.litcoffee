
# Right Panel of Main Page

Should contain info about cogmap

    # @litcoffee React.DOM
    React = require 'react'

    RightPanelPage = React.createClass

      render: ->
        <div class="right-panel">
          <div class="right-sticky">
            <i class="icon-chevron-left" id="sticky-icon"></i>
          </div>
          <div class="right-panel-container">
            <h4>CogMap</h4>
            <div class="cogmap-selectors shiny-template-output" id="cogMapOutput" data-post-render="cogMapOutputPostRender">
            </div>
          </div>
        </div>


    module.exports = RightPanelPage
