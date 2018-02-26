# XML Raw Data Input:
# Added 25.02.18
# PUT XML between the @" "@

$inputXML = @"
<Window x:Class="SHITBOXUI1._0.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:SHITBOXUI1._0"
        mc:Ignorable="d"
        Title="ShitBox UI" Height="350" Width="242">
    <Grid>
        <Grid.ColumnDefinitions>
            <ColumnDefinition Width="195*"/>
            <ColumnDefinition Width="322*"/>
        </Grid.ColumnDefinitions>
        <Image x:Name="UIPicture" HorizontalAlignment="Left" Height="100" Margin="65,10,0,0" VerticalAlignment="Top" Width="100" Source="E:\ShitBoxUI\Sonya-Swarm-Poop.ico" Grid.ColumnSpan="2"/>
        <TextBlock x:Name="PlainText" HorizontalAlignment="Left" Margin="35,110,0,0" TextWrapping="Wrap" Text="SHITBOX UI 2.0" VerticalAlignment="Top" Height="49" Width="179" Grid.ColumnSpan="2" FontSize="24"/>
        <Button x:Name="UISysDiag" Content="Run Sys Diag" HorizontalAlignment="Left" Margin="70,176,0,0" VerticalAlignment="Top" Width="88" Grid.ColumnSpan="2"/>
        <Button x:Name="MusBut" Content="Stop" HorizontalAlignment="Left" Margin="39,270,0,0" VerticalAlignment="Top" Width="31" Grid.Column="1"/>
        <Button x:Name="UIReboot" Content="Reboot" Margin="70,201,0,0" Width="88" Grid.ColumnSpan="2" VerticalAlignment="Top" HorizontalAlignment="Left"/>
        <Button x:Name="MusButP" Content="Play" HorizontalAlignment="Left" Margin="70,270,0,0" VerticalAlignment="Top" Width="31" Grid.ColumnSpan="2"/>
        <Label Content="© ShitBox Crew 2018" HorizontalAlignment="Left" Margin="52,290,0,0" VerticalAlignment="Top" RenderTransformOrigin="0.3,-0.025" Grid.ColumnSpan="2" Width="132" Height="29"/>
        <TextBlock x:Name="UIMusStat" HorizontalAlignment="Left" Margin="18,272,0,0" TextWrapping="Wrap" Text="" VerticalAlignment="Top" Grid.Column="1"/>


    </Grid>
</Window>


"@       

# Loading System Critical Functions:

Function Print-AsciiArt {

Write-Host "───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────" -ForegroundColor Yellow
Write-Host "─────────────────────────────────────────────────────────────▄─────────────────────────────────────────────────────────" -ForegroundColor Yellow
Write-host "   ▄████████    ▄█    █▄     ▄█      ███     ──────────────▄▀░▀▄────────────── ▀█████████▄   ▄██████▄  ▀████    ▐████▀ " -ForegroundColor Yellow
Write-host "  ███    ███   ███    ███   ███  ▀█████████▄ ────────────▄▀░░░░░▀▄────────────   ███    ███ ███    ███   ███▌   ████▀  " -ForegroundColor Yellow
Write-host "  ███    █▀    ███    ███   ███▌    ▀███▀▀██ ──────────▄▀░░░░░░░░░▀▄──────────   ███    ███ ███    ███    ███  ▐███    " -ForegroundColor Yellow
Write-host "  ███         ▄███▄▄▄▄███▄▄ ███▌     ███   ▀ ────────▄█▄▄▄▄▄▄▄▄▄▄▄▄▄█▄────────  ▄███▄▄▄██▀  ███    ███    ▀███▄███▀    " -ForegroundColor Yellow
Write-host "▀███████████ ▀▀███▀▀▀▀███▀  ███▌     ███     ───────▄▀▄─────────────▄▀▄─────── ▀▀███▀▀▀██▄  ███    ███    ████▀██▄     " -ForegroundColor Yellow
Write-host "         ███   ███    ███   ███      ███     ─────▄▀░░░▀▄─────────▄▀░░░▀▄─────   ███    ██▄ ███    ███   ▐███  ▀███    " -ForegroundColor Yellow
Write-host "   ▄█    ███   ███    ███   ███      ███     ───▄▀░░░░░░░▀▄─────▄▀░░░░░░░▀▄───   ███    ███ ███    ███  ▄███     ███▄  " -ForegroundColor Yellow
Write-host " ▄████████▀    ███    █▀    █▀      ▄████▀   ─▄▀░░░░░░░░░░░▀▄─▄▀░░░░░░░░░░░▀▄─ ▄█████████▀   ▀██████▀  ████       ███▄ " -ForegroundColor Yellow
Write-Host "─────────────────────────────────────────────▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀─────────────────────────────────────────" -ForegroundColor Yellow
Write-Host "───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────" -ForegroundColor Yellow
Write-Host ""
Write-Host ""


}
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
 Write-Host ""
}
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
    $Bootlog = Get-Content -Path "\\shitbox\d$\_LOGS\bootlog.txt" | select -Last 5

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
    #Write-host "Disk $($DiskSpace.)"
    Matrix-Typer "Core-Service info:"
    Write-Host ""
    Write-Host "$($Plex.ProcessName) is running with PID $($Plex.ID)" -ForegroundColor White
    Write-Host "$($FileZilla.ProcessName) is running with PID $($FileZilla.ID)" -ForegroundColor White
    Write-Host ""

    Matrix-Typer "Showing last five entries from bootlog:"
    Write-host "$($Bootlog)"

    Write-Host ""
    Write-Host "Press any key to exit ....."
    $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}
