
# Related Displays



    # @litcoffee React.DOM
    React = require 'react'
    _     = require 'underscore'

    RelatedDisplay = require "./related_display.litcoffee"
    LeftNavStore   = require "../../stores/left_nav_store.litcoffee"
    PanelDataStore = require "../../stores/panel_data_store.litcoffee"

    PanelLayout = React.createClass
      displayName: "Table_Sort_Filter"

      navInfo: _.once ->
        dt = LeftNavStore.get_single_item_by_id("cogTableControls")
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
        console.log("Table Sort Filter cancel hit!")
        return
      handle_apply: ->
        console.log("Table Sort Filter apply hit!")
        return


      handle_header_click: ({key, currentStatus}) ->
        return ->
          console.log("Table Sort Filter handle_header_click for key: |#{key}| with current status: |#{currentStatus}| !")
          return

      handle_value_min: ({key, currentStatus}) ->
        return ->
          console.log("Table Sort Filter handle_value_min for key: |#{key}| with current status: |#{currentStatus}| !")
          return

      handle_value_max: ({key, currentStatus}) ->
        return ->
          console.log("Table Sort Filter handle_value_max for key: |#{key}| with current status: |#{currentStatus}| !")
          return

      handle_page_first: ->
        console.log("Table Sort Filter handle_page_first!")
        return

      handle_page_last: ->
        console.log("Table Sort Filter handle_page_last!")
        return

      handle_page_prev: ->
        console.log("Table Sort Filter handle_page_prev!")
        return

      handle_page_next: ->
        console.log("Table Sort Filter handle_page_next!")
        return

      handle_cog_select_click: ({key, currentStatus}) ->
        return ->
          console.log("Table Sort Filter handle_cog_select_click for key: |#{key}| with current status:  |#{currentStatus}| !")
          return


      # propTypes:
      #   divLink:     ReactPropTypes.string.isRequired
      #   icon:        ReactPropTypes.string.isRequired
      #   title:       ReactPropTypes.string.isRequired
      #   description: ReactPropTypes.string.isRequired
      #   itemId:      ReactPropTypes.string.isRequired
      #   htmlLink:    ReactPropTypes.string.isRequired

      render_inner_inner: ({renderData}) ->

        tableHeaders = []

        # {
        #   "name": "panelKey",
        #   "desc": "panel key",
        #   "type": "key",
        #   "group": "panelKey",
        #   "defLabel": false,
        #   "defActive": true,
        #   "filterable": false,
        #   "index": 0,
        #   "active": ""
        # },
        console.log(renderData.cogInfo)
        for item,i in renderData.cogInfo

          tableHeaders.push(
            <th
              key={i}
              className={if item.filterable then "pointer" else "hidden"}
              onClick={@handle_header_click({key: item.name, currentStatus: "unsorted"}) }
            >
              { item.name }
              <span className="cog-table-sort-span">
                <i className="icon-unsorted"></i>
              </span>
            </th>
          )


        tableBody = []
        for itemArr,j in renderData.data
          rowArr = []
          for item, i in itemArr
            if renderData.cogInfo[i].filterable
              rowArr.push(<td key={j + "," + i}>{item}</td>)
            else
              rowArr.push(<td key={j + "," + i} className="hidden">{item}</td>)

          tableBody.push(<tr key={j} >{ rowArr }</tr>)


        tableFoot = ["TABLE FOOTER NEEDS TO BE IMPLEMENTED!!!"]
        console.log("need to insert table footer charts.")

        <div id="cog-table-inner-inner">
          <div id="cog-table-table">
            <table cellPadding="0" cellSpacing="0" border="0" className="table-condensed table-striped table-bordered nice-table cog-table nowrap" id="cogTable">
              <thead>
                <tr id="cogColumnSortInput" className="shiny-my-data-input shiny-bound-input">
                  { tableHeaders }
                </tr>
              </thead>
              <tbody id="cogTableContentOutput" className="shiny-template-output shiny-bound-output">
                { tableBody }
              </tbody>
              <tfoot>
                { tableFoot }
              </tfoot>
            </table>
          </div>
          <div id="cog-table-under">
            <div id="cogTableInfoOutput" className="pull-left shiny-text-output shiny-bound-output"> { renderData.cogTableInfo }
            </div>
            <div className="pull-right" id="cog-table-pagination">
              <ul className="pagination shiny-my-data-input shiny-bound-input" id="cogTablePaginationInput">
                <li>
                  <a href="javascript:" onClick={@handle_page_first}>
                    <i className="icon-step-backward"></i>
                  </a>
                </li>
                <li>
                  <a href="javascript:" onClick={@handle_page_prev}>
                    <i className="icon-chevron-left"></i>
                  </a>
                </li>
                <li>
                  <a href="javascript:">
                    <span id="cogTableCurPageOutput" className="shiny-text-output shiny-bound-output">{ renderData.curPage }</span>
                      {"of"}
                    <span id="cogTableNpagesOutput" className="shiny-text-output shiny-bound-output">{ renderData.nPages }</span>
                  </a>
                </li>
                <li>
                  <a href="javascript:" onClick={@handle_page_next}>
                    <i className="icon-chevron-right"></i>
                  </a>
                </li>
                <li>
                  <a href="javascript:" onClick={@handle_page_last}>
                    <i className="icon-step-forward"></i>
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>


      render_cog_select: ({renderData}) ->

        self = this
        cogRows = []

        # {
        #   "name": "panelKey",
        #   "desc": "panel key",
        #   "type": "key",
        #   "group": "panelKey",
        #   "defLabel": false,
        #   "defActive": true,
        #   "filterable": false,
        #   "index": 0,
        #   "active": ""
        # },

        for item,i in renderData.cogInfo
          onClickFn = @handle_cog_select_click {
            key          : item.name,
            currentStatus: (item.active is "")
          }

          classValue = "list-group-item selectable " + item.active + " nothidden"

          cogRows.push(
            <li key={i} className={classValue} onClick={onClickFn} >
              <span>{ item.name }</span>
              <span className="right-icon">
                <i className="icon-filter hidden"></i>
                <i className="icon-sort-numeric-asc hidden"></i>
                <i className="icon-sort-numeric-desc hidden"></i>
                <i className="icon-sort-alpha-asc hidden"></i>
                <i className="icon-sort-alpha-desc hidden"></i>
              </span>
            </li>
          )

          # <p>
          #   <button id="btn-cog-table-reset" type="button" className="btn btn-danger" disabled>Reset All</button>
          # </p>

        return (
          <div id="cog-table-var-select">
            <p className="control-label">Columns to show</p>
            <div className="cog-table-var-select-list">
              <ul className="list-group filter-select" id="cog-table-vars">
                { cogRows }
              </ul>
            </div>
          </div>
        )


      render_body_content: ({renderData}) ->
        <div id="cog-table-hideoverflow">
          <div id="cog-table-outer">
            <div id="cog-table-inner">
              { @render_inner_inner({renderData}) }
              { @render_cog_select({renderData}) }
            </div>
          </div>
        </div>



      render: ->
        renderData = PanelDataStore.get_single_item_by_id("table_sort_filter")

        <RelatedDisplay
          key={"Table_Sort_Filter"}
          icon={ @render_icon() }
          title={ @render_title() }
          description={ @render_description() }
          bodyContent={ @render_body_content({renderData}) }
          onCancel={ @handle_cancel }
          onApply={ @handle_apply }
        />




    module.exports = PanelLayout
