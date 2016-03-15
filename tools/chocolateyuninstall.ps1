$ErrorActionPreference = 'Stop';

$packageName = 'aspnetmvc2'
$uninstallerKeyName = '{DD8FF2F3-0D97-4CF3-AF78-FA0E1B242244}'
$installerType = 'MSI'
$msiArgs="$uninstallerKeyName /qn"

Uninstall-ChocolateyPackage -PackageName $packageName -FileType $installerType $msiArgs
