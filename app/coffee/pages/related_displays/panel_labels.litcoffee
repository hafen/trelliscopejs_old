
# Related Displays



    # @litcoffee React.DOM
    React = require 'react'
    _     = require 'underscore'

    RelatedDisplay = require "./related_display.litcoffee"
    LeftNavStore   = require "../../stores/left_nav_store.litcoffee"
    PanelDataStore = require "../../stores/panel_data_store.litcoffee"

    PanelLayout = React.createClass
      displayName: "Panel_Labels"

      navInfo: _.once ->
        dt = LeftNavStore.get_single_item_by_id("panelLabelList")
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
        console.log("Panel Label cancel hit!")
        return
      handle_apply: ->
        console.log("Panel Label apply hit!")
        return


      handle_show_click: ({key, currentStatus}) ->
        return ->
          console.log("Panel Layout handle_show_click for key: |#{key}| with current status: |#{currentStatus}| !")
          return



      # propTypes:
      #   divLink:     ReactPropTypes.string.isRequired
      #   icon:        ReactPropTypes.string.isRequired
      #   title:       ReactPropTypes.string.isRequired
      #   description: ReactPropTypes.string.isRequired
      #   itemId:      ReactPropTypes.string.isRequired
      #   htmlLink:    ReactPropTypes.string.isRequired


      render_table_body: ({labelInfoArr}) ->

        ret = []
        self = this

        for labelInfoObj in labelInfoArr
          do (labelInfoObj) ->
            # <tr>
            #   <td><strong>panelKey</strong>: panel key</td>
            #   <td className="select-column selectable panel-labels-select " data-name="panelKey" id="panel-labels-select-panelKey"><i className="icon-check "></i></td>
            # </tr>

            ret.push(
              <tr className="panel-labels-group" key={"label_table_#{ret.length}"} ><td> { labelInfoObj.groupName.join(' ') } </td><td></td></tr>
            )
            for labelInfoItem in labelInfoObj.data
              do (labelInfoItem) ->
                classNameVal = "select-column selectable panel-labels-select " + labelInfoItem.active
                labelInfoItem.isActive = (labelInfoItem.active is "active")

                handle_fn = self.handle_show_click({key: labelInfoItem.name, currentStatus: labelInfoItem.isActive})

                ret.push(
                  <tr key={"label_table_#{ret.length}"} onClick={handle_fn} className="pointer">
                    <td><strong>{ labelInfoItem.name }</strong>: {labelInfoItem.desc}</td>
                    <td className={ classNameVal }>
                      <i className="icon-check "></i>
                    </td>
                  </tr>
                )
                return
              null

            return # from do
          null
        return ret




      render_body_content: ({renderData})->

        labelInfoArr = renderData.cog

        <div className="panel-body-wrapper">
          <div className="table-header-div">
          <table className="table table-condensed table-bordered nice-table full-width-table table-header">
            <thead>
              <tr>
                <th>Cognostic</th>
                <th className="select-column">Show</th>
              </tr>
            </thead>
          </table>
          </div>
          <div id="panel-labels-selection" className="table-body-div">
          <table className="table table-condensed table-bordered nice-table full-width-table">
            <tbody>
              { @render_table_body({labelInfoArr}) }
            </tbody>
          </table>
          </div>
        </div>



      render: ->
        renderData = PanelDataStore.get_single_item_by_id("panel_labels")

        <RelatedDisplay
          key={"Panel_Labels_Related_Display"}
          icon={ @render_icon() }
          title={ @render_title() }
          description={ @render_description() }
          bodyContent={ @render_body_content({renderData}) }
          onCancel={ @handle_cancel }
          onApply={ @handle_apply }
        />


    module.exports = PanelLayout
