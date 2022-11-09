param(
    [parameter(Mandatory)]
    [String]$AzureSubscription,
    [Parameter(Mandatory)]
    [String]$VmFilePath,
    [Parameter(Mandatory)]
    [String]$DomainName,
    [Parameter(Mandatory)]
    [pscredential]$DomainCredentials
)

try{
    $ErrorActionPreference = "Stop"
    Connect-AzAccount

    # Setting Azure Context.
    Set-AzContext -Subscription $AzureSubscription
    $scriptPath = "$($PSScriptRoot)\JoinWindowsVM.ps1"

    if($?) {
        gc $VmFilePath  | Foreach-Object -ThrottleLimit 10 -Parallel {

            $domainName = $using:domainName
            $domainCredentials = $using:domainCredentials
            $scriptPath = $using:scriptPath

            $azVM = Get-AzVM -VmName $_
            Write-Host "`nJoining VM: $($azVM.Name)"
            $out = Invoke-AzVMRunCommand -VMName $azVM.Name -ResourceGroupName $azVM.ResourceGroupName -CommandId 'RunPowerShellScript' `
                  -ScriptPath $scriptPath -Parameter @{$Domain = $domainName; $Credentials  = $domainCredentials}
                  
            $out.value[1].DisplayStatus
        }
    }
}

catch {
    Write-Host "Exception: $($_.Exception.Message)"
}