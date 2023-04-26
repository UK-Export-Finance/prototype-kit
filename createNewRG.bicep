

param resourceGroupName string = 'rg-prototypekit-dev-001'
param resourceGroupLocation string = 'UK South'
param secondSubscriptionID string = '8beaa40a-2fb6-49d1-b080-ff1871b6276f'

module newRG 'createNewRG.bicep' = {
  name: 'newResourceGroup'
  scope: subscription(secondSubscriptionID)
  params: {
    name: resourceGroupName
    location: resourceGroupLocation
  }
}