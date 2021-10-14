# AVD MSIX Packages

This module deploys AVD MSIX Packages.

## Resource types

|Resource Type|ApiVersion|
|:--|:--|
|`Microsoft.Resources/deployments`|2018-02-01|
|`Microsoft.DesktopVirtualization/hostpools/msixpackages`|2021-07-12|


## Parameters

| Parameter Name | Type | Description | DefaultValue | Possible values |
| :-- | :-- | :-- | :-- | :-- |
| `hostPoolName` | string | Required. Name of the Host Pool to create the MSIX package(s) in. |  |  |
| `packageRelativePath` | string | Relative Path to the package inside the image. |  |  |
| `imagePath` | string | VHD/CIM image path on Network Share. |  |  |
| `packageName` | string | Package Name from appxmanifest.xml. |  |  |
| `packageFamilyName` | string | Package Family Name from appxmanifest.xml. Contains Package Name and Publisher name. |  |  |
| `displayName` | string | User friendly Name to be displayed in the portal. |  |  |
| `version` | string | Package Version found in the appxmanifest.xml. |  |  |
| `lastUpdated` | string | Date Package was last updated, found in the appxmanifest.xml. |  |  |
| `isRegularRegistration` | bool | Specifies how to register Package in feed. |  |  |
| `isActive` | bool | Make this version of the package the active one across the hostpool. |  |  |
| `packageDependencies` | array | List of package dependencies. |  |  |
| `packageApplications` | array | List of package applications. |  |  |
| `cuaId` | string | Optional. Customer Usage Attribution id (GUID). This GUID must be previously registered |  |  |

### Parameter Usage: `imagePath`
```json
"imagePath": {
	"value": "\\\\fslogixpo01.file.core.windows.net\\msixappattach\\mp3tag.vhd"
}
```

### Parameter Usage: `packageRelativePath`
```json
"imagePath": {
	"value": "\\apps\\35795FlorianHeidenreich.Mp3tag_3.9.0.0_x86__rf0p6xgxmspcc"
}
```

### Parameter Usage: `lastUpdated`
```json
"imagePath": {
	"value": "2021-08-09T02:13:56.899756"
}
```

### Parameter Usage: `packageApplications`
```json
"packageApplications": {
	"value": [
		{
			"appUserModelID": "Mp3tag_rf0p6xgxmspcc!mp3tag",
			"appId": "mp3tag",
			"description": "MP3Tag",
			"friendlyName": "MP3Tag",
			"iconImageName": "Square44x44Logo.targetsize-16.png",
			"rawIcon": "AAABAAEAICAAAAAAIAADAgAAFgAAAIlQTkcNChoKAAAADUlIRFIAAAAgAAAAIAgGAAAAc3p69AAAAAFzUkdCAK7OHOkAAAAEZ0FNQQAAsY8L/GEFAAAACXBIWXMAAA7DAAAOwwHHb6hkAAABmElEQVRYR+2UQasBURiGETKibJUytrK3vWUlG3+CHb9htrazkl9go1iwscFGKVF+gYgV2VrwXu9XoxQu5pjuYt56Mn3nO2cenHM8bty4uRP9ws+XeCnGBXyJlyIC8Xgcuq4rQdO09wUmkwlUJZ/Pfy7Q6XTQarWest1upfdRbAlEo1GZHAqFEA6HbwgGgzLW6/Wk91FsC/j9fhiGgWazeUOpVHJGIBAIoF6vYzweC4vFQsYajcZVYLfbXccJ5+/3e+lT8hdYJBIJjEYjrFYrFAoFqVGg3W4jEokIPp9PPrl/GGUCsVgM3W4Xm81GXu71eq8CrPGFtVpN5vD4zWYzWUOZABdl+BNbNWLtgfP5DNM0ZXMWi0WcTiepOyawXC7lAstkMjgcDlJjHBFYr9fI5XJIpVIYDAbSZ0WZAI8jJfgtrRqhAC8kPrM/mUwinU6j3+/LGrYEqtUqyuXyU3gsp9PpTa1SqWA+n8satgSOx+OfcLORe3XmIwFePMPhUAnZbPZ9AV4mqrDuC1n9hYjAl3Djxs1/i8fzC48wlXopAWvTAAAAAElFTkSuQmCC",
			"rawPng": "iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwgAADsIBFShKgAAAAZhJREFUWEftlEGrAVEYhhEyomyVMrayt71lJRt/gh2/Yba2s5JfYKNYsLHBRilRfoGIFdla8F7vV6MULuaY7mLeejJ95ztnHpxzPG7cuLkT/cLPl3gpxgV8iZciAvF4HLquK0HTtPcFJpMJVCWfz38u0Ol00Gq1nrLdbqX3UWwJRKNRmRwKhRAOh28IBoMy1uv1pPdRbAv4/X4YhoFms3lDqVRyRiAQCKBer2M8HguLxULGGo3GVWC3213HCefv93vpU/IXWCQSCYxGI6xWKxQKBalRoN1uIxKJCD6fTz65fxhlArFYDN1uF5vNRl7u9XqvAqzxhbVaTebw+M1mM1lDmQAXZfgTWzVi7YHz+QzTNGVzFotFnE4nqTsmsFwu5QLLZDI4HA5SYxwRWK/XyOVySKVSGAwG0mdFmQCPIyX4La0aoQAvJD6zP5lMIp1Oo9/vyxq2BKrVKsrl8lN4LKfT6U2tUqlgPp/LGrYEjsfjn3CzkXt15iMBXjzD4VAJ2Wz2fQFeJqqw7gtZ/YWIwJdw48bNf4vH8wuPMJV6KQFr0wAAAABJRU5ErkJggg=="
		}
	]
}
```


## Outputs

| Output Name | Type | Description |
| :-- | :-- | :-- |
| `hostPoolName` | string | The Name of the Host Pool to register the MSIX package(s) in. |
| `hostPoolResourceGroup` | string | The name of the Resource Group the MSIX packages were created in. |
| `msixpackageResourceIds` | array | The list of the deployed MSIX package resourceIds. |


## Considerations

*N/A*

## Additional resources

- [What is Windows Virtual Desktop?](https://docs.microsoft.com/en-us/azure/virtual-desktop/overview)
- [Windows Virtual Desktop environment](https://docs.microsoft.com/en-us/azure/virtual-desktop/environment-setup)
- [What is MSIX App Attach?](https://docs.microsoft.com/en-us/azure/virtual-desktop/what-is-app-attach)
