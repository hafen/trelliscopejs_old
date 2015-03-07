`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend {
  location: config.locationType
}


Router.map ->
  this.resource 'single', {path: "/s/:projectName"}, ->
    this.route("panelFn", {path: "fn"})
    this.route("related")
    this.route("labels")
    this.route("cognostics")
    this.resource "filter", ->
      this.route("table")
      this.route("univariate")
      this.route("multivariate")
      return
    this.route("sample")
    this.route("settings")
    this.route(":page")
    return

  # this.resource 'multiple', {path: "/m/:projectName"}, ->
  #   this.route("page")
  #   this.route("fn")
  #   this.route("related")
  #   this.route("labels")
  #   this.route("cognostics")
  #   this.resource "filter", ->
  #     this.route("table")
  #     this.route("univariate")
  #     this.route("multivariate")
  #     return
  #   this.route("sample")
  #   this.route("settings")
  #   return

  this.route('catchall', {path: '/*wildcard'})
  return


# App.ApplicationRoute = Ember.Route.extend {
#   actions: {
#     error: ->
#       this.transitionTo('catchall', 'application-error')
#       return
#   }
# }

# Ember.Handlebars.registerHelper 'debug', (optionalValue) ->
#   console.log("Current Context");
#   console.log("====================");
#   console.log(this);
#   console.log(arguments);
#   if optionalValue
#     console.log("Value");
#     console.log("====================");
#     console.log(optionalValue);
#   return

`export default Router`
