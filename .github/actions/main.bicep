param location string = resourceGroup().location
param appServicePlanName string = 'asp-prototypekit-dev-001'
param appServiceName string = 'app-prototypekit-dev-001'
param vnetName string = 'vnet-prototypekit-dev-001'
param vnetAddressSpace string = "172.16.40.0/22 172.16.60.0/23"
param subnetName string = 'snet-prototypekit-dev-001' 
param subnetAddressPrefix string = '10.60.0.0/16'
param containerRegistryName string = 'tfsdev'
param containerRegistrySku string = 'Basic'
param containerRegistryAdminUserEnabled bool = true
param containerImageName string = 'reference-data-proxy:latest'

resource appServicePlan 'Microsoft.Web/serverfarms@2021-02-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: 'P1v2'
    tier: 'PremiumV2'
  }
}

resource appService 'Microsoft.Web/sites@2021-02-01' = {
  name: appServiceName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      appSettings: [
        {
          name: 'DOCKER_REGISTRY_SERVER_URL'
          value: 'https://${containerRegistryName}.azurecr.io'
        }
        {
          name: 'DOCKER_REGISTRY_SERVER_USERNAME'
          value: containerRegistry.properties.loginServer
        }
        {
          name: 'DOCKER_REGISTRY_SERVER_PASSWORD'
          value: listCredentials(containerRegistry.id).passwords[0].value
        }
      ]
    }
  }
}

resource vnet 'Microsoft.Network/virtualNetworks@2021-02-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressSpace
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: subnetAddressPrefix
          delegations: [
            {
              name: 'webapp'
              properties: {
                serviceName: 'Microsoft.Web/serverfarms'
              }
            }
          ]
        }
      }
    ]
  }
}

resource containerRegistry 'Microsoft.ContainerRegistry/registries@2021-06-01' = {
  name: containerRegistryName
  location: location
  sku: {
    name: containerRegistrySku
  }
  properties: {
    adminUserEnabled: containerRegistryAdminUserEnabled
  }
}

resource appServiceVnetConnection 'Microsoft.Web/sites/networkconfig/virtualNetwork@2021-02-01' = {
  name: '${appService.name}/integrationVnet'
  properties: {
    vnetResourceId: vnet.id
    subnetResourceId: resourceId('Microsoft.Network/virtualNetworks/subnets', vnet.name, subnetName)
  }
}

resource appServiceContainer 'Microsoft.Web/sites/config@2021-02-01' = {
  name: '${appService.name}/web'
  properties: {
    linuxFxVersion: 'DOCKER|${containerRegistryName}.azurecr.io/${containerImageName}'
  }
}
