targetScope='subscription'

param resourceGroupName string = '${{ vars.AZURE_RG }}'
param resourceGroupLocation string = '${{ vars.AZURE_REGION }}'


resource newRG 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
  
}