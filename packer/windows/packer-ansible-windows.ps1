# TODO: check no-proxy
if (Test-Path env:\HTTP_PROXY) {
  Remove-Item env:\HTTP_PROXY
}

if (Test-Path env:\HTTPS_PROXY) {
  Remove-Item env:\HTTPS_PROXY
}

$env:PATH += ";$PSScriptRoot\..\alias\wsl-fall-creators"
$env:PACKER_LOG=1
$env:NO_PROXY += "127.0.0.1"
packer @args