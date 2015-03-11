`import DS from 'ember-data'`

attr = DS.attr

Nav = DS.Model.extend {
  group: attr()
  icon: attr()
  title: attr()
  action: attr('string', {defaultValue: null})
  divLink: attr()
  description: attr()
  footer: attr('string', {defaultValue: null})
  itemId: attr()
  bodyId: (->
    return this.get('itemId') + "Output"
  ).property('itemId')
  applyButton: (->
    return this.get('itemId') + "ApplyButton"
  ).property('itemId')
  navLink: (->
    return this.get('divLink') + "-nav-link"
  ).property('divLink')
}

Nav.reopenClass {
  FIXTURES: [
    {
      id: 1
      group: "view_options"
      icon:"icon-th"
      title: "Panel Layout"
      description: "Specify the arrangement of the panels on each page by entering the number of rows and columns of panels per page.  Future functionality for fixing / varying levels of cognostics per page to come."
      itemId: "panelLayout"
      divLink: "panel-layout"
    }
    {
      id: 2
      group: "view_options"
      icon:"icon-panel-edit"
      title: "Panel Function Editor"
      description: "Edit the code that generates each panel."
      itemId: "panelFunction"
      divLink: "panel-function"
      footer: "Note: this feature is currently disabled - panels will not update when you click 'Apply'..."
    }
    {
      id: 3
      group: "view_options"
      divLink: "panel-function"
      icon:"icon-cog-list"
      title: "Panel Labels"
      description: "Specify which cognostics to view underneath each panel. <br/>Select cognostics to view by clicking and/or dragging the 'Show' column."
      itemId: "panelLabelList"
      footer: "Note: this feature is currently disabled - panels will not update when you click 'Apply'..."
    }
    {
      id: 4
      group: "view_options"
      divLink: "add-related-display"
      icon:"icon-plus-square-o"
      title: "Related Displays"
      description: "Select additional displays (if any) that have been created on the same partitioning to view with the currently selected display.  If additional displays are selected, only one subset per page will be shown."
      itemId: "relatedDisplayList"
    }
    {
      id: 5
      group: "cognostics"
      divLink: "active-cog"
      icon:"icon-active-cog"
      title: "Active Cognostics"
      description: "Specify which cognostics are available for sorting, filtering, and sampling."
      itemId: "activeCogList"
    }
    {
      id: 6
      group: "cognostics"
      divLink: "cog-table-sort-filter"
      icon:"icon-sort-filter"
      title: "Cognostics View / Sort / Filter"
      description: "View cognostics in a table and specify sort order or filtering of panels.  <br/>Shift-click on the panel header sorting buttons for multi-column sorting."
      itemId: "cogTableControls"
    }
    {
      id: 7
      group: "cognostics"
      divLink: "univar-filter"
      icon:"icon-bars"
      title: "Visual Univariate Filter"
      description: "Filter panels based on a single cognostic guided by a visual display of the distribution of the cognostic.  <br/>Select a variable to view and click and drag on the display to specify filtering."
      itemId: "cogUniFilterControls"
    }
    {
      id: 8
      group: "cognostics"
      divLink: "bivar-filter"
      icon:"icon-stats"
      title: "Visual Bivariate Filter"
      description: "Filter panels based on pairs of cognostics through an interactive scatterplot.  <br/>Currently only quantitative variables are supported."
      itemId: "cogBiFilterControls"
    }
    {
      id: 9
      group: "cognostics"
      divLink: "multivar-filter"
      icon:"icon-multivar"
      title: "Visual Multivariate Filter"
      description: "Filter panels based on a two-dimensional projection pursuit of multiple quantitative cognostics.  <br/>This can help uncover interesting regions of the cognostics space."
      itemId: "cogMultiFilterControls"
      footer : "Note: this interactive filter is not yet bound to the back-end - panels will not update when you click 'Apply'..."
    }
    {
      id: 10
      group: "cognostics"
      divLink: "sample-panels"
      icon:"icon-sample"
      title: "Sample Panels"
      description: "Specify how to sample from panels in their current sorted and filtered state (coming soon)."
      itemId: "cogSampleControls"
    }
  ]
}

`export default Nav`
