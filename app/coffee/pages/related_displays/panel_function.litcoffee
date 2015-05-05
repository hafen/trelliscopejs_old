
# Related Displays

Panel Function displays the current function.

This is currently disabled. :-\


    # @litcoffee React.DOM
    React = require 'react'
    _     = require 'underscore'

    AceEditor = require 'react-ace'

    # must be required after AceEditor!
    brace = require 'brace'
    require("brace/mode/r")
    require("brace/theme/tomorrow")

    RelatedDisplay = require "./related_display.litcoffee"
    LeftNavStore   = require "../../stores/left_nav_store.litcoffee"
    PanelDataStore = require "../../stores/panel_data_store.litcoffee"




    PanelFunction = React.createClass
      displayName: "Panel_Function"

      navInfo: _.once ->
        dt = LeftNavStore.get_single_item_by_id("panelFunction")
        # console.log("dt: ", dt)
        return dt

      render_icon:        _.once( -> return @navInfo().icon)
      render_title:       _.once( -> return @navInfo().title)
      render_description: _.once( -> return @navInfo().description)

      componentWillMount: ->
        return


      handle_cancel: ->
        console.log("Panel Function cancel hit!")
        return null
      handle_apply: ->
        console.log("Panel Function apply hit!")
        return null

      handle_editor_onload: (editor) ->
        # console.log(editor)
        # window.editor = editor
        return

      handle_editor_change: (newValue) ->
        console.log("code changed... but i'm not listining!")
        return

      render_body_content:  ({renderData}) ->
        <AceEditor
          key="ace_editor"
          mode="r"
          theme="tomorrow"
          onChange={@handle_editor_change}
          onLoad={@handle_editor_onload}
          name="panel_function_editor"
          value={renderData.code?[0] or ""}
        />



      render: ->
        renderData = PanelDataStore.get_single_item_by_id("panel_function")
        console.log(renderData)

        <RelatedDisplay
          key={"Panel_Function_Related_Display"}
          icon={ @render_icon() }
          title={ @render_title() }
          description={ @render_description() }
          bodyContent={ @render_body_content({renderData}) }
          onCancel={ @handle_cancel }
          onApply={ @handle_apply }
        />


    module.exports = PanelFunction
