$ErrorActionPreference = 'Stop';

$packageName = 'aspnetmvc2'
$installerType = 'MSI'
$url = 'https://download.microsoft.com/download/7/8/C/78C01A05-3B3F-4963-88EC-322BD8E3CBC2/AspNetMVC2.msi'
$silentArgs = '/qn'

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"
