`import DS from 'ember-data'`

SinglePlot = DS.Model.extend {
  navs: DS.hasMany('navs')
}

`export default SinglePlot`
