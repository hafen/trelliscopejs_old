
# RadComponent

This is a test of literate coffeescript

    # @litcoffee React.DOM
    React = require 'react'

    RadComponent = React.createClass

      render: ->
        <div className="rad-component">
          <p>is this component rad? {@props.rad}</p>
        </div>


    module.exports = RadComponent
