# This script retrieves DHCP leases from a specified DHCP server and exports them to a CSV file with a custom delimiter.
Get-DhcpServerv4Scope -ComputerName $dhcpServer | ForEach-Object {
    Get-DhcpServerv4Lease -ComputerName $dhcpServer -ScopeId $_.ScopeId -AllLeases
} | Select-Object ScopeId, IPAddress, HostName, ClientId, AddressState | Export-Csv -Path "DhcpLeases.csv" -Delimiter ":" -NoTypeInformation
