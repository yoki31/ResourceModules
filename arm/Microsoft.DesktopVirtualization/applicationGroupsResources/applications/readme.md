# AVD Applications

This module deploys AVD Applications.



## Resource types

|Resource Type|ApiVersion|
|:--|:--|
|`Microsoft.Resources/deployments`|2018-02-01|
|`Microsoft.DesktopVirtualization/applicationGroups/applications`|2021-07-12|


## Parameters

| Parameter Name | Type | Description | DefaultValue | Possible values |
| :-- | :-- | :-- | :-- | :-- |
| `appGroupName` | string | Required. Name of the Application Group to create the application(s) in. |  |  |
| `name` | string | Required. The resource name |  |  |
| `appDescription` | string | Optional. Description of Application |  |  |
| `friendlyName` | string | Optional. Friendly name of Application |  |  |
| `applicationType` | string | Mandatory. Resource Type of Application | | InBuilt, MsixApplication |
| `filePath` | string | Optional. Specifies a path for the executable file for the application |  |  |
| `commandLineSetting` | string | Required. Specifies whether this published application can be launched with command line arguments provided by the client, command line arguments specified at publish time, or no command line arguments at all |  |  Allow, DoNotAllow, Require |
| `commandLineArguments` | string | Optional. Command Line Arguments for Application |  |  |
| `showInPortal` | bool | Optional. Specifies whether to show the RemoteApp program in the RD Web Access server |  |  |
| `iconPath` | string | Optional. Path to icon |  |  |
| `iconIndex` | int | Optional. Index of the icon |  |  |
| `msixPackageApplicationId` | string | Optional. Specifies the package application Id for MSIX applications |  |  |
| `msixPackageFamilyName` | string | Optional. Specifies the package family name for MSIX applications |  |  |
| `cuaId` | string | Optional. Customer Usage Attribution id (GUID). This GUID must be previously registered |  |  |

## Outputs

| Output Name | Type | Description |
| :-- | :-- | :-- |
| `appGroupName` | string | The Name of the Application Group to register the Application(s) in. |
| `applicationResourceGroup` | string | The name of the Resource Group the AVD Applications were created in. |
| `applicationResourceId` | array | The deployed application resourceId. |


## Considerations

*N/A*

## Additional resources

- [What is Windows Virtual Desktop?](https://docs.microsoft.com/en-us/azure/virtual-desktop/overview)
- [Windows Virtual Desktop environment](https://docs.microsoft.com/en-us/azure/virtual-desktop/environment-setup)
- [Reference](https://docs.microsoft.com/en-us/azure/templates/microsoft.desktopvirtualization/2021-07-12/applicationgroups/applications)
