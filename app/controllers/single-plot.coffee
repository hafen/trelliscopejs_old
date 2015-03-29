`import Ember from 'ember'`

SinglePlotController = Ember.Controller.extend {
  # // initial value
  isExpanded: false,

  actions: {
    expand: ->
      this.set('isExpanded', true)
      return

    contract: ->
      this.set('isExpanded', false)
      return
  }
}

`export default SinglePlotController`
