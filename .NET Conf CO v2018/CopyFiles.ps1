###########################################################################
# Script generado para DEMO || NO UTILIZAR EN PRODUCCION ||
# Autor: Pablo Ariel Di Loreto
# Email: pablodiloreto@hotmail.com
# Social: @PabloDiLoreto
# Contexto: .NET Conf CO v2018
###########################################################################
# Objetivo: Creación de file para página web
# Consideraciones: no hay
# Fecha de actualización: 08/11/2018
###########################################################################

# Powershell Execution Policy bypassed to run these scripts
Set-ExecutionPolicy Bypass -Scope Process

# Nos paramos en el dir y creamos un file HTML
Set-Location -Path "c:\Web Sites\NetConfCoWebSite"
ConvertTo-Html -Title "Hola desde .NET Conf CO v2018" -Body "Publicacion con Azure DevTest Labs" -Pre "<h1>Hola desde .NET Conf CO v2018</h1>" -Post "It Works!" | Out-File index.html -force

# Fin del Script