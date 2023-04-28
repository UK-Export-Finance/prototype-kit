param location string = resourceGroup().location
var appServicePlanName = 'asp-prototypekit-dev-001'
var appServiceName = 'app-prototypekit-dev-001'
var vnetName = 'vnet${uniqueString(resourceGroup().id)}sn'
var vnetAddressPrefix  = '10.0.0.0/16'
var subnetName = 'sn${uniqueString(resourceGroup().id)}'
var subnetAddressPrefix = '10.0.0.0/24'
var containerRegistryName = 'crprototypekitdev001'
var containerRegistrySku = 'Basic'
var containerRegistryAdminUserEnabled = true
var containerImageName = 'reference-data-proxy:latest'

resource appServicePlan 'Microsoft.Web/serverfarms@2021-02-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: 'P1v2'
    tier: 'PremiumV2'
  }
}

resource vnet 'Microsoft.Network/virtualNetworks@2020-06-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: subnetAddressPrefix
          delegations: [
            {
              name: 'delegation'
              properties: {
                serviceName: 'Microsoft.Web/serverFarms'
              }
            }
          ]
        }
      }
    ]
  }
}

resource appService 'Microsoft.Web/sites@2022-03-01' = {
  name: appServiceName
  location: location
  kind: 'app'
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    serverFarmId: appServicePlan.id
    virtualNetworkSubnetId: vnet.properties.subnets[0].id
    httpsOnly: true
    siteConfig: {
      vnetRouteAllEnabled: true
      http20Enabled: true
      appSettings: [
        {
          name: 'DOCKER_REGISTRY_SERVER_URL'
          value: 'https://${containerRegistryName}.azurecr.io'
        }
      ]
      // linuxFxVersion: 'NODE|10.15'
    }
  }
}

resource containerRegistry 'Microsoft.ContainerRegistry/registries@2022-12-01' = {
  name: containerRegistryName
  location: location
  sku: {
    name: containerRegistrySku
  }
  properties: {
    adminUserEnabled: containerRegistryAdminUserEnabled
  }
}

// resource appServiceVnetConnection 'Microsoft.Web/sites/networkconfig/virtualNetwork@2021-02-01' = {
//   name: '${appService.name}/integrationVnet'
//   properties: {
//     vnetResourceId: vnet.id
//     subnetResourceId: resourceId('Microsoft.Network/virtualNetworks/subnets', vnet.name, subnetName)
//   }
// }

// resource appServiceContainer 'Microsoft.Web/sites/config@2021-02-01' = {
//   parent: appService
//   name: 'web'
//   properties: {
//     linuxFxVersion: 'DOCKER|${containerRegistryName}.azurecr.io/${containerImageName}'
//   }
// }
