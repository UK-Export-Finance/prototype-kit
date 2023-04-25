@description('Admin username')
param adminUsername string

@description('Admin password')
@secure()
param adminPassword string



@description('Location for all resources.')
param location string = resourceGroup().location


var virtualNetworkName = 'vNet'
var subnetName = 'backendSubnet'
var subnetRef = resourceId('Microsoft.Network/virtualNetworks/subnets', virtualNetworkName, subnetName)






resource virtualNetwork 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: virtualNetworkName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: '10.0.2.0/24'
        }
      }
    ]
  }
}



