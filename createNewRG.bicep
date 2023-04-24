// module deployed at subscription level
module exampleModule 'module.bicep' = {
  name: 'rg-prototypekit-dev-002'
  scope: subscription()
}
