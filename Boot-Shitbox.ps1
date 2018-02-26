Function Boot-Shitbox {

    Param(
    [Parameter(Mandatory=$false)]
    [switch]$ping
    )

    $Computer = "SHITBOX"
    $DebugPreference = "Continue"
    $ServerOnline = Test-Connection -ComputerName $Computer -BufferSize 16 -Count 1 -ea 0 -quiet

    if ($ping){
    Matrix-Typer "ESTABLISHING SERVER UPLINK"
    $PingOnline = Test-Connection -ComputerName $Computer -BufferSize 16 -Count 1 -ea 0 -quiet
    Write-Host "MAINFRAME CONFIRMED ONLINE" -ForegroundColor White
    Matrix-Typer "SHUTTING DOWN MAINFRAME"
    sleep 2
    Invoke-Command -ComputerName $Computer -ScriptBlock {shutdown -r -t 0} -ErrorAction SilentlyContinue
    sleep 2
    Write-Host "Starting sleep sequence" -ForegroundColor Green
    sleep 20
    Write-Host "Initiating ping scan sequence" -ForegroundColor Green
    
    Do{
    $TestingServer = Test-Connection -ComputerName $Computer -BufferSize 16 -Count 1 -ea 0 -quiet

    if ($TestingServer -eq 'True'){Matrix-Typer "Server is Online"}
    else {Write-Host "Server is Offline" -ForegroundColor Red}

    }

    Until($TestingServer -eq 'True'){
    }

    Matrix-Typer "SERVER UPLINK ESTABLISHED"
    Write-Host "Waiting for services to start" -ForegroundColor Green
    Sleep 10

    Write-Host "Checking if core-services are up" -ForegroundColor Green
    $Plexinfo = Invoke-Command -ComputerName $Computer -ScriptBlock {Get-Service -Name "plexmediaserver"}

    if ($Plexinfo -eq $null){
    Write-Host "Bootlegging plex, as it's a hassle" -ForegroundColor Green
    Invoke-Command -ComputerName $Computer -ScriptBlock {Start-Service -Name "plexmediaserver" }
    }

    Matrix-Typer "MAINFRAME REBOOT SEQUENCE SUCCESSFULL"
    Matrix-Typer "MAINFRAME CORE SERVICES RUNNING"
    Log-Info -Logfile "\\shitbox\d`$\_LOGS\bootlog.txt" -Logstamp "Server Booted at: $(Get-Date -Format R) +1"
    
    Matrix-Typer "Do you wish to acquire systeminfo? [y/n]:"    
    $UserPrompt = Read-Host

    if ($UserPrompt -eq 'y'){
    Get-ShitboxInfo
    }

    else {Write-Host "Goodbye world" ; sleep 5}
    }

    else {
    Write-Host "Server is online, trying to shutdown"
    Invoke-Command -ComputerName $Computer -ScriptBlock {shutdown -r -t 0}
    Write-Host "Shutdown command has been sent to $($Computer)"
    } 

}

Function Matrix-Typer {

    Param(
    [Parameter(Mandatory=$true)]
    [string]$Text
    )

$host.UI.RawUI.ForegroundColor = "Green"
$Random = New-Object System.Random
$Text -split '' |

    ForEach-Object {
    Write-Host $_ -nonew
    Start-Sleep -milliseconds $(1 + $Random.Next(150))
    }
 
}