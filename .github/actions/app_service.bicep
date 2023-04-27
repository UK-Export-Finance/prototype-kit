param sku string = 'B1' // The SKU of App Service Plan
param linuxFxVersion string = 'node|18-lts' // The runtime stack of web app
param location string = resourceGroup().location // Location for all resources

var appServicePlanName = 'asp-prototypekit-dev-001'
var appName = 'app-prototypekit-dev-001'

resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: sku
  }
  kind: 'linux'
  properties: {
    reserved: true
  }
}

resource appService 'Microsoft.Web/sites@2020-06-01' = {
  name: appName
  location: location
  kind: 'app'
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: linuxFxVersion
    }
  }
}