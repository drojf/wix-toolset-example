# Readme

## Prerequisites

- Install Wix toolkit
- ~~Instal Visual Studio Wix extension~~ using from visual studio causes problems - just run msbuild directly

## Required references

Add following references to the Wix project (MySetup in this example):

- to project being deployed
- to WixUIExtension, needed for UI (C:\Program Files (x86)\WiX Toolset v3.11\bin\\WixUIExtension.dll)

## XML additions

Add mondo (see here): https://www.firegiant.com/wix/tutorial/user-interface/ui-wizardry/

```xml
<Product>
<UIRef Id="WixUI_Mondo" />
<UIRef Id="WixUI_ErrorProgressText" />
</Product>
```

## Tutorials and Examples

- [wix official docs](https://wixtoolset.org/documentation/) - samples on some of these pages
- https://www.firegiant.com/wix/tutorial/user-interface/
- https://github.com/aykanatm/wixtoolset-example/blob/master/WixToolsetExample/TestApp.Setup/Product.wxs
- Skip license / custom UI: https://stackoverflow.com/a/597060/848627
- Adding files from directory automatically using HarvestDirectory: https://stackoverflow.com/questions/2605907/wix-heatdirectory-task-setting-the-preprocessorvariable

## Getting debug output from msi file

Execute the msi file with `msiexec /i MySetup.msi /l* out.log`

## Adding lots of files

- The wixproj file is setup to scan the app bin path (see the value next to `<HarvestPath>`) for files and add them to the project automatically
- Based on these examples: https://stackoverflow.com/questions/2605907/wix-heatdirectory-task-setting-the-preprocessorvariable
- Also see https://wixtoolset.org/documentation/manual/v3/msbuild/target_reference/harvestdirectory.html

## Installer Versioning

- On each new release of the installer, update the "Version" field in `<Product Version="1.0.2.0" ...>` to `<Product Version="1.0.4.0">` (don't update 4th part of version - see below)
- **You must update the first 3 parts of the version, otherwise windows doesn't treat as a new version** - see https://wixtoolset.org/documentation/manual/v3/howtos/updates/major_upgrade.html