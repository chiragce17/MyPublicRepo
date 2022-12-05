# Enabling TLS 1.2 in powershell
$TLS12Protocol = [System.Net.SecurityProtocolType] 'Ssl3 , Tls12'
[System.Net.ServicePointManager]::SecurityProtocol = $TLS12Protocol

$7zipUrl = 'https://www.7-zip.org/a/7z2201-x64.msi'
$outFilePath = "$($env:TEMP)\7zip.msi"

Invoke-WebRequest $7zipUrl -OutFile $outFilePath -Verbose

if(Test-Path $outFilePath) {
    Start-Process $outFilePath -ArgumentList '/quiet' -wait

    if(gwmi win32_product | where{$_.name -like "*7-zip*"}){
        Write-Host "7-zip installation is successful" -f Green
    }
    else{
        write-Host "7-zip Installation is failed" -f Red
    }
}