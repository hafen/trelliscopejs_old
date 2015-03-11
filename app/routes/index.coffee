`import Ember from 'ember'`

IndexRoute = Ember.Route.extend {

  model: (params) ->
    store = this.store
    return Ember.RSVP.hash {
      # find all 'nav' objects... uses fixtures, so no REST call
      navs: store.find('nav')
    }

  afterModel: ->
    self = this
    console.log(this)
    # console.log(this.context)
    # console.log(this.context.navs)
  #   return $.getJSON('/navs').then (result) ->
  #     console.log("asdf result: ", result)
  #     self.set("navs", result)
  #     return

  # setupController: (controller, model) ->
  #   console.log("calling index setupController")
  #   this._super(controller,model);
  #   controller.set('navs', this.get('navs'))
  #   return

  # redirect: ->
  #   this.transitionTo('s')
  #   return
}

`export default IndexRoute`
