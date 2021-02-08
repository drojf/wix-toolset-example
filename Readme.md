# Readme

## File/Folder structure

`MyApplication` - Contains a dummy C# project. Replace with your own application which you want to package

`MySetup` - Contains all the files necessary to build the installer

- `build.bat` - run this file to build the installer (run in a command window so you can see the output)
- MySetup.wixproj - contains some configuration information read by msbuild to build the wix project, but also some stuff you wouldn't expect, like the folder scanning settings (harvest).
- Product.wxs - contains the main installer configuration
- Localization.wxl - a localization file, but in this case only used for changing some of the default text in the installer
- obj - contains temporary build files. NOTE: it is useful to examine these files, especially the `_HarvestedApplicationComponents_dir.wxs` to check if files have been harvested correctly
- bin - installer .msi file output folder

## Known Issues

In `Product.wxs`, the shortcut uses a link like `Target="[#filBF0BC55BA474DA2517DA5EDFFD7B1501]"` (this is the id of the executable file). This filename will change if the certain options are changed, and you'll need to copy the file id again from the `obj/Debug/_HarvestedApplicationComponents_dir.wxs` folder.

## Prerequisites

- Install [Wix Toolset](https://wixtoolset.org/releases/)
- Do not install the Visual Studio extension (configuring the installer using the `.wixproj` file seems to conflictt with configuring using Visual Studio)

## Required references

This is already done for you in the `MySetup.wixproj`. The following references are needed:

- Add the <WixExtension> "WixUIExtension"
- Add a <ProjectReference> to the project being deployed

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