
# Left Navigation Item

Template for navigation items in the left side bar

    # @litcoffee React.DOM
    React = require 'react'
    ReactPropTypes = React.PropTypes

    LeftNavItem = require("./left_nav_item.litcoffee")

    LeftNavGroup = React.createClass
      displayName: "LeftNavGroup"
      propTypes:
        title: ReactPropTypes.string.isRequired
        navItems: ReactPropTypes.array.isRequired

      render: ->

        itemDisplayArr = []
        for navItem in @props.navItems
          navTitle = if navItem.navTitle? then navItem.navTitle else navItem.title
          itemDisplayArr.push <LeftNavItem
            divLink     = navItem.divLink
            icon        = navItem.icon
            title       = navTitle
            description = navItem.description
            itemId      = navItem.itemId
          />
          # itemDisplayArr.push(<br />)


        <div>
          <a href="javascript:" className="list-group-item active list-group-item-primary list-group-item-short">
            <span className="list-group-header">{@props.title}</span>
          </a>
          {itemDisplayArr}
        </div>

    module.exports = LeftNavGroup
