param(
    [String]$Domain,
    [pscredential]$Credentials
)

Add-Computer -DomainName $Domain -Credential $Credentials -Restart -Force