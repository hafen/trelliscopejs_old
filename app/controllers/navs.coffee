`import Ember from 'ember'`

NavsController = Ember.Controller.extend {
  firstParts: ( ->
    return model.navs
  ).property("model.navs")
}

`export default NavsController`
