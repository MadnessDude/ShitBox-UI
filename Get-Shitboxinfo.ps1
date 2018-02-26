Function Get-ShitboxInfo {
    
    $Computer = "shitbox"

    Matrix-Typer -Text "DUMPING INFO:"
    $SystemInfo = Get-WmiObject win32_operatingsystem -ComputerName $Computer
    $Boottime = $SystemInfo.ConvertToDateTime($SystemInfo.LastBootUpTime)
    $Uptime = (Get-Date) - ($SystemInfo.ConvertToDateTime($SystemInfo.lastbootuptime))
    $DisplayUptime = "Uptime: " + $Uptime.Days + " days, " + $Uptime.Hours + " hours, " + $Uptime.Minutes + " minutes"
    $DiskSpace = Invoke-Command -ComputerName $Computer -ScriptBlock {gwmi win32_logicaldisk | Format-Table DeviceId, @{n="TotalSize";e={[math]::Round($_.Size/1GB,2)}},@{n="FreeSpace";e={[math]::Round($_.FreeSpace/1GB,2)}}}
    $PhysicalRAM = (Get-WMIObject -class Win32_PhysicalMemory -ComputerName $Computer | Measure-Object -Property capacity -Sum | % {[Math]::Round(($_.sum / 1GB),2)})
    $CPUInfo = Get-WmiObject -Class Win32_Processor -ComputerName $Computer
    $CPULoad = Get-WmiObject win32_processor -ComputerName $Computer | Measure-Object -property LoadPercentage -Average | Select Average
    $Plex = Invoke-Command -ComputerName $Computer -ScriptBlock {Get-Process | ? Name -Match "Plex Media*"}
    $FileZilla = Invoke-Command -ComputerName $Computer -ScriptBlock {Get-Process | ? Name -eq "Filezilla Server"}
    $Bootlog = Get-Content -Path "\\shitbox\d`$\_LOGS\bootlog.txt" | select -Last 5

    Write-Host ""
    Matrix-Typer "Mainframe info:"
    Write-Host "Server name: $($SystemInfo.PSComputerName)" -ForegroundColor White
    Write-Host "Installed RAM size: $($PhysicalRAM) GB" -ForegroundColor White
    Write-Host "CPU: $($CPUInfo.Name)" -ForegroundColor White
    Write-Host "CPULoadAverage: $($CPULoad.Average)%" -ForegroundColor White
    Write-Host "Last boot time: $($Boottime)" -ForegroundColor White
    Write-Host "$($DisplayUptime)" -ForegroundColor White
    Write-Host ""
    Matrix-Typer "Disk info:"
    $DiskSpace
    Matrix-Typer "Core-Service info:"
    Write-Host ""
    Write-Host "$($Plex.ProcessName) is running with PID $($Plex.ID)" -ForegroundColor White
    Write-Host "$($FileZilla.ProcessName) is running with PID $($FileZilla.ID)" -ForegroundColor White
    Write-Host ""

    Matrix-Typer "Showing last five entries from bootlog:"
    $Bootlog

    Write-Host ""
    Write-Host "Press any key to exit ....."
    $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
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
Write-Host ""
}