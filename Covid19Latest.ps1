$country = "uk"
$covidUrl = "https://disease.sh/v3/covid-19/all"
$countryUrl = "https://disease.sh/v3/covid-19/countries/$country"

Invoke-RestMethod $covidUrl |
Format-Table -AutoSize -Property @{Label="Last update"; Expression={[datetimeoffset]::FromUnixTimeMilliseconds($_.updated)}}, cases, deaths, recovered, todaycases, todaydeaths,todayrecovered, active, critical

Invoke-RestMethod $countryUrl |
Format-Table -AutoSize -Property  @{Label="Last update"; Expression={[datetimeoffset]::FromUnixTimeMilliseconds($_.updated)}} , cases, deaths, recovered, todaycases, todaydeaths,todayrecovered, active, critical
