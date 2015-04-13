# Routes

Explaination of all routes in application

# Notes

* All routes must be done similar to Ember.js formatting.
* There is an "```{{outlet}}```" or ```<RouteHandler/>``` for nested routes.
* The router page will pull in all 'routes' and organize them accordingly.
* Each page will not know about eachother, except for through the router.

# Base Url

may need to follow pattern: /s/*:groupName*/*:projectName*

* /
* /selectProject
  * Choose project to work in

* /s/*:projectName*
  * base view of project

* /s/*:projectName*/*:page*
  * show the project on the given page

* /s/*:projectName*/fn
  * Panel Function... add update of first panel on the side?

* /s/*:projectName*/related
  * show related displays

* /s/*:projectName*/labels
  * show labels currently displayed

* /s/*:projectName*/cognostics
  * table of cognostics to choose from
  * (should be combined with labels)

* /s/*:projectName*/filter/table
  * table filter view

* /s/*:projectName*/filter/univariate
* /s/*:projectName*/filter/bivariate
* /s/*:projectName*/filter/multivariate
  * uni/bi/multivariate filter views

* /s/*:projectName*/sample
  * coming

* /s/*:projectName*/settings
  * settings?





Design ideas
* Have the url be as minimal as possible
  * settings will be saved internally
  * 'full' url may be gathered if needed
  * if 'full' url is entered, states are saved, then url is reduced
  * 'full' url could be copied or saved for bookmarks.  like a "share here" button
  * it's MUCH prettier
  * state could try to be done within a "session settings" save.
    * Each tab loaded would have its own "session" which would house all settings.
    * Before refresh, all parameters would be put into the url.
    * Once the page is refreshed, all parameters are set into new "session" and removed from url.
    * All tabs would have 'full' urls defined in url to work with "open in new tab"
    * Only thing in url is current navigation route... like normal.

* Have all settings different from default in url
  * project and data urls will be done
  * but, all settings such as labels are done as parameters in url

