param environmentName string
param location string = resourceGroup().location

param allowedOrigins array = []
param applicationInsightsName string
param appServicePlanId string
param appSettings object = {}
param keyVaultName string
param serviceName string = 'api'
param storageAccountName string

module api '../core/host/function-python.bicep' = {
  name: 'function-python-${serviceName}'
  params: {
    environmentName: environmentName
    location: location
    allowedOrigins: allowedOrigins
    appSettings: appSettings
    applicationInsightsName: applicationInsightsName
    appServicePlanId: appServicePlanId
    keyVaultName: keyVaultName
    serviceName: serviceName
    storageAccountName: storageAccountName
  }
}

output apiIdentityPrincipalId string = api.outputs.identityPrincipalId
output apiName string = api.outputs.name
output apiUri string = api.outputs.uri
