
# Left Navigation Item

Template for navigation items in the left side bar

    # @litcoffee React.DOM
    React = require 'react'
    ReactPropTypes = React.PropTypes

    LeftNavItem = React.createClass
      displayName: "LeftNavItem"
      propTypes:
        divLink:     ReactPropTypes.string.isRequired
        icon:        ReactPropTypes.string.isRequired
        title:       ReactPropTypes.string.isRequired
        description: ReactPropTypes.string.isRequired
        itemId:      ReactPropTypes.string.isRequired
        htmlLink:    ReactPropTypes.string.isRequired

      prop_bodyId: -> return this.props.itemId + "Output"
      applyButton: -> return this.props.itemId + "ApplyButton"
      navLink:     -> return this.props.divLink + "-nav-link"

      render: ->
        <a href={@props.htmlLink} className="list-group-item" data-divlink={@props.divlink} id={@props.itemId}>
          <i className={@props.icon}></i>
          <span className="list-group-text">{ @props.title }</span>
        </a>

    module.exports = LeftNavItem
