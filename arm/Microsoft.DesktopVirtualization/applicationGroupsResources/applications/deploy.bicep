@description('Required. The resource name')
param name string

@description('Optional. Description of Application.')
param appDescription string = ''

@description('Optional. Friendly name of Application.')
param friendlyName string = ''

@description('Optional. Specifies a path for the executable file for the application.')
param filePath string = ''

@description('Required. Specifies whether this published application can be launched with command line arguments provided by the client, command line arguments specified at publish time, or no command line arguments at all.')
@allowed([
  'Allow'
  'DoNotAllow'
  'Require'
])
param commandLineSetting string

@description('Optional. Command Line Arguments for Application.')
param commandLineArguments string = ''

@description('Optional. Specifies whether to show the RemoteApp program in the RD Web Access server.')
param showInPortal bool = false

@description('Optional. Path to icon.')
param iconPath string = ''

@description('Optional. Index of the icon.')
param iconIndex int = 0

@minLength(1)
@description('Required. Name of the Application Group to create the application(s) in.')
param appGroupName string

@description('Optional. Specifies the package application Id for MSIX applications')
param msixPackageApplicationId string = ''

@description('Optional. Specifies the package family name for MSIX applications')
param msixPackageFamilyName string = ''

@description('Required. Resource Type of Application')
@allowed([
  'InBuilt'
  'MsixApplication'
])
param applicationType string

@description('Optional. Customer Usage Attribution id (GUID). This GUID must be previously registered')
param cuaId string = ''

module pid_cuaId './.bicep/nested_cuaId.bicep' = if (!empty(cuaId)) {
  name: 'pid-${cuaId}'
  params: {}
}

resource applications_res 'Microsoft.DesktopVirtualization/applicationGroups/applications@2021-07-12' = {
  name: '${appGroupName}/${name}'
  properties: {
    applicationType: applicationType
    description: appDescription
    friendlyName: friendlyName
    commandLineSetting: commandLineSetting
    commandLineArguments: commandLineArguments
    showInPortal: showInPortal
    filePath: filePath
    iconPath: iconPath
    iconIndex: iconIndex
    msixPackageFamilyName: msixPackageFamilyName
    msixPackageApplicationId: msixPackageApplicationId
  }
}

output applicationResourceId string = applications_res.id
output applicationResourceGroup string = resourceGroup().name
output appGroupName string = appGroupName
