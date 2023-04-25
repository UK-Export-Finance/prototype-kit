targetScope='subscription'

param resourceGroupName string = 'rg-prototypekit-dev-001'
param resourceGroupLocation string = 'UK South'

resource newRG 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
}
