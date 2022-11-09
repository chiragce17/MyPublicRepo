# This script will join Azure Windows VM to the domain.

## Pre-Requisites.
- Azure PowerShell Module.
- PowerShell Core (v7.0 +).
- Azure Subscription
- Azure credentials.
- VMs to be saved in text file to Join then into domain.

## How to run the script.
- Download **Join-VMtoDomain** Folder.
- Open PowerShell 7 in Administrator mode.
- Browse the Path this script.
- Run the below command.

`.\Join-VMtoDomain.ps1 -AzureSubscription 'xxxx-xxxx-xxxx-xx' -VmFilePath C:\Temp\Vms.txt -DomainName YourDomaintoJoin.local `

- Once you click enter, it will ask you for the Domain credenatials.
