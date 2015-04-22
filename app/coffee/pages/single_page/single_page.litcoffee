
# Single Data Source View

Single data source viewing options

    # @litcoffee React.DOM
    React = require 'react'
    _     = require 'underscore'
    ReactPropTypes = React.PropTypes
    {DefaultRoute, Link, Route, RouteHandler, run} = require('react-router')

    Header     = require "../etc/header.litcoffee"
    Footer     = require "../etc/footer.litcoffee"
    RightPanel = require "../etc/right_panel.litcoffee"

    LeftNav = require "../left_nav/left_nav.litcoffee"

    RelatedDisplay = React.createClass
      displayName: "Single_Data_Source"


      # propTypes:
      #   # divLink:     ReactPropTypes.string.isRequired
      #   icon:         ReactPropTypes.string.isRequired
      #   title:        ReactPropTypes.string.isRequired
      #   description:  ReactPropTypes.string.isRequired
      #   bodyContent:  ReactPropTypes.object.isRequired
      #   onCancel:     ReactPropTypes.func.isRequired
      #   onApply:      ReactPropTypes.func.isRequired
      #   # itemId:      ReactPropTypes.string.isRequired
      #   # htmlLink:    ReactPropTypes.string.isRequired

      render: ->
        <div>
          <Header />

          <div className="shiny-template-output" id="panelTableContentOutput" data-post-render="panelTableContentOutputPostRender">
            # <RouteHandler />
          </div>

        </div>


    # RelatedDisplayFactory = React.createFactory(RelatedDisplay)
    # module.exports = RelatedDisplayFactory
    module.exports = RelatedDisplay
