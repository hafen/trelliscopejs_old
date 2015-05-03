
# Related Displays



    # @litcoffee React.DOM
    React = require 'react'
    _     = require 'underscore'

    RelatedDisplay = require "./related_display.litcoffee"
    LeftNavStore = require "../../stores/left_nav_store.litcoffee"

    PanelLayout = React.createClass
      displayName: "Active_Cognostics"

      navInfo: _.once ->
        dt = LeftNavStore.get_single_item_by_id("activeCogList")
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
        console.log("Active Cognostics cancel hit!")
        return
      handle_apply: ->
        console.log("Active Cognostics apply hit!")
        return


      handle_show_click: ({key, currentStatus}) ->
        return ->
          console.log("Active Cognostics handle_show_click for key: |#{key}| with current status: |#{currentStatus}| !")
          return



      # propTypes:
      #   divLink:     ReactPropTypes.string.isRequired
      #   icon:        ReactPropTypes.string.isRequired
      #   title:       ReactPropTypes.string.isRequired
      #   description: ReactPropTypes.string.isRequired
      #   itemId:      ReactPropTypes.string.isRequired
      #   htmlLink:    ReactPropTypes.string.isRequired


      render_table_body: ({cogInfoArr}) ->

        ret = []
        self = this

        for cogInfoObj in cogInfoArr
          do (cogInfoObj) ->
            # <tr>
            #   <td><strong>panelKey</strong>: panel key</td>
            #   <td className="select-column selectable panel-labels-select " data-name="panelKey" id="panel-labels-select-panelKey"><i className="icon-check "></i></td>
            # </tr>

            ret.push(
              <tr className="panel-labels-group" key={"label_table_#{ret.length}"} ><td> { cogInfoObj.groupName.join(' ') } </td><td></td></tr>
            )
            for cogInfoItem in cogInfoObj.data
              do (cogInfoItem) ->
                classNameVal = "select-column selectable panel-labels-select " + cogInfoItem.active
                cogInfoItem.isActive = (cogInfoItem.active is "active")

                handle_fn = self.handle_show_click({key: cogInfoItem.name, currentStatus: cogInfoItem.isActive})

                ret.push(
                  <tr key={"label_table_#{ret.length}"} onClick={handle_fn} className="pointer">
                    <td><strong>{ cogInfoItem.name }</strong>: {cogInfoItem.desc}</td>
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




      render_body_content: ({cogInfoArr})->

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
              { @render_table_body({cogInfoArr}) }
            </tbody>
          </table>
          </div>
        </div>



      render: ->
        renderData = @testCogInfoArr()

        <RelatedDisplay
          key={"Panel_Labels_Related_Display"}
          icon={ @render_icon() }
          title={ @render_title() }
          description={ @render_description() }
          bodyContent={ @render_body_content({cogInfoArr: renderData.cog}) }
          onCancel={ @handle_cancel }
          onApply={ @handle_apply }
        />

      testCogInfoArr: ->

        return {
          "cog":[
            {
              "groupName":["panelKey"],
              "data":[
                {
                  "name":"panelKey",
                  "desc":"panel key",
                  "active":"active",
                  "selectable":""
                }
              ]
            },
            {
              "groupName":["condVar"],
              "data":[
                {
                  "name":"county",
                  "desc":"conditioning variable",
                  "active":"active",
                  "selectable":"selectable"
                },
                {
                  "name":"state",
                  "desc":"conditioning variable",
                  "active":"active",
                  "selectable":"selectable"
                }
              ]
            },
            {
              "groupName":["common"],
              "data": [
                {
                  "name":"slope",
                  "desc":"list price slope",
                  "active":"active",
                  "selectable":"selectable"
                },
                {
                  "name":"meanList",
                  "desc":"mean",
                  "active":"active",
                  "selectable":"selectable"
                },
                {
                  "name":"meanSold",
                  "desc":"mean",
                  "active":"active",
                  "selectable":"selectable"
                },
                {
                  "name":"nObs",
                  "desc":"number of non-NA list prices",
                  "active":"active",
                  "selectable":"selectable"
                },
                {
                  "name":"zillowHref",
                  "desc":"zillow link",
                  "active":"",
                  "selectable":"selectable"
                }
              ]
            }
          ],
          "cdName":["list_vs_time_ggplot"],
          "cdGroup":["fields"]
        }


    module.exports = PanelLayout
