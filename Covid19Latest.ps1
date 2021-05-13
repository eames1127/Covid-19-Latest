[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [string]$countryCode
)

$covidUrl = "https://disease.sh/v3/covid-19/all"
$countryUrl = "https://disease.sh/v3/covid-19/countries/$countryCode"

Write-Host "`nWorld wide data."

Invoke-RestMethod $covidUrl |
Format-Table -AutoSize -Property @{Label="Last update"; Expression={[datetimeoffset]::FromUnixTimeMilliseconds($_.updated)}}, cases, deaths, recovered, todaycases, todaydeaths,todayrecovered, active, critical

Write-Host "`nData for $countryCode"

Invoke-RestMethod $countryUrl |
Format-Table -AutoSize -Property country, @{Label="Last update"; Expression={[datetimeoffset]::FromUnixTimeMilliseconds($_.updated)}} , cases, deaths, recovered, todaycases, todaydeaths,todayrecovered, active, critical
