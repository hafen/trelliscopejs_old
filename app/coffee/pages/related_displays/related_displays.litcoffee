
# Related Displays



    # @litcoffee React.DOM
    React = require 'react'
    _     = require 'underscore'

    RelatedDisplay = require "./related_display.litcoffee"
    LeftNavStore = require "../../stores/left_nav_store.litcoffee"

    PanelLayout = React.createClass
      displayName: "Related_Display"

      navInfo: _.once ->
        dt = LeftNavStore.get_single_item_by_id("relatedDisplayList")
        # console.log("dt: ", dt)
        return dt

      render_icon:        _.once( -> return @navInfo().icon)
      render_title:       _.once( -> return @navInfo().title)
      render_description: _.once( -> return @navInfo().description)

      # {
      #   icon:        "icon-th"
      #   title:       "Panel Layout"
      #   description: "Specify the arrangement of the panels on each page by entering the number of rows and columns of panels per page.  Future functionality for fixing / varying levels of cognostics per page to come."
      #   itemId:      "panelLayout"
      #   divLink:     "panel-layout"
      #   htmlLink:     "/panel_layout"
      # }

      handle_cancel: ->
        console.log("Related Display cancel hit!")
        return null
      handle_apply: ->
        console.log("Related Display apply hit!")
        return null




      # propTypes:
      #   divLink:     ReactPropTypes.string.isRequired
      #   icon:        ReactPropTypes.string.isRequired
      #   title:       ReactPropTypes.string.isRequired
      #   description: ReactPropTypes.string.isRequired
      #   itemId:      ReactPropTypes.string.isRequired
      #   htmlLink:    ReactPropTypes.string.isRequired


      render: ->
        <RelatedDisplay
          key={"Panel_Layout_Related_Display"}
          icon={ @render_icon() }
          title={ @render_title() }
          description={ @render_description() }
          bodyContent={ "Not implemented!" }
          onCancel={ @handle_cancel }
          onApply={ @handle_apply }
        />


    module.exports = PanelLayout
