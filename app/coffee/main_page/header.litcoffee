
# Header Section of Main Page

contains top icon bar in main section

    # @litcoffee React.DOM
    React = require 'react'

    HeaderPage = React.createClass

      render: ->
        <div class="navbar navbar-default navbar-fixed-top" role="navigation">
          <div class="container">
            <div class="navbar-header">
              <div class="left-icons">
                <ul>
                  <a data-toggle="modal" data-target="#displayInfoModal" href="javascript:"><li><i class="icon-file-info"></i></li></a>
                  <span id="headerDisplayNameOutput" class="shiny-text-output"></span>
                </ul>
              </div>
              <div class="center-icons shiny-template-output" id="panelPageNavOutput" data-post-render="panelPageNavOutputPostRender">
              </div>
              <div class="right-icons">
                <ul>
                  <a data-toggle="modal" data-target="#userModal" href="javascript:"><li><i class="icon-user"></i></li></a>
                  <a data-toggle="modal" data-target="#openModal" href="javascript:"><li><i class="icon-folder-open"></i></li></a>
                  <a data-toggle="modal" data-target="#aboutModal" href="javascript:"><li><i class="icon-info-circle"></i></li></a>
                </ul>
              </div>
            </div>
          </div>
        </div>


    module.exports = HeaderPage