Function Get-FormVariables{
if ($global:ReadmeDisplay -ne $true){Write-Debug "If you need to reference this display again, run Get-FormVariables";$global:ReadmeDisplay=$true}
Write-Debug "Found the following interactable elements from our form"
get-variable WPF*
}
Function Log-Info {

    Param(
    [Parameter(Mandatory=$true)]
    [string]$Logfile,
    [string]$Logstamp
    )

    Add-Content $Logfile -Value $Logstamp

}
Function MusicPlayer {

   

    Param(

    [Parameter(Mandatory=$false)]

    [switch]$Start,

    [switch]$Stop

    )

 

    if($Start){

        $MusicPlayer.PlayLooping();

    }

 

    elseif($Stop){

        $MusicPlayer.stop();

    }

}

# Shitbox Ascii Logo
# Added: 25.02.18
#

Print-AsciiArt

# XML GUI Input Translator
# Added 25.02.18
#
 
$inputXML = $inputXML -replace 'mc:Ignorable="d"','' -replace "x:N",'N'  -replace '^<Win.*', '<Window'
 
[void][System.Reflection.Assembly]::LoadWithPartialName('presentationframework')
[xml]$XAML = $inputXML
#Read XAML
 
    $reader=(New-Object System.Xml.XmlNodeReader $xaml)
try{$Form=[Windows.Markup.XamlReader]::Load( $reader )}
catch{Write-Warning "Unable to parse XML, with error: $($Error[0])`n Ensure that there are NO SelectionChanged properties (PowerShell cannot process them)"
    throw}
 
#===========================================================================
# Load XAML Objects In PowerShell
#===========================================================================
  
$xaml.SelectNodes("//*[@Name]") | %{"trying item $($_.Name)" | out-null;
    try {Set-Variable -Name "WPF$($_.Name)" -Value $Form.FindName($_.Name) -ErrorAction Stop}
    catch{throw}
    }
 
Get-FormVariables | Out-Null

# Music Player
# Added 25.02.18
# Must be after XML Code
        
$MusicPlayer = new-Object System.Media.SoundPlayer;
$MusicPlayer.SoundLocation="E:\ShitBoxUI\CORE_SHITBOXUI.wav";
$MusicPlayer.PlayLooping()
$flag=$false;
$WPFUIMusStat.Text = "🔊"

# Buttons
# Added 25.02.18
# Please write all button code below here

$WPFMusBut.Add_Click(
  {
   $MusicPlayer.Stop()
   $WPFUIMusStat.Text = "🔇"
   
  }
)

$WPFMusButP.Add_Click(
  {
   $MusicPlayer.PlayLooping()
   $WPFUIMusStat.Text = "🔊"
  }
)

$WPFUISysDiag.Add_Click(
{
    Get-ShitboxInfo
        }
    )

$WPFUIReboot.Add_Click(
{
    Boot-Shitbox -ping
        }
    )

# Form GUI Starter
# Added 25.02.18
# This starts the GUI

$Form.ShowDialog() | out-null