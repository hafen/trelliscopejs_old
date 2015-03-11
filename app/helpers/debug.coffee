`import Ember from 'ember'`

debug = (value) ->
  console.log("Current Context");
  console.log("====================");
  console.log(this);
  console.log(arguments);
  if optionalValue
    console.log("Value");
    console.log("====================");
    console.log(optionalValue);
  return

DebugHelper = Ember.Handlebars.makeBoundHelper(debug)

# # only to be used in regular context... not cli context
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


# idk what this is for...
`export { debug }`

# should only be this export
`export default DebugHelper`
