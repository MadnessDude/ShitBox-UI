# GitHub Sync
# Added 26.02.18
#

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
        <Image x:Name="UIPicture" HorizontalAlignment="Left" Height="100" Margin="65,10,0,0" VerticalAlignment="Top" Width="100" Source="$PSScriptRoot\Sonya-Swarm-Poop.ico" Grid.ColumnSpan="2"/>
        <TextBlock x:Name="PlainText" HorizontalAlignment="Left" Margin="35,110,0,0" TextWrapping="Wrap" Text="SHITBOX UI 2.0" VerticalAlignment="Top" Height="49" Width="179" Grid.ColumnSpan="2" FontSize="24"/>
        <Button x:Name="Button1" Content="Button1" HorizontalAlignment="Left" Margin="70,176,0,0" VerticalAlignment="Top" Width="88" Grid.ColumnSpan="2"/>
        <Button x:Name="MusBut" Content="Stop" HorizontalAlignment="Left" Margin="39,270,0,0" VerticalAlignment="Top" Width="31" Grid.Column="1"/>
        <Button x:Name="Button2" Content="Button2" Margin="70,201,0,0" Width="88" Grid.ColumnSpan="2" VerticalAlignment="Top" HorizontalAlignment="Left"/>
        <Button x:Name="MusButP" Content="Play" HorizontalAlignment="Left" Margin="70,270,0,0" VerticalAlignment="Top" Width="31" Grid.ColumnSpan="2"/>
        <Label Content="© ShitBox Crew 2018 💩" HorizontalAlignment="Left" Margin="52,290,0,0" VerticalAlignment="Top" RenderTransformOrigin="0.3,-0.025" Grid.ColumnSpan="2" Width="145" Height="29"/>
        <TextBlock x:Name="UIMusStat" HorizontalAlignment="Left" Margin="18,272,0,0" TextWrapping="Wrap" Text="" VerticalAlignment="Top" Grid.Column="1"/>
        <TextBlock x:Name="UIWELC" HorizontalAlignment="Left" Margin="45,146,0,0" TextWrapping="Wrap" Text="Welcome:" VerticalAlignment="Top" Grid.ColumnSpan="2" Width="179"/>


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

Function Get-FormVariables{
if ($global:ReadmeDisplay -ne $true){Write-Debug "If you need to reference this display again, run Get-FormVariables";$global:ReadmeDisplay=$true}
Write-Debug "Found the following interactable elements from our form"
get-variable WPF*
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
$MusicPlayer.SoundLocation="$PSScriptRoot\CORE_SHITBOXUI.wav";
$MusicPlayer.PlayLooping()
$flag=$false;
$WPFUIMusStat.Text = "🔊"

# Welcome Code
# Added 26.02.18
# 

$WPFUIWELC.text = "Welcome $env:USERNAME"

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

$WPFButton1.Add_Click(
{
    
        }
    )

$WPFButton2.Add_Click(
{
    
        }
    )

# Form GUI Starter
# Added 25.02.18
# This starts the GUI

$Form.ShowDialog() | out-null