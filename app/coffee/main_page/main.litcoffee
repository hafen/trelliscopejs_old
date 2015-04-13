
# Main Page

Should be shell to application

    # @litcoffee React.DOM
    React = require 'react'
    Router = require('director').Router

    Header     = require "./etc/header.litcoffee"
    Footer     = require "./etc/footer.litcoffee"
    RightPanel = require "./etc/right_panel.litcoffee"

    LeftNav = require "./left_nav/left_nav.litcoffee"


    MainPage = React.createClass
      displayName: "MainPage"

      # componentDidMount: ->
      #   routes = {
      #     '/related_displays':  ->
      #       console.log("related displays!")
      #       return

      #     '/panel_function': [
      #       ->
      #         console.log("books page!")
      #         return

      #       ->
      #         console.log("An inline route handler.")
      #         return
      #     ]
      #     '/panel_labels': ->
      #         console.log("panel labels!")
      #         return
      #     '/panel_layout': ->
      #         console.log("panel layout!")
      #         return
      #     '/books/view/:bookId': (bookId) ->
      #       console.log("viewBook: bookId is populated: " + bookId)
      #       return
      #   }

      #   # router = Router(routes)#.configure({html5history: yes})
      #   # router.init('/')
      #   # console.log(routes)

      #   # window.router = router
      #   return


      render: ->
        <div>
          <Header />
          <div className="container">

            <LeftNav />

            <div className="shiny-template-output" id="panelTableContentOutput" data-post-render="panelTableContentOutputPostRender"></div>

            <RightPanel />
          </div>
          <Footer />
        </div>








    module.exports = MainPage
