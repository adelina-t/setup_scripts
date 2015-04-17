# set computer_name and ip

Param (
	[String]$NewName,
	[String]$NewIp,
	[int]$Prefix,
	[String]$DefaultGateway
)

if ($NewName) {
	echo "Changing Computer Name to $NewName"
	$computerName = Get-WmiObject Win32_ComputerSystem
	$computerName.Rename($NewName)
}

if ($NewIp) {
	echo "Changind Computer Ip Address to $NewIp"
	New-NetIpAddress -InterfaceAlias "Ethernet0" -IPAddress $NewIp -AddressFamily IPv4 -PrefixLength $Prefix -DefaultGateway $DefaultGateway
	Set-DnsClientServerAddress -InterfaceAlias "Ethernet0" -ServerAddresses 8.8.8.8
}

echo "you need to restart your computer for the changes to take effect"
