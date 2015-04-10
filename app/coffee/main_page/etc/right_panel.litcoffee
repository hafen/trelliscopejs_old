
# Right Panel of Main Page

Should contain info about cogmap

    # @litcoffee React.DOM
    React = require 'react'

    RightPanelPage = React.createClass
      displayName: "RightPanelPage"

      render: ->
        <div className="right-panel">
          <div className="right-sticky">
            <i className="icon-chevron-left" id="sticky-icon"></i>
          </div>
          <div className="right-panel-container">
            <h4>CogMap</h4>
            <div className="cogmap-selectors shiny-template-output" id="cogMapOutput" data-post-render="cogMapOutputPostRender">
            </div>
          </div>
        </div>


    module.exports = RightPanelPage
