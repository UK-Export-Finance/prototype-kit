param location string = resourceGroup().location
  
var virtualNetwork = {
  name: 'prototypekit-vnet'
  location: location
  addressPrefixes: [
    '10.0.0.0/16'
    ]
  subnets: [
    {
      name: 'prototypekitsubnet1'
      properties: {
        addressPrefix: '10.0.0.0/24'
      }
    }
    {
      name: 'prototypekitsubnet2'
      properties: {
        addressPrefix: '10.0.1.0/24'
      }
    }
  ]
}
  
resource virtualnetwork 'Microsoft.Network/virtualNetworks@2020-06-01' = {
  name: virtualNetwork.name
  location: virtualNetwork.location
  properties: {
    addressSpace: {
      addressPrefixes: virtualNetwork.addressPrefixes
    }
    subnets: virtualNetwork.subnets
  }
}