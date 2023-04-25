param location string = resourceGroup().location

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: 'prototypekit-network'
  location: location
  tags: {
    Owner: 'Vamshi'
    Purpose: 'Prototypekit'
  }
  properties: {
    addressSpace: {
      addressPrefixes: [
        '20.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'servers'
        properties: {
          addressPrefix: '20.0.0.0/24'
        }
      }
      {
        name: 'desktops'
        properties: {
          addressPrefix: '20.0.1.0/24'
        }
      }
      {
        name: 'resources'
        properties: {
          addressPrefix: '20.0.2.0/24'
        }
      }
    ]
  }
}