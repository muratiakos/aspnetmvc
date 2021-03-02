$ErrorActionPreference = 'Stop';

$url = 'https://download.microsoft.com/download/7/B/1/7B11DE4E-0247-448E-8D39-7C9B12ABA1FF/AspNetMVC2_VS2008.exe'

# Download from a file share
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$downloadLocation = "$toolsDir\AspNetMVC2_VS2008.exe"
Get-ChocolateyWebFile -PackageName 'AspNetMVC2_VS2008' -FileFullPath "$downloadLocation" -Url "$url"

$extractLocation = "$toolsDir\extracted"
&"$downloadLocation" /q /x:"$extractLocation"

$packageName = 'aspnetmvc2'
$installerType = 'msi'

$silentArgs = '/qn'

Install-ChocolateyInstallPackage -PackageName "$packageName" -FileType "$installerType" -SilentArgs "$silentArgs" -File "$extractLocation\mvcruntime\aspnetmvc2.msi"

Remove-Item -Force -Recurse "$toolsDir\extracted"
Remove-Item -Force "$downloadLocation"