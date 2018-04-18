# http://support.microsoft.com/kb/2570538
# http://robrelyea.wordpress.com/2007/07/13/may-be-helpful-ngen-exe-executequeueditems/

if ([Environment]::Is64BitOperatingSystem) {
  Invoke-Expression "${env:\windir}\microsoft.net\framework\v4.0.30319\ngen.exe update /force /queue"
  Invoke-Expression "${env:\windir}\microsoft.net\framework64\v4.0.30319\ngen.exe update /force /queue"
  Invoke-Expression "${env:\windir}\microsoft.net\framework\v4.0.30319\ngen.exe executequeueditems"
  Invoke-Expression "${env:\windir}\microsoft.net\framework64\v4.0.30319\ngen.exe executequeueditems"
} else {
  Invoke-Expression "${env:\windir}\microsoft.net\framework\v4.0.30319\ngen.exe update /force /queue"
  Invoke-Expression "${env:\windir}\microsoft.net\framework\v4.0.30319\ngen.exe executequeueditems"
}