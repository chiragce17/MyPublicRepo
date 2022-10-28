param(
    [parameter(Mandatory)]
    [String[]]$Servers
)

$output = @()
$outFile = "C:\Temp\ServerFQDN.csv"

foreach($server in $Servers) {
    $out = Invoke-Command -ComputerName $server -ScriptBlock {
        [System.Net.Dns]::GetHostByName($env:COMPUTERNAME).HostName
    }

    $output += [PSCustomObject]@{
        Server = $server
        FQDN = $out
    }
}

$output
$output | Export-Csv $outFile -NoTypeInformation 
Write-Host "`nScript execution is completed" -f Green
Write-Output "OutputFile: $outFile"