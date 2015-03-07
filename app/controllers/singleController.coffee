App.SingleController = Ember.ObjectController.extend {
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
