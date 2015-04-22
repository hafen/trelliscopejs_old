
# Header Section of Main Page

contains top icon bar in main section

    # @litcoffee React.DOM
    React = require 'react'

    HeaderPage = React.createClass
      displayName: "Header"

      render: ->
        <div className="navbar navbar-default navbar-fixed-top" role="navigation">
          <div className="container">
            <div className="navbar-header">
              <div className="left-icons">
                <ul>
                  <a data-toggle="modal" data-target="#displayInfoModal" href="javascript:"><li><i className="icon-file-info"></i></li></a>
                  <span id="headerDisplayNameOutput" className="shiny-text-output"></span>
                </ul>
              </div>
              <div className="center-icons shiny-template-output" id="panelPageNavOutput" data-post-render="panelPageNavOutputPostRender">
              </div>
              <div className="right-icons">
                <ul>
                  <a data-toggle="modal" data-target="#userModal" href="javascript:"><li><i className="icon-user"></i></li></a>
                  <a data-toggle="modal" data-target="#openModal" href="javascript:"><li><i className="icon-folder-open"></i></li></a>
                  <a data-toggle="modal" data-target="#aboutModal" href="javascript:"><li><i className="icon-info-circle"></i></li></a>
                </ul>
              </div>
            </div>
          </div>
        </div>


    module.exports = HeaderPage
