param environmentName string
param location string = resourceGroup().location

param serviceName string = 'web'

module web '../core/host/staticwebapp.bicep' = {
  name: 'web-staticwebapp-${serviceName}'
  params: {
    environmentName: environmentName
    location: location
    serviceName: serviceName
  }
}

output webName string = web.outputs.name
output webUri string = web.outputs.uri