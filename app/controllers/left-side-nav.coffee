`import Ember from 'ember'`



# first attempt at controller for navigation...
# if using direct array, there is no problem
LeftSideNavController = Ember.Controller.extend {

  leftBarInfoArrD: (->

    # this.store.find('leftSideNavGroup')
    # viewGroupItems = this.store.find('leftSideNav', { group: "view_options" })
    # cogGroupItems = this.store.find('leftSideNav', { group: "cognostics"  })
    viewGroupItems = []
    cogGroupItems = []

    console.log("viewGroupItems: ", viewGroupItems)
    console.log("cogGroupItems: ", cogGroupItems)

    return [
      {
        mainTitle: "View Options2"
        items: viewGroupItems
      }
      {
        mainTitle: "Cognostics2"
        items: cogGroupItems
      }
    ]
  ).property("model.leftSideNavGroup")

  # leftBarInfoArrC: [
  #   {
  #     mainTitle: "View Options"
  #     items: [
  #       {
  #         title: "Panel Layout", icon: "icon-th", action: null
  #         divlink: "panel-layout", id: "panel-layout-nav-link"
  #       }
  #       {
  #         title: "Panel Function", icon: "icon-panel-edit", action: null
  #         divlink: "panel-function", id: "panel-function-nav-link"
  #       }
  #       {
  #         title: "Panel Labels", icon: "icon-cog-list", action: null
  #         divlink: "panel-labels", id: "panel-labels-nav-link"
  #       }
  #       {
  #         title: "Related Displays", icon: "icon-plus-square-o",
  #         action: "showRelatedLayoutControls"
  #         divlink: "add-related-display", id: "add-related-display-nav-link"
  #       }
  #     ]
  #   }
  #   {
  #     mainTitle: "Cognostics"
  #     items: [
  #       {
  #         title: "Active Cognostics", icon: "icon-active-cog", action: null
  #         divlink: "active-cog", id: "active-cog-nav-link"
  #       }
  #       {
  #         title: "Table Sort / Filter", icon: "icon-sort-filter", action: null
  #         divlink: "cog-table-sort-filter", id: "cog-table-sort-filter-nav-link"
  #       }
  #       {
  #         title: "Univariate Filter", icon: "icon-bars", action: null
  #         divlink: "univar-filter", id: "univar-filter-nav-link"
  #       }
  #       {
  #         title: "Bivariate Filter", icon: "icon-stats", action: null
  #         divlink: "bivar-filter", id: "bivar-filter-nav-link"
  #       }
  #       {
  #         title: "Multivariate Filter", icon: "icon-multivar", action: null
  #         divlink: "multivar-filter", id: "multivar-filter-nav-link"
  #       }
  #       {
  #         title: "Sample", icon: "icon-sample", action: null
  #         divlink: "sample-panels", id: "sample-panels-nav-link"
  #       }
  #     ]
  #   }
  # ]
}

`export default LeftSideNavController`
