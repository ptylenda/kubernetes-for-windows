$ErrorActionPreference = 'SilentlyContinue'

ipmo $PSScriptRoot\hns.psm1

Get-HnsNetwork | ? Name -eq cbr0 | Remove-HnsNetwork
Get-hnsendpoint | Remove-HNSEndpoint
Get-HnsPolicyList | Remove-HnsPolicyList
Get-NetNat | Remove-NetNat -Confirm:$false

rm -r -fo "C:\var\lib\cni\"
rm -fo "C:\var\run\flannel\subnet.env"

restart-service docker -fo