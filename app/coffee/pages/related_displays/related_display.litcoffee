
# Related Displays

All "modal" pages will be rendered using the same style... just diff content

    # @litcoffee React.DOM
    React = require 'react'
    _     = require 'underscore'
    ReactPropTypes = React.PropTypes


    RelatedDisplay = React.createClass
      displayName: "Related_Display"

      propTypes:
        # divLink:     ReactPropTypes.string.isRequired
        icon:         ReactPropTypes.string.isRequired
        title:        ReactPropTypes.string.isRequired
        description:  ReactPropTypes.string.isRequired
        bodyContent:  ReactPropTypes.object.isRequired
        onCancel:     ReactPropTypes.func.isRequired
        onApply:      ReactPropTypes.func.isRequired
        # itemId:      ReactPropTypes.string.isRequired
        # htmlLink:    ReactPropTypes.string.isRequired

      render_top: ({title, description, icon}) ->
        <div className="panel-heading">
          <div className="panel-left">
            <span className="slide-icon">
              <i className={ icon }></i>
            </span>
            <h1>{ title }</h1>
            <p>{ description }</p>
          </div>
          <div className="panel-right">
            <a href="javascript:" className="btn-panel-close">
              <span className="panel-close"><i className="icon-times"></i></span>
            </a>
          </div>
        </div>

      render_bottom: ->
        <div className="panel-footer">
          <div className="pull-left control-footer"></div>
          <div className="pull-right">
            <button type="button" className="btn btn-default btn-panel-close" data-action="panelLayoutOutputCancelButton" onClick={@props.onCancel}>Cancel</button>
            <button type="button" className="btn btn-primary btn-panel-apply" data-action="panelLayoutOutputApplyButton" onClick={@props.onApply}>Apply</button>
          </div>
        </div>

      render_main_class: ->
        return "panel-body shiny-template-output shiny-bound-output"

      render: ->
          # <div className="slide-panel panel panel-default slide-left">

        <div className="shiny-template-output" id="panelTableContentOutput" data-post-render="panelTableContentOutputPostRender">

          <div className="related-display-container panel panel-default">

            { @render_top({title: @props.title, description: @props.description, icon: @props.icon}) }

            <div className={ @render_main_class() } >

              {@props.bodyContent}

            </div>

            { @render_bottom() }

          </div>
        </div>


    # RelatedDisplayFactory = React.createFactory(RelatedDisplay)
    # module.exports = RelatedDisplayFactory
    module.exports = RelatedDisplay
