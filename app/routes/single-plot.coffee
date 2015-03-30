`import Ember from 'ember'`

SinglePlotRoute = Ember.Route.extend {

  model: (params) ->
    store = this.store
    this.model.navitems = store.find('nav')
    return this.model

    # return Ember.RSVP.hash {
    #   # find all 'nav' objects... uses fixtures, so no REST call
    #   navs: store.find('nav')
    # }

  afterModel: ->
    self = this

    # console.log(this)
    # console.log(this.model)
    # console.log(this.model.navitems)
    self.set("navs", this.store.find('nav'))

    # console.log(this.context)
    # console.log(this.context.navs)

  #   return $.getJSON('/navs').then (result) ->
  #     console.log("asdf result: ", result)
  #     self.set("navs", result)
  #     return

  # setupController: (controller, model) ->
  #   console.log("calling SinglePlotRoute setupController")
  #   this._super(controller,model);
  #   # controller.set('navs', this.get('navs'))
  #   return
}



`export default SinglePlotRoute`
