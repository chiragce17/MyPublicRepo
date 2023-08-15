$count = 0 
if(Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing" -Name "RebootPending" -EA Ignore) {
    $count = 1
}

if(Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" -Name "RebootRequired" -EA Ignore) {
    $count = 1
}

if(Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager" -Name "PendingFileRenameOperations" -EA Ignore){
    $count = 1
}

if($count -eq 1){
    Write-Output "Server Reboot is Pending"
}

else {
    Write-Output "Server Reboot is not pending"
}