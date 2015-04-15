# Null Handler

passes all routes through as if this route didnt even exist


    # @litcoffee React.DOM
    React = require 'react'
    {DefaultRoute, Link, Route, RouteHandler, run} = require('react-router')

    NullHandler = React.createClass
      displayName: "NullHandler"

      render: ->
        <RouteHandler />

    module.exports = NullHandler

