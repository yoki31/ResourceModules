@description('The resource name')
param name string

@description('Description of Application.')
param description string

@description('Friendly name of Application.')
param friendlyName string

@description('Specifies a path for the executable file for the application.')
param filePath string

@description('Specifies whether this published application can be launched with command line arguments provided by the client, command line arguments specified at publish time, or no command line arguments at all.')
@allowed([
  'Allow'
  'DoNotAllow'
  'Require'
])
param commandLineSetting string

@description('Command Line Arguments for Application.')
param commandLineArguments string

@description('Specifies whether to show the RemoteApp program in the RD Web Access server.')
param showInPortal bool

@description('Path to icon.')
param iconPath string

@description('Index of the icon.')
param iconIndex int

@minLength(1)
@description('Required. Name of the Application Group to create the application(s) in.')
param appGroupName string

@description('Specifies the package application Id for MSIX applications')
param msixPackageApplicationId string

@description('Specifies the package family name for MSIX applications')
param msixPackageFamilyName string

@description('Optional. Customer Usage Attribution id (GUID). This GUID must be previously registered')
param cuaId string = ''

module pid_cuaId './.bicep/nested_cuaId.bicep' = if (!empty(cuaId)) {
  name: 'pid-${cuaId}'
  params: {}
}

resource applications_res 'Microsoft.DesktopVirtualization/applicationGroups/applications@2021-07-12' = {
  name: '${appGroupName}/${name}'
  properties: {
    description: description
    friendlyName: friendlyName
    filePath: filePath
    commandLineSetting: commandLineSetting
    commandLineArguments: commandLineArguments
    showInPortal: showInPortal
    iconPath: iconPath
    iconIndex: iconIndex
    msixPackageFamilyName: msixPackageFamilyName
    msixPackageApplicationId: msixPackageApplicationId
  }
}

output applicationResourceId string = applications_res.id
output applicationResourceGroup string = resourceGroup().name
output appGroupName string = appGroupName
