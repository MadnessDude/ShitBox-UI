# Web Services for Management (WSMAN) Checker
# Added 27.02.18
# Checks if WSMan is running, if not start service
# Code is impartial, if statements conflicting??

function FuncCheckService{
 param($ServiceName)
 $CheckWSMAN = Get-Service -Name $WSMan
 if ($CheckWSMAN.Status -ne "running"){
 Start-Service $ServiceName
 Write-Host "Starting WSMan service" 
 " ---------------------- " 
 " Service is now started"
 }
 if ($CheckWSMAN.Status -eq "running"){ 
 Write-Host "$WSMan service is already started"
 }
 }