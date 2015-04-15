
# Related Displays



    # @litcoffee React.DOM
    React = require 'react'
    _     = require 'underscore'

    RelatedDisplay = require "./related_display.litcoffee"
    LeftNavStore = require "../../stores/left_nav_store.litcoffee"

    PanelLayout = React.createClass
      displayName: "Panel_Layout"

      navInfo: _.once ->
        dt = LeftNavStore.get_single_item_by_id("panelLayout")
        console.log("dt: ", dt)
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
        console.log("Panel Layout cancel hit!")
        return null
      handle_apply: ->
        console.log("Panel Layout apply hit!")
        return null

      handle_row_change: ->
        console.log("Panel Layout handle_row_change hit!")
        return null
      handle_col_change: ->
        console.log("Panel Layout handle_col_change hit!")
        return null



      # propTypes:
      #   divLink:     ReactPropTypes.string.isRequired
      #   icon:        ReactPropTypes.string.isRequired
      #   title:       ReactPropTypes.string.isRequired
      #   description: ReactPropTypes.string.isRequired
      #   itemId:      ReactPropTypes.string.isRequired
      #   htmlLink:    ReactPropTypes.string.isRequired

      handle_by_row: () ->
        isByRow = yes
        console.log "update store with value #{isByRow}!"
        return
      handle_by_col: () ->
        isByRow = no
        console.log "update store with value #{isByRow}!"
        return

      render_table: ({rowNum, colNum}) ->
        rowVal = []
        for j in [1..colNum]
          rowVal.push(
            <td></td>
          )

        bodyVal = []
        for i in [1..rowNum]
          bodyVal.push(
            <tr>{ rowVal }</tr>
          )

        # <table className="panel-layout-preview-table" style="width:103px; height:126.1899109792285px">
        <table className="panel-layout-preview-table">
          <tbody>
            { bodyVal }
          </tbody>
        </table>


      render_body_content: ({rowNum, colNum, isByRow})->
        rowPanelArrClass = if isByRow then "btn btn-info pl-toggle active" else "btn btn-default pl-toggle"
        colPanelArrClass = if isByRow then "btn btn-default pl-toggle" else "btn btn-info pl-toggle active"

        # <div id="panel-layout-preview-pane" style="height: 128.189910979229px;">

        <div className="panel-body-wrapper" id="panel-layout-data" data-panel-aspect="1">
          <div className="panel-layout-controls">
            <div className="well">
              <div className="control-group">
                <p className="control-label">Rows</p>
                <div className="controls">
                  <input id="panel-rows" type="number" value={ rowNum } className="input-small shiny-bound-input" onChange={ @handle_row_change } />
                </div>
              </div>
              <div className="control-group">
                <p className="control-label">Columns</p>
                <div className="controls">
                  <input id="panel-cols" type="number" value={ colNum } className="input-small shiny-bound-input" onChange={ @handle_column_change } />
                </div>
              </div>
            </div>
            <div className="well">
              <p className="control-label">Fixed Per Page</p>
              <div className="btn-group">
                <button type="button" className="btn btn-default layout-dropdown" disabled="">&nbsp;</button>
                <button type="button" className="btn btn-default dropdown-toggle" data-toggle="dropdown" disabled="">
                  <span className="caret"></span>
                  <span className="sr-only">Toggle Dropdown</span>
                </button>
                <ul className="dropdown-menu" role="menu">
                  <li><a href="javascript:">Var1<span className="badge pull-right">42</span></a></li>
                </ul>
              </div>
              <p className="control-label">Varies Per Page</p>
              <div className="btn-group">
                <button type="button" className="btn btn-default layout-dropdown" disabled="">&nbsp;</button>
                <button type="button" className="btn btn-default dropdown-toggle" data-toggle="dropdown" disabled="">
                  <span className="caret"></span>
                  <span className="sr-only">Toggle Dropdown</span>
                </button>
                <ul className="dropdown-menu" role="menu">
                  <li><a href="javascript:">Var1<span className="badge pull-right">42</span></a></li>
                </ul>
              </div>
            </div>
            <p className="control-label">Panel Arrangement</p>
            <div id="panel-layout-toggle">
              <div className="btn-group" id="panelArrangement">
                <button type="button" className={rowPanelArrClass} onClick={@handle_by_row}>By Row</button>
                <button type="button" className={colPanelArrClass} onClick={@handle_by_col}>By Column</button>
              </div>
            </div>
          </div>
          <div className="panel-layout-preview">
            <div id="panel-layout-preview-pane" >
              { @render_table({rowNum, colNum}) }
            </div>
          </div>
          <div className="clear"></div>
        </div>



      render: ->
        <RelatedDisplay
          icon={ @render_icon() }
          title={ @render_title() }
          description={ @render_description() }
          bodyContent={ @render_body_content({rowNum: 1, colNum: 1, isByRow: yes}) }
          onCancel={ @handle_cancel }
          onApply={ @handle_apply }
        />


    module.exports = PanelLayout
