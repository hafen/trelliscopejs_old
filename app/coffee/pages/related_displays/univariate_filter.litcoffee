
# Related Displays



    # @litcoffee React.DOM
    React = require 'react'
    _     = require 'underscore'

    RelatedDisplay = require "./related_display.litcoffee"
    LeftNavStore   = require "../../stores/left_nav_store.litcoffee"
    PanelDataStore = require "../../stores/panel_data_store.litcoffee"

    PanelLayout = React.createClass
      displayName: "Panel_Filter_Univariate"

      navInfo: _.once ->
        dt = LeftNavStore.get_single_item_by_id("cogUniFilterControls")
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


      handle_label_click: ({key, currentStatus, message}) ->
        return ->
          console.log("Panel Filter Univariate handle_label_click for key: |#{key}| with current status: |#{currentStatus}| !")
          return

      handle_label_hover_enter: ({key, currentStatus, message}) ->
        return ->
          console.log("Panel Filter Univariate handle_label_hover_enter for key: |#{key}| with current status: |#{currentStatus}|.  Display message: |#{message}| !")
          return
      handle_label_hover_leave: ({key, currentStatus}) ->
        return ->
          console.log("Panel Filter Univariate handle_label_hover_leave for key: |#{key}| with current status: |#{currentStatus}| !")
          return



      # propTypes:
      #   divLink:     ReactPropTypes.string.isRequired
      #   icon:        ReactPropTypes.string.isRequired
      #   title:       ReactPropTypes.string.isRequired
      #   description: ReactPropTypes.string.isRequired
      #   itemId:      ReactPropTypes.string.isRequired
      #   htmlLink:    ReactPropTypes.string.isRequired



      render_body_content: ({renderData})->

        labelInfoArr = renderData.cogs
        console.log("labelInfoArr: ", labelInfoArr)


        console.log("TODO. listen to what is filtered.  hide item's span icon in nameArr")

        # {
        #   "name": "slope",
        #   "desc": "list price slope",
        #   "type": "numeric",
        #   "group": "common",
        #   "defLabel": false,
        #   "defActive": true,
        #   "filterable": true
        # },
        nameArr = []
        for item, i in labelInfoArr
          if item.filterable and item.defActive and (item.type is "numeric")
            nameArr.push(
              <li
                key={i}
                className="list-group-item"
                onClick={ @handle_label_click({key: item.name, currentStatus: no}) }
                onMouseEnter={ @handle_label_hover_enter({key: item.name, currentStatus: no, message: item.desc}) }
                onMouseLeave={ @handle_label_hover_leave({key: item.name, currentStatus: no}) }
              >
                <div className="uni-filter-var-name filter-list-name">{item.name}</div>
                <span className="right-icon"><i className={"icon-filter #{"hidden"}"}></i></span></li>
            )

        <div className="panel-body-wrapper">
          <div className="relative-wrapper">
            <div className="vis-filter-controls">
              <p className="control-label">Variable to plot</p>
              <div className="vis-filter-univar" id="univarFilterState">
                <ul className="list-group filter-select" id="univarFilterSelect">
                  { nameArr }
                </ul>
              </div>
            </div>
            <div className="vis-filter-plot empty-plot shiny-d3-output shiny-bound-output" id="univarFilterPlot" data-d3-fn="d3univar" data-callback="univarFilterLocalLoad" data-spinner="univarSpinner"></div>
            <div id="univar-dist-toggle">
              <div className="btn-group" id="univarDistType" data-action="updateUnivarPlot">
                <button type="button" className="btn btn-info mc-toggle active" data-dist-type="conditional">Filtered</button>
                <button type="button" className="btn btn-default mc-toggle" data-dist-type="marginal">All</button>
              </div>
            </div>
            <div id="univar-type-toggle">
              <div className="btn-group" id="univarPlotType" data-action="updateUnivarPlot">
                <button type="button" className="btn btn-default mc-toggle quantile-button" disabled="">Quantile</button>
                <button type="button" className="btn btn-default mc-toggle histogram-button" disabled="">Histogram</button>
                <button type="button" className="btn btn-default mc-toggle bar-button" disabled="">Bar</button>
              </div>
            </div>
          </div>
        </div>


      render: ->
        renderData = PanelDataStore.get_single_item_by_id("univariateFilter")

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
