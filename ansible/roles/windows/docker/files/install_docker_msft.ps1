
param (
  [string]$RequiredVersion = '17.06.2-ee-10'
)

Install-Module -Name DockerMsftProvider -Repository PSGallery -Force
Install-Package Docker -ProviderName DockerMsftProvider -Force -RequiredVersion $RequiredVersion -Verbose -ForceBootstrap

