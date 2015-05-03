
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
              <tr className="panel-labels-group" key={"label_table_#{ret.length}"} ><td> { cogInfoObj.title } </td><td></td></tr>
            )
            for cogInfoItem in cogInfoObj.items
              do (cogInfoItem) ->
                classNameVal = if cogInfoItem.isActive
                  "select-column selectable panel-labels-select active"
                else
                  "select-column selectable panel-labels-select "

                handle_fn = self.handle_show_click({key: cogInfoItem.mainTitle, currentStatus: cogInfoItem.isActive})

                ret.push(
                  <tr key={"label_table_#{ret.length}"} onClick={handle_fn} className="pointer">
                    <td><strong>{ cogInfoItem.mainTitle }</strong>: {cogInfoItem.subTitle}</td>
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
        <RelatedDisplay
          key={"Panel_Labels_Related_Display"}
          icon={ @render_icon() }
          title={ @render_title() }
          description={ @render_description() }
          bodyContent={ @render_body_content({cogInfoArr: @testCogInfoArr()}) }
          onCancel={ @handle_cancel }
          onApply={ @handle_apply }
        />

      testCogInfoArr: ->

        return [
          {
            title: "panelKey",
            items: [{mainTitle: "panelKey", subTitle: "panel key", isActive: no}]
          }
          {
            title: "condVar",
            items: [
              {mainTitle: "county", subTitle: "conditioning variable", isActive: yes}
              {mainTitle: "state", subTitle: "conditioning variable", isActive: yes}
            ]
          }
          {
            title: "common",
            items: [
              {mainTitle: "slope", subTitle: "list price slope", isActive: no}
              {mainTitle: "meanList", subTitle: "mean", isActive: yes}
              {mainTitle: "meanSold", subTitle: "mean", isActive: no}
              {mainTitle: "nObs", subTitle: "number of non-NA list prices", isActive: no}
              {mainTitle: "zillowHref", subTitle: "zillow link", isActive: no}
            ]
          }
          {
            title: "studying",
            items: [
              {mainTitle: "tracy", subTitle: "finals", isActive: yes}
              {mainTitle: "tracySummer", subTitle: "quals", isActive: no}
            ]
          }
        ]


    module.exports = PanelLayout
