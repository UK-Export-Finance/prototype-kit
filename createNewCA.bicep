resource symbolicname 'Microsoft.App/containerApps@2022-10-01' = {
  name: 'string'
  location: 'string'
  tags: {
    tagName1: 'tagValue1'
    tagName2: 'tagValue2'
  }
  extendedLocation: {
    name: 'string'
    type: 'CustomLocation'
  }
  identity: {
    type: 'string'
    userAssignedIdentities: {}
  }
  properties: {
    configuration: {
      activeRevisionsMode: 'string'
      dapr: {
        appId: 'string'
        appPort: int
        appProtocol: 'string'
        enableApiLogging: bool
        enabled: bool
        httpMaxRequestSize: int
        httpReadBufferSize: int
        logLevel: 'string'
      }
      ingress: {
        allowInsecure: bool
        clientCertificateMode: 'string'
        corsPolicy: {
          allowCredentials: bool
          allowedHeaders: [
            'string'
          ]
          allowedMethods: [
            'string'
          ]
          allowedOrigins: [
            'string'
          ]
          exposeHeaders: [
            'string'
          ]
          maxAge: int
        }
        customDomains: [
          {
            bindingType: 'string'
            certificateId: 'string'
            name: 'string'
          }
        ]
        exposedPort: int
        external: bool
        ipSecurityRestrictions: [
          {
            action: 'string'
            description: 'string'
            ipAddressRange: 'string'
            name: 'string'
          }
        ]
        targetPort: int
        traffic: [
          {
            label: 'string'
            latestRevision: bool
            revisionName: 'string'
            weight: int
          }
        ]
        transport: 'string'
      }
      maxInactiveRevisions: int
      registries: [
        {
          identity: 'string'
          passwordSecretRef: 'string'
          server: 'string'
          username: 'string'
        }
      ]
      secrets: [
        {
          name: 'string'
          value: 'string'
        }
      ]
    }
    environmentId: 'string'
    managedEnvironmentId: 'string'
    template: {
      containers: [
        {
          args: [
            'string'
          ]
          command: [
            'string'
          ]
          env: [
            {
              name: 'string'
              secretRef: 'string'
              value: 'string'
            }
          ]
          image: 'string'
          name: 'string'
          probes: [
            {
              failureThreshold: int
              httpGet: {
                host: 'string'
                httpHeaders: [
                  {
                    name: 'string'
                    value: 'string'
                  }
                ]
                path: 'string'
                port: int
                scheme: 'string'
              }
              initialDelaySeconds: int
              periodSeconds: int
              successThreshold: int
              tcpSocket: {
                host: 'string'
                port: int
              }
              terminationGracePeriodSeconds: int
              timeoutSeconds: int
              type: 'string'
            }
          ]
          resources: {
            cpu: json('decimal-as-string')
            memory: 'string'
          }
          volumeMounts: [
            {
              mountPath: 'string'
              volumeName: 'string'
            }
          ]
        }
      ]
      initContainers: [
        {
          args: [
            'string'
          ]
          command: [
            'string'
          ]
          env: [
            {
              name: 'string'
              secretRef: 'string'
              value: 'string'
            }
          ]
          image: 'string'
          name: 'string'
          resources: {
            cpu: json('decimal-as-string')
            memory: 'string'
          }
          volumeMounts: [
            {
              mountPath: 'string'
              volumeName: 'string'
            }
          ]
        }
      ]
      revisionSuffix: 'string'
      scale: {
        maxReplicas: int
        minReplicas: int
        rules: [
          {
            azureQueue: {
              auth: [
                {
                  secretRef: 'string'
                  triggerParameter: 'string'
                }
              ]
              queueLength: int
              queueName: 'string'
            }
            custom: {
              auth: [
                {
                  secretRef: 'string'
                  triggerParameter: 'string'
                }
              ]
              metadata: {}
              type: 'string'
            }
            http: {
              auth: [
                {
                  secretRef: 'string'
                  triggerParameter: 'string'
                }
              ]
              metadata: {}
            }
            name: 'string'
            tcp: {
              auth: [
                {
                  secretRef: 'string'
                  triggerParameter: 'string'
                }
              ]
              metadata: {}
            }
          }
        ]
      }
      volumes: [
        {
          name: 'string'
          storageName: 'string'
          storageType: 'string'
        }
      ]
    }
    workloadProfileType: 'string'
  }
}