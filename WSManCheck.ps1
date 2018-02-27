# Web Services for Management (WSMAN) Checker
# Added 27.02.18
# Checks if WSMan is running, if not start service
# Code is impartial, if statements conflicting??

function FuncCheckService{

 $CheckWSMAN = Get-Service -Name WinRM

    if ($CheckWSMAN.Status -ne "running"){
        # Checking if you are running this shell as admin.
        $AreYouAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")

        if ($AreYouAdmin -match 'False') {Write-Host "You need to run as admin bro." ; break}
        else {Start-Service WinRM ; Write-Host "Starting WinRM-Service"}
    }

    elseif ($CheckWSMAN.Status -eq "running"){ 
    Write-Host "$WSMan service is already started"
    }

    else{Write-Error "Something went wrong."}
 }