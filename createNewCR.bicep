resource symbolicname 'Microsoft.ContainerRegistry/registries@2022-12-01' = {
  name: 'string'
  location: 'string'
  tags: {
    tagName1: 'tagValue1'
    tagName2: 'tagValue2'
  }
  sku: {
    name: 'string'
  }
  identity: {
    principalId: 'string'
    tenantId: 'string'
    type: 'string'
    userAssignedIdentities: {}
  }
  properties: {
    adminUserEnabled: bool
    dataEndpointEnabled: bool
    encryption: {
      keyVaultProperties: {
        identity: 'string'
        keyIdentifier: 'string'
      }
      status: 'string'
    }
    networkRuleBypassOptions: 'string'
    networkRuleSet: {
      defaultAction: 'string'
      ipRules: [
        {
          action: 'Allow'
          value: 'string'
        }
      ]
    }
    policies: {
      exportPolicy: {
        status: 'string'
      }
      quarantinePolicy: {
        status: 'string'
      }
      retentionPolicy: {
        days: int
        status: 'string'
      }
      trustPolicy: {
        status: 'string'
        type: 'Notary'
      }
    }
    publicNetworkAccess: 'string'
    zoneRedundancy: 'string'
  }
}
