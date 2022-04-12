targetScope = 'subscription'

param myResourceGroup string = 'ZellyTest01-rg'

@description('Specifies the name of the Azure Storage account.')
param storageAccountName string = 'emranstoragetest01'

@description('Specifies the name of the File Share. File share names must be between 3 and 63 characters in length and use numbers, lower-case letters and dash (-) only.')
@minLength(3)
@maxLength(63)
param fileShareName string = 'abctest01'

@description('Specifies the location in which the Azure Storage resources should be deployed.')
param location string = 'swedencentral'


//Create Resource Group 

resource myRG01 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: myResourceGroup
  location: location

}

module myFileShare  'fileshare.bicep' = {
  name: 'myFileShareDeploy'
  scope: myRG01
  params: {
    storageAccountName: storageAccountName
    fileShareName: fileShareName
    location: location
  }
}
