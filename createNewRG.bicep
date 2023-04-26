targetScope='subscription'

param resourceGroupName string = 'rg-prototypekit-dev-001'
param resourceGroupLocation string = 'UK South'
param subscriptionID string = '8beaa40a-2fb6-49d1-b080-ff1871b6276f'

resource newRG 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
  scope: subscriptionID
}