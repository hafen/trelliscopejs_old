# Routes

Explaination of all routes in application

# Base Url

may need to follow pattern: /*:groupName*/*:projectName*

* /
* /selectProject
  * Choose project to work in

* /*:projectName*
  * base view of project

* /*:projectName*/*:page*
  * show the project on the given page

* /*:projectName*/fn
  * Panel Function... add update of first panel on the side?

* /*:projectName*/related
  * show related displays

* /*:projectName*/labels
  * show labels currently displayed

* /*:projectName*/cognostics
  * table of cognostics to choose from
  * (should be combined with labels)

* /*:projectName*/filter/table
  * table filter view

* /*:projectName*/filter/univariate
* /*:projectName*/filter/bivariate
* /*:projectName*/filter/multivariate
  * uni/bi/multivariate filter views

* /*:projectName*/sample
  * coming

* /*:projectName*/settings
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

