###########################################################################
# Script generado para DEMO || NO UTILIZAR EN PRODUCCION ||
# Autor: Pablo Ariel Di Loreto
# Email: pablodiloreto@hotmail.com
# Social: @PabloDiLoreto
# Contexto: .NET Conf CO v2018
###########################################################################
# Objetivo: Eliminación de "Default Web Site" y agregado de nuevo sitio web
# Consideraciones: también agrega un AppPool con ciertas configuraciones
# Fecha de actualización: 08/11/2018
###########################################################################

# Powershell Execution Policy bypassed to run these scripts
Set-ExecutionPolicy Bypass -Scope Process

# Importación del mómdulo de administración web (IIS)
Import-Module WebAdministration

# Eliminación del "Default Web Site" en IIS
Get-WebSite -Name "Default Web Site" | Remove-WebSite -Confirm:$false -Verbose
Remove-WebAppPool -Name "DefaultAppPool" -Confirm:$false -Verbose

# Creación de nuevo AppPool
$appPool = New-WebAppPool -name "NetConfCoAppPool"  -force
$appPool.processModel.identityType = "NetworkService"
$appPool.enable32BitAppOnWin64 = 1
$appPool | Set-Item

# Creación de carpeta para utilizarla en el sitio web que se creará
md "c:\Web Sites\NetConfCoWebSite"

# Creación de Sitio Web reutilizando AppPool y directorio anteriormente creado
$site = new-WebSite -name "NetConfCoWebsite" -PhysicalPath "c:\Web Sites\NetConfCoWebSite" -HostHeader "co.netconf.global" -ApplicationPool "NetConfCoAppPool" -force

# Fin del Script