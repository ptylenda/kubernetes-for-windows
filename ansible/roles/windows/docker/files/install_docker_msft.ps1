
param (
  [string]$RequiredVersion = '17.06.2-ee-13',
  [string]$ZipNameVersion = 'docker-17-06-2-ee-13.zip'
)

# TODO: add proxy option and Install-Package with proxy settings

Install-Module -Name DockerMsftProvider -Repository PSGallery
# Creates: C:\Program Files\WindowsPowerShell\Modules\DockerMsftProvider

# Look at issue: https://github.com/OneGet/MicrosoftDockerProvider/issues/15
if (-not (Test-Path "$env:TEMP\DockerMsftProvider")) {
  New-Item -Path "$env:TEMP\DockerMsftProvider" -ItemType Directory
}
$downloadURL = "https://dockermsft.blob.core.windows.net/dockercontainer/$($ZipNameVersion)"
$destination = "$env:TEMP\DockerMsftProvider\$($ZipNameVersion)"
Invoke-WebRequest -Uri $downloadURL -OutFile $destination
Install-Package Docker -ProviderName DockerMsftProvider -Confirm -RequiredVersion $RequiredVersion -Verbose -ForceBootstrap

# TODO: convert it as an ansible module
# Future usage for ansible module
# $metadata = Get-Content 'C:\Program Files\Docker\metadata.json' | ConvertFrom-Json
# $metadata.Version
# 17.06.2-ee-13
