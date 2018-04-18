 while($true) { 
   $arrService = Get-Service -Name docker
   if ($arrService.Status -ne "Running") {
     Write-Host "Starting docker service as it is not running..." 
     Start-Service docker
   }
   
   sleep 10
}