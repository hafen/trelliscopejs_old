`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend {
  location: config.locationType
}


Router.map (map) ->

  # this.resource('navs')
  this.route('index', {path: '/'})

  this.route('singlePlot', {path: '/s/'})

  this.route('catchall', {path: '/*wildcard'})
  return


`export default Router`

  # this.resource 'dt', ->
    # this.route('leftSideNav')
  # this.route('left-navigations')
  # this.route('leftNavigations')
  # this.route('leftSideNavs')
  # # this.route('leftSideNavGroups')
  # this.route('leftSideNavGroup')
  # this.route('leftSideNavGroups')
  # this.route('leftSideNavGroups', {path: "/leftSideNavGroup/:groupName"})

  # this.route("asdf", {path: "/"})

  # @resource 'singleHomepage', {path:"/"}, ->
  #   @resource 'single', {path: "/s/:projectName"}, ->
  #     @route("panelFn", {path: "fn"})
  #     @route("related")
  #     @route("labels")
  #     @route("cognostics")
  #     @resource "filter", ->
  #       @route("table")
  #       @route("univariate")
  #       @route("multivariate")
  #       return
  #     @route("sample")
  #     @route("settings")
  #     @route(":page")
  #     return

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
#   this.route("settings")  @route 'LeftNavigations'


#   return
