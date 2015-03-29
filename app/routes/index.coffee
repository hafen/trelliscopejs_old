`import Ember from 'ember'`

IndexRoute = Ember.Route.extend {

  beforeModel: ->
    this.transitionTo('singlePlot');
    return

}

`export default IndexRoute`
