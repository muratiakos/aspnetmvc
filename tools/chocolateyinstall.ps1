$ErrorActionPreference = 'Stop';

$url = 'http://download.windowsupdate.com/c/msdownload/update/software/secu/2014/10/aspnetmvc2-kb2993939_1e3f60495160a568adb51b09af5c7b0a95146764.exe'
$checksum = '2B91A27DC45B11CB6977A214CF9E4DCF1E219F66876413F2A8D3DC4BE86B1175'
$checksumType = 'sha256'

# Download from a file share
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$downloadLocation = "$toolsDir\aspnetmvc2-kb2993939_1e3f60495160a568adb51b09af5c7b0a95146764.exe"
Get-ChocolateyWebFile -PackageName 'aspnetmvc2-kb2993939' -FileFullPath "$downloadLocation" -Url "$url" -Checksum "$checksum" -ChecksumType "$checksumType"

$extractLocation = "$toolsDir\extracted"
&"$downloadLocation" /C /T:"$extractLocation"

$packageName = 'aspnetmvc2'
$installerType = 'msi'

$silentArgs = '/qn'

Install-ChocolateyInstallPackage -PackageName "$packageName" -FileType "$installerType" -SilentArgs "$silentArgs" -File "$extractLocation\aspnetmvc2.msi"

Remove-Item -Force -Recurse "$toolsDir\extracted"
Remove-Item -Force "$downloadLocation"