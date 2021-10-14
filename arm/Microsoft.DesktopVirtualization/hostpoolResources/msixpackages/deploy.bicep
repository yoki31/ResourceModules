@description('Required. Name of the Host Pool to create the MSIX package(s) in.')
@minLength(1)
param hostPoolName string

@description('Relative Path to the package inside the image.')
param packageRelativePath string

@description('VHD/CIM image path on Network Share.')
param imagePath string

@description('Package Name from appxmanifest.xml.')
param packageName string

@description('Package Family Name from appxmanifest.xml. Contains Package Name and Publisher name.')
param packageFamilyName string

@description('User friendly Name to be displayed in the portal.')
param displayName string

@description('Package Version found in the appxmanifest.xml.')
param version string

@description('Date Package was last updated, found in the appxmanifest.xml.')
param lastUpdated string

@description('Specifies how to register Package in feed.')
param isRegularRegistration bool

@description('Make this version of the package the active one across the hostpool.')
param isActive bool

@description('List of package dependencies.')
param packageDependencies array

@description('List of package applications.')
param packageApplications array

@description('Optional. Customer Usage Attribution id (GUID). This GUID must be previously registered')
param cuaId string = ''

module pid_cuaId './.bicep/nested_cuaId.bicep' = if (!empty(cuaId)) {
  name: 'pid-${cuaId}'
  params: {}
}

resource msixpackage 'Microsoft.DesktopVirtualization/hostpools/msixpackages@2021-07-12' = {
  name: '${hostPoolName}/${last(split(packageRelativePath, '\\'))}'
  properties: {
    imagePath: imagePath
    packageName: packageName
    packageFamilyName: packageFamilyName
    displayName: displayName
    packageRelativePath: packageRelativePath
    isActive: isActive
    isRegularRegistration: isRegularRegistration
    version: version
    lastUpdated: lastUpdated
    packageDependencies: packageDependencies
    packageApplications: packageApplications
  }
}

output msixpackageResourceIds string = resourceId('Microsoft.DesktopVirtualization/hostpools/msixpackages', hostPoolName, last(split(packageRelativePath, '\\')))
output hostPoolResourceGroup string = resourceGroup().name
output hostPoolName string = hostPoolName
