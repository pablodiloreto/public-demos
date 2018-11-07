# * Powershell Execution Policy bypassed to run these scripts
Set-ExecutionPolicy Bypass -Scope Process

Import-Module WebAdministration

Get-WebSite -Name "Default Web Site" | Remove-WebSite -Confirm:$false -Verbose
Remove-WebAppPool -Name "DefaultAppPool" -Confirm:$false -Verbose

$appPool = New-WebAppPool -name "NetConfCoAppPool"  -force
$appPool.processModel.identityType = "NetworkService"
$appPool.enable32BitAppOnWin64 = 1
$appPool | Set-Item

md "c:\Web Sites\NetConfCoWebSite"

# All on one line
$site = new-WebSite -name "NetConfCoWebsite" -PhysicalPath "c:\Web Sites\NetConfCoWebSite" -HostHeader "co.netconf.global" -ApplicationPool "NetConfCoAppPool" -force