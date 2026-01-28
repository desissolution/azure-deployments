targetscope = 'subscription'
param location string = 'eastus'
param resourceGroupName string = 'myResourceGroup'
param vnetName string = 'myVNet'
param addressPrefix string = '10.0.0.0/16'
param subnetName string = 'mySubnet'
param subnetPrefix string = '10.0.0.0/24'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
}

module virtualNetwork 'br/public:avm/res/network/virtual-network:0.5.3' = {
  name: 'virtualNetworkDeployment'
  scope: resourceGroup
  params: {
    // Required parameters
    addressPrefixes: [
      addressPrefix
    ]
    name: vnetName
    // Non-required parameters
    location: location
    subnets: [
      {
        name: subnetName
        addressPrefix: subnetPrefix
      }
    ]
  }
}
