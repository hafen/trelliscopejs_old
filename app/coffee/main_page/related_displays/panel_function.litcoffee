
# Related Displays

Panel Function displays the current function.

This is currently disabled. :-\


    # @litcoffee React.DOM
    React = require 'react'
    _     = require 'underscore'

    # brace     = require 'brace'
    # require('brace/mode/r')
    # require('brace/theme/tomorrow')

    AceEditor = require 'react-ace'

    RelatedDisplay = require "./related_display.litcoffee"
    LeftNavStore = require "../../stores/left_nav_store.litcoffee"


    PanelFunction = React.createClass
      displayName: "Panel_Function"

      navInfo: _.once ->
        dt = LeftNavStore.get_single_item_by_id("panelFunction")
        console.log("dt: ", dt)
        return dt

      render_icon:        _.once( -> return @navInfo().icon)
      render_title:       _.once( -> return @navInfo().title)
      render_description: _.once( -> return @navInfo().description)

      handle_cancel: ->
        console.log("Panel Function cancel hit!")
        return null
      handle_apply: ->
        console.log("Panel Function apply hit!")
        return null

      handle_editor_onload: (editor) ->
        # console.log(editor)
        # window.editor = editor
        # ace.config.set("basePath", "/assets/ace_editor")
        # editor.getSession().setMode('r')
        return

      handle_editor_change: (newValue) ->
        console.log("code changed... but i'm not listining!")
        return

      get_function_value: ->
        return "obj <- \"yellow\"\nobj"


      render_body_content:  ->
        return "Content!"


      render: ->
              # <RelatedDisplay
              #   icon={ @render_icon() }
              #   title={ @render_title() }
              #   description={ @render_description() }
              #   bodyContent={ @render_body_content() }
              #   onCancel={ @handle_cancel }
              #   onApply={ @handle_apply }
              # />


        <div className="shiny-template-output" id="panelTableContentOutput" data-post-render="panelTableContentOutputPostRender">

          <div className="related-display-container panel panel-default">

            <div className="panel-heading">
              <div className="panel-left">
                <span className="slide-icon">
                  <i className={ @render_icon() }></i>
                </span>
                <h1>{ @render_title() }</h1>
                <p>{ @render_description() }</p>
              </div>
              <div className="panel-right">
                <a href="javascript:" className="btn-panel-close">
                  <span className="panel-close"><i className="icon-times"></i></span>
                </a>
              </div>
            </div>

            <div className="panel-body shiny-template-output shiny-bound-output" >
              <AceEditor
                mode="javascript"
                theme="tomorrow"
                onChange={@handle_editor_change}
                onLoad={@handle_editor_onload}
                name="panel_function_editor"
                value={@get_function_value()}
              />

            </div>

            <div className="panel-footer">
              <div className="pull-left control-footer"></div>
              <div className="pull-right">
                <button type="button" className="btn btn-default btn-panel-close" data-action="panelLayoutOutputCancelButton" onClick={@handle_cancel}>Cancel</button>
                <button type="button" className="btn btn-primary btn-panel-apply" data-action="panelLayoutOutputApplyButton" onClick={@handle_apply}>Apply</button>
              </div>
            </div>

          </div>
        </div>



    module.exports = PanelFunction
