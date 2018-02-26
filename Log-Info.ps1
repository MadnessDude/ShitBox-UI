Function Log-Info {

    Param(
    [Parameter(Mandatory=$true)]
    [string]$Logfile,
    [string]$Logstamp
    )

    Add-Content $Logfile -Value $Logstamp

}