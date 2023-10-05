# Setzt GDATA Clientname auf WindowsPCNamen
# Version: 1.0

$computername=$env:computername


try {

Get-ItemPropertyValue "HKLM:\SOFTWARE\WOW6432Node\G DATA"  -Name client_MachineGuid_name  -ErrorAction Stop | Out-Null 
#Get-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\G DATA" 
"GDATA RegValue found..."}

catch {

" GData Regvalue did not exist! Probably GDATA not installed!"

return $false

}

if ((Get-ItemPropertyValue "HKLM:\SOFTWARE\WOW6432Node\G DATA"  -Name client_MachineGuid_name) -eq $computername )
{
	
	"GData Regvalue already correct: " + $computername
}else{

New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\G DATA" -Name client_MachineGuid_Name -Value $computername -force
}