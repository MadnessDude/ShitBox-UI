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

Function Matrix-Logo {

    Param(
    [Parameter(Mandatory=$true)]
    [string]$Text
    )

$host.UI.RawUI.ForegroundColor = "Green"
$Random = New-Object System.Random
$Text -split '' |

    ForEach-Object {
    Write-Host $_ -nonew
    Start-Sleep -milliseconds $(0.7 + $Random.Next(0.1))
    }
 
}