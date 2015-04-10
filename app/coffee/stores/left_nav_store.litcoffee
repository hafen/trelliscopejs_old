# /*
#  * Copyright (c) 2014, Facebook, Inc.
#  * All rights reserved.
#  *
#  * This source code is licensed under the BSD-style license found in the
#  * LICENSE file in the root directory of this source tree. An additional grant
#  * of patent rights can be found in the PATENTS file in the same directory.
#  *

#  * TodoStore
#  */

    # Dispatcher = require('../dispatcher/Dispatcher');
    EventEmitter = require('events').EventEmitter;
    assign = require('object-assign');

    _data = {
      viewOptionsInfoArr: [
        {
          icon:        "icon-th"
          title:       "Panel Layout"
          description: "Specify the arrangement of the panels on each page by entering the number of rows and columns of panels per page.  Future functionality for fixing / varying levels of cognostics per page to come."
          itemId:      "panelLayout"
          divLink:     "panel-layout"
        }
        {
          icon:        "icon-panel-edit"
          navTitle:    "Panel Function"
          title:       "Panel Function Editor"
          description: "Edit the code that generates each panel."
          itemId:      "panelFunction"
          divLink:     "panel-function"
          footer:      "Note: this feature is currently disabled - panels will not update when you click 'Apply'..."
        }
        {
          divLink:     "panel-function"
          icon:        "icon-cog-list"
          title:       "Panel Labels"
          description: "Specify which cognostics to view underneath each panel. <br/>Select cognostics to view by clicking and/or dragging the 'Show' column."
          itemId:      "panelLabelList"
          footer:      "Note: this feature is currently disabled - panels will not update when you click 'Apply'..."
        }
        {
          divLink:     "add-related-display"
          icon:        "icon-plus-square-o"
          title:       "Related Displays"
          description: "Select additional displays (if any) that have been created on the same partitioning to view with the currently selected display.  If additional displays are selected, only one subset per page will be shown."
          itemId:      "relatedDisplayList"
        }
      ]

      cognosticsInfoArr: [
        {
          divLink:     "active-cog"
          icon:        "icon-active-cog"
          title:       "Active Cognostics"
          description: "Specify which cognostics are available for sorting, filtering, and sampling."
          itemId:      "activeCogList"
        }
        {
          divLink:     "cog-table-sort-filter"
          icon:        "icon-sort-filter"
          navTitle:    "Table Sort / Filter"
          title:       "Cognostics View / Sort / Filter"
          description: "View cognostics in a table and specify sort order or filtering of panels.  <br/>Shift-click on the panel header sorting buttons for multi-column sorting."
          itemId:      "cogTableControls"
        }
        {
          divLink:     "univar-filter"
          icon:        "icon-bars"
          navTitle:    "Univariate Filter"
          title:       "Visual Univariate Filter"
          description: "Filter panels based on a single cognostic guided by a visual display of the distribution of the cognostic.  <br/>Select a variable to view and click and drag on the display to specify filtering."
          itemId:      "cogUniFilterControls"
        }
        {
          divLink:     "bivar-filter"
          icon:        "icon-stats"
          navTitle:       "Bivariate Filter"
          title:       "Visual Bivariate Filter"
          description: "Filter panels based on pairs of cognostics through an interactive scatterplot.  <br/>Currently only quantitative variables are supported."
          itemId:      "cogBiFilterControls"
        }
        {
          divLink:     "multivar-filter"
          icon:        "icon-multivar"
          navTitle:    "Multivariate Filter"
          title:       "Visual Multivariate Filter"
          description: "Filter panels based on a two-dimensional projection pursuit of multiple quantitative cognostics.  <br/>This can help uncover interesting regions of the cognostics space."
          itemId:      "cogMultiFilterControls"
          footer:      "Note: this interactive filter is not yet bound to the back-end - panels will not update when you click 'Apply'..."
        }
        {
          divLink:     "sample-panels"
          icon:        "icon-sample"
          navTitle:    "Sample"
          title:       "Sample Panels"
          description: "Specify how to sample from panels in their current sorted and filtered state (coming soon)."
          itemId:      "cogSampleControls"
        }
      ]

    }


    NavStore = assign {}, EventEmitter.prototype, {

      # /**
      #  * Get the entire collection of view options
      #  * @return {array}
      #  */
      getAllViewOptions: ->
        return _data.viewOptionsInfoArr


      # /**
      #  * Get the entire collection of view options
      #  * @return {array}
      #  */
      getAllCognostics: ->
        return _data.cognosticsInfoArr

    }


    module.exports = NavStore;
